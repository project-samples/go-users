package rate

import (
	"github.com/core-go/search"
)

type RateFilter struct {
	*search.Filter
	Id           string            `json:"id" gorm:"column:id;primary_key" bson:"id" dynamodbav:"id" firestore:"id" match:"equal" validate:"max=255"`
	Author       string            `json:"author" gorm:"column:author;primary_key" bson:"author" dynamodbav:"author" firestore:"author" match:"equal" validate:"max=255"`
	Rate         int               `json:"rate" gorm:"column:rate" bson:"rate" dynamodbav:"rate" firestore:"rate" match:"equal" validate:"max=10"`
	Review       string            `json:"review" gorm:"column:review" bson:"review" dynamodbav:"review" firestore:"review"`
	Time         *search.TimeRange `json:"time" gorm:"column:time" bson:"time" dynamodbav:"time" firestore:"time"`
	UsefulCount  int               `json:"usefulCount" gorm:"column:usefulCount" bson:"usefulCount" dynamodbav:"usefulCount" firestore:"usefulCount"`
	CommentCount int               `json:"commentCount" gorm:"column:commentCount" bson:"commentCount" dynamodbav:"commentCount" firestore:"commentCount"`
}
