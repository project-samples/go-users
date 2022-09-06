package appreciation

import (
	"context"
	"database/sql"
	"fmt"
	"strconv"
)

type AppreciationService interface {
	Check(ctx context.Context, id string, author string) (*Appreciation, error)
	Appreciate(ctx context.Context, appreciation *Appreciation) (int64, error)
	Delete(ctx context.Context, id string, author string, reaction string) (int64, error)
}

func NewAppreciationService(
	db *sql.DB,
	appreciationTable string,
	id string,
	author string,
	reaction string,
	prefix string,
	suffix string,
	userInfoTable string,
	infoId string,
	reactionCount string,
) AppreciationService {
	return &appreciationService{
		DB:                db,
		AppreciationTable: appreciationTable,
		Id:                id,
		Author:            author,
		Reaction:          reaction,
		Prefix:            prefix,
		Suffix:            suffix,
		UserInfoTable:     userInfoTable,
		InfoId:            infoId,
		ReactionCount:     reactionCount,
	}
}

type appreciationService struct {
	DB                *sql.DB
	AppreciationTable string
	Id                string
	Author            string
	Reaction          string
	Prefix            string
	Suffix            string
	UserInfoTable     string
	InfoId            string
	ReactionCount     string
}

func (s *appreciationService) Check(ctx context.Context, id string, author string) (*Appreciation, error) {
	query := "select id, author, reaction from " + s.AppreciationTable + " where id = $1 and author = $2 limit 1"
	fmt.Println(query)
	rows, err := s.DB.QueryContext(ctx, query, id, author)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	for rows.Next() {
		var appreciation Appreciation
		err = rows.Scan(&appreciation.Id, &appreciation.Author, &appreciation.Reaction)
		if err != nil {
			return nil, err
		}
		return &appreciation, nil
	}
	return nil, nil
}

func (s *appreciationService) Appreciate(ctx context.Context, appreciation *Appreciation) (int64, error) {
	var query2 string
	reaction := strconv.Itoa(appreciation.Reaction)
	oldAppreciation, _ := s.Check(ctx, appreciation.Id, appreciation.Author)
	if oldAppreciation != nil {	
		oldReaction := strconv.Itoa(oldAppreciation.Reaction)
		query2 = "insert into " + s.UserInfoTable + "(" + s.InfoId + "," + s.ReactionCount + "," + s.Prefix + reaction + s.Suffix + ") values ($1, 1, 1) " +
		"on conflict (" + s.InfoId + ") do update set " + s.Prefix + oldReaction + s.Suffix + " = " + s.UserInfoTable  + "." + s.Prefix + oldReaction + s.Suffix + " - 1, " + s.Prefix + reaction + s.Suffix + " = " + s.UserInfoTable  + "." + s.Prefix + reaction + s.Suffix + " + 1;"
	} else {
		query2 = "insert into " + s.UserInfoTable + "(" + s.InfoId + "," + s.ReactionCount + "," + s.Prefix + reaction + s.Suffix + ") values ($1, 1, 1) " +
		"on conflict (" + s.InfoId + ") do update set " + s.ReactionCount + " = " + s.UserInfoTable + "." + s.ReactionCount + " + 1, " + s.Prefix + reaction + s.Suffix + " = " + s.UserInfoTable  + "." + s.Prefix + reaction + s.Suffix + " + 1;"
	}

	query1 := "insert into " + s.AppreciationTable + "(" + s.Id + "," + s.Author + "," + s.Reaction + ") values ($1, $2, $3)" +
		"on conflict ("+ s.Id + "," + s.Author +") do update set " + s.Reaction + " = $3"
	fmt.Println(query1)
	stmt1, er0 := s.DB.Prepare(query1)
	if er0 != nil {
		return -1, nil
	}
	res1, er1 := stmt1.ExecContext(ctx, appreciation.Id, appreciation.Author, appreciation.Reaction)
	if er1 != nil {
		return -1, er1
	}
	fmt.Println(res1)

	fmt.Println(query2)
	stmt2, er0 := s.DB.Prepare(query2)
	if er0 != nil {
		return -1, nil
	}
	res2, er2 := stmt2.ExecContext(ctx, appreciation.Id)
	if er2 != nil {
		return -1, er2
	}
	fmt.Println(res2)

	return res1.RowsAffected()
}

func (s *appreciationService) Delete(ctx context.Context, id string, author string, reaction string) (int64, error) {
	query1 := "delete from " + s.AppreciationTable + " where " + s.Id + " = $1 and " + s.Author + " = $2"
	fmt.Println(query1)
	stmt1, er0 := s.DB.Prepare(query1)
	if er0 != nil {
		return -1, nil
	}
	res1, er1 := stmt1.ExecContext(ctx, id, author)
	if er1 != nil {
		return -1, er1
	}
	fmt.Println(res1)

	query2 := "update " + s.UserInfoTable + " set " + s.ReactionCount + " = " + s.ReactionCount + " - 1," + s.Prefix + reaction + s.Suffix + " = " + s.Prefix + reaction + s.Suffix + " - 1 where " + s.Id + " = $1;"
	fmt.Println(query2)
	stmt2, er0 := s.DB.Prepare(query2)
	if er0 != nil {
		return -1, nil
	}
	res2, er2 := stmt2.ExecContext(ctx, id)
	if er2 != nil {
		return -1, er2
	}
	fmt.Println(res2)

	return res1.RowsAffected()
}
