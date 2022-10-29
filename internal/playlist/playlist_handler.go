package playlist

import (
	"context"
	"fmt"
	"github.com/core-go/core"
	"github.com/core-go/search"
	"net/http"
	"reflect"
)

type playlistHandler struct {
	service PlaylistService
	*search.SearchHandler
	*core.Params
}

type PlaylistHandler interface {
	Search(w http.ResponseWriter, r *http.Request)
	Load(w http.ResponseWriter, r *http.Request)
	Insert(w http.ResponseWriter, r *http.Request)
	Update(w http.ResponseWriter, r *http.Request)
	Patch(w http.ResponseWriter, r *http.Request)
	Delete(w http.ResponseWriter, r *http.Request)
}

func NewPlaylistHandler(
	Find func(context.Context, interface{}, interface{}, int64, ...int64) (int64, string, error),
	service PlaylistService,
	Error func(context.Context, string, ...map[string]interface{}),
	Log func(context.Context, string, string, bool, string) error,
	Validate func(context.Context, interface{}) ([]core.ErrorMessage, error),
	status core.StatusConfig,
	action core.ActionConfig,
) PlaylistHandler {
	modelType := reflect.TypeOf(Playlist{})
	searchType := reflect.TypeOf(PlaylistFilter{})
	searchHandler := search.NewSearchHandler(Find, modelType, searchType, Error, Log)
	params := core.CreateParams(modelType, &status, Error, Validate, &action)
	return &playlistHandler{
		service:       service,
		SearchHandler: searchHandler,
		Params:        params,
	}
}

func (h *playlistHandler) Delete(w http.ResponseWriter, r *http.Request) {
	id := core.GetRequiredParam(w, r)
	if len(id) > 0 {
		result, err := h.service.Delete(r.Context(), id)
		core.HandleDelete(w, r, result, err, h.Error, h.Log, h.Resource, h.Action.Delete)
	}
}

func (h *playlistHandler) Insert(w http.ResponseWriter, r *http.Request) {
	var playlist Playlist
	er1 := core.Decode(w, r, &playlist)
	if er1 == nil {
		errors, er2 := h.Validate(r.Context(), &playlist)
		if !core.HasError(w, r, errors, er2, *h.Status.ValidationError, h.Error, h.Log, h.Action.Create) {

			result, er3 := h.service.Insert(r.Context(), &playlist)
			core.AfterCreated(w, r, &playlist, result, er3, h.Status, h.Error, h.Log)
		}
	}
}

func (h *playlistHandler) Load(w http.ResponseWriter, r *http.Request) {
	id := core.GetRequiredParam(w, r)
	if len(id) > 0 {
		result, err := h.service.Load(r.Context(), id)
		core.RespondModel(w, r, result, err, h.Error, nil)
	}
}

func (h *playlistHandler) Patch(w http.ResponseWriter, r *http.Request) {
	var playlist Playlist
	r, json, er1 := core.BuildMapAndCheckId(w, r, &playlist, h.Keys, h.Indexes)
	if er1 == nil {
		errors, er2 := h.Validate(r.Context(), &playlist)
		fmt.Println(errors, er2)

		if !core.HasError(w, r, errors, er2, *h.Status.ValidationError, h.Error, h.Log, h.Resource, h.Action.Patch) {
			result, er3 := h.service.Patch(r.Context(), json)
			core.HandleResult(w, r, json, result, er3, h.Status, h.Error, h.Log, h.Resource, h.Action.Patch)
		}
	}
}

func (h *playlistHandler) Update(w http.ResponseWriter, r *http.Request) {
	var playlist Playlist
	err1 := core.DecodeAndCheckId(w, r, &playlist, h.Keys, h.Indexes)
	if err1 == nil {
		errors, err2 := h.Validate(r.Context(), &playlist)
		if !core.HasError(w, r, errors, err2, *h.Status.ValidationError, h.Error, h.Log, h.Resource, h.Action.Update) {
			result, er3 := h.service.Update(r.Context(), &playlist)
			core.HandleResult(w, r, &playlist, result, er3, h.Status, h.Error, h.Log)
		}
	}
}
