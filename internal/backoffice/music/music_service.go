package music

import (
	"context"
	"github.com/core-go/core"
)

type BackOfficeMusicService interface {
	Load(ctx context.Context, id string) (*Music, error)
	Insert(ctx context.Context, music *Music) (int64, error)
	Update(ctx context.Context, music *Music) (int64, error)
	Patch(ctx context.Context, music map[string]interface{}) (int64, error)
	Delete(ctx context.Context, id interface{}) (int64, error)
}

type backOfficeMusicService struct {
	repository core.Repository
}

func NewBackOfficeMusicService(
	repository core.Repository) BackOfficeMusicService {
	return &backOfficeMusicService{repository: repository}
}

func (r *backOfficeMusicService) Load(ctx context.Context, id string) (*Music, error) {
	var room Music
	ok, err := r.repository.LoadAndDecode(ctx, id, &room)
	if !ok {
		return nil, err
	}
	return &room, nil
}

func (r *backOfficeMusicService) Insert(ctx context.Context, music *Music) (int64, error) {
	return r.repository.Insert(ctx, music)
}

func (r *backOfficeMusicService) Update(ctx context.Context, music *Music) (int64, error) {
	return r.repository.Update(ctx, music)
}

func (r *backOfficeMusicService) Delete(ctx context.Context, id interface{}) (int64, error) {
	return r.repository.Delete(ctx, id)
}

func (r *backOfficeMusicService) Patch(ctx context.Context, music map[string]interface{}) (int64, error) {
	return r.repository.Patch(ctx, music)
}
