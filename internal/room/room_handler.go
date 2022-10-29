package room

import (
	"context"
	"github.com/core-go/core"
	"github.com/core-go/search"
	"net/http"
	"reflect"
)

type RoomHandler interface {
	core.Query
}

func NewRoomHandler(
	Find func(context.Context, interface{}, interface{}, int64, ...int64) (int64, string, error),
	service RoomService,
	Error func(context.Context, string, ...map[string]interface{}),
	Log func(context.Context, string, string, bool, string) error,
	Validate func(context.Context, interface{}) ([]core.ErrorMessage, error),
	status core.StatusConfig,
	action core.ActionConfig,
) RoomHandler {
	modelType := reflect.TypeOf(Room{})
	searchType := reflect.TypeOf(RoomFilter{})
	searchHandler := search.NewSearchHandler(Find, modelType, searchType, Error, Log)
	params := core.CreateParams(modelType, &status, Error, Validate, &action)
	return &roomHandler{
		service:       service,
		SearchHandler: searchHandler,
		Params:        params,
	}
}

type roomHandler struct {
	*search.SearchHandler
	service RoomService
	*core.Params
}

func (h *roomHandler) Load(w http.ResponseWriter, r *http.Request) {
	id := core.GetRequiredParam(w, r)
	if len(id) > 0 {
		result, err := h.service.Load(r.Context(), id)
		core.RespondModel(w, r, result, err, h.Error, nil)
	}
}
