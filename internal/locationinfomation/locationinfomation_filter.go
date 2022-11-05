package locationinfomation

type LocationInfomationFilter struct {
	Id             *string `json:"id" gorm:"column:id,primary_key" validate:"max=40" match:"equal"`
	Followercount  *int    `json:"followercount" gorm:"column:followercount"`
	Followingcount *int    `json:"followingcount" gorm:"column:followingcount"`
}
