package entity

import "time"

type Entity struct {
	EntityId    string     `json:"entityId,omitempty" gorm:"column:entityId;primary_key" bson:"_id,omitempty" validate:"required,max=20,code"`
	Entityname  string     `json:"entityname,omitempty" gorm:"column:entityname" bson:"entityname,omitempty" dynamodbav:"entityname,omitempty" firestore:"entityname,omitempty" validate:"required,max=80"`
	Email       string     `json:"email,omitempty" gorm:"column:email" bson:"email,omitempty" dynamodbav:"email,omitempty" firestore:"email,omitempty" validate:"email,max=100"`
	DisplayName *string    `json:"displayName,omitempty" gorm:"column:displayname" bson:"displayName,omitempty" dynamodbav:"displayName,omitempty" firestore:"displayName,omitempty" validate:"max=255"`
	ImageURL    string     `json:"imageURL,omitempty" gorm:"column:imageurl" bson:"imageURL,omitempty" dynamodbav:"imageURL,omitempty" firestore:"imageURL,omitempty" match:"equal"`
	Status      string     `json:"status,omitempty" gorm:"column:status" bson:"status,omitempty" dynamodbav:"status,omitempty" firestore:"status,omitempty" match:"equal" validate:"required,max=1,code"`
	Phone       string     `json:"phone,omitempty" gorm:"column:phone" bson:"phone,omitempty" dynamodbav:"phone,omitempty" firestore:"phone,omitempty" match:"equal" validate:"phone,max=16"`
	CreatedBy   *string    `json:"createdBy,omitempty" gorm:"column:createdBy" bson:"createdBy,omitempty" dynamodbav:"createdBy,omitempty" firestore:"createdBy,omitempty"`
	CreatedAt   *time.Time `json:"createdAt,omitempty" gorm:"column:createdAt" bson:"createdAt,omitempty" dynamodbav:"createdAt,omitempty" firestore:"createdAt,omitempty"`
	UpdatedBy   *string    `json:"updatedBy,omitempty" gorm:"column:updatedBy" bson:"updatedBy,omitempty" dynamodbav:"updatedBy,omitempty" firestore:"updatedBy,omitempty"`
	UpdatedAt   *time.Time `json:"updatedAt,omitempty" gorm:"column:updatedAt" bson:"updatedAt,omitempty" dynamodbav:"updatedAt,omitempty" firestore:"updatedAt,omitempty"`
	LastLogin   *time.Time `json:"lastLogin,omitempty" gorm:"lastLogin" bson:"lastLogin,omitempty" dynamodbav:"lastLogin,omitempty" firestore:"lastLogin,omitempty"`
	Users       []string   `json:"users,omitempty" bson:"users,omitempty" dynamodbav:"users,omitempty" firestore:"users,omitempty"`
}
