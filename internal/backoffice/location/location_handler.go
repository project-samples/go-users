package bolocation

import (
	"context"
	"fmt"
	"go-service/internal/upload"
	"net/http"
	"reflect"

	sv "github.com/core-go/core"
	"github.com/core-go/search"
)

type BackOfficeLocationHandler interface {
	Search(w http.ResponseWriter, r *http.Request)
	Load(w http.ResponseWriter, r *http.Request)
	Insert(w http.ResponseWriter, r *http.Request)
	Update(w http.ResponseWriter, r *http.Request)
	Patch(w http.ResponseWriter, r *http.Request)
	Delete(w http.ResponseWriter, r *http.Request)
	upload.UploadHander
}

func NewBackOfficeLocationHandler(
	find func(context.Context, interface{}, interface{}, int64, ...int64) (int64, string, error),
	service BackOfficeLocationService,
	logError func(context.Context, string, ...map[string]interface{}),
	writeLog func(context.Context, string, string, bool, string) error,
	status sv.StatusConfig,
	action sv.ActionConfig,
	validate func(context.Context, interface{}) ([]sv.ErrorMessage, error),
	uploadService upload.UploadService,
	keyFile string,
	generate func(ctx context.Context) (string, error),
) BackOfficeLocationHandler {
	searchModelType := reflect.TypeOf(LocationFilter{})
	modelType := reflect.TypeOf(Location{})
	searchHandler := search.NewSearchHandler(find, modelType, searchModelType, logError, writeLog)
	params := sv.CreateParams(modelType, &status, logError, validate, &action)
	UploadHandler := upload.NewUploadHandler(uploadService, logError, &status, keyFile, generate)
	return &backOfficeLocationHandler{service: service,
		SearchHandler: searchHandler,
		Error:         logError,
		Log:           writeLog,
		Params:        params,
		UploadHandler: UploadHandler,
	}
}

type backOfficeLocationHandler struct {
	*sv.Params
	service BackOfficeLocationService
	*search.SearchHandler
	Error         func(context.Context, string, ...map[string]interface{})
	Log           func(context.Context, string, string, bool, string) error
	UploadHandler upload.UploadHander
}

func (h *backOfficeLocationHandler) Delete(w http.ResponseWriter, r *http.Request) {
	id := sv.GetRequiredParam(w, r)
	if len(id) > 0 {
		result, err := h.service.Delete(r.Context(), id)
		sv.HandleDelete(w, r, result, err, h.Error, h.Log, h.Resource, h.Action.Delete)
	}
}

func (h *backOfficeLocationHandler) Insert(w http.ResponseWriter, r *http.Request) {
	var location Location
	er1 := sv.Decode(w, r, &location)
	if er1 == nil {
		errors, er2 := h.Validate(r.Context(), &location)
		if !sv.HasError(w, r, errors, er2, *h.Status.ValidationError, h.Error, h.Log, h.Action.Create) {
			result, er3 := h.service.Insert(r.Context(), &location)
			sv.AfterCreated(w, r, &location, result, er3, h.Status, h.Error, h.Log)
		}
	}
}

func (h *backOfficeLocationHandler) Patch(w http.ResponseWriter, r *http.Request) {
	var film Location
	r, json, er1 := sv.BuildMapAndCheckId(w, r, &film, h.Keys, h.Indexes)
	if er1 == nil {
		errors, er2 := h.Validate(r.Context(), &film)
		fmt.Println(errors, er2)

		if !sv.HasError(w, r, errors, er2, *h.Status.ValidationError, h.Error, h.Log, h.Resource, h.Action.Patch) {
			result, er3 := h.service.Patch(r.Context(), json)
			sv.HandleResult(w, r, json, result, er3, h.Status, h.Error, h.Log, h.Resource, h.Action.Patch)
		}
	}
}

func (h *backOfficeLocationHandler) Update(w http.ResponseWriter, r *http.Request) {
	var location Location
	err1 := sv.DecodeAndCheckId(w, r, &location, h.Keys, h.Indexes)
	if err1 == nil {
		errors, err2 := h.Validate(r.Context(), &location)
		if !sv.HasError(w, r, errors, err2, *h.Status.ValidationError, h.Error, h.Log, h.Resource, h.Action.Update) {

			result, er3 := h.service.Update(r.Context(), &location)
			sv.HandleResult(w, r, &location, result, er3, h.Status, h.Error, h.Log)
		}
	}
}

func (h *backOfficeLocationHandler) Load(w http.ResponseWriter, r *http.Request) {
	id := sv.GetRequiredParam(w, r)
	if len(id) > 0 {
		result, err := h.service.Load(r.Context(), id)
		sv.RespondModel(w, r, result, err, h.Error, nil)
	}
}

func (u *backOfficeLocationHandler) GetGallery(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.GetGallery(w, r)
}

func (u *backOfficeLocationHandler) UploadImage(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.UploadImage(w, r)
}

func (u *backOfficeLocationHandler) UploadGallery(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.UploadGallery(w, r)
}

func (u *backOfficeLocationHandler) UploadCover(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.UploadCover(w, r)
}

func (u *backOfficeLocationHandler) DeleteGalleryFile(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.DeleteGalleryFile(w, r)
}
func (u *backOfficeLocationHandler) UpdateGallery(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.UpdateGallery(w, r)
}
