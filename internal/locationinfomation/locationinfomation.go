package locationinfomation

type LocationInfomation struct {
	Id             string `json:"id" gorm:"column:id;primary_key" validate:"max=40"`
	Followercount  int    `json:"followercount" gorm:"column:followercount"`
	Followingcount int    `json:"followingcount" gorm:"column:followingcount"`
}
