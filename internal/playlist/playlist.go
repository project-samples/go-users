package playlist

type Playlist struct {
	Id       string `json:"id,omitempty" gorm:"primary_key;column:id" dynamodbav:"id,omitempty" firestore:"id,omitempty" validate:"max=40"`
	Title    string `json:"title,omitempty" gorm:"column:title" dynamodbav:"title,omitempty" firestore:"title,omitempty" validate:"omitempty,max=240"`
	UserId   string `json:"userId,omitempty" gorm:"column:userId" dynamodbav:"userId,omitempty" firestore:"userId,omitempty" validate:"omitempty,max=250"`
	Imageurl string `json:"imageurl,omitempty" gorm:"column:imageurl" dynamodbav:"imageurl,omitempty" firestore:"name,omitempty" validate:"omitempty,max=250"`
}
