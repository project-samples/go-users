package film

import (
	"context"
	"go-service/internal/reaction/comment"
	. "go-service/internal/userinfo"
)

type FilmRateSearchService interface {
	Search(ctx context.Context, m interface{}, results interface{}, limit int64, options ...int64) (int64, string, error)
}

type Model struct {
	Anonymous bool    `json:"anonymous,omitempty" gorm:"column:anonymous" bson:"anonymous,omitempty" dynamodbav:"anonymous,omitempty" firestore:"anonymous,omitempty"`
	AuthorURL *string `json:"authorURL,omitempty" gorm:"column:imageurl"`
	Username  *string `json:"authorName,omitempty" gorm:"column:username"`
}

type filmRateSearchService struct {
	find      func(ctx context.Context, m interface{}, results interface{}, limit int64, options ...int64) (int64, string, error)
	queryInfo func(ids []string) ([]Info, error)
	mapResult func(r interface{}) error
}

func NewFilmSearchService(find func(ctx context.Context, m interface{}, results interface{}, limit int64, options ...int64) (int64, string, error),
	queryInfo func(ids []string) ([]Info, error)) *filmRateSearchService {
	return &filmRateSearchService{find: find, queryInfo: queryInfo}
}

func (f *filmRateSearchService) Search(ctx context.Context, m interface{}, results interface{}, limit int64, options ...int64) (int64, string, error) {
	total1, r1, er1 := f.find(ctx, m, results, limit, options...)
	if f.queryInfo == nil {
		return total1, r1, er1
	}
	comments := make([]comment.Comment, 0)
	err := ObjectAssign(&comments, results)
	if err != nil {
		return 0, "", err
	}
	ids := make([]string, 0)
	for _, r := range comments {
		ids = append(ids, r.Id)
	}
	infos, err := f.queryInfo(ids)
	if err != nil {
		return total1, r1, err
	}
	for k, _ := range comments {
		c := comments[k]
		i := BinarySearch(infos, c.Author)
		if i >= 0 && !c.Anonymous {
			comments[k].AuthorURL = &infos[i].Url
			if infos[i].DisplayName != nil {
				comments[k].AuthorName = infos[i].DisplayName
			} else {
				comments[k].AuthorName = &infos[i].Name
			}
		}
	}
	if err != nil {
		return total1, r1, err
	}
	return total1, r1, nil
}
