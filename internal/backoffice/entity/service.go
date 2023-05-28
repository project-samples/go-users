package entity

import "context"

type entitieservice interface {
	Load(ctx context.Context, id string) (*Entity, error)
	Create(ctx context.Context, entity *Entity) (int64, error)
	Update(ctx context.Context, entity *Entity) (int64, error)
	Patch(ctx context.Context, entity map[string]interface{}) (int64, error)
	Delete(ctx context.Context, id string) (int64, error)
}

func Newentitieservice(repository EntityRepository) entitieservice {
	return &EntityUseCase{repository: repository}
}

type EntityUseCase struct {
	repository EntityRepository
}

func (s *EntityUseCase) Load(ctx context.Context, id string) (*Entity, error) {
	return s.repository.Load(ctx, id)
}
func (s *EntityUseCase) Create(ctx context.Context, entity *Entity) (int64, error) {
	return s.repository.Create(ctx, entity)
}
func (s *EntityUseCase) Update(ctx context.Context, entity *Entity) (int64, error) {
	return s.repository.Update(ctx, entity)
}
func (s *EntityUseCase) Patch(ctx context.Context, entity map[string]interface{}) (int64, error) {
	return s.repository.Patch(ctx, entity)
}
func (s *EntityUseCase) Delete(ctx context.Context, id string) (int64, error) {
	return s.repository.Delete(ctx, id)
}
