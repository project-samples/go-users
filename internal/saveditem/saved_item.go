package saveditem

import (
	"database/sql/driver"
	"encoding/json"
	"errors"
)

type SavedItem struct {
	Id    string   `json:"id,omitempty" gorm:"column:id;primary_key" bson:"id,omitempty" dynamodbav:"id,omitempty" firestore:"id,omitempty" validate:"required,max=255"`
	Items []string `json:"items,omitempty" gorm:"column:items" bson:"items,omitempty" dynamodbav:"items,omitempty" firestore:"items,omitempty" validate:"required"`
}

func (c SavedItem) Value() (driver.Value, error) {
	return json.Marshal(c)
}

func (c *SavedItem) Scan(value interface{}) error {
	b, ok := value.([]byte)
	if !ok {
		return errors.New("type assertion to []byte failed")
	}
	return json.Unmarshal(b, &c)
}
