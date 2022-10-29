package category

import (
	"context"

	sv "github.com/core-go/core"
)

type CategoryService interface {
	Load(ctx context.Context, id string) (*Category, error)
	Create(ctx context.Context, category *Category) (int64, error)
	Update(ctx context.Context, category *Category) (int64, error)
	Patch(ctx context.Context, category map[string]interface{}) (int64, error)
	Delete(ctx context.Context, id string) (int64, error)
}

func NewCategoryService(repository sv.Repository) CategoryService {
	return &categoryService{repository: repository}
}

type categoryService struct {
	repository sv.Repository
}

func (s *categoryService) Load(ctx context.Context, id string) (*Category, error) {
	var category Category
	ok, err := s.repository.LoadAndDecode(ctx, id, &category)
	if !ok {
		return nil, err
	}
	return &category, nil
}
func (s *categoryService) Create(ctx context.Context, category *Category) (int64, error) {
	return s.repository.Insert(ctx, category)
}

func (s *categoryService) Update(ctx context.Context, category *Category) (int64, error) {
	return s.repository.Update(ctx, category)
}
func (s *categoryService) Patch(ctx context.Context, category map[string]interface{}) (int64, error) {
	return s.repository.Patch(ctx, category)
}
func (s *categoryService) Delete(ctx context.Context, id string) (int64, error) {
	return s.repository.Delete(ctx, id)
}

// type CategoryService[T interface{}, F interface{}] interface {
// 	Load(ctx context.Context, id string) (*T, error)
// 	Create(ctx context.Context, category *T) (int64, error)
// 	Update(ctx context.Context, category *T) (int64, error)
// 	Patch(ctx context.Context, category map[string]interface{}) (int64, error)
// 	Delete(ctx context.Context, id string) (int64, error)
// }

// func NewCategoryService[T interface{}, F interface{}](repository sv.Repository) CategoryService[T, F] {
// 	return &categoryService[T, F]{repository: repository}
// }

// type categoryService[T interface{}, F interface{}] struct {
// 	repository sv.Repository
// }

// func (s *categoryService[T, F]) Load(ctx context.Context, id string) (*T, error) {
// 	var category T

// 	ok, err := s.repository.LoadAndDecode(ctx, id, &category)
// 	if !ok {
// 		return nil, err
// 	}

// 	return &category, err
// }

// func (s *categoryService[T, F]) Create(ctx context.Context, category *T) (int64, error) {
// 	return s.repository.Insert(ctx, category)
// }

// func (s *categoryService[T, F]) Update(ctx context.Context, category *T) (int64, error) {
// 	return s.repository.Update(ctx, category)
// }
// func (s *categoryService[T, F]) Patch(ctx context.Context, category map[string]interface{}) (int64, error) {
// 	return s.repository.Patch(ctx, category)
// }
// func (s *categoryService[T, F]) Delete(ctx context.Context, id string) (int64, error) {
// 	return s.repository.Delete(ctx, id)
// }
