package room

import (
	"github.com/core-go/search"
)

type RoomFilter struct {
	*search.Filter
	Id          string             `json:"id,omitempty" gorm:"primary_key;column:id" dynamodbav:"id,omitempty" firestore:"id,omitempty" validate:"max=40" match:"equal"`
	Title       string             `json:"title,omitempty" gorm:"column:title" dynamodbav:"title,omitempty" firestore:"title,omitempty" validate:"required,max=120"`
	Description string             `json:"description,omitempty" gorm:"column:description" dynamodbav:"description,omitempty" firestore:"description,omitempty" validate:"omitempty,max=1000"`
	Offer       []string           `json:"offer,omitempty" gorm:"column:offer" dynamodbav:"offer,omitempty" firestore:"offer,omitempty"`
	Price       search.NumberRange `json:"price,omitempty" gorm:"column:price" dynamodbav:"price,omitempty" firestore:"price,omitempty"`
	Location    string             `json:"location,omitempty" gorm:"column:location" dynamodbav:"location,omitempty" firestore:"location,omitempty" validate:"required,max=255"`
	Host        string             `json:"host,omitempty" gorm:"column:host" dynamodbav:"host,omitempty" firestore:"host,omitempty" validate:"required,max=255"`
	Guest       *int32             `json:"guest,omitempty" gorm:"column:guest" dynamodbav:"guest,omitempty" firestore:"guest,omitempty"`
	Bedrooms    *int32             `json:"bedrooms,omitempty" gorm:"column:bedrooms" dynamodbav:"guest,omitempty" firestore:"bedrooms,omitempty"`
	Bed         *int32             `json:"bed,omitempty" gorm:"column:bed" dynamodbav:"bed,omitempty" firestore:"bed,omitempty"`
	Bathrooms   *int32             `json:"bathrooms,omitempty" gorm:"column:bathrooms" dynamodbav:"bathrooms,omitempty" firestore:"bathrooms,omitempty"`
	Highlight   []string           `json:"highlight,omitempty" gorm:"column:highlight" dynamodbav:"highlight,omitempty" firestore:"highlight,omitempty"`
	Status      string             `json:"status,omitempty" gorm:"column:status" dynamodbav:"status,omitempty" firestore:"status,omitempty"`
	Category    []string           `json:"category,omitempty" gorm:"column:category" dynamodbav:"category,omitempty" firestore:"category,omitempty"`
	Region      string             `json:"region,omitempty" gorm:"column:region" dynamodbav:"region,omitempty" firestore:"region,omitempty"`
	Typeof      []string           `json:"typeof,omitempty" gorm:"column:typeof" dynamodbav:"typeof,omitempty" firestore:"typeof,omitempty"`
	Property    string             `json:"property,omitempty" gorm:"column:property" dynamodbav:"property,omitempty" firestore:"property,omitempty"`
	Language    []string           `json:"language,omitempty" gorm:"column:language" dynamodbav:"language,omitempty" firestore:"language,omitempty"`
}

type Info struct {
	id    string  `json:"-" gorm:"column:id,primary_key"`
	rate  float64 `json:"rate" gorm:"column:rate"`
	rate1 int32   `json:"rate1" gorm:"column:rate1"`
	rate2 int32   `json:"rate2" gorm:"column:rate2"`
	rate3 int32   `json:"rate3" gorm:"column:rate3"`
	rate4 int32   `json:"rate4" gorm:"column:rate4"`
	rate5 int32   `json:"rate5" gorm:"column:rate5"`
	count int32   `json:"count" gorm:"column:count"`
	score int32   `json:"score" gorm:"column:score"`
}
