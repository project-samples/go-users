package entity

import "context"

type EntityRepository interface {
	Load(ctx context.Context, id string) (*Entity, error)
	Create(ctx context.Context, entity *Entity) (int64, error)
	Update(ctx context.Context, entity *Entity) (int64, error)
	Patch(ctx context.Context, entity map[string]interface{}) (int64, error)
	Delete(ctx context.Context, id string) (int64, error)
}
