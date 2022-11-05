package job

import (
	"time"

	"github.com/core-go/search"
)

type JobFilter struct {
	*search.Filter
	Id             string     `json:"id,omitempty" gorm:"primary_key;column:id" dynamodbav:"id,omitempty" firestore:"id,omitempty" validate:"max=40" match:"equal"`
	Title          string     `json:"title,omitempty" gorm:"column:title" dynamodbav:"title,omitempty" firestore:"title,omitempty" validate:"omitempty,max=120"`
	Description    string     `json:"description,omitempty" gorm:"column:description" dynamodbav:"description,omitempty" firestore:"description,omitempty" validate:"omitempty,max=1000"`
	Skill          []string   `json:"skill,omitempty" gorm:"column:skill" dynamodbav:"skill,omitempty" firestore:"skill,omitempty"`
	PublishedAt    *time.Time `json:"publishedAt,omitempty" gorm:"column:publishedAt" dynamodbav:"publishedAt,omitempty" firestore:"publishedAt,omitempty"`
	ExpiredAt      *time.Time `json:"expiredAt,omitempty" gorm:"column:expiredAt" dynamodbav:"expiredAt,omitempty" firestore:"expiredAt,omitempty"`
	Quantity       *int32     `json:"quantity,omitempty" gorm:"column:quantity" dynamodbav:"quantity,omitempty" firestore:"quantity,omitempty"`
	ApplicantCount *int32     `json:"applicantCount,omitempty" gorm:"column:applicantCount" dynamodbav:"applicantCount,omitempty" firestore:"applicantCount,omitempty"`
	Requirements   string     `json:"requirements,omitempty" gorm:"column:requirements" dynamodbav:"requirements,omitempty" firestore:"requirements,omitempty"`
	Benefit        string     `json:"benefit,omitempty" gorm:"column:benefit" dynamodbav:"benefit,omitempty" firestore:"benefit,omitempty"`
}
