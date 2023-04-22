package userinfomation

type UserInfomation struct {
	Id             string `json:"id,omitempty" gorm:"primary_key;column:id" validate:"max=40"`
	Followercount  int    `json:"followercount,omitempty" gorm:"column:followercount"`
	Followingcount int    `json:"followingcount,omitempty" gorm:"column:followingcount"`
	Reactioncount  int    `json:"reactioncount,omitempty" gorm:"column:reactioncount"`
	Level1count    int    `json:"level1count,omitempty" gorm:"column:level1count"`
	Level2count    int    `json:"level2count,omitempty" gorm:"column:level2count"`
	Level3count    int    `json:"level3count,omitempty" gorm:"column:level3count"`
}
