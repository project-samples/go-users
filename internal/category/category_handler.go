package category

import (
	"context"
	"net/http"
	"reflect"

	"github.com/core-go/core"
	sv "github.com/core-go/core"
	"github.com/core-go/search"
)

type CategoryHandler interface {
	Search(w http.ResponseWriter, r *http.Request)
	Load(w http.ResponseWriter, r *http.Request)
	Create(w http.ResponseWriter, r *http.Request)
	Update(w http.ResponseWriter, r *http.Request)
	Patch(w http.ResponseWriter, r *http.Request)
	Delete(w http.ResponseWriter, r *http.Request)
}

func NewCategoryHandler(
	find func(context.Context, interface{}, interface{}, int64, ...int64) (int64, string, error),
	service CategoryService,
	status sv.StatusConfig,
	logError func(context.Context, string, ...map[string]interface{}),
	validate func(context.Context, interface{}) ([]core.ErrorMessage, error),
	writeLog func(context.Context, string, string, bool, string) error,
	actions *core.ActionConfig) CategoryHandler {
	searchModelType := reflect.TypeOf(CategoryFilter{})
	modelType := reflect.TypeOf(Category{})
	params := core.CreateParams(modelType, &status, logError, validate, actions)
	searchHandler := search.NewSearchHandler(find, modelType, searchModelType, logError, params.Log)
	return &categoryHandler{service: service, SearchHandler: searchHandler, Params: params, Error: logError}
}

type categoryHandler struct {
	*search.SearchHandler
	*sv.Params
	service CategoryService
	Error   func(context.Context, string, ...map[string]interface{})

	Log func(context.Context, string, string, bool, string) error
}

func (h *categoryHandler) Load(w http.ResponseWriter, r *http.Request) {
	id := core.GetRequiredParam(w, r)
	if len(id) > 0 {
		result, err := h.service.Load(r.Context(), id)
		core.RespondModel(w, r, result, err, h.Error, nil)
	}
}
func (h *categoryHandler) Create(w http.ResponseWriter, r *http.Request) {
	var category Category
	er1 := core.Decode(w, r, &category)
	if er1 == nil {
		errors, er2 := h.Validate(r.Context(), &category)
		if !core.HasError(w, r, errors, er2, *h.Status.ValidationError, h.Error, h.Log, h.Resource, h.Action.Create) {
			result, er3 := h.service.Create(r.Context(), &category)
			core.AfterCreated(w, r, &category, result, er3, h.Status, h.Error, h.Log, h.Resource, h.Action.Create)
		}
	}
}

func (h *categoryHandler) Update(w http.ResponseWriter, r *http.Request) {
	var category Category
	er1 := core.DecodeAndCheckId(w, r, &category, h.Keys, h.Indexes)
	if er1 == nil {
		errors, er2 := h.Validate(r.Context(), &category)
		if !core.HasError(w, r, errors, er2, *h.Status.ValidationError, h.Error, h.Log, h.Resource, h.Action.Update) {
			result, er3 := h.service.Update(r.Context(), &category)
			core.HandleResult(w, r, &category, result, er3, h.Status, h.Error, h.Log, h.Resource, h.Action.Update)
		}
	}
}

func (h *categoryHandler) Patch(w http.ResponseWriter, r *http.Request) {
	var category Category
	r, json, er1 := core.BuildMapAndCheckId(w, r, &category, h.Keys, h.Indexes)

	if er1 == nil {
		errors, er2 := h.Validate(r.Context(), &category)
		if !core.HasError(w, r, errors, er2, *h.Status.ValidationError, h.Error, h.Log, h.Resource, h.Action.Patch) {
			result, er3 := h.service.Patch(r.Context(), json)
			core.HandleResult(w, r, json, result, er3, h.Status, h.Error, h.Log, h.Resource, h.Action.Patch)
		}
	}
}

func (h *categoryHandler) Delete(w http.ResponseWriter, r *http.Request) {
	id := core.GetRequiredParam(w, r)
	if len(id) > 0 {
		result, err := h.service.Delete(r.Context(), id)
		core.HandleDelete(w, r, result, err, h.LogError, h.Log, h.Resource, h.Action.Delete)
	}
}

// type CategoryHandler[T interface{}, F interface{}] interface {
// 	Search(w http.ResponseWriter, r *http.Request)
// 	Load(w http.ResponseWriter, r *http.Request)
// 	Create(w http.ResponseWriter, r *http.Request)
// 	Update(w http.ResponseWriter, r *http.Request)
// 	Patch(w http.ResponseWriter, r *http.Request)
// 	Delete(w http.ResponseWriter, r *http.Request)
// }
// type categoryHandler[T interface{}, F interface{}] struct {
// 	*search.SearchHandler
// 	*core.Params
// 	service CategoryService[T, F]
// 	Error   func(context.Context, string, ...map[string]interface{})

// 	// Log     func(context.Context, string, string, bool, string) error
// }

// func NewCategoryHandler[T interface{}, F interface{}](
// 	find func(context.Context, interface{}, interface{}, int64, ...int64) (int64, string, error),
// 	service CategoryService[T, F],
// 	status core.StatusConfig,
// 	logError func(context.Context, string, ...map[string]interface{}),
// 	validate func(context.Context, interface{}) ([]core.ErrorMessage, error),
// 	writeLog func(context.Context, string, string, bool, string) error,
// 	actions *core.ActionConfig) CategoryHandler[T, F] {
// 	var model T
// 	var filter F
// 	searchModelType := reflect.TypeOf(filter)
// 	modelType := reflect.TypeOf(model)
// 	params := core.CreateParams(modelType, &status, logError, validate, actions)
// 	searchHandler := search.NewSearchHandler(find, modelType, searchModelType, logError, params.Log)
// 	return &categoryHandler[T, F]{service: service, SearchHandler: searchHandler, Params: params, Error: logError}
// }

// func (h *categoryHandler[T, F]) Load(w http.ResponseWriter, r *http.Request) {
// 	id := core.GetRequiredParam(w, r)
// 	if len(id) > 0 {
// 		result, err := h.service.Load(r.Context(), id)
// 		core.RespondModel(w, r, result, err, h.Error, nil)
// 	}
// }

// func (h *categoryHandler[T, F]) Create(w http.ResponseWriter, r *http.Request) {
// 	var category T
// 	er1 := core.Decode(w, r, &category)
// 	if er1 == nil {
// 		errors, er2 := h.Validate(r.Context(), &category)
// 		if !core.HasError(w, r, errors, er2, *h.Status.ValidationError, h.Error, h.Log, h.Resource, h.Action.Create) {
// 			result, er3 := h.service.Create(r.Context(), &category)
// 			core.AfterCreated(w, r, &category, result, er3, h.Status, h.Error, h.Log, h.Resource, h.Action.Create)
// 		}
// 	}
// }

// func (h *categoryHandler[T, F]) Update(w http.ResponseWriter, r *http.Request) {
// 	var category T
// 	er1 := core.DecodeAndCheckId(w, r, &category, h.Keys, h.Indexes)
// 	if er1 == nil {
// 		errors, er2 := h.Validate(r.Context(), &category)
// 		if !core.HasError(w, r, errors, er2, *h.Status.ValidationError, h.Error, h.Log, h.Resource, h.Action.Update) {
// 			result, er3 := h.service.Update(r.Context(), &category)
// 			core.HandleResult(w, r, &category, result, er3, h.Status, h.Error, h.Log, h.Resource, h.Action.Update)
// 		}
// 	}
// }

// func (h *categoryHandler[T, F]) Patch(w http.ResponseWriter, r *http.Request) {
// 	var category T
// 	r, json, er1 := core.BuildMapAndCheckId(w, r, &category, h.Keys, h.Indexes)

// 	if er1 == nil {
// 		errors, er2 := h.Validate(r.Context(), &category)
// 		if !core.HasError(w, r, errors, er2, *h.Status.ValidationError, h.Error, h.Log, h.Resource, h.Action.Patch) {
// 			result, er3 := h.service.Patch(r.Context(), json)
// 			core.HandleResult(w, r, json, result, er3, h.Status, h.Error, h.Log, h.Resource, h.Action.Patch)
// 		}
// 	}
// }

// func (h *categoryHandler[T, F]) Delete(w http.ResponseWriter, r *http.Request) {
// 	id := core.GetRequiredParam(w, r)
// 	if len(id) > 0 {
// 		result, err := h.service.Delete(r.Context(), id)
// 		core.HandleDelete(w, r, result, err, h.LogError, h.Log, h.Resource, h.Action.Delete)
// 	}

// }
