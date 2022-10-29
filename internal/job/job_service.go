package job

import (
	"context"
	"database/sql"
	"github.com/core-go/core"
	"github.com/core-go/core/search"
	"reflect"
)

type JobService interface {
	Load(ctx context.Context, id string) (*Job, error)
}

type jobService struct {
	db         *sql.DB
	repository core.Repository
	search.SearchService
	modelType reflect.Type
}

func NewJobService(
	repository core.Repository) JobService {
	return &jobService{repository: repository}
}

func (r *jobService) Load(ctx context.Context, id string) (*Job, error) {
	var room Job
	ok, err := r.repository.LoadAndDecode(ctx, id, &room)
	if !ok {
		return nil, err
	}
	return &room, nil
}
