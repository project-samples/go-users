package item

import "github.com/core-go/search"

type ItemFilter struct {
	*search.Filter
	Id          string              `json:"id" gorm:"column:id;primary_key" bson:"_id" dynamodbav:"id" firestore:"id" match:"equal"`
	Title       string              `json:"title" gorm:"column:title" bson:"title" dynamodbav:"title" firestore:"title"`
	Description string              `json:"description" gorm:"column:description" bson:"description" dynamodbav:"description" firestore:"description"`
	Status      string              `json:"status" gorm:"column:status" bson:"status" dynamodbav:"status" firestore:"status"`
	Price       *search.NumberRange `json:"price" gorm:"column:price" bson:"price" dynamodbav:"price" firestore:"price"`
	Brand       []string            `json:"brand" gorm:"column:brand" bson:"brand" dynamodbav:"brand" firestore:"brand"`
	PublishedAt *search.TimeRange   `json:"publishedAt" gorm:"column:publishedAt" bson:"publishedAt" dynamodbav:"publishedAt" firestore:"publishedAt"`
	ExpiredAt   *search.TimeRange   `json:"expiredAt" gorm:"column:expiredAt" bson:"expiredAt" dynamodbav:"expiredAt" firestore:"expiredAt"`
	Categories  []string            `json:"categories" gorm:"column:categories" bson:"categories" dynamodbav:"categories" firestore:"categories"`
}
