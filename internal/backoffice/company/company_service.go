package company

import (
	"context"

	"github.com/core-go/core"
)

type BackofficeCompanyService interface {
	Load(ctx context.Context, id interface{}) (*Company, error)
	Insert(ctx context.Context, company *Company) (int64, error)
	Update(ctx context.Context, company *Company) (int64, error)
	Patch(ctx context.Context, company map[string]interface{}) (int64, error)
	Delete(ctx context.Context, id interface{}) (int64, error)
}

func NewBackofficeCompanyService(repository core.Repository) BackofficeCompanyService {
	return &backofficeCompanyService{
		repository: repository,
	}
}

type backofficeCompanyService struct {
	repository core.Repository
}

func (s *backofficeCompanyService) Load(ctx context.Context, id interface{}) (*Company, error) {
	var company Company
	ok, err := s.repository.LoadAndDecode(ctx, id, &company)

	if !ok {
		return nil, err
	}
	return &company, nil
}
func (s *backofficeCompanyService) Insert(ctx context.Context, company *Company) (int64, error) {
	return s.repository.Insert(ctx, company)
}
func (s *backofficeCompanyService) Update(ctx context.Context, company *Company) (int64, error) {
	return s.repository.Update(ctx, company)

}

func (s *backofficeCompanyService) Patch(ctx context.Context, company map[string]interface{}) (int64, error) {
	return s.repository.Patch(ctx, company)

}

func (s *backofficeCompanyService) Delete(ctx context.Context, id interface{}) (int64, error) {
	return s.repository.Delete(ctx, id)

}
