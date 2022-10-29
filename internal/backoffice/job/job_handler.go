package job

import (
	"context"
	"fmt"
	"net/http"
	"reflect"

	"github.com/core-go/core"
	"github.com/core-go/search"
)

type backofficeJobHandler struct {
	service BackOfficeJobService
	*search.SearchHandler
	*core.Params
}

type BackofficeJobHandler interface {
	Search(w http.ResponseWriter, r *http.Request)
	Load(w http.ResponseWriter, r *http.Request)
	Insert(w http.ResponseWriter, r *http.Request)
	Update(w http.ResponseWriter, r *http.Request)
	Patch(w http.ResponseWriter, r *http.Request)
	Delete(w http.ResponseWriter, r *http.Request)
}

func NewBackofficeJobHandler(
	Find func(context.Context, interface{}, interface{}, int64, ...int64) (int64, string, error),
	service BackOfficeJobService,
	Error func(context.Context, string, ...map[string]interface{}),
	Log func(context.Context, string, string, bool, string) error,
	Validate func(context.Context, interface{}) ([]core.ErrorMessage, error),
	status core.StatusConfig,
	action core.ActionConfig,
) BackofficeJobHandler {
	modelType := reflect.TypeOf(Job{})
	searchType := reflect.TypeOf(JobFilter{})
	searchHandler := search.NewSearchHandler(Find, modelType, searchType, Error, Log)
	params := core.CreateParams(modelType, &status, Error, Validate, &action)
	return &backofficeJobHandler{
		service:       service,
		SearchHandler: searchHandler,
		Params:        params,
	}
}

func (h *backofficeJobHandler) Delete(w http.ResponseWriter, r *http.Request) {
	id := core.GetRequiredParam(w, r)
	if len(id) > 0 {
		result, err := h.service.Delete(r.Context(), id)
		core.HandleDelete(w, r, result, err, h.Error, h.Log, h.Resource, h.Action.Delete)
	}
}

func (h *backofficeJobHandler) Insert(w http.ResponseWriter, r *http.Request) {
	var job Job
	er1 := core.Decode(w, r, &job)
	if er1 == nil {
		errors, er2 := h.Validate(r.Context(), &job)
		if !core.HasError(w, r, errors, er2, *h.Status.ValidationError, h.Error, h.Log, h.Action.Create) {

			result, er3 := h.service.Insert(r.Context(), &job)
			core.AfterCreated(w, r, &job, result, er3, h.Status, h.Error, h.Log)
		}
	}
}

func (h *backofficeJobHandler) Load(w http.ResponseWriter, r *http.Request) {
	id := core.GetRequiredParam(w, r)
	if len(id) > 0 {
		result, err := h.service.Load(r.Context(), id)
		core.RespondModel(w, r, result, err, h.Error, nil)
	}
}

func (h *backofficeJobHandler) Patch(w http.ResponseWriter, r *http.Request) {
	var job Job
	r, json, er1 := core.BuildMapAndCheckId(w, r, &job, h.Keys, h.Indexes)
	if er1 == nil {
		errors, er2 := h.Validate(r.Context(), &job)
		fmt.Println(errors, er2)

		if !core.HasError(w, r, errors, er2, *h.Status.ValidationError, h.Error, h.Log, h.Resource, h.Action.Patch) {
			result, er3 := h.service.Patch(r.Context(), json)
			core.HandleResult(w, r, json, result, er3, h.Status, h.Error, h.Log, h.Resource, h.Action.Patch)
		}
	}
}

func (h *backofficeJobHandler) Update(w http.ResponseWriter, r *http.Request) {
	var job Job
	err1 := core.DecodeAndCheckId(w, r, &job, h.Keys, h.Indexes)
	if err1 == nil {
		errors, err2 := h.Validate(r.Context(), &job)
		if !core.HasError(w, r, errors, err2, *h.Status.ValidationError, h.Error, h.Log, h.Resource, h.Action.Update) {
			result, er3 := h.service.Update(r.Context(), &job)
			core.HandleResult(w, r, &job, result, er3, h.Status, h.Error, h.Log)
		}
	}
}
