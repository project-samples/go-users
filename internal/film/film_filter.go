package film

import (
	"github.com/core-go/search"
)

type FilmFilter struct {
	*search.Filter
	Id          string   `json:"id" gorm:"primary_key,column:id" validate:"max=40" match:"equal"`
	Title       string   `json:"title" gorm:"column:title" validate:"required,max=300" q:"true"`
	Description string   `json:"description,omitempty" gorm:"column:description" validate:"max=300"`
	TrailerUrl  string   `json:"trailerurl,omitempty" gorm:"column:trailerurl" validate:"max=300"`
	Status      string   `json:"status" gorm:"column:status" validate:"max=1"`
	Categories  []string `json:"categories,omitempty" gorm:"column:categories"`
	Directors   []string `json:"directors,omitempty" gorm:"column:directors"`
	Casts       []string `json:"casts,omitempty" gorm:"column:casts"`
	Productions []string `json:"productions,omitempty" gorm:"column:productions"`
	Countries   []string `json:"countries,omitempty" gorm:"column:countries"`
	Language    string   `json:"language,omitempty" gorm:"column:language"`
	Writer      []string `json:"writer,omitempty" gorm:"column:writer"`
	ImageURL    string   `json:"imageurl,omitempty" gorm:"column:imageurl" validate:"max=300"`
}
