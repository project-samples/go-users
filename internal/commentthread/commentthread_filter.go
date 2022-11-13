package commentthread

import (
	"time"

	"github.com/core-go/search"
)

type CommentThreadFilter struct {
	*search.Filter
	CommentId string     `json:"commentId" gorm:"column:commentid;primary_key" bson:"commentId" firestore:"commentId" match:"equal"`
	Id        string     `json:"id" gorm:"column:id" bson:"id" firestore:"id" match:"equal"`
	Author    string     `json:"author" gorm:"column:author" bson:"author" firestore:"author" match:"equal"`
	UserId    string     `json:"UserId" gorm:"column:userid" bson:"UserId" firestore:"UserId" match:"equal"`
	Comment   string     `json:"comment" gorm:"column:comment" bson:"comment" firestore:"comment"`
	Time      time.Time  `json:"time" gorm:"column:time" bson:"time" firestore:"time"`
	UpdateAt  *time.Time `json:"updateAt" gorm:"column:updateat" bson:"updateat" firestore:"updateat"`
	UserURL   string     `json:"userURL" gorm:"-"`
}
