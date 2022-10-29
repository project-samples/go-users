package userinfomation

import (
	"context"

	sv "github.com/core-go/core"
)

type UserInfomationService interface {
	Load(ctx context.Context, id string) (*UserInfomation, error)
}

func NewUserInfomationService(repository sv.ViewRepository) UserInfomationService {
	return &userInfomationService{repository: repository}
}

type userInfomationService struct {
	repository sv.ViewRepository
}

func (s *userInfomationService) Load(ctx context.Context, id string) (*UserInfomation, error) {
	var userinfomation UserInfomation
	ok, err := s.repository.LoadAndDecode(ctx, id, &userinfomation)
	if !ok {
		return &userinfomation, err
	}
	return &userinfomation, nil
}
