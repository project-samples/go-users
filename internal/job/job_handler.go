package job

import (
	"context"
	"fmt"
	"github.com/core-go/core"
	"github.com/core-go/search"
	"net/http"
	"reflect"
)

type jobHandler struct {
	service JobService
	*search.SearchHandler
	*core.Params
}

type JobHandler interface {
	Search(w http.ResponseWriter, r *http.Request)
	Load(w http.ResponseWriter, r *http.Request)
}

func NewJobHandler(
	Find func(context.Context, interface{}, interface{}, int64, ...int64) (int64, string, error),
	service JobService,
	Error func(context.Context, string, ...map[string]interface{}),
	Log func(context.Context, string, string, bool, string) error,
	Validate func(context.Context, interface{}) ([]core.ErrorMessage, error),
	status core.StatusConfig,
	action core.ActionConfig,
) JobHandler {
	modelType := reflect.TypeOf(Job{})
	searchType := reflect.TypeOf(JobFilter{})
	searchHandler := search.NewSearchHandler(Find, modelType, searchType, Error, Log)
	params := core.CreateParams(modelType, &status, Error, Validate, &action)
	return &jobHandler{
		service:       service,
		SearchHandler: searchHandler,
		Params:        params,
	}
}

func (h *jobHandler) Load(w http.ResponseWriter, r *http.Request) {
	id := core.GetRequiredParam(w, r)
	fmt.Println("result", id)
	if len(id) > 0 {
		result, err := h.service.Load(r.Context(), id)
		fmt.Println("result", result)
		core.RespondModel(w, r, result, err, h.Error, nil)
	}
}
