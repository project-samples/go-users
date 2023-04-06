package ratereactionsearch

import (
	"context"
	"database/sql"
	"database/sql/driver"
	"fmt"
	s "github.com/core-go/search"
	. "github.com/core-go/sql"
	"go-service/internal/commentthread"
	. "go-service/internal/userinfo"
	"reflect"
)

type CommentSearchService interface {
	Search(ctx context.Context, rf *commentthread.CommentThreadFilter) ([]commentthread.CommentThread, int64, error)
}

type commentSearchService struct {
	Database    *sql.DB
	BuildQuery  func(sm interface{}) (string, []interface{})
	offset      int64
	ModelType   reflect.Type
	Map         func(ctx context.Context, model interface{}) (interface{}, error)
	fieldsIndex map[string]int
	ToArray     func(interface{}) interface {
		driver.Valuer
		sql.Scanner
	}
	queryInfo func(ids []string) ([]Info, error)
}

func NewCommentSearchService(Database *sql.DB,
	BuildQuery func(sm interface{}) (string, []interface{}),
	ToArray func(interface{}) interface {
		driver.Valuer
		sql.Scanner
	}, queryInfo func(ids []string) ([]Info, error),
) (*commentSearchService, error) {
	modelType := reflect.TypeOf(commentthread.CommentThread{})
	fieldsIndex, _ := GetColumnIndexes(modelType)
	return &commentSearchService{
		Database:    Database,
		BuildQuery:  BuildQuery,
		ModelType:   modelType,
		Map:         nil,
		fieldsIndex: fieldsIndex,
		offset:      0,
		queryInfo:   queryInfo,
		ToArray:     ToArray,
	}, nil
}

func (f *commentSearchService) Search(ctx context.Context, rf *commentthread.CommentThreadFilter) ([]commentthread.CommentThread, int64, error) {
	sql, params := f.BuildQuery(rf)
	fmt.Print(sql, params)
	rates := make([]commentthread.CommentThread, 0)
	if rf.PageIndex == 0 {
		rf.PageIndex = 1
	}
	offset := s.GetOffset(rf.Limit, rf.PageIndex)

	total1, er2 := BuildFromQuery(ctx, f.Database, f.fieldsIndex, &rates, sql, params, rf.Limit, offset, f.ToArray, f.Map)
	if er2 != nil {
		return rates, total1, er2
	}
	if f.queryInfo == nil {
		return rates, total1, nil
	}
	ids := make([]string, 0)
	for _, r := range rates {
		ids = append(ids, r.Author)
	}
	infos, err := f.queryInfo(ids)
	if err != nil {
		return rates, total1, err
	}
	for k, _ := range rates {
		c := rates[k]
		i := BinarySearch(infos, c.Author)
		if i >= 0 {
			rates[k].AuthorURL = &infos[i].Url
			if infos[i].DisplayName != nil {
				rates[k].AuthorName = infos[i].DisplayName
			} else {
				rates[k].AuthorName = &infos[i].Name
			}
		}
	}
	if err != nil {
		return rates, total1, err
	}
	return rates, total1, nil
}