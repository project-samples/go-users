package film

import (
	"context"
	"net/http"
	"reflect"

	sv "github.com/core-go/core"
	"github.com/core-go/search"
)

type FilmHandler interface {
	Search(w http.ResponseWriter, r *http.Request)
	Load(w http.ResponseWriter, r *http.Request)
}

func NewFilmHandler(
	find func(context.Context, interface{}, interface{}, int64, ...int64) (int64, string, error),
	service FilmService,
	logError func(context.Context, string, ...map[string]interface{}),
	writeLog func(context.Context, string, string, bool, string) error) FilmHandler {
	searchModelType := reflect.TypeOf(FilmFilter{})
	modelType := reflect.TypeOf(Film{})
	searchHandler := search.NewSearchHandler(find, modelType, searchModelType, logError, writeLog)
	return &filmHandler{service: service, SearchHandler: searchHandler, Error: logError, Log: writeLog}
}

type filmHandler struct {
	*search.SearchHandler
	service FilmService
	Error   func(context.Context, string, ...map[string]interface{})
	Log     func(context.Context, string, string, bool, string) error
}

func (h *filmHandler) Load(w http.ResponseWriter, r *http.Request) {
	id := sv.GetRequiredParam(w, r)
	if len(id) > 0 {
		result, err := h.service.Load(r.Context(), id)
		sv.RespondModel(w, r, result, err, h.Error, nil)
	}
}

// // SaveFilm
// type SavedFilmHandler interface {
// 	Load(w http.ResponseWriter, r *http.Request)
// 	Save(w http.ResponseWriter, r *http.Request)
// 	// Remove(w http.ResponseWriter, r *http.Request)
// }

// func NewSavedFilmHanlder(service SavedFilmService) SavedFilmHandler {

// 	return &savedFilmHandler{service: service}
// }

// type savedFilmHandler struct {
// 	service SavedFilmService
// 	*sv.Params
// 	// Log func(context.Context, string, string, bool, string) error
// }

// func (h *savedFilmHandler) Load(w http.ResponseWriter, r *http.Request) {
// 	id := sv.GetRequiredParam(w, r)
// 	if len(id) > 0 {
// 		result, err := h.service.Load(r.Context(), id)
// 		sv.RespondModel(w, r, result, err, h.Error, nil)
// 	}

// }

// func (h *savedFilmHandler) Save(w http.ResponseWriter, r *http.Request) {
// 	id := mux.Vars(r)["id"]
// 	itemId := mux.Vars(r)["itemId"]
// 	if len(id) > 0 && len(itemId) > 0 {
// 		result, err := h.service.Save(r.Context(), id, itemId)
// 		sv.RespondModel(w, r, result, err, h.Error, nil)
// 	} else {
// 		http.Error(w, "parameter is required", http.StatusBadRequest)
// 	}
// }

// func (h *savedFilmHandler) Remove(w http.ResponseWriter, r *http.Request) {
// 	id := mux.Vars(r)["id"]
// 	itemId := mux.Vars(r)["itemId"]
// 	if len(id) == 0 {
// 		http.Error(w, "id is required", http.StatusBadRequest)
// 	}
// 	if len(itemId) == 0 {
// 		http.Error(w, "itemId is required", http.StatusBadRequest)
// 	}
// 	result, err := h.service.Remove(r.Context(), id, itemId)
// 	if err != nil {
// 		http.Error(w, err.Error(), http.StatusInternalServerError)
// 	}
// 	sv.RespondModel(w, r, result, err, h.Error, nil)

// }
