package film

import (
	"database/sql/driver"
	"encoding/json"
	"errors"
)

type Film struct {
	Id          string       `json:"id" gorm:"primary_key;column:id" validate:"max=40"`
	Title       string       `json:"title" gorm:"column:title" validate:"required,max=300"`
	Status      string       `json:"status" gorm:"column:status" validate:"max=1" match:"equal"`
	Description *string      `json:"description,omitempty" gorm:"column:description" validate:"omitempty,max=300"`
	ImageURL    string       `json:"imageURL,omitempty" gorm:"column:imageurl" validate:"max=300"`
	TrailerUrl  string       `json:"trailerUrl,omitempty" gorm:"column:trailerurl" validate:"max=300"`
	Categories  []string     `json:"categories,omitempty" gorm:"column:categories"`
	Directors   []string     `json:"directors,omitempty" gorm:"column:directors"`
	Casts       []string     `json:"casts,omitempty" gorm:"column:casts"`
	Productions []string     `json:"productions,omitempty" gorm:"column:productions"`
	Countries   []string     `json:"countries,omitempty" gorm:"column:countries"`
	Info        *Info10      `json:"info,omitempty" gorm:"-"`
	Language    *string      `json:"language,omitempty" gorm:"column:language"`
	Writer      []string     `json:"writer,omitempty" gorm:"column:writer"`
	Gallery     []UploadInfo `json:"gallery,omitempty" gorm:"column:gallery" bson:"gallery,omitempty" dynamodbav:"gallery,omitempty" firestore:"gallery,omitempty"`
	CoverURL    *string      `json:"coverurl,omitempty" gorm:"column:coverurl"`
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

type UploadInfo struct {
	Source     string `json:"source,omitempty"`
	TypeUpload string `json:"type,omitempty"`
	Url        string `json:"url,omitempty" validate:"required"`
}

func (c UploadInfo) Value() (driver.Value, error) {
	return json.Marshal(c)
}

func (c *UploadInfo) Scan(value interface{}) error {
	b, ok := value.([]byte)
	if !ok {
		return errors.New("type assertion to []byte failed")
	}
	return json.Unmarshal(b, &c)
}
