package music

import (
	"context"
	"github.com/core-go/core"
)

type MusicService interface {
	Load(ctx context.Context, id string) (*Music, error)
}

type musicService struct {
	repository core.Repository
}

func NewMusicService(
	repository core.Repository) MusicService {
	return &musicService{repository: repository}
}

func (r *musicService) Load(ctx context.Context, id string) (*Music, error) {
	var room Music
	ok, err := r.repository.LoadAndDecode(ctx, id, &room)
	if !ok {
		return nil, err
	}
	return &room, nil
}
