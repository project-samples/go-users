package rate

import (
	"context"
	"net/http"
	"reflect"
	"time"

	sv "github.com/core-go/core"
	"github.com/core-go/search"
	"github.com/gorilla/mux"
)

type RateHandler interface {
	Search(w http.ResponseWriter, r *http.Request)
	Load(w http.ResponseWriter, r *http.Request)
	Rate(w http.ResponseWriter, r *http.Request)
}

func NewRateHandler(find func(context.Context, interface{}, interface{}, int64, ...int64) (int64, string, error), service RateService, status sv.StatusConfig, logError func(context.Context, string, ...map[string]interface{}), validate func(ctx context.Context, model interface{}) ([]sv.ErrorMessage, error), action *sv.ActionConfig) RateHandler {
	searchModelType := reflect.TypeOf(RateFilter{})
	modelType := reflect.TypeOf(Rate{})
	params := sv.CreateParams(modelType, &status, logError, validate, action)
	searchHandler := search.NewSearchHandler(find, modelType, searchModelType, logError, params.Log)
	return &rateHandler{service: service, SearchHandler: searchHandler, Params: params}
}

type rateHandler struct {
	service RateService
	*search.SearchHandler
	*sv.Params
}

func (h *rateHandler) Load(w http.ResponseWriter, r *http.Request) {
	id := mux.Vars(r)["id"]
	author := mux.Vars(r)["author"]
	if len(id) > 0 {
		res, err := h.service.Load(r.Context(), id, author)
		sv.RespondModel(w, r, res, err, h.Error, nil)
	}
}

func (h *rateHandler) Rate(w http.ResponseWriter, r *http.Request) {
	var rate Rate
	var t = time.Now()
	rate.Time = &t
	er1 := sv.Decode(w, r, &rate)
	if mux.Vars(r)["id"] != "" {
		rate.Id = mux.Vars(r)["id"]
	}
	if mux.Vars(r)["author"] != "" {
		rate.Author = mux.Vars(r)["author"]
	}
	if er1 == nil {
		errors, er2 := h.Validate(r.Context(), &rate)
		if !sv.HasError(w, r, errors, er2, *h.Status.ValidationError, h.Error, h.Log, h.Resource, h.Action.Create) {
			result, er3 := h.service.Rate(r.Context(), &rate)
			sv.AfterCreated(w, r, &rate, result, er3, h.Status, h.Error, h.Log, h.Resource, h.Action.Create)
		}
	}
}
