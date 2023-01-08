package company

import (
	"time"

	"github.com/core-go/storage/upload"
)

type Company struct {
	Id            string              `json:"id" gorm:"primary_key;column:id" dynamodbav:"id" firestore:"id" match:"equal"`
	Name          string              `json:"name" gorm:"column:name" dynamodbav:"name" firestore:"name" validate:"max=120"`
	Description   string              `json:"description" gorm:"column:description" dynamodbav:"description" firestore:"description" validate:"max=1000"`
	Size          int32               `json:"size" gorm:"column:size" dynamodbav:"size" firestore:"size"`
	Address       string              `json:"address" gorm:"column:address" dynamodbav:"address" firestore:"address" validate:"max=255"`
	Status        string              `json:"status" gorm:"column:status" dynamodbav:"status" firestore:"status" validate:"max=1" match:"equal"`
	EstablishedAt *time.Time          `json:"established_at" gorm:"column:establishedat" dynamodbav:"establishedat" firestore:"establishedat" `
	Categories    []string            `json:"categories" gorm:"column:categories" dynamodbav:"categories" firestore:"categories"`
	Info          *Info               `json:"info,omitempty" gorm:"-" dynamodbav:"info" firestore:"info"`
	ImageURL      *string             `json:"imageURL,omitempty" gorm:"column:imageurl" validate:"max=300"`
	Gallery       []upload.UploadInfo `json:"gallery,omitempty" gorm:"column:gallery" bson:"gallery,omitempty" dynamodbav:"gallery,omitempty" firestore:"gallery,omitempty"`
	CoverURL      *string             `json:"coverURL,omitempty" gorm:"column:coverurl"`
}

type Info struct {
	Id    string  `json:"-" gorm:"column:id,primary_key"`
	Rate  float64 `json:"rate" gorm:"column:rate"`
	Rate1 int32   `json:"rate1" gorm:"column:rate1"`
	Rate2 int32   `json:"rate2" gorm:"column:rate2"`
	Rate3 int32   `json:"rate3" gorm:"column:rate3"`
	Rate4 int32   `json:"rate4" gorm:"column:rate4"`
	Rate5 int32   `json:"rate5" gorm:"column:rate5"`
	Count int32   `json:"count" gorm:"column:count"`
	Score float64 `json:"score" gorm:"column:score"`
}
