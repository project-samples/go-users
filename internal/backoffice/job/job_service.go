package job

import (
	"context"
	"github.com/core-go/core"
)

type BackOfficeJobService interface {
	Load(ctx context.Context, id string) (*Job, error)
	Insert(ctx context.Context, room *Job) (int64, error)
	Update(ctx context.Context, room *Job) (int64, error)
	Patch(ctx context.Context, room map[string]interface{}) (int64, error)
	Delete(ctx context.Context, id interface{}) (int64, error)
}

type backOfficeJobService struct {
	repository core.Repository
}

func NewBackOfficeJobService(
	repository core.Repository) BackOfficeJobService {
	return &backOfficeJobService{repository: repository}
}

func (r *backOfficeJobService) Load(ctx context.Context, id string) (*Job, error) {
	var room Job
	ok, err := r.repository.LoadAndDecode(ctx, id, &room)
	if !ok {
		return nil, err
	}
	return &room, nil
}

func (r *backOfficeJobService) Insert(ctx context.Context, room *Job) (int64, error) {
	return r.repository.Insert(ctx, room)
}

func (r *backOfficeJobService) Update(ctx context.Context, room *Job) (int64, error) {
	return r.repository.Update(ctx, room)
}

func (r *backOfficeJobService) Delete(ctx context.Context, id interface{}) (int64, error) {
	return r.repository.Delete(ctx, id)
}

func (r *backOfficeJobService) Patch(ctx context.Context, room map[string]interface{}) (int64, error) {
	return r.repository.Patch(ctx, room)
}
