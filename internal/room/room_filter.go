package room

import (
	"github.com/core-go/search"
)

type RoomFilter struct {
	*search.Filter
	Id          string             `json:"id,omitempty" gorm:"column:id;primary_key" validate:"max=40" match:"equal"`
	Title       string             `json:"title,omitempty" gorm:"column:title" validate:"max=120"`
	Description string             `json:"description,omitempty" gorm:"column:description" validate:"max=1000"`
	Offer       []string           `json:"offer,omitempty" gorm:"column:offer"`
	Price       search.NumberRange `json:"price,omitempty" gorm:"column:price"`
	Location    string             `json:"location,omitempty" gorm:"column:location" validate:"max=255"`
	Host        string             `json:"host,omitempty" gorm:"column:host" validate:"max=255"`
	Guest       *uint8             `json:"guest,omitempty" gorm:"column:guest"`
	Bedrooms    *uint8             `json:"bedrooms,omitempty" gorm:"column:bedrooms"`
	Bed         *uint8             `json:"bed,omitempty" gorm:"column:bed"`
	Bathrooms   *uint8             `json:"bathrooms,omitempty" gorm:"column:bathrooms"`
	Highlight   []string           `json:"hightlight,omitempty" gorm:"column:highlight"`
	Status      string             `json:"status,omitempty" gorm:"column:status"`
	Category    []string           `json:"category,omitempty" gorm:"column:category"`
	Region      string             `json:"region,omitempty" gorm:"column:region"`
	TypeOf      []string           `json:"typeof,omitempty" gorm:"column:typeof"`
	Language    []string           `json:"language,omitempty" gorm:"column:language"`
}
