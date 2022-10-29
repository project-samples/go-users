package locationinfomation

import (
	"context"
	"net/http"
	"reflect"

	sv "github.com/core-go/core"
	"github.com/core-go/search"
)

type LocationInfomationHandler interface {
	Search(w http.ResponseWriter, r *http.Request)
	Load(w http.ResponseWriter, r *http.Request)
}

func NewLocationInfomationHandler(
	service LocationInfomationService,
	find func(context.Context, interface{}, interface{}, int64, ...int64) (int64, string, error),
	logError func(context.Context, string, ...map[string]interface{}),
	writeLog func(context.Context, string, string, bool, string) error,
) LocationInfomationHandler {
	modelType := reflect.TypeOf(LocationInfomation{})
	filterType := reflect.TypeOf(LocationInfomationFilter{})
	searchHandler := search.NewSearchHandler(find, modelType, filterType, logError, writeLog)
	return &locationInfomationHandler{
		SearchHandler: searchHandler,
		service:       service,
		LogError:      logError,
		WriteLog:      writeLog,
	}
}

type locationInfomationHandler struct {
	*search.SearchHandler
	service  LocationInfomationService
	LogError func(context.Context, string, ...map[string]interface{})
	WriteLog func(context.Context, string, string, bool, string) error
}

func (h *locationInfomationHandler) Load(w http.ResponseWriter, r *http.Request) {
	id := sv.GetRequiredParam(w, r)
	if len(id) > 0 {
		result, err := h.service.Load(r.Context(), id)
		sv.RespondModel(w, r, result, err, h.LogError, h.WriteLog)
	}
}
