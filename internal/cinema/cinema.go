package cinema

import (
	"database/sql"
	"database/sql/driver"
	"encoding/json"
	"errors"
	"time"
)

type Cinema struct {
	Id        string         `json:"id" gorm:"column:id;primary_key" validate:"max=40" match:"equal"`
	Name      string         `json:"name" gorm:"column:name" validate:"max=255"`
	Address   string         `json:"address" gorm:"column:address" validate:"max=255"`
	Parent    string         `json:"parent" gorm:"column:parent" validate:"max=40"`
	Status    string         `json:"status" gorm:"column:status" validate:"max=1"`
	Latitude  *float64       `json:"latitude" gorm:"column:latitude" validate:"max=255"`
	Longitude *float64       `json:"longitude" gorm:"column:longitude" validate:"max=255"`
	ImageURL  string         `mapstructure:"imageURL" json:"imageURL,omitempty" gorm:"column:imageurl"`
	CreatedBy sql.NullString `json:"createdBy" gorm:"column:createdBy"`
	CreatedAt *time.Time     `json:"createdAt" gorm:"column:createdAt"`
	UpdatedBy sql.NullString `json:"updatedBy" gorm:"column:updatedBy"`
	UpdatedAt *time.Time     `json:"updatedAt" gorm:"column:updatedAt"`
	Gallery   []Gallery      `json:"gallery,omitempty" gorm:"column:gallery"`
	CoverURL  sql.NullString `json:"coverURL" gorm:"column:coverURL"`
	Info      *Info10        `json:"info,omitempty" gorm:"-"`
}

type Info10 struct {
	Id     string  `json:"-" gorm:"column:id;primary_key"`
	Rate   float64 `json:"rate" gorm:"column:rate"`
	Rate1  int32   `json:"rate1" gorm:"column:rate1"`
	Rate2  int32   `json:"rate2" gorm:"column:rate2"`
	Rate3  int32   `json:"rate3" gorm:"column:rate3"`
	Rate4  int32   `json:"rate4" gorm:"column:rate4"`
	Rate5  int32   `json:"rate5" gorm:"column:rate5"`
	Rate6  int32   `json:"rate6" gorm:"column:rate6"`
	Rate7  int32   `json:"rate7" gorm:"column:rate7"`
	Rate8  int32   `json:"rate8" gorm:"column:rate8"`
	Rate9  int32   `json:"rate9" gorm:"column:rate9"`
	Rate10 int32   `json:"rate10" gorm:"column:rate10"`
	Count  int32   `json:"count" gorm:"column:count"`
	Score  float64 `json:"score" gorm:"column:score"`
}

type Gallery struct {
	Url  string `json:"url" gorm:"column:url" validate:"required"`
	Type string `json:"type" gorm:"column:type" validate:"required"`
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
