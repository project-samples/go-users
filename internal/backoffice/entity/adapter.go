package entity

import (
	"context"
	"database/sql"
	"fmt"
	"reflect"
	"strings"

	q "github.com/core-go/sql"
)

type entityRole struct {
	EntityId string `json:"entityId,omitempty" gorm:"column:entityId;primary_key" bson:"_id,omitempty" validate:"required,max=20,code"`
	UserId   string `json:"userId,omitempty" gorm:"column:userId;primary_key" bson:"_id,omitempty" dynamodbav:"userId,omitempty" firestore:"userId,omitempty" validate:"max=40"`
}

type EntityAdapter struct {
	db               *sql.DB
	driver           string
	BuildParam       func(int) string
	CheckDelete      string
	Map              map[string]int
	modelType        reflect.Type
	entitySchema     *q.Schema
	entityRoleSchema *q.Schema
}

func NewEntityRepository(db *sql.DB) (*EntityAdapter, error) {
	modelType := reflect.TypeOf(Entity{})
	buildParam := q.GetBuild(db)
	var r entityRole
	subType := reflect.TypeOf(r)
	m, err := q.GetColumnIndexes(subType)
	if err != nil {
		return nil, err
	}
	entitySchema := q.CreateSchema(modelType)
	entityRoleSchema := q.CreateSchema(subType)
	driver := q.GetDriver(db)
	return &EntityAdapter{db: db, driver: driver, BuildParam: buildParam, modelType: modelType, Map: m, entitySchema: entitySchema, entityRoleSchema: entityRoleSchema}, nil
}

func (s *EntityAdapter) Load(ctx context.Context, id string) (*Entity, error) {
	var entities []Entity
	sql := fmt.Sprintf("select * from entities where entityId = %s", s.BuildParam(1))
	er1 := q.Query(ctx, s.db, s.Map, &entities, sql, id)
	if er1 != nil {
		return nil, er1
	}
	if len(entities) == 0 {
		return nil, nil
	}
	entity := entities[0]
	users, er3 := getUsers(ctx, s.db, id, s.BuildParam, s.Map)
	if er3 != nil {
		return nil, er3
	}
	if len(users) > 0 {
		entity.Users = users
	}
	return &entity, nil
}

func (s *EntityAdapter) Create(ctx context.Context, entity *Entity) (int64, error) {
	sts, err := buildInsertEntityStatements(entity, s.driver, s.BuildParam, s.entitySchema, s.entityRoleSchema)
	if err != nil {
		return 0, err
	}
	return sts.Exec(ctx, s.db)
}

func (s *EntityAdapter) Update(ctx context.Context, entity *Entity) (int64, error) {
	sts, err := buildUpdateEntityStatements(entity, s.driver, s.BuildParam, s.entitySchema, s.entityRoleSchema)
	if err != nil {
		return 0, err
	}
	return sts.Exec(ctx, s.db)
}

func (s *EntityAdapter) Patch(ctx context.Context, entity map[string]interface{}) (int64, error) {
	sts, err := buildPatchEntityStatements(entity, s.BuildParam, s.modelType)
	if err != nil {
		return 0, err
	}
	return sts.Exec(ctx, s.db)
}

func (s *EntityAdapter) Delete(ctx context.Context, id string) (int64, error) {
	if len(s.CheckDelete) > 0 {
		exist, er0 := checkExist(s.db, s.CheckDelete, id)
		if exist || er0 != nil {
			return -1, er0
		}
	}
	sts, er1 := buildDeleteEntityStatements(id, s.BuildParam)
	if er1 != nil {
		return 0, er1
	}
	return sts.Exec(ctx, s.db)
}

func getUsers(ctx context.Context, db *sql.DB, entityId string, buildParam func(int) string, m map[string]int) ([]string, error) {
	var entityUsers []entityRole
	users := make([]string, 0)
	query := fmt.Sprintf(`select userId from entityusers where entityId = %s`, buildParam(1))
	err := q.Query(ctx, db, m, &entityUsers, query, entityId)
	if err != nil {
		return nil, err
	}
	for _, e := range entityUsers {
		users = append(users, e.UserId)
	}
	return users, nil
}

func buildInsertEntityStatements(entity *Entity, driver string, buildParam func(int) string, entitySchema *q.Schema, entityRoleSchema *q.Schema) (q.Statements, error) {
	modules, er1 := buildEntityModules(entity.EntityId, entity.Users)
	if er1 != nil {
		return nil, er1
	}
	sts := q.NewStatements(true)
	sts.Add(q.BuildToInsert("entities", entity, buildParam, entitySchema))
	if modules != nil {
		query, args, er2 := q.BuildToInsertBatch("entityusers", modules, driver, entityRoleSchema)
		if er2 != nil {
			return sts, er2
		}
		sts.Add(query, args)
	}
	return sts, nil
}

func buildEntityModules(entityID string, users []string) ([]entityRole, error) {
	if users == nil || len(users) <= 0 {
		return nil, nil
	}
	modules := make([]entityRole, 0)
	for _, p := range users {
		m := toEntityModules(entityID, p)
		m.EntityId = entityID
		m.UserId = users[0]
		modules = append(modules, m)
	}
	return modules, nil
}

func toEntityModules(EntityID string, menu string) entityRole {
	s := strings.Split(menu, " ")
	p := entityRole{EntityId: EntityID, UserId: s[0]}
	return p
}

func buildUpdateEntityStatements(entity *Entity, driver string, buildParam func(int) string, entitySchema *q.Schema, entityRoleSchema *q.Schema) (q.Statements, error) {
	modules, er1 := buildEntityModules(entity.EntityId, entity.Users)
	if er1 != nil {
		return nil, er1
	}
	sts := q.NewStatements(true)
	sts.Add(q.BuildToUpdate("entities", entity, buildParam, entitySchema))

	deleteModules := fmt.Sprintf("delete from entityusers where entityId = %s", buildParam(1))
	sts.Add(deleteModules, []interface{}{entity.EntityId})

	if modules != nil {
		query, args, er2 := q.BuildToInsertBatch("entityusers", modules, driver, entityRoleSchema)
		if er2 != nil {
			return sts, er2
		}
		sts.Add(query, args)
	}
	return sts, nil
}

func checkExist(db *sql.DB, sql string, args ...interface{}) (bool, error) {
	rows, err := db.Query(sql, args...)
	if err != nil {
		return false, err
	}
	defer rows.Close()
	for rows.Next() {
		return true, nil
	}
	return false, nil
}

func buildDeleteEntityStatements(id string, buildParam func(int) string) (q.Statements, error) {
	sts := q.NewStatements(false)

	deleteModules := fmt.Sprintf("delete from entityusers where entityId = %s", buildParam(1))
	sts.Add(deleteModules, []interface{}{id})

	deleteRole := fmt.Sprintf("delete from entities where entityId = %s", buildParam(1))
	sts.Add(deleteRole, []interface{}{id})

	return sts, nil
}

func buildPatchEntityStatements(json map[string]interface{}, buildParam func(int) string, modelType reflect.Type) (q.Statements, error) {
	sts := q.NewStatements(true)
	primaryKeyColumns, _ := q.FindPrimaryKeys(modelType)
	jsonColumnMap := q.MakeJsonColumnMap(modelType)
	columnMap := q.JSONToColumns(json, jsonColumnMap)
	sts.Add(q.BuildToPatch("entities", columnMap, primaryKeyColumns, buildParam))
	if json["users"] != nil {
		deleteModules := fmt.Sprintf("delete from entityusers where entityId = '%s';", buildParam(1))
		sts.Add(deleteModules, []interface{}{json["entityId"]})
		a := json["users"]
		t, ok := a.([]string)
		if ok {
			for i := 0; i < len(t); i++ {
				insertModules := fmt.Sprintf("insert into entityusers values ('%s','%s');", buildParam(1), buildParam(2))
				sts.Add(insertModules, []interface{}{json["entityId"], t[i]})
			}
		}
	}
	return sts, nil
}
