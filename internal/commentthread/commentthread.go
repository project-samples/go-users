package commentthread

import (
	"database/sql/driver"
	"encoding/json"
	"errors"
	"time"
)

type CommentThread struct {
	CommentId   string     `json:"commentId" gorm:"column:commentid;primary_key" bson:"commentId" firestore:"commentId" match:"equal"`
	Id          string     `json:"id" gorm:"column:id" bson:"id" firestore:"id" validate:"required"  match:"equal"`
	Author      string     `json:"author" gorm:"column:author" bson:"author" firestore:"author" validate:"required" match:"equal"`
	UserId      string     `json:"UserId" gorm:"column:userid" bson:"UserId" firestore:"UserId" validate:"required" match:"equal"`
	Comment     string     `json:"comment" gorm:"column:comment" bson:"comment" firestore:"comment"`
	Time        time.Time  `json:"time" gorm:"column:time" bson:"time" firestore:"time"`
	UpdatedAt   *time.Time `json:"updatedAt" gorm:"column:updatedat" bson:"updatedat" firestore:"updatedat"`
	Histories   []History  `json:"histories" gorm:"column:histories" bson:"histories" firestore:"histories"`
	ReplyCount  int64      `json:"replyCount" gorm:"-" bson:"replycount" firestore:"replycount"`
	UsefulCount int64      `json:"usefulCount" gorm:"-" bson:"usefulcount" firestore:"usefulcount"`
	AuthorName  string     `json:"authorName" gorm:"-" bson:"authorname" firestore:"authorname" bson:"authorname"`
	Disable     bool       `json:"disable" gorm:"-"`
}

func (c History) Value() (driver.Value, error) {
	return json.Marshal(c)
}

func (c *History) Scan(value interface{}) error {
	b, ok := value.([]byte)
	if !ok {
		return errors.New("type assertion to []byte failed")
	}
	return json.Unmarshal(b, &c)
}

type History struct {
	Comment string    `json:"comment" gorm:"column:comment"`
	Time    time.Time `json:"time" gorm:"column:time"`
}
