package userinfomation

type UserInfomationFilter struct {
	Id             string `json:"id" gorm:"column:id;primary_key"`
	Followercount  int    `json:"followercount" gorm:"column:followercount"`
	Followingcount int    `json:"followingcount" gorm:"column:followingcount"`
}
