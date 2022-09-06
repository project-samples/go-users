package rate

import (
	"context"
	"database/sql"
	"database/sql/driver"
	"fmt"
	"strconv"
)

type RateService interface {
	Load(ctx context.Context, id string, author string) (*Rate, error)
	Rate(ctx context.Context, rate *Rate) (int64, error)
}

func NewRateService(db *sql.DB,
	rateTable string,
	id string,
	author string,
	rateCol string,
	review string,
	time string,
	usefulCount string,
	commentCount string,
	infoTable string,
	infoId string,
	infoRate string,
	rateCount string,
	rateScore string,
	toArray func(interface{}) interface {
		driver.Valuer
		sql.Scanner
	},
) RateService {
	return &rateService{
		DB:           db,
		RateTable:    rateTable,
		Id:           id,
		Author:       author,
		RateCol:      rateCol,
		Review:       review,
		Time:         time,
		UsefulCount:  usefulCount,
		CommentCount: commentCount,
		InfoTable:    infoTable,
		InfoId:       infoId,
		InfoRate:     infoRate,
		RateCount:    rateCount,
		RateScore:    rateScore,
		ToArray:      toArray,
	}
}

type rateService struct {
	DB           *sql.DB
	RateTable    string
	Id           string
	Author       string
	RateCol      string
	Review       string
	Time         string
	UsefulCount  string
	CommentCount string
	InfoTable    string
	InfoId       string
	InfoRate     string
	RateCount    string
	RateScore    string
	ToArray      func(interface{}) interface {
		driver.Valuer
		sql.Scanner
	}
}

func (s *rateService) Load(ctx context.Context, id string, author string) (*Rate, error) {
	query := "select " + s.Id + ", " + s.Author + ", " + s.RateCol + ", " + s.Review + ", " + s.Time + ", " + s.UsefulCount + ", " + s.CommentCount + ", histories from " + s.RateTable + " where id = $1 and author = $2 limit 1"
	fmt.Println(query)
	rows, err := s.DB.QueryContext(ctx, query, id, author)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	for rows.Next() {
		var rate Rate
		err = rows.Scan(&rate.Id, &rate.Author, &rate.Rate, &rate.Review, &rate.Time, &rate.UsefulCount, &rate.CommentCount, s.ToArray(&rate.Histories))
		if err != nil {
			return nil, err
		}
		return &rate, nil
	}
	return nil, nil
}

func (s *rateService) Rate(ctx context.Context, rate *Rate) (int64, error) {
	oldRate, _ := s.Load(ctx, rate.Id, rate.Author)
	rateStr := strconv.Itoa(rate.Rate)
	query1 := "insert into " + s.InfoTable + "(" + s.InfoId + "," + s.InfoRate + "," + s.InfoRate + rateStr + "," + s.RateCount + "," + s.RateScore + ") values ($1, " + rateStr + ", 1, 1, " + rateStr + ") on conflict (" + s.InfoId + ") do update set "
	if oldRate != nil {
		if oldRate.Rate != rate.Rate {
			oldRateStr := strconv.Itoa(oldRate.Rate)
			query1 += s.InfoRate + oldRateStr + " = " + s.InfoTable + "." + s.InfoRate + oldRateStr + " - 1, " +
				s.InfoRate + rateStr + " = " + s.InfoTable + "." + s.InfoRate + rateStr + " + 1, " +
				s.RateScore + " = " + s.InfoTable + "." + s.RateScore + " + " + rateStr + " - " + oldRateStr + ", " +
				s.InfoRate + " = (" + s.InfoTable + "." + s.RateScore + " + " + rateStr + " - " + oldRateStr + ") / " + s.InfoTable + "." + s.RateCount + ";"
		} else {
			query1 += s.InfoRate + rateStr + " = " + s.InfoTable + "." + s.InfoRate + rateStr + ";"
		}
		rate.Histories = append(oldRate.Histories, Histories{Time: oldRate.Time, Rate: oldRate.Rate, Review: oldRate.Review})
	} else {
		query1 += s.RateCount + " = " + s.InfoTable + "." + s.RateCount + " + 1, " +
			s.InfoRate + rateStr + " = " + s.InfoTable + "." + s.InfoRate + rateStr + " + 1, " +
			s.RateScore + " = " + s.InfoTable + "." + s.RateScore + " + " + rateStr + ", " +
			s.InfoRate + " = (" + s.InfoTable + "." + s.RateScore + " + " + rateStr + ") / (" + s.InfoTable + "." + s.RateCount + " + 1);"
	}

	fmt.Println(query1)
	stmt1, err := s.DB.Prepare(query1)
	if err != nil {
		return -1, err
	}
	res1, err := stmt1.ExecContext(ctx, rate.Id)
	if err != nil {
		return -1, err
	}
	fmt.Println(res1)

	query2 := "insert into " + s.RateTable + "(" + s.Id + "," + s.Author + "," + s.RateCol + "," + s.Review + "," + s.Time + ", histories) values ($1, $2, $3, $4, $5, $6)" +
		"on conflict (" + s.Id + "," + s.Author + ") do update set " + s.RateCol + " = $3, " + s.Review + " = $4, " + s.Time + " = $5, histories = $6;"
	fmt.Println(query2)
	stmt, err := s.DB.Prepare(query2)
	if err != nil {
		return -1, err
	}
	fmt.Println(oldRate, rate)
	res2, err := stmt.ExecContext(ctx, rate.Id, rate.Author, rate.Rate, rate.Review, rate.Time, s.ToArray(rate.Histories))
	if err != nil {
		return -1, err
	}
	fmt.Println(res2)

	return res2.RowsAffected()
}
