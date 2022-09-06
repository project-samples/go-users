package reaction

import (
	"context"
	"database/sql"
	"fmt"
)

type ReactionService interface {
	Insert(ctx context.Context, reaction *Reaction) (int64, error)
	Delete(ctx context.Context, reaction *Reaction) (int64, error)
}

func NewReactionService(
	db *sql.DB,
	table string,
	id string,
	author string,
	userId string,
	time string,
	reaction string,
	rateTable string,
	rateId string,
	rateAuthor string,
	usefulCount string,
) ReactionService {
	return &reactionService{
		DB:          db,
		Table:       table,
		Id:          id,
		Author:      author,
		UserId:      userId,
		Time:        time,
		Reaction:    reaction,
		RateTable:   rateTable,
		RateId:      rateId,
		RateAuthor:  rateAuthor,
		UsefulCount: usefulCount,
	}
}

type reactionService struct {
	DB          *sql.DB
	Table       string
	Id          string
	Author      string
	UserId      string
	Time        string
	Reaction    string
	RateTable   string
	RateId      string
	RateAuthor  string
	UsefulCount string
}

func (s *reactionService) Insert(ctx context.Context, reaction *Reaction) (int64, error) {
	query1 := "insert into " + s.Table + " (" + s.Id + "," + s.Author + "," + s.UserId + "," + s.Time + "," + s.Reaction + ") values ($1, $2, $3, $4, $5)"
	fmt.Println(query1)
	stmt1, err := s.DB.Prepare(query1)
	if err != nil {
		return -1, err
	}
	res1, err := stmt1.ExecContext(ctx, reaction.Id, reaction.Author, reaction.UserId, reaction.Time, reaction.Type)
	if err != nil {
		return -1, err
	}

	query2 := "update " + s.RateTable + " set " + s.UsefulCount + " = " + s.RateTable + "." + s.UsefulCount + "+ 1 where " + s.RateId + " = $1 and " + s.RateAuthor + " = $2;"
	fmt.Println(query2)
	stmt2, err := s.DB.Prepare(query2)
	if err != nil {
		return -1, err
	}
	res2, err := stmt2.ExecContext(ctx, reaction.Id, reaction.Author)
	if err != nil {
		return -1, err
	}
	fmt.Println(res2)

	return res1.RowsAffected()
}

func (s *reactionService) Delete(ctx context.Context, reaction *Reaction) (int64, error) {
	query1 := "delete from " + s.Table + " where " + s.Id + " = $1 and " + s.Author + " = $2 and " + s.UserId + "= $3;"
	fmt.Println(query1)
	stmt1, err := s.DB.Prepare(query1)
	if err != nil {
		return -1, err
	}
	res1, err := stmt1.ExecContext(ctx, reaction.Id, reaction.Author, reaction.UserId)
	fmt.Println(res1)
	if err != nil {
		return -1, err
	}

	query2 := "update " + s.RateTable + " set " + s.UsefulCount + " = " + s.RateTable + "." + s.UsefulCount + "- 1 where " + s.RateId + " = $1 and " + s.RateAuthor + " = $2;"
	fmt.Println(query2)
	stmt2, err := s.DB.Prepare(query2)
	if err != nil {
		return -1, err
	}
	res2, err := stmt2.ExecContext(ctx, reaction.Id, reaction.Author)
	if err != nil {
		return -1, err
	}
	fmt.Println(res2)

	return res1.RowsAffected()
}
