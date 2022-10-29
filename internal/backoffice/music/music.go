package music

import "time"

type Music struct {
	Id          string     `json:"id,omitempty" gorm:"primary_key;column:id" dynamodbav:"id,omitempty" firestore:"id,omitempty" validate:"max=40"`
	Name        string     `json:"name,omitempty" gorm:"column:name" dynamodbav:"name,omitempty" firestore:"name,omitempty" validate:"omitempty,max=300"`
	Author      []string   `json:"author,omitempty" gorm:"column:author" dynamodbav:"author,omitempty" firestore:"author,omitempty"`
	ReleaseDate *time.Time `json:"releaseDate,omitempty" gorm:"column:releaseDate" dynamodbav:"releaseDate,omitempty" firestore:"releaseDate,omitempty"`
	Duration    *time.Time `json:"duration,omitempty" gorm:"column:duration" dynamodbav:"duration,omitempty" firestore:"duration,omitempty"`
	Lyric       string     `json:"lyric,omitempty" gorm:"column:lyric" dynamodbav:"lyric,omitempty" firestore:"lyric,omitempty"`
	ImageURL    string     `json:"imageURL,omitempty" gorm:"column:imageURL" dynamodbav:"imageURL,omitempty" firestore:"imageURL,omitempty" validate:"omitempty,max=1500"`
	Mp3URL      string     `json:"mp3URL,omitempty" gorm:"column:mp3URL" dynamodbav:"mp3URL,omitempty" firestore:"mp3URL,omitempty" validate:"omitempty,max=1500"`
}
