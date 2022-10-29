package cinema

import (
	"context"
	"net/http"
	"reflect"

	"github.com/core-go/core"
	sv "github.com/core-go/core"
	"github.com/core-go/search"
)

type CinemaHandler interface {
	core.QueryHandler
}

func NewCinemaHandler(find func(context.Context, interface{}, interface{}, int64, ...int64) (int64, string, error),
	writeLog func(context.Context, string, string, bool, string) error,
	service CinemaService,
	logError func(context.Context, string, ...map[string]interface{}),
	validate func(context.Context, interface{}) ([]core.ErrorMessage, error),
	status core.StatusConfig, action core.ActionConfig) CinemaHandler {
	searchModelType := reflect.TypeOf(CinemaFilter{})
	modelType := reflect.TypeOf(Cinema{})
	params := core.CreateParams(modelType, &status, logError, validate, &action)
	handler := search.NewSearchHandler(find, modelType, searchModelType, logError, writeLog)
	return &cinemaHandler{service: service, SearchHandler: handler, Error: logError, Params: params}
}

type cinemaHandler struct {
	service CinemaService
	load    func(ctx context.Context, id interface{}, result interface{}) (bool, error)
	*search.SearchHandler
	*core.Params
	Error func(context.Context, string, ...map[string]interface{})
}

func (h *cinemaHandler) Load(w http.ResponseWriter, r *http.Request) {
	id := sv.GetRequiredParam(w, r)
	if len(id) > 0 {
		var user Cinema
		ok, err := h.load(r.Context(), id, &user)
		sv.RespondIfFound(w, r, user, ok, err, h.Error, nil)
	}
}
