package appreciation

type Appreciation struct {
	Id       string `json:"id,omitempty" gorm:"column:id;primary_key" bson:"id,omitempty" dynamodbav:"id,omitempty" firestore:"id,omitempty" validate:"required,max=255"`
	Author   string `json:"author,omitempty" gorm:"column:author;primary_key" bson:"author,omitempty" dynamodbav:"author,omitempty" firestore:"author,omitempty" validate:"required,max=255"`
	Reaction int `json:"reaction,omitempty" gorm:"column:reaction" bson:"reaction,omitempty" dynamodbav:"reaction,omitempty" firestore:"reaction,omitempty" validate:"required,max=10"`
}

type UserInfo struct {
	Id             string `json:"id,omitempty" gorm:"column:id;primary_key" bson:"id,omitempty" dynamodbav:"id,omitempty" firestore:"id,omitempty" validate:"required,max=255"`
	FollowerCount  string `json:"followercount,omitempty" gorm:"column:followercount" bson:"followercount,omitempty" dynamodbav:"followercount,omitempty" firestore:"followercount,omitempty"`
	FollowingCount string `json:"followingcount,omitempty" gorm:"column:followingcount" bson:"followingcount,omitempty" dynamodbav:"followingcount,omitempty" firestore:"followingcount,omitempty"`
	ReactionCount  string `json:"reactioncount,omitempty" gorm:"column:reactioncount" bson:"reactioncount,omitempty" dynamodbav:"reactioncount,omitempty" firestore:"reactioncount,omitempty"`
	Level1Count    string `json:"level1count,omitempty" gorm:"column:level1count" bson:"level1count,omitempty" dynamodbav:"level1count,omitempty" firestore:"level1count,omitempty"`
	Level2Count    string `json:"level2count,omitempty" gorm:"column:level2count" bson:"level2count,omitempty" dynamodbav:"level2count,omitempty" firestore:"level2count,omitempty"`
	Level3Count    string `json:"level3count,omitempty" gorm:"column:level3count" bson:"level3count,omitempty" dynamodbav:"level3count,omitempty" firestore:"level3count,omitempty"`
}
