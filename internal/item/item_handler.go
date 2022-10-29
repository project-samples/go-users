package item

import (
	"context"
	"github.com/core-go/search"
	sv "github.com/core-go/core"
	"net/http"
	"reflect"
)

type ItemHandler interface {
	Search(w http.ResponseWriter, r *http.Request)
	Load(w http.ResponseWriter, r *http.Request)
}

func NewItemHandler(find func(context.Context, interface{}, interface{}, int64, ...int64) (int64, string, error), service ItemService, status sv.StatusConfig, logError func(context.Context, string, ...map[string]interface{}), validate func(ctx context.Context, model interface{}) ([]sv.ErrorMessage, error), action *sv.ActionConfig) ItemHandler {
	searchModelType := reflect.TypeOf(ItemFilter{})
	modelType := reflect.TypeOf(Item{})
	params := sv.CreateParams(modelType, &status, logError, validate, action)
	searchHandler := search.NewSearchHandler(find, modelType, searchModelType, logError, params.Log)
	return &itemHandler{service: service, SearchHandler: searchHandler, Params: params}
}

type itemHandler struct {
	service ItemService
	*search.SearchHandler
	*sv.Params
}

func (h *itemHandler) Load(w http.ResponseWriter, r *http.Request) {
	id := sv.GetRequiredParam(w, r)
	if len(id) > 0 {
		result, err := h.service.Load(r.Context(), id)
		sv.RespondModel(w, r, result, err, h.Error, nil)
	}
}
