package company

import (
	"context"
	"fmt"
	"net/http"
	"reflect"

	sv "github.com/core-go/core"
	"github.com/core-go/search"
)

type CompanyHandler interface {
	Search(w http.ResponseWriter, r *http.Request)
	Load(w http.ResponseWriter, r *http.Request)
	GetByUserId(w http.ResponseWriter, r *http.Request)
}

func NewCompanyHandler(
	find func(context.Context, interface{}, interface{}, int64, ...int64) (int64, string, error),
	service CompanyService,
	logError func(context.Context, string, ...map[string]interface{}),
	writeLog func(context.Context, string, string, bool, string) error) CompanyHandler {
	searchModelType := reflect.TypeOf(CompanyFilter{})
	modelType := reflect.TypeOf(Company{})
	searchHandler := search.NewSearchHandler(find, modelType, searchModelType, logError, writeLog)
	return &companyHandler{SearchHandler: searchHandler, service: service, Error: logError, Log: writeLog}
}

type companyHandler struct {
	*search.SearchHandler
	service CompanyService
	Error   func(context.Context, string, ...map[string]interface{})
	Log     func(context.Context, string, string, bool, string) error
}

func (h *companyHandler) Load(w http.ResponseWriter, r *http.Request) {
	id := sv.GetRequiredParam(w, r)
	if len(id) > 0 {
		result, err := h.service.Load(r.Context(), id)
		sv.RespondModel(w, r, result, err, h.Error, nil)
	}
}

func (h *companyHandler) GetByUserId(w http.ResponseWriter, r *http.Request) {
	id := sv.GetRequiredParam(w, r)
	if len(id) > 0 {
		result, err := h.service.GetByUserId(r.Context(), id)
		fmt.Print(result)
		sv.RespondModel(w, r, result, err, h.Error, nil)
	}
}
