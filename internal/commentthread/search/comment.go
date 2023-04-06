package search

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

type CommentThreadSearchService interface {
	Search(ctx context.Context, rf *commentthread.CommentThreadFilter) ([]commentthread.CommentThread, int64, error)
}

type commentThreadSearchService struct {
	Database    *sql.DB
	BuildQuery  func(sm interface{}) (string, []interface{})
	ModelType   reflect.Type
	Map         func(ctx context.Context, model interface{}) (interface{}, error)
	fieldsIndex map[string]int
	ToArray     func(interface{}) interface {
		driver.Valuer
		sql.Scanner
	}
	queryInfo func(ids []string) ([]Info, error)
}

func NewCommentThreadSearchService(Database *sql.DB,
	BuildQuery func(sm interface{}) (string, []interface{}),
	ToArray func(interface{}) interface {
		driver.Valuer
		sql.Scanner
	}, queryInfo func(ids []string) ([]Info, error),
) (*commentThreadSearchService, error) {
	modelType := reflect.TypeOf(commentthread.CommentThread{})
	fieldsIndex, _ := GetColumnIndexes(modelType)
	return &commentThreadSearchService{
		Database:    Database,
		BuildQuery:  BuildQuery,
		ModelType:   modelType,
		Map:         nil,
		fieldsIndex: fieldsIndex,
		queryInfo:   queryInfo,
		ToArray:     ToArray,
	}, nil
}

func (f *commentThreadSearchService) Search(ctx context.Context, rf *commentthread.CommentThreadFilter) ([]commentthread.CommentThread, int64, error) {
	sql, params := f.BuildQuery(rf)
	fmt.Print(sql, params)
	rates := make([]commentthread.CommentThread, 0)
	if rf.Page == 0 {
		rf.Page = 1
	}
	offset := s.GetOffset(rf.Limit, rf.Page)

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
