package bolocation

import (
	"context"

	sv "github.com/core-go/core"
)

type BackOfficeLocationService interface {
	Load(ctx context.Context, id string) (*Location, error)
	Insert(ctx context.Context, location *Location) (int64, error)
	Update(ctx context.Context, location *Location) (int64, error)
	Patch(ctx context.Context, location map[string]interface{}) (int64, error)
	Delete(ctx context.Context, id interface{}) (int64, error)
}

func NewBackOfficeLocationService(
	repository sv.Repository) BackOfficeLocationService {
	return &backOfficeLocationService{repository: repository}
}

type backOfficeLocationService struct {
	repository sv.Repository
}

func (s *backOfficeLocationService) Load(ctx context.Context, id string) (*Location, error) {
	var location Location
	ok, err := s.repository.LoadAndDecode(ctx, id, &location)
	if !ok {
		return nil, err
	}
	return &location, nil
}

func (s *backOfficeLocationService) Insert(ctx context.Context, location *Location) (int64, error) {
	return s.repository.Insert(ctx, location)
}

func (s *backOfficeLocationService) Update(ctx context.Context, location *Location) (int64, error) {
	return s.repository.Update(ctx, location)

}

func (s *backOfficeLocationService) Patch(ctx context.Context, location map[string]interface{}) (int64, error) {
	return s.repository.Patch(ctx, location)

}

func (s *backOfficeLocationService) Delete(ctx context.Context, id interface{}) (int64, error) {
	return s.repository.Delete(ctx, id)

}
