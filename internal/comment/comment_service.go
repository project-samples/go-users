package comment

import (
	"context"
	"database/sql"
	"database/sql/driver"
	"fmt"
	"time"
)

type CommentService interface {
	Load(ctx context.Context, id string) (*Comment, error)
	Create(ctx context.Context, comment *Comment) (int64, error)
	Update(ctx context.Context, comment *Comment) (int64, error)
	Delete(ctx context.Context, commentId string, id string, author string) (int64, error)
}

func NewCommentService(
	db *sql.DB,
	table string,
	commentId string,
	id string,
	author string,
	userId string,
	comment string,
	time string,
	updateAt string,
	rateTable string,
	rateId string,
	rateAuthor string,
	commentCount string,
	toArray func(interface{}) interface {
		driver.Valuer
		sql.Scanner
	},
) CommentService {
	return &commentService{
		DB:           db,
		Table:        table,
		CommentId:    commentId,
		Id:           id,
		Author:       author,
		UserId:       userId,
		Comment:      comment,
		Time:         time,
		UpdateAt:     updateAt,
		RateTable:    rateTable,
		RateId:       rateId,
		RateAuthor:   rateAuthor,
		CommentCount: commentCount,
		ToArray:      toArray,
	}
}

type commentService struct {
	DB           *sql.DB
	Table        string
	CommentId    string
	Id           string
	Author       string
	UserId       string
	Comment      string
	Time         string
	UpdateAt     string
	RateTable    string
	RateId       string
	RateAuthor   string
	CommentCount string
	ToArray      func(interface{}) interface {
		driver.Valuer
		sql.Scanner
	}
}

func (s *commentService) Load(ctx context.Context, id string) (*Comment, error) {
	query := "select " + s.CommentId + ", " + s.Id + ", " + s.Author + ", " + s.UserId + ", " + s.Comment + ", " + s.Time + ", " + s.UpdateAt + ", histories from " + s.Table + " where " + s.CommentId + " = $1 limit 1"
	fmt.Println(query)
	rows, err := s.DB.QueryContext(ctx, query, id)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	for rows.Next() {
		var comment Comment
		err = rows.Scan(&comment.CommentId, &comment.Id, &comment.Author, &comment.UserId, &comment.Comment, &comment.Time, &comment.UpdateAt, s.ToArray(&comment.Histories))
		if err != nil {
			return nil, err
		}
		return &comment, nil
	}
	return nil, nil
}

func (s *commentService) Create(ctx context.Context, comment *Comment) (int64, error) {
	query1 := "insert into " + s.Table + " (" + s.CommentId + "," + s.Id + "," + s.Author + "," + s.UserId + "," + s.Comment + "," + s.Time + ") values ($1, $2, $3, $4, $5, $6)"
	fmt.Println(query1)
	stmt1, err := s.DB.Prepare(query1)
	if err != nil {
		return -1, err
	}
	res1, err := stmt1.ExecContext(ctx, comment.CommentId, comment.Id, comment.Author, comment.UserId, comment.Comment, comment.Time)
	if err != nil {
		return -1, err
	}

	query2 := "update " + s.RateTable + " set " + s.CommentCount + " = " + s.RateTable + "." + s.CommentCount + "+ 1 where " + s.RateId + " = $1 and " + s.RateAuthor + " = $2"
	fmt.Println(query2)
	stmt2, err := s.DB.Prepare(query2)
	if err != nil {
		return -1, err
	}
	stmt2.ExecContext(ctx, comment.Id, comment.Author)

	return res1.RowsAffected()
}

func (s *commentService) Update(ctx context.Context, comment *Comment) (int64, error) {
	oldComment, _ := s.Load(ctx, comment.CommentId)
	fmt.Println(oldComment)
	if oldComment.Histories != nil {
		comment.Histories = append(oldComment.Histories, Histories{Time: oldComment.UpdateAt, Comment: oldComment.Comment})
	} else {
		comment.Histories = append(oldComment.Histories, Histories{Time: oldComment.Time, Comment: oldComment.Comment})
	}

	query := "update " + s.Table + " set " + s.Comment + " = $1, " + s.UpdateAt + " = $2, " + "histories = $3 where " + s.CommentId + " = $4;"
	fmt.Println(query)
	stmt, err := s.DB.Prepare(query)
	if err != nil {
		return -1, err
	}
	res, err := stmt.ExecContext(ctx, comment.Comment, time.Now(), s.ToArray(comment.Histories), comment.CommentId)
	if err != nil {
		return -1, err
	}
	
	return res.RowsAffected()

}

func (s *commentService) Delete(ctx context.Context, commentId string, id string, author string) (int64, error) {
	query1 := "delete from " + s.Table + " where " + s.CommentId + " = $1"
	fmt.Println(query1)
	stmt1, er0 := s.DB.Prepare(query1)
	if er0 != nil {
		return -1, nil
	}
	res1, er1 := stmt1.ExecContext(ctx, commentId)
	if er1 != nil {
		return -1, er1
	}

	query2 := "update " + s.RateTable + " set " + s.CommentCount + " = " + s.RateTable + "." + s.CommentCount + "- 1 where " + s.RateId + " = $1 and " + s.RateAuthor + " = $2"
	stmt2, err := s.DB.Prepare(query2)
	if err != nil {
		return -1, err
	}
	stmt2.ExecContext(ctx, id, author)

	return res1.RowsAffected()
}
