package cinema

import (
	"time"

	"github.com/core-go/search"
)

type CinemaFilter struct {
	*search.Filter
	Id        string     `json:"id,omitempty" gorm:"column:id;primary_key" validate:"max=40" match:"equal"`
	Name      string     `json:"name,omitempty" gorm:"column:name" validate:"max=255"`
	Address   string     `json:"address,omitempty" gorm:"column:address" validate:"max=255"`
	Parent    string     `json:"parent,omitempty" gorm:"column:parent" validate:"max=40"`
	Status    string     `json:"status,omitempty" gorm:"column:status" validate:"max=1"`
	Latitude  *float64   `json:"latitude,omitempty" gorm:"column:latitude" validate:"max=255"`
	Longitude *float64   `json:"longitude,omitempty" gorm:"column:longitude" validate:"max=255"`
	ImageURL  string     `json:"imageURL,omitempty" gorm:"column:imageURL"`
	CoverURL  string     `json:"coverURL" gorm:"column:coverURL"`
	Gallery   string     `json:"gallery,omitempty" gorm:"column:gallery"`
	CreatedBy string     `json:"createdBy" gorm:"column:createdBy"`
	CreatedAt *time.Time `json:"createdAt" gorm:"column:createdAt"`
	UpdatedBy string     `json:"updatedBy" gorm:"column:updatedBy"`
	UpdatedAt *time.Time `json:"updatedAt" gorm:"column:updatedAt"`
	Info      *Info10    `json:"info,omitempty" gorm:"-"`
}

type Info struct {
	Id    string  `json:"-" gorm:"column:id,primary_key"`
	Rate  float64 `json:"rate" gorm:"column:rate"`
	Rate1 int32   `json:"rate1" gorm:"column:rate1"`
	Rate2 int32   `json:"rate2" gorm:"column:rate2"`
	Rate3 int32   `json:"rate3" gorm:"column:rate3"`
	Rate4 int32   `json:"rate4" gorm:"column:rate4"`
	Rate5 int32   `json:"rate5" gorm:"column:rate5"`
}
