package category

import "github.com/core-go/search"

type CategoryFilter struct {
	*search.Filter
	Id           string `mapstructure:"categoryid" json:"categoryid,omitempty"  gorm:"primary_key;column:categoryid"`
	CategoryName string `mapstructure:"categoryname" json:"categoryname,omitempty" gorm:"column:categoryname"`
	Status       string `mapstructure:"status" json:"status,omitempty" gorm:"column:status"`
}

// type CompanyCategoryFilter struct {
// 	*search.Filter
// 	Id           string `mapstructure:"categoryid" json:"categoryid,omitempty"  gorm:"primary_key;column:categoryid"`
// 	CategoryName string `mapstructure:"categoryname" json:"categoryname,omitempty" gorm:"column:categoryname"`
// }
