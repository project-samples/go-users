package playlist

import "github.com/core-go/search"

type PlaylistFilter struct {
	*search.Filter
	Id     string `json:"id,omitempty" gorm:"primary_key;column:id" dynamodbav:"id,omitempty" firestore:"id,omitempty" validate:"max=40" match:"equal"`
	Title  string `json:"title,omitempty" gorm:"column:title" dynamodbav:"title,omitempty" firestore:"title,omitempty" validate:"omitempty,max=240"`
	UserId string `json:"userId,omitempty" gorm:"column:userId" dynamodbav:"userId,omitempty" firestore:"userId,omitempty" validate:"omitempty,max=250"`
}
