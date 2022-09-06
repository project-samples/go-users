package follow

import (
	"context"
	"database/sql"
	"fmt"
)

type FollowService interface {
	Follow(ctx context.Context, id string, target string) (int64, error)
	UnFollow(ctx context.Context, id string, target string) (int64, error)
	CheckFollow(ctx context.Context, id string, target string) (*Following, error)
}

func NewFollowService(db *sql.DB, followerTable string, followingTable string, userInfoTable string) FollowService {
	return &followService{DB: db, FollowerTable: followerTable, FollowingTable: followingTable, UserInfoTable: userInfoTable}
}

type followService struct {
	DB             *sql.DB
	FollowerTable  string
	FollowingTable string
	UserInfoTable  string
}

func (s *followService) CheckFollow(ctx context.Context, id string, target string) (*Following, error) {
	query := "select id, following from " + s.FollowingTable + " where id = $1 and following = $2 limit 1"
	fmt.Println(query)
	rows, err := s.DB.QueryContext(ctx, query, id, target)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	for rows.Next() {
		var follow Following
		err = rows.Scan(&follow.Id, &follow.Following)
		if err != nil {
			return nil, err
		}
		return &follow, nil
	}
	return nil, nil
}

func (s *followService) Follow(ctx context.Context, id string, target string) (int64, error) {
	query1 := "insert into " + s.FollowerTable + " (id, follower) values ($1, $2)"
	stmt1, er0 := s.DB.Prepare(query1)
	if er0 != nil {
		return -1, nil
	}
	res1, er1 := stmt1.ExecContext(ctx, id, target)
	if er1 != nil {
		return -1, er1
	}
	fmt.Println(res1)

	query2 := "insert into " + s.FollowingTable + " (id, following) values ($1, $2)"
	fmt.Println(query2)
	stmt2, er0 := s.DB.Prepare(query2)
	if er0 != nil {
		return -1, nil
	}
	res2, er2 := stmt2.ExecContext(ctx, target, id)
	if er2 != nil {
		return -1, er2
	}
	fmt.Println(res2)

	query3 := "insert into " + s.UserInfoTable + "(id,followercount,followingcount) values ($1, 0, 1) on conflict (id) do update set followingcount = " + s.UserInfoTable + ".followingcount + 1;"
	fmt.Println(query3)
	stmt3, er0 := s.DB.Prepare(query3)
	if er0 != nil {
		return -1, nil
	}
	res3, er3 := stmt3.ExecContext(ctx, id)
	if er3 != nil {
		return -1, er3
	}
	fmt.Println(res3)

	query4 := "insert into " + s.UserInfoTable + "(id,followercount,followingcount) values ($1, 1, 0) on conflict (id) do update set followercount = " + s.UserInfoTable + ".followercount + 1;"
	fmt.Println(query4)
	stmt4, er0 := s.DB.Prepare(query4)
	if er0 != nil {
		return -1, nil
	}
	res4, er4 := stmt4.ExecContext(ctx, target)
	if er4 != nil {
		return -1, er4
	}
	fmt.Println(res4)

	return res1.RowsAffected()
}

func (s *followService) UnFollow(ctx context.Context, id string, target string) (int64, error) {
	query1 := "delete from " + s.FollowerTable + " where id = $1 and follower = $2"
	fmt.Println(query1)
	stmt1, er0 := s.DB.Prepare(query1)
	if er0 != nil {
		return -1, nil
	}
	res1, er1 := stmt1.ExecContext(ctx, id, target)
	if er1 != nil {
		return -1, er1
	}
	fmt.Println(res1)

	query2 := "delete from " + s.FollowingTable + " where id = $1 and following = $2"
	fmt.Println(query2)
	stmt2, er0 := s.DB.Prepare(query2)
	if er0 != nil {
		return -1, nil
	}
	res2, er2 := stmt2.ExecContext(ctx, target, id)
	if er2 != nil {
		return -1, er2
	}
	fmt.Println(res2)

	query3 := "update " + s.UserInfoTable + " set followingcount = followingcount - 1 where id = $1;"
	fmt.Println(query3)
	stmt3, er0 := s.DB.Prepare(query3)
	if er0 != nil {
		return -1, nil
	}
	res3, er3 := stmt3.ExecContext(ctx, id)
	if er3 != nil {
		return -1, er3
	}
	fmt.Println(res3)

	query4 := "update " + s.UserInfoTable + " set followercount = followercount - 1 where id = $1;"
	fmt.Println(query4)
	stmt4, er0 := s.DB.Prepare(query4)
	if er0 != nil {
		return -1, nil
	}
	res4, er4 := stmt4.ExecContext(ctx, target)
	if er4 != nil {
		return -1, er4
	}
	fmt.Println(res4)

	return res1.RowsAffected()
}
