package room

import (
	"context"
	"github.com/core-go/core"
)

type RoomService interface {
	Load(ctx context.Context, id string) (*Room, error)
}

func NewRoomService(repository core.Repository) RoomService {
	return &roomService{repository: repository}
}

type roomService struct {
	repository core.Repository
}

func (r *roomService) Load(ctx context.Context, id string) (*Room, error) {
	var room Room
	ok, err := r.repository.LoadAndDecode(ctx, id, &room)
	if !ok {
		return nil, err
	}
	return &room, err
}
