package entity

import (
	"context"
	"net/http"
	"reflect"

	sv "github.com/core-go/core"
	"github.com/core-go/core/builder"
	"github.com/core-go/search"
)

type EntityTransport interface {
	Search(w http.ResponseWriter, r *http.Request)
	Load(w http.ResponseWriter, r *http.Request)
	Create(w http.ResponseWriter, r *http.Request)
	Update(w http.ResponseWriter, r *http.Request)
	Patch(w http.ResponseWriter, r *http.Request)
	Delete(w http.ResponseWriter, r *http.Request)
}

func NewEntityHandler(
	find func(context.Context, interface{}, interface{}, int64, ...int64) (int64, string, error),
	entitieservice EntityRepository,
	conf sv.WriterConfig,
	logError func(context.Context, string, ...map[string]interface{}),
	generateId func(context.Context) (string, error),
	validate func(context.Context, interface{}) ([]sv.ErrorMessage, error),
	tracking builder.TrackingConfig,
	writeLog func(context.Context, string, string, bool, string) error,
) EntityTransport {
	modelType := reflect.TypeOf(Entity{})
	searchModelType := reflect.TypeOf(EntityFilter{})
	builder := builder.NewBuilderWithIdAndConfig(generateId, modelType, tracking)
	patchHandler, params := sv.CreatePatchAndParams(modelType, conf.Status, logError, entitieservice.Patch, validate, builder.Patch, conf.Action, writeLog)
	searchHandler := search.NewSearchHandler(find, modelType, searchModelType, logError, writeLog)
	return &EntityHandler{service: entitieservice, builder: builder, PatchHandler: patchHandler, SearchHandler: searchHandler, Params: params}
}

type EntityHandler struct {
	service EntityRepository
	builder sv.Builder
	*sv.PatchHandler
	*search.SearchHandler
	*sv.Params
}

func (h *EntityHandler) Load(w http.ResponseWriter, r *http.Request) {
	id := sv.GetRequiredParam(w, r)
	if len(id) > 0 {
		result, err := h.service.Load(r.Context(), id)
		sv.RespondModel(w, r, result, err, h.Error, nil)
	}
}
func (h *EntityHandler) Create(w http.ResponseWriter, r *http.Request) {
	var entity Entity
	er1 := sv.Decode(w, r, &entity, h.builder.Create)
	if er1 == nil {
		errors, er2 := h.Validate(r.Context(), &entity)
		if !sv.HasError(w, r, errors, er2, *h.Status.ValidationError, h.Error, h.Log, h.Resource, h.Action.Create) {
			result, er3 := h.service.Create(r.Context(), &entity)
			sv.AfterCreated(w, r, &entity, result, er3, h.Status, h.Error, h.Log, h.Resource, h.Action.Create)
		}
	}
}
func (h *EntityHandler) Update(w http.ResponseWriter, r *http.Request) {
	var entity Entity
	er1 := sv.DecodeAndCheckId(w, r, &entity, h.Keys, h.Indexes, h.builder.Update)
	if er1 == nil {
		errors, er2 := h.Validate(r.Context(), &entity)
		if !sv.HasError(w, r, errors, er2, *h.Status.ValidationError, h.Error, h.Log, h.Resource, h.Action.Update) {
			result, er3 := h.service.Update(r.Context(), &entity)
			sv.HandleResult(w, r, &entity, result, er3, h.Status, h.Error, h.Log, h.Resource, h.Action.Update)
		}
	}
}
func (h *EntityHandler) Delete(w http.ResponseWriter, r *http.Request) {
	id := sv.GetRequiredParam(w, r)
	if len(id) > 0 {
		result, err := h.service.Delete(r.Context(), id)
		sv.HandleDelete(w, r, result, err, h.Error, h.Log, h.Resource, h.Action.Delete)
	}
}
