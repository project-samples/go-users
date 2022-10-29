package film

import (
	"context"

	"github.com/core-go/core"
)

type BackOfficeFilmService interface {
	Load(ctx context.Context, id string) (*Film, error)
	Insert(ctx context.Context, film *Film) (int64, error)
	Update(ctx context.Context, film *Film) (int64, error)
	Patch(ctx context.Context, film map[string]interface{}) (int64, error)
	Delete(ctx context.Context, id interface{}) (int64, error)
}

func NewBackOfficeFilmService(
	repository core.Repository) BackOfficeFilmService {
	return &backOfficeFilmService{repository: repository}
}

type backOfficeFilmService struct {
	repository core.Repository
}

func (s *backOfficeFilmService) Load(ctx context.Context, id string) (*Film, error) {
	var film Film
	ok, err := s.repository.LoadAndDecode(ctx, id, &film)
	if !ok {
		return nil, err
	}
	return &film, nil
}

func (s *backOfficeFilmService) Insert(ctx context.Context, film *Film) (int64, error) {
	return s.repository.Insert(ctx, film)
}

func (s *backOfficeFilmService) Update(ctx context.Context, film *Film) (int64, error) {
	return s.repository.Update(ctx, film)

}

func (s *backOfficeFilmService) Patch(ctx context.Context, film map[string]interface{}) (int64, error) {
	return s.repository.Patch(ctx, film)

}

func (s *backOfficeFilmService) Delete(ctx context.Context, id interface{}) (int64, error) {
	return s.repository.Delete(ctx, id)

}
