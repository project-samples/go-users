package room

import (
	"context"
	"github.com/core-go/core"
)

type BackOfficeRoomService interface {
	Load(ctx context.Context, id string) (*Room, error)
	Insert(ctx context.Context, room *Room) (int64, error)
	Update(ctx context.Context, room *Room) (int64, error)
	Patch(ctx context.Context, room map[string]interface{}) (int64, error)
	Delete(ctx context.Context, id interface{}) (int64, error)
}

type backOfficeRoomService struct {
	repository core.Repository
}

func NewBackOfficeRoomService(
	repository core.Repository) BackOfficeRoomService {
	return &backOfficeRoomService{repository: repository}
}

func (r *backOfficeRoomService) Load(ctx context.Context, id string) (*Room, error) {
	var room Room
	ok, err := r.repository.LoadAndDecode(ctx, id, &room)
	if !ok {
		return nil, err
	}
	return &room, nil
}

func (r *backOfficeRoomService) Insert(ctx context.Context, room *Room) (int64, error) {
	return r.repository.Insert(ctx, room)
}

func (r *backOfficeRoomService) Update(ctx context.Context, room *Room) (int64, error) {
	return r.repository.Update(ctx, room)
}

func (r *backOfficeRoomService) Delete(ctx context.Context, id interface{}) (int64, error) {
	return r.repository.Delete(ctx, id)
}

func (r *backOfficeRoomService) Patch(ctx context.Context, room map[string]interface{}) (int64, error) {
	return r.repository.Patch(ctx, room)
}
