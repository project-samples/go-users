package appreciation

import (
	"context"
	"database/sql"
	"fmt"
)

type AppreciationService interface {
	Check(ctx context.Context, id string, author string) (*Appreciation, error)
	Appreciate(ctx context.Context, appreciation *Appreciation) (int64, error)
	Delete(ctx context.Context, id string, author string, reaction string) (int64, error)
}

func NewAppreciationService(
	db *sql.DB,
	appreciationTable string,
	idCol string,
	authorCol string,
	reactionCol string,
	prefix string,
	suffix string,
	userInfoTable string,
	infoIdCol string,
	reactionCountCol string,
) AppreciationService {
	return &appreciationService{
		DB:                db,
		AppreciationTable: appreciationTable,
		IdCol:             idCol,
		AuthorCol:         authorCol,
		ReactionCol:       reactionCol,
		Prefix:            prefix,
		Suffix:            suffix,
		UserInfoTable:     userInfoTable,
		InfoIdCol:         infoIdCol,
		ReactionCountCol:  reactionCountCol,
	}
}

type appreciationService struct {
	DB                *sql.DB
	AppreciationTable string
	IdCol             string
	AuthorCol         string
	ReactionCol       string
	Prefix            string
	Suffix            string
	UserInfoTable     string
	InfoIdCol         string
	ReactionCountCol  string
}

func (s *appreciationService) Check(ctx context.Context, id string, author string) (*Appreciation, error) {
	query := fmt.Sprintf("select id, author, reaction from %s where id = $1 and author = $2 limit 1", s.AppreciationTable)
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
	oldAppreciation, _ := s.Check(ctx, appreciation.Id, appreciation.Author)
	if oldAppreciation != nil {
		query2 = fmt.Sprintf(
			"insert into %s(%s, %s, %s%d%s) values ($1, 1, 1) on conflict (%s) do update set %s%d%s = %s.%s%d%s - 1, %s%d%s = %s.%s%d%s + 1;",
			s.UserInfoTable, s.InfoIdCol, s.ReactionCountCol, s.Prefix, appreciation.Reaction, s.Suffix,
			s.InfoIdCol, s.Prefix, oldAppreciation.Reaction, s.Suffix, s.UserInfoTable, s.Prefix, appreciation.Reaction, s.Suffix,
			s.Prefix, appreciation.Reaction, s.Suffix, s.UserInfoTable, s.Prefix, appreciation.Reaction, s.Suffix)
	} else {
		query2 = fmt.Sprintf(
			"insert into %s(%s,%s,%s%d%s) values ($1, 1, 1) on conflict (%s) do update set %s = %s.%s + 1, %s%d%s = %s.%s%d%s + 1;",
			s.UserInfoTable, s.InfoIdCol, s.ReactionCountCol, s.Prefix, appreciation.Reaction, s.Suffix,
			s.InfoIdCol, s.ReactionCountCol, s.UserInfoTable, s.ReactionCountCol,
			s.Prefix, appreciation.Reaction, s.Suffix, s.UserInfoTable, s.Prefix, appreciation.Reaction, s.Suffix)
	}

	query1 := fmt.Sprintf(
		"insert into %s(%s, %s, %s) values ($1, $2, $3) on conflict (%s, %s) do update set %s = $3",
		s.AppreciationTable, s.IdCol, s.AuthorCol, s.ReactionCol, s.IdCol, s.AuthorCol, s.ReactionCol)
	fmt.Println(query1)
	stmt1, er0 := s.DB.Prepare(query1)
	if er0 != nil {
		return -1, nil
	}
	stmt1.ExecContext(ctx, appreciation.Id, appreciation.Author, appreciation.Reaction)

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

	return res2.RowsAffected()
}

func (s *appreciationService) Delete(ctx context.Context, id string, author string, reaction string) (int64, error) {
	query1 := fmt.Sprintf("delete from %s where %s = $1 and %s = $2", s.AppreciationTable, s.IdCol, s.AuthorCol)
	fmt.Println(query1)
	stmt1, er0 := s.DB.Prepare(query1)
	if er0 != nil {
		return -1, nil
	}
	stmt1.ExecContext(ctx, id, author)

	query2 := fmt.Sprintf(
		"update %s set %s = %s - 1, %s%s%s = %s%s%s - 1 where %s = $1;",
		s.UserInfoTable, s.ReactionCountCol, s.ReactionCountCol, s.Prefix, reaction, s.Suffix, s.Prefix, reaction, s.Suffix, s.IdCol)
	fmt.Println(query2)
	stmt2, er0 := s.DB.Prepare(query2)
	if er0 != nil {
		return -1, nil
	}
	res2, er2 := stmt2.ExecContext(ctx, id)
	if er2 != nil {
		return -1, er2
	}

	return res2.RowsAffected()
}
