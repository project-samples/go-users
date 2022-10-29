package room

import (
	"database/sql/driver"
	"encoding/json"
	"errors"
	"go-service/internal/upload"
)

type Room struct {
	Id          string              `json:"id,omitempty" gorm:"primary_key;column:id" dynamodbav:"id,omitempty" firestore:"id,omitempty" validate:"max=40"`
	Title       string              `json:"title,omitempty" gorm:"column:title" dynamodbav:"title,omitempty" firestore:"title,omitempty" validate:"required,max=120"`
	Description string              `json:"description,omitempty" gorm:"column:description" dynamodbav:"description,omitempty" firestore:"description,omitempty" validate:"omitempty,max=1000"`
	Offer       []string            `json:"offer,omitempty" gorm:"column:offer" dynamodbav:"offer,omitempty" firestore:"offer,omitempty"`
	Price       int32               `json:"price,omitempty" gorm:"column:price" dynamodbav:"price,omitempty" firestore:"price,omitempty"`
	Location    string              `json:"location,omitempty" gorm:"column:location" dynamodbav:"location,omitempty" firestore:"location,omitempty" validate:"required,max=255"`
	Host        string              `json:"host,omitempty" gorm:"column:host" dynamodbav:"host,omitempty" firestore:"host,omitempty" validate:"required,max=255"`
	Guest       *int32              `json:"guest,omitempty" gorm:"column:guest" dynamodbav:"guest,omitempty" firestore:"guest,omitempty"`
	Bedrooms    *int32              `json:"bedrooms,omitempty" gorm:"column:bedrooms" dynamodbav:"bedrooms,omitempty" firestore:"bedrooms,omitempty"`
	Bed         *int32              `json:"bed,omitempty" gorm:"column:bed" dynamodbav:"bed,omitempty" firestore:"bed,omitempty"`
	Bathrooms   *int32              `json:"bathrooms,omitempty" gorm:"column:bathrooms" dynamodbav:"bathrooms,omitempty" firestore:"bathrooms,omitempty"`
	Highlight   []string            `json:"highlight,omitempty" gorm:"column:highlight" dynamodbav:"highlight,omitempty" firestore:"highlight,omitempty"`
	Status      string              `json:"status,omitempty" gorm:"column:status" dynamodbav:"status,omitempty" firestore:"status,omitempty"`
	Category    []string            `json:"category,omitempty" gorm:"column:category" dynamodbav:"category,omitempty" firestore:"category,omitempty"`
	Region      string              `json:"region,omitempty" gorm:"column:region" dynamodbav:"region,omitempty" firestore:"region,omitempty"`
	Typeof      []string            `json:"typeof,omitempty" gorm:"column:typeof" dynamodbav:"typeof,omitempty" firestore:"typeof,omitempty"`
	Property    string              `json:"property,omitempty" gorm:"column:property" dynamodbav:"property,omitempty" firestore:"property,omitempty"`
	Language    []string            `json:"language,omitempty" gorm:"column:language" dynamodbav:"language,omitempty" firestore:"language,omitempty"`
	Gallery     []upload.UploadInfo `json:"gallery,omitempty" gorm:"column:gallery"`
	ImageURL    *string             `json:"imageURL,omitempty" gorm:"column:imageurl"  dynamodbav:"imageURL" firestore:"imageURL"`
	CoverURL    *string             `json:"coverURL,omitempty" gorm:"column:coverurl"  dynamodbav:"coverURL" firestore:"coverURL"`
}

type UploadImage struct {
	Source string `json:"source,omitempty" gorm:"column:source" validate:"required,max=300"`
	Type   string `json:"type,omitempty" gorm:"column:type" validate:"required,max=300"`
	Url    string `json:"url,omitempty" gorm:"column:url" validate:"required,max=300"`
}

func (c UploadImage) Value() (driver.Value, error) {
	return json.Marshal(c)
}

func (c *UploadImage) Scan(value interface{}) error {
	b, ok := value.([]byte)
	if !ok {
		return errors.New("type assertion to []byte failed")
	}
	return json.Unmarshal(b, &c)
}
