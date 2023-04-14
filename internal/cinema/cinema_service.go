package cinema

import (
	"context"

	sv "github.com/core-go/core"
)

type CinemaService interface {
	Load(ctx context.Context, id string) (*Cinema, error)
}

func NewCinemaService(repository sv.Repository) CinemaService {
	return &cinemaService{repository: repository}
}

type cinemaService struct {
	repository sv.Repository
}

func (s *cinemaService) Load(ctx context.Context, id string) (*Cinema, error) {
	var Cinema Cinema
	ok, err := s.repository.LoadAndDecode(ctx, id, &Cinema)
	if !ok {
		return nil, err
	} else {
		return &Cinema, err
	}
}
