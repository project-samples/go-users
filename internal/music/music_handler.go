package music

import (
	"context"
	"github.com/core-go/core"
	"github.com/core-go/search"
	"net/http"
	"reflect"
)

type backofficeMusicHandler struct {
	service MusicService
	*search.SearchHandler
	*core.Params
}

type MusicHandler interface {
	Search(w http.ResponseWriter, r *http.Request)
	Load(w http.ResponseWriter, r *http.Request)
}

func NewMusicHandler(
	Find func(context.Context, interface{}, interface{}, int64, ...int64) (int64, string, error),
	service MusicService,
	Error func(context.Context, string, ...map[string]interface{}),
	Log func(context.Context, string, string, bool, string) error,
	Validate func(context.Context, interface{}) ([]core.ErrorMessage, error),
	status core.StatusConfig,
	action core.ActionConfig,
) MusicHandler {
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

func (h *backofficeMusicHandler) Load(w http.ResponseWriter, r *http.Request) {
	id := core.GetRequiredParam(w, r)
	if len(id) > 0 {
		result, err := h.service.Load(r.Context(), id)
		core.RespondModel(w, r, result, err, h.Error, nil)
	}
}
