package myitem

import (
	"context"
	sv "github.com/core-go/core"
)

type ItemService interface {
	Load(ctx context.Context, id string) (*Item, error)
	Create(ctx context.Context, item *Item) (int64, error)
	Update(ctx context.Context, item *Item) (int64, error)
	Patch(ctx context.Context, item map[string]interface{}) (int64, error)
	Delete(ctx context.Context, id string) (int64, error)
}

func NewMyItemService(repository sv.Repository) ItemService {
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
func (s *itemService) Create(ctx context.Context, item *Item) (int64, error) {
	return s.repository.Insert(ctx, item)
}
func (s *itemService) Update(ctx context.Context, item *Item) (int64, error) {
	return s.repository.Update(ctx, item)
}
func (s *itemService) Patch(ctx context.Context, item map[string]interface{}) (int64, error) {
	return s.repository.Patch(ctx, item)
}
func (s *itemService) Delete(ctx context.Context, id string) (int64, error) {
	return s.repository.Delete(ctx, id)
}
