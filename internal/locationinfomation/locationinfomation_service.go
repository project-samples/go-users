package locationinfomation

import (
	"context"

	sv "github.com/core-go/core"
)

type LocationInfomationService interface {
	Load(ctx context.Context, id string) (*LocationInfomation, error)
}

func NewLocationInfomationService(repo sv.ViewRepository) LocationInfomationService {
	return &locationInfomationService{Repository: repo}
}

type locationInfomationService struct {
	Repository sv.ViewRepository
}

// Load implements LocationInfomationService
func (s *locationInfomationService) Load(ctx context.Context, id string) (*LocationInfomation, error) {
	var locationinfo LocationInfomation
	ok, err := s.Repository.LoadAndDecode(ctx, id, &locationinfo)
	if !ok {
		return &locationinfo, err
	}
	return &locationinfo, nil
}
