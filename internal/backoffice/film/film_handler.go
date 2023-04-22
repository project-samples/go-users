package film

import (
	"context"
	"fmt"
	"net/http"
	"reflect"

	"github.com/core-go/storage"
	"github.com/core-go/storage/upload"

	"github.com/core-go/core"
	"github.com/core-go/core/builder"
	"github.com/core-go/search"
)

type BackOfficeFilmHandler interface {
	Search(w http.ResponseWriter, r *http.Request)
	Load(w http.ResponseWriter, r *http.Request)
	Insert(w http.ResponseWriter, r *http.Request)
	Update(w http.ResponseWriter, r *http.Request)
	Patch(w http.ResponseWriter, r *http.Request)
	Delete(w http.ResponseWriter, r *http.Request)
	storage.UploadHandler
}

func NewBackOfficeFilmHandler(
	find func(context.Context, interface{}, interface{}, int64, ...int64) (int64, string, error),
	service BackOfficeFilmService,
	validate func(context.Context, interface{}) ([]core.ErrorMessage, error),
	logError func(context.Context, string, ...map[string]interface{}),
	writeLog func(context.Context, string, string, bool, string) error,
	saveDirectors func(context.Context, []string) (int64, error),
	SaveCasts func(context.Context, []string) (int64, error),
	SaveProductions func(context.Context, []string) (int64, error),
	SaveCountries func(context.Context, []string) (int64, error),
	status core.StatusConfig,
	action *core.ActionConfig,
	generateId func(context.Context) (string, error),
	tracking builder.TrackingConfig,
	uploadService upload.UploadManager,
	keyFile string,
	generate func(ctx context.Context) (string, error),

) BackOfficeFilmHandler {
	searchModelType := reflect.TypeOf(FilmFilter{})
	modelType := reflect.TypeOf(Film{})
	searchHandler := search.NewSearchHandler(find, modelType, searchModelType, logError, writeLog)
	params := core.CreateParams(modelType, &status, logError, validate, action)
	UploadHandler := upload.NewHandler(uploadService, logError, keyFile, generate)

	return &backOfficeFilmHandler{service: service,
		SearchHandler: searchHandler,
		Error:         logError,
		Log:           writeLog,
		SaveDirectors: saveDirectors,
		SaveCasts:     SaveCasts, SaveProductions: SaveProductions, SaveCountries: SaveCountries,
		Status:        status,
		Validate:      validate,
		Params:        params,
		UploadHandler: UploadHandler,
	}
}

type backOfficeFilmHandler struct {
	*search.SearchHandler
	*core.PatchHandler
	service         BackOfficeFilmService
	Error           func(context.Context, string, ...map[string]interface{})
	Log             func(context.Context, string, string, bool, string) error
	Validate        func(context.Context, interface{}) ([]core.ErrorMessage, error)
	Status          core.StatusConfig
	SaveDirectors   func(context.Context, []string) (int64, error)
	SaveCasts       func(context.Context, []string) (int64, error)
	SaveProductions func(context.Context, []string) (int64, error)
	SaveCountries   func(context.Context, []string) (int64, error)
	*core.Params
	UploadHandler storage.UploadHandler
}

func (h *backOfficeFilmHandler) Load(w http.ResponseWriter, r *http.Request) {
	id := core.GetRequiredParam(w, r)
	if len(id) > 0 {
		result, err := h.service.Load(r.Context(), id)
		core.RespondModel(w, r, result, err, h.Error, nil)
	}
}

func (h *backOfficeFilmHandler) Insert(w http.ResponseWriter, r *http.Request) {
	var film Film
	er1 := core.Decode(w, r, &film)
	if er1 == nil {
		errors, er2 := h.Validate(r.Context(), &film)
		if !core.HasError(w, r, errors, er2, *h.Status.ValidationError, h.Error, h.Log, h.Action.Create) {
			if h.SaveDirectors != nil && len(film.Directors) > 0 {
				h.SaveDirectors(r.Context(), film.Directors)
			}
			if h.SaveCountries != nil && len(film.Countries) > 0 {
				h.SaveCountries(r.Context(), film.Directors)
			}
			if h.SaveProductions != nil && len(film.Productions) > 0 {
				h.SaveProductions(r.Context(), film.Productions)
			}
			if h.SaveCasts != nil && len(film.Casts) > 0 {
				h.SaveCasts(r.Context(), film.Casts)
			}
			result, er3 := h.service.Insert(r.Context(), &film)
			core.AfterCreated(w, r, &film, result, er3, h.Status, h.Error, h.Log)
		}
	}
}
func (h *backOfficeFilmHandler) Update(w http.ResponseWriter, r *http.Request) {
	var film Film
	err1 := core.DecodeAndCheckId(w, r, &film, h.Keys, h.Indexes)
	if err1 == nil {
		errors, err2 := h.Validate(r.Context(), &film)
		if !core.HasError(w, r, errors, err2, *h.Status.ValidationError, h.Error, h.Log, h.Resource, h.Action.Update) {
			if h.SaveDirectors != nil && len(film.Directors) > 0 {
				_, err := h.SaveDirectors(r.Context(), film.Directors)
				if err != nil {
					return
				}
			}
			if h.SaveCountries != nil && len(film.Countries) > 0 {
				_, err := h.SaveCountries(r.Context(), film.Directors)
				if err != nil {
					return
				}
			}
			if h.SaveProductions != nil && len(film.Productions) > 0 {
				_, err := h.SaveProductions(r.Context(), film.Productions)
				if err != nil {
					return
				}
			}
			if h.SaveCasts != nil && len(film.Casts) > 0 {
				_, err := h.SaveCasts(r.Context(), film.Casts)
				if err != nil {
					return
				}
			}
			result, er3 := h.service.Update(r.Context(), &film)
			core.HandleResult(w, r, &film, result, er3, h.Status, h.Error, h.Log)
		}
	}
}

func (h *backOfficeFilmHandler) Patch(w http.ResponseWriter, r *http.Request) {
	var film Film
	r, json, er1 := core.BuildMapAndCheckId(w, r, &film, h.Keys, h.Indexes)
	if er1 == nil {
		errors, er2 := h.Validate(r.Context(), &film)
		fmt.Println(errors, er2)

		if !core.HasError(w, r, errors, er2, *h.Status.ValidationError, h.Error, h.Log, h.Resource, h.Action.Patch) {
			if h.SaveDirectors != nil && len(film.Directors) > 0 {
				_, err := h.SaveDirectors(r.Context(), film.Directors)
				if err != nil {
					return
				}
			}
			if h.SaveCountries != nil && len(film.Countries) > 0 {
				_, err := h.SaveCountries(r.Context(), film.Directors)
				if err != nil {
					return
				}
			}
			if h.SaveProductions != nil && len(film.Productions) > 0 {
				_, err := h.SaveProductions(r.Context(), film.Productions)
				if err != nil {
					return
				}
			}
			if h.SaveCasts != nil && len(film.Casts) > 0 {
				_, err := h.SaveCasts(r.Context(), film.Casts)
				if err != nil {
					return
				}
			}
			result, er3 := h.service.Patch(r.Context(), json)
			core.HandleResult(w, r, json, result, er3, h.Status, h.Error, h.Log, h.Resource, h.Action.Patch)
		}
	}
}
func (h *backOfficeFilmHandler) Delete(w http.ResponseWriter, r *http.Request) {
	id := core.GetRequiredParam(w, r)
	if len(id) > 0 {
		result, err := h.service.Delete(r.Context(), id)
		core.HandleDelete(w, r, result, err, h.Error, h.Log, h.Resource, h.Action.Delete)
	}
}

func (u *backOfficeFilmHandler) GetGallery(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.GetGallery(w, r)
}

func (u *backOfficeFilmHandler) UploadImage(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.UploadImage(w, r)
}

func (u *backOfficeFilmHandler) UploadGallery(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.UploadGallery(w, r)
}

func (u *backOfficeFilmHandler) UploadCover(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.UploadCover(w, r)
}

func (u *backOfficeFilmHandler) DeleteGalleryFile(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.DeleteGalleryFile(w, r)
}
func (u *backOfficeFilmHandler) UpdateGallery(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.UpdateGallery(w, r)
}
