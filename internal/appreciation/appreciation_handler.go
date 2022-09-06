package appreciation

import (
	"context"
	sv "github.com/core-go/core"
	"net/http"
	"reflect"
	"strconv"
)

type AppreciationHandler interface {
	Appreciate(w http.ResponseWriter, r *http.Request)
	Delete(w http.ResponseWriter, r *http.Request)
	Check(w http.ResponseWriter, r *http.Request)
}

func NewAppreciationHandler(service AppreciationService, status sv.StatusConfig, logError func(context.Context, string, ...map[string]interface{}), validate func(ctx context.Context, model interface{}) ([]sv.ErrorMessage, error), action *sv.ActionConfig) AppreciationHandler {
	modelType := reflect.TypeOf(Appreciation{})
	params := sv.CreateParams(modelType, &status, logError, validate, action)
	return &appreciationHandler{service: service, Params: params}
}

type appreciationHandler struct {
	service AppreciationService
	*sv.Params
}

func (h *appreciationHandler) Appreciate(w http.ResponseWriter, r *http.Request) {
	var appreciation Appreciation
	appreciation.Reaction, _ = strconv.Atoi(sv.GetRequiredParam(w, r))
	appreciation.Author = sv.GetRequiredParam(w, r, 1)
	appreciation.Id = sv.GetRequiredParam(w, r, 2)
	if len(appreciation.Id) > 0 && len(appreciation.Author) > 0 && appreciation.Reaction > 0 {
		result, err := h.service.Appreciate(r.Context(), &appreciation)
		sv.AfterCreated(w, r, &appreciation, result, err, h.Status, h.Error, h.Log, h.Resource, h.Action.Create)
	}
}

func (h *appreciationHandler) Delete(w http.ResponseWriter, r *http.Request) {
	reaction := sv.GetRequiredParam(w, r)
	author := sv.GetRequiredParam(w, r, 1)
	id := sv.GetRequiredParam(w, r, 2)
	if len(id) > 0 && len(author) > 0 && len(reaction) > 0 {
		result, err := h.service.Delete(r.Context(), id, author, reaction)
		sv.HandleDelete(w, r, result, err, h.Error, h.Log, h.Resource, h.Action.Delete)
	}
}

func (h *appreciationHandler) Check(w http.ResponseWriter, r *http.Request) {
	author := sv.GetRequiredParam(w, r)
	id := sv.GetRequiredParam(w, r, 1)
	if len(id) > 0 && len(author) > 0 {
		result, err := h.service.Check(r.Context(), id, author)
		sv.RespondModel(w, r, result, err, h.Error, nil)
	}
}
