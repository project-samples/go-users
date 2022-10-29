package item

import (
	"database/sql/driver"
	"encoding/json"
	"errors"
	"time"
)

type Item struct {
	Id          string     `json:"id,omitempty" gorm:"column:id;primary_key" bson:"_id,omitempty" dynamodbav:"id,omitempty" firestore:"id,omitempty" validate:"required,max=40"`
	Title       string     `json:"title,omitempty" gorm:"column:title" bson:"title,omitempty" dynamodbav:"title,omitempty" firestore:"title,omitempty" validate:"required,max=255"`
	Author      *string    `json:"author,omitempty" gorm:"column:author" bson:"author,omitempty" dynamodbav:"title,omitempty" firestore:"title,omitempty" validate:"required,max=255"`
	Description *string    `json:"description,omitempty" gorm:"column:description" bson:"description,omitempty" dynamodbav:"description,omitempty" firestore:"description,omitempty"`
	Status      string     `json:"status,omitempty" gorm:"column:status" bson:"status,omitempty" dynamodbav:"status,omitempty" firestore:"status,omitempty"`
	Price       string     `json:"price,omitempty" gorm:"column:price" bson:"price,omitempty" dynamodbav:"price,omitempty" firestore:"price,omitempty"`
	ImageURL    *string    `json:"imageURL,omitempty" gorm:"column:imageURL" bson:"imageURL,omitempty" dynamodbav:"imageURL,omitempty" firestore:"imageURL,omitempty"`
	Brand       string     `json:"brand,omitempty" gorm:"column:brand" bson:"brand,omitempty" dynamodbav:"brand,omitempty" firestore:"brand,omitempty"`
	PublishedAt *time.Time `json:"publishedAt,omitempty" gorm:"column:publishedAt" bson:"publishedAt,omitempty" dynamodbav:"publishedAt,omitempty" firestore:"publishedAt,omitempty"`
	ExpiredAt   *time.Time `json:"expiredAt,omitempty" gorm:"column:expiredAt" bson:"expiredAt,omitempty" dynamodbav:"expiredAt,omitempty" firestore:"expiredAt,omitempty"`
	Categories  []string   `json:"categories,omitempty" gorm:"column:categories" bson:"categories,omitempty" dynamodbav:"categories,omitempty" firestore:"categories,omitempty"`
	Gallery     []Gallery  `json:"gallery,omitempty" gorm:"column:gallery" bson:"gallery,omitempty" dynamodbav:"gallery,omitempty" firestore:"gallery,omitempty"`
}

type Gallery struct {
	Url    string `json:"url,omitempty" gorm:"column:url" bson:"url,omitempty" dynamodbav:"url,omitempty" firestore:"url,omitempty" validate:"required"`
	Type   string `json:"type,omitempty" gorm:"column:type" bson:"type,omitempty" dynamodbav:"type,omitempty" firestore:"type,omitempty"`
	Source string `json:"source,omitempty" gorm:"column:source" bson:"source,omitempty" dynamodbav:"source,omitempty" firestore:"source,omitempty"`
}

func (c Gallery) Value() (driver.Value, error) {
	return json.Marshal(c)
}

func (c *Gallery) Scan(value interface{}) error {
	b, ok := value.([]byte)
	if !ok {
		return errors.New("type assertion to []byte failed")
	}
	return json.Unmarshal(b, &c)
}
