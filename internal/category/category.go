package category

// import "time"

type Category struct {
	CategoryId   string `json:"categoryId" gorm:"primary_key;column:categoryid" validate:"max=40"`
	CategoryName string `json:"categoryName" gorm:"column:categoryname" validate:"required,max=300"`
	Status       string `json:"status,omitempty" gorm:"column:status" validate:"max=1" match:"equal"`
	// CreateBy     string     `json:"createdBy,omitempty"`
	// CreatedAt    *time.Time `json:"createdAt,omitempty"`
	// UpdatedBy    string     `json:"updatedBy,omitempty"`
	// UpdatedAt    *time.Time `json:"updatedAt,omitempty"`
}

// type CompanyCategory struct {
// 	CategoryId   string `json:"categoryId" gorm:"primary_key;column:categoryid" validate:"max=40"`
// 	CategoryName string `json:"categoryName" gorm:"column:categoryname" validate:"required,max=300"`
// }
