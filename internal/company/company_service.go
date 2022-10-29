package company

import (
	"context"

	"github.com/core-go/core"
)

type CompanyService interface {
	Load(context context.Context, id string) (*Company, error)
}

func NewCompanyService(repository core.ViewRepository, infoRepository core.ViewRepository) CompanyService {
	return &companyService{companyRepository: repository, infoRepository: infoRepository}
}

type companyService struct {
	companyRepository core.ViewRepository
	infoRepository    core.ViewRepository
}

func (s *companyService) Load(context context.Context, id string) (*Company, error) {
	var company Company
	ok, err := s.companyRepository.LoadAndDecode(context, id, &company)
	if !ok {
		return nil, err
	}
	var companyInfo Info
	ok, err = s.infoRepository.LoadAndDecode(context, id, &companyInfo)
	if !ok {
		return &company, err
	} else {
		company.Info = &companyInfo

		return &company, nil
	}
}
