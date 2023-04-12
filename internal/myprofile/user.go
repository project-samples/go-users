package myprofile

import (
	"database/sql/driver"
	"encoding/json"
	"errors"
	"time"
)

type User struct {
	UserId       string        `json:"id,omitempty" gorm:"column:id;primary_key" bson:"_id,omitempty" dynamodbav:"userId,omitempty" firestore:"userId,omitempty" validate:"required,max=40" match:"equal"`
	Username     string        `json:"username,omitempty" gorm:"column:username" bson:"username,omitempty" dynamodbav:"username,omitempty" firestore:"username,omitempty" validate:"required,max=100"`
	Email        string        `json:"email,omitempty" gorm:"column:email" bson:"email,omitempty" dynamodbav:"email,omitempty" firestore:"email,omitempty" validate:"email,max=100"`
	Phone        *string       `json:"phone,omitempty" gorm:"column:phone" bson:"phone,omitempty" dynamodbav:"phone,omitempty" firestore:"phone,omitempty" validate:"required,phone,max=18"`
	Occupation   *string       `json:"occupation,omitempty" gorm:"column:occupation" bson:"occupation,omitempty" dynamodbav:"occupation,omitempty" firestore:"occupation,omitempty" `
	Company      *string       `json:"company,omitempty" gorm:"column:company" bson:"company,omitempty" dynamodbav:"company,omitempty" firestore:"company,omitempty" `
	Bio          *string       `json:"bio,omitempty" gorm:"column:bio" bson:"bio,omitempty" dynamodbav:"bio,omitempty" firestore:"bio,omitempty"`
	DateOfBirth  *time.Time    `json:"dateOfBirth,omitempty" gorm:"column:dateofbirth" bson:"dateOfBirth,omitempty" dynamodbav:"dateOfBirth,omitempty" firestore:"dateOfBirth,omitempty"`
	Interests    []string      `json:"interests,omitempty" gorm:"column:interests" bson:"interests,omitempty" dynamodbav:"interests,omitempty" firestore:"interests,omitempty"`
	LookingFor   []string      `json:"lookingFor,omitempty" gorm:"column:lookingfor" bson:"lookingFor,omitempty" dynamodbav:"lookingFor,omitempty" firestore:"lookingFor,omitempty"`
	Skills       []Skills      `json:"skills,omitempty" gorm:"column:skills" bson:"skills,omitempty" dynamodbav:"skills,omitempty" firestore:"skills,omitempty"`
	Achievements []Achievement `json:"achievements,omitempty" gorm:"column:achievements" bson:"achievements,omitempty" dynamodbav:"achievements,omitempty" firestore:"achievements,omitempty"`
	Settings     *Settings     `json:"settings,omitempty" gorm:"column:settings" bson:"settings,omitempty" dynamodbav:"settings,omitempty" firestore:"settings,omitempty"`
	Companies    []Company     `json:"companies,omitempty" gorm:"column:companies" bson:"companies,omitempty" dynamodbav:"companies,omitempty" firestore:"companies,omitempty"`
	Educations   []Education   `json:"educations,omitempty" gorm:"column:educations" bson:"educations,omitempty" dynamodbav:"educations,omitempty" firestore:"educations,omitempty"`
	Works        []Works       `json:"works,omitempty" gorm:"column:works" bson:"works,omitempty" dynamodbav:"works,omitempty" firestore:"works,omitempty"`
	Socials      *Socials      `json:"socials,omitempty" gorm:"column:socials" bson:"socials,omitempty" dynamodbav:"socials,omitempty" firestore:"socials,omitempty"`
	Gallery      []UploadInfo  `json:"gallery,omitempty" gorm:"column:gallery" bson:"gallery,omitempty" dynamodbav:"gallery,omitempty" firestore:"gallery,omitempty"`
	ImageURL     *string       `json:"imageURL,omitempty" gorm:"column:imageURL" bson:"imageURL,omitempty" dynamodbav:"imageURL,omitempty" firestore:"imageURL,omitempty"`
	CoverURL     *string       `json:"coverURL,omitempty" gorm:"column:coverurl"`
}
type Education struct {
	School string `json:"school,omitempty" gorm:"column:school" bson:"school,omitempty" dynamodbav:"school,omitempty" firestore:"school,omitempty" validate:"required"`
	Degree string `json:"degree,omitempty" gorm:"column:degree" bson:"degree,omitempty" dynamodbav:"degree,omitempty" firestore:"degree,omitempty"`
	Major  string `json:"major,omitempty" gorm:"column:major" bson:"major,omitempty" dynamodbav:"major,omitempty" firestore:"major,omitempty"`
	From   string `json:"from,omitempty" gorm:"column:from" bson:"from,omitempty" dynamodbav:"from,omitempty" firestore:"from,omitempty"`
	To     string `json:"to,omitempty" gorm:"column:to" bson:"to,omitempty" dynamodbav:"to,omitempty" firestore:"to,omitempty"`
	Title  string `json:"title,omitempty" gorm:"column:title" bson:"title,omitempty" dynamodbav:"title,omitempty" firestore:"title,omitempty"`
}

type Company struct {
	Id          *string `json:"id,omitempty" gorm:"column:id" bson:"id,omitempty" dynamodbav:"id,omitempty" firestore:"id,omitempty" validate:"required"`
	Name        string  `json:"name,omitempty" gorm:"column:name" bson:"name,omitempty" dynamodbav:"name,omitempty" firestore:"name,omitempty"`
	Description string  `json:"description,omitempty" gorm:"column:description" bson:"description,omitempty" dynamodbav:"description,omitempty" firestore:"description,omitempty"`
	Position    string  `json:"position,omitempty" gorm:"column:position" bson:"position,omitempty" dynamodbav:"position,omitempty" firestore:"position,omitempty" validate:"required"`
	From        string  `json:"from,omitempty" gorm:"column:from" bson:"from,omitempty" dynamodbav:"from,omitempty" firestore:"from,omitempty"`
	To          string  `json:"to,omitempty" gorm:"column:to" bson:"to,omitempty" dynamodbav:"to,omitempty" firestore:"to,omitempty"`
}

type Works struct {
	Name        string `json:"name,omitempty" gorm:"column:name" bson:"name,omitempty" dynamodbav:"name,omitempty" firestore:"name,omitempty" validate:"required"`
	Position    string `json:"position,omitempty" gorm:"column:position" bson:"position,omitempty" dynamodbav:"position,omitempty" firestore:"position,omitempty"`
	Description string `json:"description,omitempty" gorm:"column:position" bson:"description,omitempty" dynamodbav:"description,omitempty" firestore:"description,omitempty"`
	From        string `json:"from,omitempty" gorm:"column:position" bson:"from,omitempty" dynamodbav:"from,omitempty" firestore:"from,omitempty"`
	To          string `json:"to,omitempty" gorm:"column:to" bson:"to,omitempty" dynamodbav:"to,omitempty" firestore:"to,omitempty"`
}
type Socials struct {
	Google    string `json:"google,omitempty" gorm:"column:google" bson:"google,omitempty" dynamodbav:"google,omitempty" firestore:"google,omitempty" validate:"required"`
	Facebook  string `json:"facebook,omitempty" gorm:"column:facebook" bson:"facebook,omitempty" dynamodbav:"facebook,omitempty" firestore:"facebook,omitempty"`
	Github    string `json:"github,omitempty" gorm:"column:github" bson:"github,omitempty" dynamodbav:"github,omitempty" firestore:"github,omitempty"`
	Instagram string `json:"instagram,omitempty" gorm:"column:instagram" bson:"instagram,omitempty" dynamodbav:"instagram,omitempty" firestore:"instagram,omitempty"`
	Twitter   string `json:"twitter,omitempty" gorm:"column:twitter" bson:"twitter,omitempty" dynamodbav:"twitter,omitempty" firestore:"twitter,omitempty"`
	Skype     string `json:"skype,omitempty" gorm:"column:skype" bson:"skype,omitempty" dynamodbav:"skype,omitempty" firestore:"skype,omitempty"`
	Dribble   string `json:"dribble,omitempty" gorm:"column:dribble" bson:"dribble,omitempty" dynamodbav:"dribble,omitempty" firestore:"dribble,omitempty"`
	Linkedin  string `json:"hirable,omitempty" gorm:"column:hirable" bson:"hirable,omitempty" dynamodbav:"hirable,omitempty" firestore:"hirable,omitempty"`
}
type UploadInfo struct {
	Source     string `json:"source,omitempty" gorm:"column:source" bson:"source,omitempty" dynamodbav:"source,omitempty" firestore:"source,omitempty"`
	TypeUpload string `json:"type,omitempty" gorm:"column:type" bson:"type,omitempty" dynamodbav:"type,omitempty" firestore:"type,omitempty"`
	Url        string `json:"url,omitempty"  gorm:"column:url" bson:"url,omitempty" dynamodbav:"url,omitempty" firestore:"url,omitempty" validate:"required"`
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

func (c Works) Value() (driver.Value, error) {
	return json.Marshal(c)
}
func (c *Works) Scan(value interface{}) error {
	b, ok := value.([]byte)
	if !ok {
		return errors.New("type assertion to []byte failed")
	}
	return json.Unmarshal(b, &c)
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
