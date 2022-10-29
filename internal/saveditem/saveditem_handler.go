package saveditem

import (
	"context"
	"net/http"
	"reflect"

	sv "github.com/core-go/core"
)

type SavedItemHandler interface {
	Load(w http.ResponseWriter, r *http.Request)
	Save(w http.ResponseWriter, r *http.Request)
	Remove(w http.ResponseWriter, r *http.Request)
}

func NewSavedItemHandler(service SavedItemService, status sv.StatusConfig, logError func(context.Context, string, ...map[string]interface{}), validate func(ctx context.Context, model interface{}) ([]sv.ErrorMessage, error), action *sv.ActionConfig) SavedItemHandler {
	modelType := reflect.TypeOf(SavedItem{})
	params := sv.CreateParams(modelType, &status, logError, validate, action)
	return &savedItemHandler{service: service, Params: params}
}

type savedItemHandler struct {
	service SavedItemService
	*sv.Params
}

func (h *savedItemHandler) Save(w http.ResponseWriter, r *http.Request) {

	Item := sv.GetRequiredParam(w, r)
	Id := sv.GetRequiredParam(w, r, 1)

	if len(Id) > 0 && len(Item) > 0 {
		result, err := h.service.Save(r.Context(), Id, Item)
		sv.AfterCreated(w, r, nil, result, err, h.Status, h.Error, h.Log, h.Resource, h.Action.Create)
	}
}

func (h *savedItemHandler) Remove(w http.ResponseWriter, r *http.Request) {
	item := sv.GetRequiredParam(w, r)
	id := sv.GetRequiredParam(w, r, 1)
	if len(id) > 0 && len(item) > 0 {
		result, err := h.service.Remove(r.Context(), id, item)
		sv.HandleDelete(w, r, result, err, h.Error, h.Log, h.Resource, h.Action.Delete)
	}
}

func (h *savedItemHandler) Load(w http.ResponseWriter, r *http.Request) {
	id := sv.GetRequiredParam(w, r)
	if len(id) > 0 {
		result, err := h.service.Load(r.Context(), id)
		sv.RespondModel(w, r, result, err, h.Error, nil)
	}
}
