package film

import (
	"context"

	sv "github.com/core-go/core"
)

type FilmService interface {
	Load(ctx context.Context, id string) (*Film, error)
}

func NewFilmService(repository sv.Repository, repositoryInfo sv.Repository) FilmService {
	return &filmService{repository: repository, repositoryInfo: repositoryInfo}
}

type filmService struct {
	repository     sv.Repository
	repositoryInfo sv.Repository
}

func (s *filmService) Load(ctx context.Context, id string) (*Film, error) {
	var film Film
	ok, err := s.repository.LoadAndDecode(ctx, id, &film)
	if !ok {
		return nil, err
	}
	var filmInfo Info10
	ok, err = s.repositoryInfo.LoadAndDecode(ctx, id, &filmInfo)
	if !ok {
		return &film, err
	} else {
		film.Info = &filmInfo
		return &film, err
	}
}

// func NewSavedFilmService(db *sql.DB,
// 	// find func(context.Context, interface{}, interface{}, int64, ...int64) (int64, string, error),
// 	Table string,
// 	Field string,
// 	Id string,
// 	Max int,
// 	// Sort string
// ) SavedFilmService {

// 	return &savedFilmService{DB: db, Table: Table, Field: Field, Id: Id, Max: Max}
// }

// type savedFilmService struct {
// 	DB    *sql.DB
// 	Table string
// 	Field string
// 	Id    string
// 	// Number int16
// 	Sort       string
// 	Repository SavedFilmRepository
// 	Max        int
// 	// find   func(context.Context, interface{}, interface{}, int64, ...int64) (int64, string, error)
// }

// func (s *savedFilmService) Load(ctx context.Context, id string) ([]Film, error) {
// 	items, err := s.Repository.Load(ctx, id)
// 	if err != nil {
// 		return nil, err
// 	}

// 	var ps []string
// 	for i := 1; i <= len(items); i++ {
// 		ps = append(ps, "$"+strconv.Itoa(i))
// 	}

// 	sql := fmt.Sprintf("select * from %s where %s in (%s)", "film", s.Id, strings.Join(ps, ","))
// 	if len(s.Sort) > 0 {
// 		sql = sql + " order by " + s.Sort
// 	}
// 	stmt1, err := s.DB.Prepare(sql)
// 	if err != nil {
// 		return nil, err
// 	}

// 	rows2, err := stmt1.QueryContext(ctx, items)
// 	if err != nil {
// 		return nil, err
// 	}
// 	defer rows2.Close()
// 	var films []Film
// 	for rows2.Next() {
// 		var film Film
// 		err = rows2.Scan(
// 			&film.Id,
// 			&film.Title,
// 			&film.Description,
// 			&film.ImageURL,
// 			&film.TrailerUrl,
// 			&film.Categories,
// 			&film.Directors,
// 			&film.Casts,
// 			&film.Countries,
// 			&film.Language,
// 			&film.Writer,
// 			&film.Gallery,
// 			&film.Status,
// 			&film.Info)
// 		if err != nil {
// 			return nil, err
// 		}
// 		films = append(films, film)
// 	}

// 	return films, nil

// }

// func contains(arr []string, target string) bool {
// 	for _, a := range arr {
// 		if a == target {
// 			return true
// 		}
// 	}
// 	return false
// }

// func (s *savedFilmService) Save(ctx context.Context, id string, itemId string) (int64, error) {
// 	items, err := s.Repository.Load(ctx, id)
// 	if err != nil {
// 		return -1, err
// 	}
// 	if items == nil {
// 		itemIds := []string{itemId}
// 		res, err := s.Repository.Insert(ctx, id, itemIds)
// 		if err != nil {
// 			return -1, err
// 		}
// 		return res, nil
// 	} else {
// 		if contains(items, itemId) {
// 			return 0, nil
// 		} else {
// 			items = append(items, itemId)
// 			if len(items) > s.Max {
// 				items = items[1:]
// 			}
// 			res, err := s.Repository.Update(ctx, id, items)
// 			if err != nil {
// 				return -1, err
// 			}
// 			return res, nil
// 		}

// 	}

// }

// func (s *savedFilmService) Remove(ctx context.Context, id string, itemId string) (int64, error) {
// 	items, err := s.Repository.Load(ctx, id)
// 	if err != nil {
// 		return -1, nil
// 	}
// 	if items == nil {
// 		return 0, nil
// 	} else {
// 		if contains(items, itemId) {
// 			newItems := []string{}
// 			for i := range items {
// 				if items[i] != itemId {
// 					newItems = append(newItems, items[i])
// 				}
// 			}
// 			items = newItems
// 			return s.Repository.Update(ctx, id, items)
// 		}
// 		return 0, nil
// 	}

// }
