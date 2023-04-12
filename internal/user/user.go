package user

import (
	"database/sql/driver"
	"encoding/json"
	"errors"
	"time"
)

type User struct {
	Id       *string `json:"id,omitempty" gorm:"column:id;primary_key" bson:"_id,omitempty" dynamodbav:"id,omitempty" firestore:"id,omitempty" validate:"required,max=40"`
	Username *string `json:"username,omitempty" gorm:"column:username" bson:"username,omitempty" dynamodbav:"username,omitempty" firestore:"username,omitempty" validate:"required,username,max=100"`
	Email    *string `json:"email,omitempty" gorm:"column:email" bson:"email,omitempty" dynamodbav:"email,omitempty" firestore:"email,omitempty" validate:"email,max=100"`
	Phone    *string `json:"phone,omitempty" gorm:"column:phone" bson:"phone,omitempty" dynamodbav:"phone,omitempty" firestore:"phone,omitempty" validate:"required,phone,max=18"`
	// Bio          string        `json:"bio,omitempty" gorm:"column:bio" bson:"bio,omitempty" dynamodbav:"bio,omitempty" firestore:"bio,omitempty" validate:"max=500"`
	DateOfBirth *time.Time    `json:"dateOfBirth,omitempty" gorm:"column:date_of_birth" bson:"dateOfBirth,omitempty" dynamodbav:"dateOfBirth,omitempty" firestore:"dateOfBirth,omitempty"`
	Links       *Socials      `json:"social,omitempty" gorm:"column:links"`
	Works       []Work        `json:"works,omitempty" gorm:"column:works"`
	Companies   []Company     `json:"companies,omitempty" gorm:"column:companies"`
	Educations  []Education   `json:"educations,omiempty" gorm:"column:educations"`
	Info        *Info10       `json:"info,omitempty" gorm:"-"`
	ImageURL    *string       `json:"imageURL,omitempty" gorm:"column:imageurl"`
	CoverURL    *string       `json:"coverURL,omitempty" gorm:"column:coverurl"`
	Gallery     []UploadImage `json:"gallery,omitempty" gorm:"column:gallery"`
	Bio         *string       `json:"bio,omitempty" gorm:"column:bio"`
	// Interests    []string      `json:"interests,omitempty" gorm:"column:interests" bson:"interests,omitempty" dynamodbav:"interests,omitempty" firestore:"interests,omitempty"`
	// Skills       []Skills      `json:"skills,omitempty" gorm:"column:skills" bson:"skills,omitempty" dynamodbav:"skills,omitempty" firestore:"skills,omitempty"`
	// Achievements []Achievement `json:"achievements,omitempty" gorm:"column:achievements" bson:"achievements,omitempty" dynamodbav:"achievements,omitempty" firestore:"achievements,omitempty"`
	// Settings     *Settings     `json:"settings,omitempty" gorm:"column:settings" bson:"settings,omitempty" dynamodbav:"settings,omitempty" firestore:"settings,omitempty"`
}
type UploadImage struct {
	Source string `json:"source,omitempty" gorm:"column:source"`
	Type   string `json:"type,omitempty" gorm:"column:type"`
	Url    string `json:"url,omitempty" gorm:"column:url"`
}

func (c UploadImage) Value() (driver.Value, error) {
	return json.Marshal(c)
}

func (c *UploadImage) Scan(value interface{}) error {
	b, ok := value.([]byte)
	if !ok {
		return errors.New("type assertion to []byte failed")
	}
	return json.Unmarshal(b, &c)
}

type Info10 struct {
	Id     string  `json:"id" gorm:"column:id"`
	Rate   float32 `json:"rate" gorm:"column:rate"`
	Rate1  float32 `json:"rate1" gorm:"column:rate1"`
	Rate2  float32 `json:"rate2" gorm:"column:rate2"`
	Rate3  float32 `json:"rate3" gorm:"column:rate3"`
	Rate4  float32 `json:"rate4" gorm:"column:rate4"`
	Rate5  float32 `json:"rate5" gorm:"column:rate5"`
	Rate6  float32 `json:"rate6" gorm:"column:rate6"`
	Rate7  float32 `json:"rate7" gorm:"column:rate7"`
	Rate8  float32 `json:"rate8" gorm:"column:rate8"`
	Rate9  float32 `json:"rate9" gorm:"column:rate9"`
	Rate10 float32 `json:"rate10" gorm:"column:rate10"`
	Count  int     `json:"count" gorm:"column:count"`
	Score  int     `json:"score" gorm:"column:score"`
}
type Education struct {
	School string `json:"school,omitempty" gorm:"column:school" `
	Degree string `json:"degree,omitempty" gorm:"column:degree"`
	Major  string `json:"major,omitempty" gorm:"column:major"`
	Title  string `json:"title,omitempty" gorm:"column:title"`
	From   string `json:"from,omitempty" gorm:"column:from"`
	To     string `json:"to,omitempty" gorm:"column:to"`
}

func (c Education) Value() (driver.Value, error) {
	return json.Marshal(c)
}

func (c *Education) Scan(value interface{}) error {
	b, ok := value.([]byte)
	if !ok {
		return errors.New("type assertion to []byte failed")
	}
	return json.Unmarshal(b, &c)
}

type Company struct {
	Id          *string `json:"id" gorm:"column:id"`
	Name        string  `json:"name" gorm:"column:name"`
	Description string  `json:"description" gorm:"column:description"`
	From        string  `json:"from" gorm:"column:from"`
	To          string  `json:"to" gorm:"column:to"`
}

func (c Company) Value() (driver.Value, error) {
	return json.Marshal(c)
}

func (c *Company) Scan(value interface{}) error {
	b, ok := value.([]byte)
	if !ok {
		return errors.New("type assertion to []byte failed")
	}
	return json.Unmarshal(b, &c)
}

type Work struct {
	Name        string   `json:"name,omitempty" gorm:"column:name"`
	Position    string   `json:"position,omitempty" gorm:"column:position"`
	Description string   `json:"description,omitempty" gorm:"column:description"`
	Item        []string `json:"item,omitempty" gorm:"column:item"`
	From        string   `json:"from,omitempty" gorm:"column:from"`
	To          string   `json:"to,omitempty" gorm:"column:to"`
}

func (c Work) Value() (driver.Value, error) {
	return json.Marshal(c)
}

func (c *Work) Scan(value interface{}) error {
	b, ok := value.([]byte)
	if !ok {
		return errors.New("type assertion to []byte failed")
	}
	return json.Unmarshal(b, &c)
}

type Socials struct {
	Google    string `json:"google,omitempty" gorm:"column:google"`
	Facebook  string `json:"facebook,omitempty" gorm:"column:facebook"`
	Github    string `json:"github,omitempty" gorm:"column:github"`
	Instagram string `json:"instagram,omitempty" gorm:"column:instagram"`
	Twitter   string `json:"twitter,omitempty" gorm:"column:twitter"`
	Skype     string `json:"skype,omitempty" gorm:"column:skype"`
	Dribble   string `json:"dribble,omitempty" gorm:"column:dribble"`
	Linkedin  string `json:"linkedin,omitempty" gorm:"column:linkedin"`
}

func (c Socials) Value() (driver.Value, error) {
	return json.Marshal(c)
}

func (c *Socials) Scan(value interface{}) error {
	b, ok := value.([]byte)
	if !ok {
		return errors.New("type assertion to []byte failed")
	}
	return json.Unmarshal(b, &c)
}

type Skills struct {
	Skill   string `json:"skill,omitempty" gorm:"column:skill" bson:"skill,omitempty" dynamodbav:"skill,omitempty" firestore:"skill,omitempty" validate:"required"`
	Hirable bool   `json:"hirable,omitempty" gorm:"column:hirable" bson:"hirable,omitempty" dynamodbav:"hirable,omitempty" firestore:"hirable,omitempty"`
}

func (c Skills) Value() (driver.Value, error) {
	return json.Marshal(c)
}

func (c *Skills) Scan(value interface{}) error {
	b, ok := value.([]byte)
	if !ok {
		return errors.New("type assertion to []byte failed")
	}
	return json.Unmarshal(b, &c)
}

type Achievement struct {
	Subject     string `json:"subject,omitempty" gorm:"column:subject" bson:"subject,omitempty" dynamodbav:"subject,omitempty" firestore:"subject,omitempty" validate:"required"`
	Description string `json:"description,omitempty" gorm:"column:description" bson:"description,omitempty" dynamodbav:"description,omitempty" firestore:"description,omitempty" validate:"required"`
}

func (c Achievement) Value() (driver.Value, error) {
	return json.Marshal(c)
}

func (c *Achievement) Scan(value interface{}) error {
	b, ok := value.([]byte)
	if !ok {
		return errors.New("type assertion to []byte failed")
	}
	return json.Unmarshal(b, &c)
}

type Settings struct {
	Language                        string `json:"language,omitempty" gorm:"column:language" bson:"language,omitempty" dynamodbav:"language,omitempty" firestore:"language,omitempty"`
	DateFormat                      string `json:"dateFormat,omitempty" gorm:"column:date_format" bson:"dateFormat,omitempty" dynamodbav:"dateFormat,omitempty" firestore:"dateFormat,omitempty"`
	DateTimeFormat                  string `json:"dateTimeFormat,omitempty" gorm:"column:date_time_format" bson:"dateTimeFormat,omitempty" dynamodbav:"dateTimeFormat,omitempty" firestore:"dateTimeFormat,omitempty"`
	TimeFormat                      string `json:"timeFormat,omitempty" gorm:"column:time_format" bson:"timeFormat,omitempty" dynamodbav:"timeFormat,omitempty" firestore:"timeFormat,omitempty"`
	Notification                    bool   `json:"notification" gorm:"column:notification" bson:"notification" dynamodbav:"notification" firestore:"notification"`
	EmailCommentsOfYourPosts        bool   `json:"emailCommentsOfYourPosts" gorm:"column:emailCommentsOfYourPosts" bson:"emailCommentsOfYourPosts" dynamodbav:"emailCommentsOfYourPosts" firestore:"emailCommentsOfYourPosts"`
	EmailEventInvitations           bool   `json:"emailEventInvitations" gorm:"column:emailEventInvitations" bson:"emailEventInvitations" dynamodbav:"emailEventInvitations" firestore:"emailEventInvitations"`
	EmailFeedUpdates                bool   `json:"emailFeedUpdates" gorm:"column:emailFeedUpdates" bson:"emailFeedUpdates" dynamodbav:"emailFeedUpdates" firestore:"emailFeedUpdates"`
	EmailPostMentions               bool   `json:"emailPostMentions" gorm:"column:emailPostMentions" bson:"emailPostMentions" dynamodbav:"emailPostMentions" firestore:"emailPostMentions"`
	EmailWhenNewEventsAround        bool   `json:"emailWhenNewEventsAround" gorm:"column:emailWhenNewEventsAround" bson:"emailWhenNewEventsAround" dynamodbav:"emailWhenNewEventsAround" firestore:"emailWhenNewEventsAround"`
	FollowingListPublicOnMyProfile  bool   `json:"followingListPublicOnMyProfile" gorm:"column:followingListPublicOnMyProfile" bson:"followingListPublicOnMyProfile" dynamodbav:"followingListPublicOnMyProfile" firestore:"followingListPublicOnMyProfile"`
	SearchEnginesLinksToMyProfile   bool   `json:"searchEnginesLinksToMyProfile" gorm:"column:searchEnginesLinksToMyProfile" bson:"searchEnginesLinksToMyProfile" dynamodbav:"searchEnginesLinksToMyProfile" firestore:"searchEnginesLinksToMyProfile"`
	NotifyFeedUpdates               bool   `json:"notifyFeedUpdates" gorm:"column:notifyFeedUpdates" bson:"notifyFeedUpdates" dynamodbav:"notifyFeedUpdates" firestore:"notifyFeedUpdates"`
	NotifyPostMentions              bool   `json:"notifyPostMentions" gorm:"column:notifyPostMentions" bson:"notifyPostMentions" dynamodbav:"notifyPostMentions" firestore:"notifyPostMentions"`
	NotifyCommentsOfYourPosts       bool   `json:"notifyCommentsOfYourPosts" gorm:"column:notifyCommentsOfYourPosts" bson:"notifyCommentsOfYourPosts" dynamodbav:"notifyCommentsOfYourPosts" firestore:"notifyCommentsOfYourPosts"`
	NotifyEventInvitations          bool   `json:"notifyEventInvitations" gorm:"column:notifyEventInvitations" bson:"notifyEventInvitations" dynamodbav:"notifyEventInvitations" firestore:"notifyEventInvitations"`
	NotifyWhenNewEventsAround       bool   `json:"notifyWhenNewEventsAround" gorm:"column:notifyWhenNewEventsAround" bson:"notifyWhenNewEventsAround" dynamodbav:"notifyWhenNewEventsAround" firestore:"notifyWhenNewEventsAround"`
	ShowMyProfileInSpacesAroundMe   bool   `json:"showMyProfileInSpacesAroundMe" gorm:"column:showMyProfileInSpacesAroundMe" bson:"showMyProfileInSpacesAroundMe" dynamodbav:"showMyProfileInSpacesAroundMe" firestore:"showMyProfileInSpacesAroundMe"`
	ShowAroundMeResultsInMemberFeed bool   `json:"showAroundMeResultsInMemberFeed" gorm:"column:showAroundMeResultsInMemberFeed" bson:"showAroundMeResultsInMemberFeed" dynamodbav:"showAroundMeResultsInMemberFeed" firestore:"showAroundMeResultsInMemberFeed"`
}

func (c Settings) Value() (driver.Value, error) {
	return json.Marshal(c)
}

func (c *Settings) Scan(value interface{}) error {
	b, ok := value.([]byte)
	if !ok {
		return errors.New("type assertion to []byte failed")
	}
	return json.Unmarshal(b, &c)
}
