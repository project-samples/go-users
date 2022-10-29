package company

import (
	"context"
	"fmt"
	"go-service/internal/upload"
	"net/http"
	"reflect"

	"github.com/core-go/core"
	"github.com/core-go/search"
)

type BackofficeCompanyHandler interface {
	Search(w http.ResponseWriter, r *http.Request)
	Load(w http.ResponseWriter, r *http.Request)
	Insert(w http.ResponseWriter, r *http.Request)
	Update(w http.ResponseWriter, r *http.Request)
	Patch(w http.ResponseWriter, r *http.Request)
	Delete(w http.ResponseWriter, r *http.Request)
	upload.UploadHander
}

func NewBackofficeCompanyHandler(
	Find func(context.Context, interface{}, interface{}, int64, ...int64) (int64, string, error),
	service BackofficeCompanyService,
	Error func(context.Context, string, ...map[string]interface{}),
	Log func(context.Context, string, string, bool, string) error,
	Validate func(context.Context, interface{}) ([]core.ErrorMessage, error),
	status core.StatusConfig,
	action core.ActionConfig,
	uploadService upload.UploadService,
	keyFile string,
	generate func(ctx context.Context) (string, error),

) BackofficeCompanyHandler {
	modelType := reflect.TypeOf(Company{})
	searchType := reflect.TypeOf(CompanyFilter{})
	searchHandler := search.NewSearchHandler(Find, modelType, searchType, Error, Log)
	params := core.CreateParams(modelType, &status, Error, Validate, &action)

	UploadHandler := upload.NewUploadHandler(uploadService, Error, &status, keyFile, generate)
	return &backofficeCompanyHandler{
		service:       service,
		SearchHandler: searchHandler,
		Params:        params,
		UploadHandler: UploadHandler,
	}
}

type backofficeCompanyHandler struct {
	service BackofficeCompanyService
	*search.SearchHandler
	*core.Params
	UploadHandler upload.UploadHander
}

// Delete implements BackofficeCompanyHandler
func (h *backofficeCompanyHandler) Delete(w http.ResponseWriter, r *http.Request) {
	id := core.GetRequiredParam(w, r)
	if len(id) > 0 {
		result, err := h.service.Delete(r.Context(), id)
		core.HandleDelete(w, r, result, err, h.Error, h.Log, h.Resource, h.Action.Delete)
	}
}

// Insert implements BackofficeCompanyHandler
func (h *backofficeCompanyHandler) Insert(w http.ResponseWriter, r *http.Request) {
	var company Company
	er1 := core.Decode(w, r, &company)
	if er1 == nil {
		errors, er2 := h.Validate(r.Context(), &company)
		if !core.HasError(w, r, errors, er2, *h.Status.ValidationError, h.Error, h.Log, h.Action.Create) {

			result, er3 := h.service.Insert(r.Context(), &company)
			core.AfterCreated(w, r, &company, result, er3, h.Status, h.Error, h.Log)
		}
	}
}

// Load implements BackofficeCompanyHandler
func (h *backofficeCompanyHandler) Load(w http.ResponseWriter, r *http.Request) {
	id := core.GetRequiredParam(w, r)
	if len(id) > 0 {
		result, err := h.service.Load(r.Context(), id)
		core.RespondModel(w, r, result, err, h.Error, nil)
	}
}

// Patch implements BackofficeCompanyHandler
func (h *backofficeCompanyHandler) Patch(w http.ResponseWriter, r *http.Request) {
	var company Company
	r, json, er1 := core.BuildMapAndCheckId(w, r, &company, h.Keys, h.Indexes)
	if er1 == nil {
		errors, er2 := h.Validate(r.Context(), &company)
		fmt.Println(errors, er2)

		if !core.HasError(w, r, errors, er2, *h.Status.ValidationError, h.Error, h.Log, h.Resource, h.Action.Patch) {
			result, er3 := h.service.Patch(r.Context(), json)
			core.HandleResult(w, r, json, result, er3, h.Status, h.Error, h.Log, h.Resource, h.Action.Patch)
		}
	}
}

// Update implements BackofficeCompanyHandler
func (h *backofficeCompanyHandler) Update(w http.ResponseWriter, r *http.Request) {
	var company Company
	err1 := core.DecodeAndCheckId(w, r, &company, h.Keys, h.Indexes)
	if err1 == nil {
		errors, err2 := h.Validate(r.Context(), &company)
		if !core.HasError(w, r, errors, err2, *h.Status.ValidationError, h.Error, h.Log, h.Resource, h.Action.Update) {
			result, er3 := h.service.Update(r.Context(), &company)
			core.HandleResult(w, r, &company, result, er3, h.Status, h.Error, h.Log)
		}
	}
}

func (u *backofficeCompanyHandler) GetGallery(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.GetGallery(w, r)
}

func (u *backofficeCompanyHandler) UploadImage(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.UploadImage(w, r)
}

func (u *backofficeCompanyHandler) UploadGallery(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.UploadGallery(w, r)
}

func (u *backofficeCompanyHandler) UploadCover(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.UploadCover(w, r)
}

func (u *backofficeCompanyHandler) DeleteGalleryFile(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.DeleteGalleryFile(w, r)
}
func (u *backofficeCompanyHandler) UpdateGallery(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.UpdateGallery(w, r)
}
