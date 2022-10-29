package saveditem

import (
	"context"
	"database/sql"
	"fmt"
	"go-service/internal/item"

	"github.com/lib/pq"
)

type SavedItemService interface {
	Load(ctx context.Context, id string) ([]item.Item, error)
	Save(ctx context.Context, id string, item string) (int64, error)
	Remove(ctx context.Context, id string, item string) (int64, error)
}

func NewSavedItemService(
	db *sql.DB,
	table string,
	idCol string,
	itemCol string,
	max int,

) SavedItemService {
	return &savedItemService{
		DB:      db,
		Table:   table,
		IdCol:   idCol,
		ItemCol: itemCol,
		Max:     max,
	}
}

type savedItemService struct {
	DB      *sql.DB
	Table   string
	IdCol   string
	ItemCol string
	Max     int
}

func (s *savedItemService) Load(ctx context.Context, id string) ([]item.Item, error) {
	var saveList []*SavedItem
	query := fmt.Sprintf("select %s as id, %s as items from %s where %s = $1", s.IdCol, s.ItemCol, s.Table, s.IdCol)

	rows, err := s.DB.QueryContext(ctx, query, id)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	for rows.Next() {
		var save SavedItem
		err = rows.Scan(&save.Id, pq.Array(&save.Items))
		if err != nil {
			return nil, err
		}
		saveList = append(saveList, &save)
	}
	result := []item.Item{}

	if len(saveList[0].Items) == 0 {
		return result, nil
	}

	query2 := fmt.Sprintf("SELECT * FROM %s WHERE %s = ANY($1)", "Item", "id")
	stmt, err0 := s.DB.PrepareContext(ctx, query2)
	if err0 != nil {
		return nil, err0
	}
	rows, err1 := stmt.QueryContext(ctx, pq.Array(saveList[0].Items))
	if err1 != nil {
		return nil, err1
	}
	defer rows.Close()
	for rows.Next() {
		var Item item.Item
		err2 := rows.Scan(
			&Item.Id,
			&Item.Title,
			&Item.Author,
			&Item.Description,
			&Item.Status,
			&Item.Price,
			&Item.ImageURL,
			&Item.Brand,
			&Item.PublishedAt,
			&Item.ExpiredAt,
			pq.Array(&Item.Categories),
			pq.Array(&Item.Gallery),
		)
		if err2 != nil {
			fmt.Println("result: ", err2)

			return nil, err2
		}
		result = append(result, Item)
	}
	return result, nil

}

func (s *savedItemService) Save(ctx context.Context, id string, item string) (int64, error) {

	var items []string
	query0 := fmt.Sprintf("select %s as items from %s where %s = $1", s.ItemCol, s.Table, s.IdCol)
	rows, err0 := s.DB.QueryContext(ctx, query0, id)
	if err0 != nil {
		return -1, err0
	}

	defer rows.Close()
	for rows.Next() {
		err := rows.Scan(pq.Array(&items))
		if err != nil {
			return -1, err
		}

	}

	if len(items) == 0 {
		query := fmt.Sprintf("insert into %s(%s, %s) values ($1, $2)", s.Table, s.IdCol, s.ItemCol)
		stmt, er0 := s.DB.Prepare(query)
		if er0 != nil {
			return -1, nil
		}
		items = append(items, item)
		res, err := stmt.ExecContext(ctx, id, pq.Array(items))
		if err != nil {
			return -1, err
		}
		return res.RowsAffected()
	} else {
		query := fmt.Sprintf("update %s set %s = $1 where %s = $2", s.Table, s.ItemCol, s.IdCol)
		stmt, er0 := s.DB.Prepare(query)
		if er0 != nil {
			return -1, nil
		}
		for _, v := range items {
			if v == item {
				return -1, nil
			}
		}
		items = append(items, item)
		if len(items) > s.Max {
			items = items[1:]
		}
		res, err := stmt.ExecContext(ctx, pq.Array(items), id)
		if err != nil {
			return -1, err
		}
		return res.RowsAffected()
	}
}

func (s *savedItemService) Remove(ctx context.Context, id string, item string) (int64, error) {
	query0 := fmt.Sprintf("select %s as id, %s as items from %s where %s = $1", s.IdCol, s.ItemCol, s.Table, s.IdCol)
	rows, err0 := s.DB.QueryContext(ctx, query0, id)
	if err0 != nil {
		return -1, err0
	}
	var items []SavedItem
	defer rows.Close()
	for rows.Next() {
		var item SavedItem
		err := rows.Scan(&item.Id, pq.Array(&item.Items))
		if err != nil {
			return -1, err
		}
		items = append(items, item)
	}
	if items == nil {
		return 0, nil
	}
	newItems := []string{}
	for i := 0; i < len(items[0].Items); i++ {
		if items[0].Items[i] != item {
			newItems = append(newItems, items[0].Items[i])
		}
	}
	query := fmt.Sprintf("update %s set %s = $1 where %s = $2", s.Table, s.ItemCol, s.IdCol)
	fmt.Println(query)
	stmt, er0 := s.DB.Prepare(query)
	if er0 != nil {
		return -1, er0
	}
	res, err := stmt.ExecContext(ctx, pq.Array(&newItems), id)
	if err != nil {
		return -1, err
	}

	return res.RowsAffected()
}
