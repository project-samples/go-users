package myitem

import (
	"fmt"
	q "github.com/core-go/sql"
	"strings"
)

func BuildMyItemQuery(filter interface{}) (query string, params []interface{}) {
	query = `select * from item`
	s := filter.(*ItemFilter)
	var where []string

	i := 1
	if len(s.Id) > 0 {
		where = append(where, fmt.Sprintf(`id = %s`, q.BuildDollarParam(i)))
		params = append(params, s.Id)
		i++
	}
	if len(s.Title) > 0 {
		where = append(where, fmt.Sprintf(`title ilike %s`, q.BuildDollarParam(i)))
		params = append(params, "%" + s.Title + "%")
		i++
	}
	if len(s.Description) > 0 {
		where = append(where, fmt.Sprintf(`description ilike %s`, q.BuildDollarParam(i)))
		params = append(params, "%" + s.Description + "%")
		i++
	}
	if len(s.Status) > 0 {
		where = append(where, fmt.Sprintf(`status ilike %s`, q.BuildDollarParam(i)))
		params = append(params, "%" + s.Status + "%")
		i++
	}
	if len(s.Brand) > 0 {
		where = append(where, fmt.Sprintf(`brand ilike %s`, q.BuildDollarParam(i)))
		params = append(params, s.Brand)
		i++
	}
	if len(s.Categories) > 0 {
		where = append(where, fmt.Sprintf(`categories && %s`, q.BuildDollarParam(i)))
		params = append(params, s.Categories)
		i++
	}
	if s.Price != nil {
		if s.Price.Min != nil {
			where = append(where, fmt.Sprintf(`price >= %s`, q.BuildDollarParam(i)))
			params = append(params, s.Price.Min)
			i++
		}
		if s.Price.Max != nil {
			where = append(where, fmt.Sprintf(`price <= %s`, q.BuildDollarParam(i)))
			params = append(params, s.Price.Max)
			i++
		}
	}
	if s.PublishedAt != nil {
		if s.PublishedAt.Min != nil {
			where = append(where, fmt.Sprintf(`publishedAt >= %s`, q.BuildDollarParam(i)))
			params = append(params, s.PublishedAt.Min)
			i++
		}
		if s.PublishedAt.Max != nil {
			where = append(where, fmt.Sprintf(`publishedAt <= %s`, q.BuildDollarParam(i)))
			params = append(params, s.PublishedAt.Max)
			i++
		}
	}
	if s.ExpiredAt != nil {
		if s.ExpiredAt.Min != nil {
			where = append(where, fmt.Sprintf(`expiredAt >= %s`, q.BuildDollarParam(i)))
			params = append(params, s.ExpiredAt.Min)
			i++
		}
		if s.ExpiredAt.Max != nil {
			where = append(where, fmt.Sprintf(`expiredAt <= %s`, q.BuildDollarParam(i)))
			params = append(params, s.ExpiredAt.Max)
			i++
		}
	}

	if len(where) > 0 {
		query = query + ` where ` + strings.Join(where, " and ")
	}
	return
}
