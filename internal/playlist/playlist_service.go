package playlist

import (
	"context"
	"github.com/core-go/core"
)

type PlaylistService interface {
	Load(ctx context.Context, id string) (*Playlist, error)
	Insert(ctx context.Context, music *Playlist) (int64, error)
	Update(ctx context.Context, music *Playlist) (int64, error)
	Delete(ctx context.Context, id interface{}) (int64, error)
	Patch(ctx context.Context, music map[string]interface{}) (int64, error)
}

type playlistService struct {
	repository core.Repository
}

func NewPlaylistService(
	repository core.Repository) PlaylistService {
	return &playlistService{repository: repository}
}

func (r *playlistService) Load(ctx context.Context, id string) (*Playlist, error) {
	var playlist Playlist
	ok, err := r.repository.LoadAndDecode(ctx, id, &playlist)
	if !ok {
		return nil, err
	}
	return &playlist, nil
}

func (r *playlistService) Insert(ctx context.Context, music *Playlist) (int64, error) {
	return r.repository.Insert(ctx, music)
}

func (r *playlistService) Update(ctx context.Context, music *Playlist) (int64, error) {
	return r.repository.Update(ctx, music)
}

func (r *playlistService) Delete(ctx context.Context, id interface{}) (int64, error) {
	return r.repository.Delete(ctx, id)
}

func (r *playlistService) Patch(ctx context.Context, music map[string]interface{}) (int64, error) {
	return r.repository.Patch(ctx, music)
}
