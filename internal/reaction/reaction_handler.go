package reaction

import (
	"context"
	sv "github.com/core-go/core"
	"github.com/gorilla/mux"
	"net/http"
	"reflect"
	"time"
)

type ReactionHandler interface {
	Create(w http.ResponseWriter, r *http.Request)
	Delete(w http.ResponseWriter, r *http.Request)
}

func NewReactionHandler(service ReactionService, status sv.StatusConfig, logError func(context.Context, string, ...map[string]interface{}), validate func(ctx context.Context, model interface{}) ([]sv.ErrorMessage, error), action *sv.ActionConfig) ReactionHandler {
	modelType := reflect.TypeOf(Reaction{})
	params := sv.CreateParams(modelType, &status, logError, validate, action)
	return &reactionHandler{service: service, Params: params}
}

type reactionHandler struct {
	service ReactionService
	*sv.Params
}

func (h *reactionHandler) Create(w http.ResponseWriter, r *http.Request) {
	var reaction Reaction
	var t = time.Now()
	er1 := sv.Decode(w, r, &reaction)
	reaction.Time = &t
	if (mux.Vars(r)["id"] != "") {
		reaction.Id = mux.Vars(r)["id"]
	}
	if (mux.Vars(r)["author"] != "") {
		reaction.Author = mux.Vars(r)["author"]
	}
	if (mux.Vars(r)["userId"] != "") {
		reaction.UserId = mux.Vars(r)["userId"]
	}
	if reaction.Type == 0 {
		reaction.Type = 1
	}
	if er1 == nil {
		errors, er2 := h.Validate(r.Context(), &reaction)
		if !sv.HasError(w, r, errors, er2, *h.Status.ValidationError, h.Error, h.Log, h.Resource, h.Action.Create) {
			result, er3 := h.service.Insert(r.Context(), &reaction)
			sv.AfterCreated(w, r, &reaction, result, er3, h.Status, h.Error, h.Log, h.Resource, h.Action.Create)
		}
	}
}


func (h *reactionHandler) Delete(w http.ResponseWriter, r *http.Request) {
	var reaction Reaction
	if (r.Body != nil) {
		sv.Decode(w, r, &reaction)
	}
	if (mux.Vars(r)["id"] != "") {
		reaction.Id = mux.Vars(r)["id"]
	}
	if (mux.Vars(r)["author"] != "") {
		reaction.Author = mux.Vars(r)["author"]
	}
	if (mux.Vars(r)["userId"] != "") {
		reaction.UserId = mux.Vars(r)["userId"]
	}
	result, err := h.service.Delete(r.Context(), &reaction)
	sv.HandleDelete(w, r, result, err, h.Error, h.Log, h.Resource, h.Action.Delete)

}
