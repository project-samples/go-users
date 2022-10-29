package music

import (
	"context"
	"fmt"
	"net/http"
	"reflect"

	"github.com/core-go/core"
	"github.com/core-go/search"
)

type backofficeMusicHandler struct {
	service BackOfficeMusicService
	*search.SearchHandler
	*core.Params
}

type BackofficeMusicHandler interface {
	Search(w http.ResponseWriter, r *http.Request)
	Load(w http.ResponseWriter, r *http.Request)
	Insert(w http.ResponseWriter, r *http.Request)
	Update(w http.ResponseWriter, r *http.Request)
	Patch(w http.ResponseWriter, r *http.Request)
	Delete(w http.ResponseWriter, r *http.Request)
}

func NewBackofficeMusicHandler(
	Find func(context.Context, interface{}, interface{}, int64, ...int64) (int64, string, error),
	service BackOfficeMusicService,
	Error func(context.Context, string, ...map[string]interface{}),
	Log func(context.Context, string, string, bool, string) error,
	Validate func(context.Context, interface{}) ([]core.ErrorMessage, error),
	status core.StatusConfig,
	action core.ActionConfig,
) BackofficeMusicHandler {
	modelType := reflect.TypeOf(Music{})
	searchType := reflect.TypeOf(MusicFilter{})
	searchHandler := search.NewSearchHandler(Find, modelType, searchType, Error, Log)
	params := core.CreateParams(modelType, &status, Error, Validate, &action)
	return &backofficeMusicHandler{
		service:       service,
		SearchHandler: searchHandler,
		Params:        params,
	}
}

func (h *backofficeMusicHandler) Delete(w http.ResponseWriter, r *http.Request) {
	id := core.GetRequiredParam(w, r)
	if len(id) > 0 {
		result, err := h.service.Delete(r.Context(), id)
		core.HandleDelete(w, r, result, err, h.Error, h.Log, h.Resource, h.Action.Delete)
	}
}

func (h *backofficeMusicHandler) Insert(w http.ResponseWriter, r *http.Request) {
	var music Music
	er1 := core.Decode(w, r, &music)
	if er1 == nil {
		errors, er2 := h.Validate(r.Context(), &music)
		if !core.HasError(w, r, errors, er2, *h.Status.ValidationError, h.Error, h.Log, h.Action.Create) {

			result, er3 := h.service.Insert(r.Context(), &music)
			core.AfterCreated(w, r, &music, result, er3, h.Status, h.Error, h.Log)
		}
	}
}

func (h *backofficeMusicHandler) Load(w http.ResponseWriter, r *http.Request) {
	id := core.GetRequiredParam(w, r)
	if len(id) > 0 {
		result, err := h.service.Load(r.Context(), id)
		core.RespondModel(w, r, result, err, h.Error, nil)
	}
}

func (h *backofficeMusicHandler) Patch(w http.ResponseWriter, r *http.Request) {
	var music Music
	r, json, er1 := core.BuildMapAndCheckId(w, r, &music, h.Keys, h.Indexes)
	if er1 == nil {
		errors, er2 := h.Validate(r.Context(), &music)
		fmt.Println(errors, er2)

		if !core.HasError(w, r, errors, er2, *h.Status.ValidationError, h.Error, h.Log, h.Resource, h.Action.Patch) {
			result, er3 := h.service.Patch(r.Context(), json)
			core.HandleResult(w, r, json, result, er3, h.Status, h.Error, h.Log, h.Resource, h.Action.Patch)
		}
	}
}

func (h *backofficeMusicHandler) Update(w http.ResponseWriter, r *http.Request) {
	var music Music
	err1 := core.DecodeAndCheckId(w, r, &music, h.Keys, h.Indexes)
	if err1 == nil {
		errors, err2 := h.Validate(r.Context(), &music)
		if !core.HasError(w, r, errors, err2, *h.Status.ValidationError, h.Error, h.Log, h.Resource, h.Action.Update) {
			result, er3 := h.service.Update(r.Context(), &music)
			core.HandleResult(w, r, &music, result, er3, h.Status, h.Error, h.Log)
		}
	}
}
