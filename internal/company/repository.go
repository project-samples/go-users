package company

import (
	"context"
	"database/sql"
	sqlx "github.com/core-go/sql"
	"github.com/lib/pq"
	"log"
)

type ICompanyUserRepository interface {
	LoadByUserId(ctx context.Context, id interface{}) ([]Company, error)
}

type CompanyUserRepository struct {
	db *sql.DB
}

func NewCompanyUserRepository(db *sql.DB) *CompanyUserRepository {
	return &CompanyUserRepository{
		db,
	}
}

func (c CompanyUserRepository) LoadByUserId(ctx context.Context, id interface{}) ([]Company, error) {
	list := make([]Company, 0)
	err := sqlx.QueryWithArray(ctx, c.db, nil, &list, pq.Array, "select c.* from company c  join company_users cu on cu.company_id  = c.id")
	if err != nil {
		log.Fatal(err)
	}
	return list, err
}
