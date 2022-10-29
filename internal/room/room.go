package room

import (
	"database/sql/driver"
	"encoding/json"
	"errors"
)

type Room struct {
	Id          string        `json:"id" gorm:"column:id;primary_key" validate:"max=40"`
	Title       string        `json:"title" gorm:"column:title" validate:"max=120"`
	Description string        `json:"description" gorm:"column:description" validate:"max=1000"`
	Offer       []string      `json:"offer,omitempty" gorm:"column:offer"`
	Price       uint64        `json:"price" gorm:"column:price"`
	Location    string        `json:"location" gorm:"column:location" validate:"max=255"`
	Host        string        `json:"host" gorm:"column:host" validate:"max=255"`
	Guest       *uint8        `json:"guest" gorm:"column:guest"`
	Bedrooms    *uint8        `json:"bedrooms" gorm:"column:bedrooms"`
	Bed         *uint8        `json:"bed" gorm:"column:bed"`
	Bathrooms   *uint8        `json:"bathrooms" gorm:"column:bathrooms"`
	Highlight   []string      `json:"hightlight" gorm:"column:highlight"`
	Status      string        `json:"status" gorm:"column:status"`
	Category    []string      `json:"category,omitempty" gorm:"column:category"`
	Region      string        `json:"region,omitempty" gorm:"column:region"`
	TypeOf      []string      `json:"typeof,omitempty" gorm:"column:typeof"`
	Language    []string      `json:"language,omitempty" gorm:"column:language"`
	ImageUrl    []UploadImage `json:"imageUrl,omitempty" gorm:"column:imageurl"`
}

type UploadImage struct {
	Source string `json:"source,omitempty" gorm:"column:source"`
	Type   string `json:"type,omitempty" gorm:"column:type"`
	Url    string `json:"url,omitempty" gorm:"column:url"`
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
