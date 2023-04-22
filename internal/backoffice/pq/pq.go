package pq

import (
	"database/sql"
	"database/sql/driver"
	"encoding/json"
	"errors"
	"fmt"
	. "github.com/lib/pq"
	"strings"
)

func PqArray(a interface{}) interface {
	driver.Valuer
	sql.Scanner
} {
	switch a := a.(type) {
	case []string:
		return (*ArrayString)(&a)
	case *[]string:
		return (*ArrayString)(a)
	}

	return Array(a)
}

type ArrayString []string

func (s ArrayString) Value() (driver.Value, error) {
	if len(s) == 0 {
		return "[]", nil
	}
	return fmt.Sprintf(`["%s"]`, strings.Join(s, `","`)), nil
}

func (s *ArrayString) Scan(src interface{}) (err error) {
	var arr []string
	switch src.(type) {
	case string:
		str := src.(string)
		err = json.Unmarshal([]byte(str), &arr)
	case []byte:
		err = json.Unmarshal(src.([]byte), &arr)
	default:
		return errors.New("incompatible type string array")
	}
	if err != nil {
		return
	}
	*s = arr
	return nil
}
