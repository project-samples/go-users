package commentthread

import (
	"context"
	"database/sql"
	"database/sql/driver"
	"fmt"
	"time"
)

type CommentThreadService interface {
	Comment(ctx context.Context, comment CommentThread) (int64, error)
	Update(ctx context.Context, comment CommentThread) (int64, error)
	Remove(ctx context.Context, commentId string) (int64, error)
	Load(ctx context.Context, commentId string) (*CommentThread, error)
}

func NewCommentThreadService(
	db *sql.DB,
	toArray func(interface{}) interface {
		driver.Valuer
		sql.Scanner
	},
	threadTable string,
	commentIdThreadCol string,
	idThreadCol string,
	authorThreadCol string,
	historiesThreadCol string,
	commentThreadCol string,
	timeThreadCol string,
	userIdThreadCol string,
	updatedAtCol string,
	threadReplyTable string,
	commentIdThreadReplyCol string,
	threadInfoTable string,
	commentIdthreadInfo string,
	threadReplyInfoTable string,
	commentIdThreadReplyInfoCol string,
	reactionTable string,
	commentIdReactionCol string,
	reactionReplyTable string,
	commentIdReactionRelyCol string,
) CommentThreadService {
	return &commentThreadService{
		db:                          db,
		toArray:                     toArray,
		threadTable:                 threadTable,
		commentIdThreadCol:          commentIdThreadCol,
		idThreadCol:                 idThreadCol,
		authorThreadCol:             authorThreadCol,
		historiesThreadCol:          historiesThreadCol,
		commentThreadCol:            commentThreadCol,
		timeThreadCol:               timeThreadCol,
		updatedAtCol:                updatedAtCol,
		userIdThreadCol:             userIdThreadCol,
		threadReplyTable:            threadReplyTable,
		commentIdThreadReplyCol:     commentIdThreadReplyCol,
		threadInfoTable:             threadInfoTable,
		commentIdthreadInfo:         commentIdthreadInfo,
		threadReplyInfoTable:        threadReplyInfoTable,
		commentIdThreadReplyInfoCol: commentIdThreadReplyInfoCol,
		reactionTable:               reactionTable,
		commentIdReactionCol:        commentIdReactionCol,
		reactionReplyTable:          reactionReplyTable,
		commentIdReactionRelyCol:    commentIdReactionRelyCol,
	}
}

type commentThreadService struct {
	db      *sql.DB
	toArray func(interface{}) interface {
		driver.Valuer
		sql.Scanner
	}
	threadTable                 string
	commentIdThreadCol          string
	idThreadCol                 string
	authorThreadCol             string
	historiesThreadCol          string
	commentThreadCol            string
	timeThreadCol               string
	updatedAtCol                string
	userIdThreadCol             string
	threadReplyTable            string
	commentIdThreadReplyCol     string
	threadInfoTable             string
	commentIdthreadInfo         string
	threadReplyInfoTable        string
	commentIdThreadReplyInfoCol string
	reactionTable               string
	commentIdReactionCol        string
	reactionReplyTable          string
	commentIdReactionRelyCol    string
}

// Remove implements CommentThreadService
func (s *commentThreadService) Remove(ctx context.Context, commentId string) (int64, error) {
	var rowResult int64
	rowResult = 0
	tx, err := s.db.BeginTx(ctx, nil)
	if err != nil {
		return -1, err
	}
	defer tx.Rollback()
	qr1 := fmt.Sprintf("Delete from %s where %s = $1", s.threadTable, s.commentIdThreadCol)
	res, err := tx.ExecContext(ctx, qr1, commentId)
	if err != nil {
		return -1, err
	}
	rowsAffected, err := res.RowsAffected()
	if err != nil {
		return -1, err
	}
	rowResult += rowsAffected

	qr2 := fmt.Sprintf("Delete from %s where %s = $1", s.threadReplyTable, s.commentIdThreadReplyCol)
	res, err = tx.ExecContext(ctx, qr2, commentId)
	if err != nil {
		return -1, err
	}
	rowsAffected, err = res.RowsAffected()
	if err != nil {
		return -1, err
	}
	rowResult += rowsAffected

	qr3 := fmt.Sprintf("Delete from %s where %s = $1", s.threadInfoTable, s.commentIdthreadInfo)
	res, err = tx.ExecContext(ctx, qr3, commentId)
	if err != nil {
		return -1, err
	}
	rowsAffected, err = res.RowsAffected()
	if err != nil {
		return -1, err
	}
	rowResult += rowsAffected

	qr4 := fmt.Sprintf("delete from %s a where %s in (select %s from %s where %s = $1)",
		s.threadReplyInfoTable, s.commentIdThreadReplyInfoCol, s.commentIdThreadReplyCol, s.threadReplyTable, s.commentIdThreadReplyCol)

	res, err = tx.ExecContext(ctx, qr4, commentId)
	if err != nil {
		return -1, err
	}
	rowsAffected, err = res.RowsAffected()
	if err != nil {
		return -1, err
	}
	rowResult += rowsAffected
	qr5 := fmt.Sprintf("delete from %s a where %s = $1",
		s.reactionTable, s.commentIdReactionCol)

	res, err = tx.ExecContext(ctx, qr5, commentId)
	if err != nil {
		return -1, err
	}
	rowsAffected, err = res.RowsAffected()
	if err != nil {
		return -1, err
	}
	rowResult += rowsAffected
	qr6 := fmt.Sprintf("delete from %s a where %s in (select %s from %s where %s = $1)",
		s.reactionReplyTable, s.commentIdReactionRelyCol, s.commentIdThreadReplyCol, s.threadReplyTable, s.commentIdThreadReplyCol)

	res, err = tx.ExecContext(ctx, qr6, commentId)
	if err != nil {
		return -1, err
	}
	rowsAffected, err = res.RowsAffected()
	if err != nil {
		return -1, err
	}
	rowResult += rowsAffected

	if err = tx.Commit(); err != nil {
		return -1, err
	}
	return rowResult, nil
}

// Load implements CommentThreadService
func (s *commentThreadService) Load(ctx context.Context, commentId string) (*CommentThread, error) {
	qr1 := fmt.Sprintf("Select * from %s where %s = $1", s.threadTable, s.commentIdThreadCol)
	res, err := s.db.QueryContext(ctx, qr1, commentId)
	if err != nil {
		return nil, err
	}
	for res.Next() {
		var item *CommentThread
		err = res.Scan(&item.CommentId, &item.Id, &item.Author, &item.UserId, &item.Comment, &item.Time, &item.UpdatedAt, s.toArray(&item.Histories))
		if err != nil {
			return nil, err
		}
		return item, nil
	}
	return nil, nil
}

// Update implements CommentThreadService
func (s *commentThreadService) Update(ctx context.Context, comment CommentThread) (int64, error) {
	exist, err := s.Load(ctx, comment.CommentId)
	if err != nil {
		return -1, err
	}
	if exist != nil {
		updatedTime := comment.UpdatedAt
		if exist.UpdatedAt == nil {
			updatedTime = &exist.Time
		}

		exist.Histories = append(exist.Histories, History{Comment: comment.Comment, Time: *updatedTime})
		qr1 := fmt.Sprintf("update %s set %s = $1, %s = $2, %s = $3 where %s = $4",
			s.threadTable, s.commentThreadCol, s.updatedAtCol, s.historiesThreadCol, s.commentIdThreadCol)
		res, err := s.db.ExecContext(ctx, qr1, comment.Comment, time.Now(), comment.Histories, comment.CommentId)
		if err != nil {
			return -1, err
		}
		return res.RowsAffected()
	}
	return -1, nil
}

// comment implements CommentThreadService
func (s *commentThreadService) Comment(ctx context.Context, comment CommentThread) (int64, error) {
	// insert into commentthread(commentid, id, author , userId, comment, time ,histories) values ()
	qr1 := fmt.Sprintf("insert into %s(%s,%s,%s,%s,%s,%s,%s) values($1, $2, $3, $4, $5, $6)",
		s.threadTable, s.commentIdThreadCol, s.idThreadCol, s.authorThreadCol, s.userIdThreadCol, s.commentThreadCol, s.timeThreadCol, s.historiesThreadCol)
	res, err := s.db.ExecContext(ctx, qr1, comment.CommentId, comment.Id, comment.Author, comment.UserId, comment.Comment, comment.Time, []History{})
	if err != nil {
		return -1, err
	}
	return res.RowsAffected()
}
