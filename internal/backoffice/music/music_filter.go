package music

import (
	"time"

	"github.com/core-go/search"
)

type MusicFilter struct {
	*search.Filter
	Id          string           `json:"id,omitempty" gorm:"primary_key;column:id" dynamodbav:"id,omitempty" firestore:"id,omitempty" validate:"max=40" match:"equal"`
	Name        string           `json:"name,omitempty" gorm:"column:name" dynamodbav:"name,omitempty" firestore:"name,omitempty" validate:"omitempty,max=300"`
	Author      []string         `json:"author,omitempty" gorm:"column:author" dynamodbav:"author,omitempty" firestore:"author,omitempty"`
	ReleaseDate *time.Time       `json:"releaseDate,omitempty" gorm:"column:releaseDate" dynamodbav:"releaseDate,omitempty" firestore:"releaseDate,omitempty"`
	Duration    search.TimeRange `json:"duration,omitempty" gorm:"column:duration" dynamodbav:"duration,omitempty" firestore:"duration,omitempty"`
	Lyric       string           `json:"lyric,omitempty" gorm:"column:lyric" dynamodbav:"lyric,omitempty" firestore:"lyric,omitempty"`
}
