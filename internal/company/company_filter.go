package company

import (
	"time"

	"github.com/core-go/search"
)

type CompanyFilter struct {
	*search.Filter
	Id            string             `json:"id,omitempty" gorm:"primary_key;column:id" dynamodbav:"id,omitempty" firestore:"id,omitempty" match:"equal"`
	Name          string             `json:"name,omitempty" gorm:"column:name" dynamodbav:"name,omitempty" firestore:"name,omitempty" validate:"max=120"  match:"prefix" q:"prefix"`
	Description   string             `json:"description,omitempty" gorm:"column:description" dynamodbav:"description,omitempty" firestore:"description,omitempty" validate:"max=1000"`
	Size          search.NumberRange `json:"size,omitempty" gorm:"column:size" dynamodbav:"size,omitempty" firestore:"size,omitempty"`
	Address       string             `json:"address,omitempty" gorm:"column:address" validate:"max=255" dynamodbav:"address,omitempty" firestore:"address,omitempty"`
	Status        string             `json:"status,omitempty" gorm:"column:status" validate:"max=1" match:"equal" dynamodbav:"status,omitempty" firestore:"status,omitempty"`
	EstablishedAt *time.Time         `json:"establishedAt,omitempty" gorm:"column:establishedat" dynamodbav:"establishedat,omitempty" firestore:"establishedat,omitempty"`
	Categories    []string           `json:"categories,omitempty" gorm:"column:categories" dynamodbav:"categories,omitempty" firestore:"categories,omitempty"`
	Info          *Info              `json:"info,omitempty" gorm:"column:-" dynamodbav:"info,omitempty" firestore:"info,omitempty"`
}
