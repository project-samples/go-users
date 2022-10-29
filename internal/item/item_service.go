package item

import (
	"context"
	sv "github.com/core-go/core"
)

type ItemService interface {
	Load(ctx context.Context, id string) (*Item, error)
}

func NewItemService(repository sv.Repository) ItemService {
	return &itemService{repository: repository}
}

type itemService struct {
	repository sv.Repository
}

func (s *itemService) Load(ctx context.Context, id string) (*Item, error) {
	var item Item
	ok, err := s.repository.LoadAndDecode(ctx, id, &item)
	if !ok {
		return nil, err
	} else {
		return &item, err
	}
}
