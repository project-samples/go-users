package myitem

import (
	"context"
	"net/http"
	"reflect"

	"github.com/core-go/storage"
	"github.com/core-go/storage/upload"

	sv "github.com/core-go/core"
	"github.com/core-go/search"
)

type MyItemHandler interface {
	Search(w http.ResponseWriter, r *http.Request)
	Load(w http.ResponseWriter, r *http.Request)
	Create(w http.ResponseWriter, r *http.Request)
	Update(w http.ResponseWriter, r *http.Request)
	Patch(w http.ResponseWriter, r *http.Request)
	Delete(w http.ResponseWriter, r *http.Request)
	UploadImage(w http.ResponseWriter, r *http.Request)
	UploadGallery(w http.ResponseWriter, r *http.Request)
	DeleteGalleryFile(w http.ResponseWriter, r *http.Request)
	UpdateGallery(w http.ResponseWriter, r *http.Request)
	GetGallery(w http.ResponseWriter, r *http.Request)
}

func NewMyItemHandler(
	find func(context.Context, interface{}, interface{}, int64, ...int64) (int64, string, error),
	service ItemService,
	status sv.StatusConfig,
	logError func(context.Context, string, ...map[string]interface{}),
	validate func(ctx context.Context, model interface{}) ([]sv.ErrorMessage, error),
	action *sv.ActionConfig,
	uploadService upload.UploadManager,
	keyFile string,
	generate func(ctx context.Context) (string, error),

) MyItemHandler {
	searchModelType := reflect.TypeOf(ItemFilter{})
	modelType := reflect.TypeOf(Item{})
	params := sv.CreateParams(modelType, &status, logError, validate, action)
	searchHandler := search.NewSearchHandler(find, modelType, searchModelType, logError, params.Log)
	UploadHandler := upload.NewHandler(uploadService, logError, keyFile, generate)
	return &itemHandler{service: service, SearchHandler: searchHandler, Params: params, UploadHandler: UploadHandler}
}

type itemHandler struct {
	service ItemService
	*search.SearchHandler
	*sv.Params
	UploadHandler storage.UploadHandler
}

func (h *itemHandler) Load(w http.ResponseWriter, r *http.Request) {
	id := sv.GetRequiredParam(w, r)
	if len(id) > 0 {
		result, err := h.service.Load(r.Context(), id)
		sv.RespondModel(w, r, result, err, h.Error, nil)
	}
}
func (h *itemHandler) Create(w http.ResponseWriter, r *http.Request) {
	var item Item
	er1 := sv.Decode(w, r, &item)
	if er1 == nil {
		errors, er2 := h.Validate(r.Context(), &item)
		if !sv.HasError(w, r, errors, er2, *h.Status.ValidationError, h.Error, h.Log, h.Resource, h.Action.Create) {
			result, er3 := h.service.Create(r.Context(), &item)
			sv.AfterCreated(w, r, &item, result, er3, h.Status, h.Error, h.Log, h.Resource, h.Action.Create)
		}
	}
}
func (h *itemHandler) Update(w http.ResponseWriter, r *http.Request) {
	var item Item
	er1 := sv.DecodeAndCheckId(w, r, &item, h.Keys, h.Indexes)
	if er1 == nil {
		errors, er2 := h.Validate(r.Context(), &item)
		if !sv.HasError(w, r, errors, er2, *h.Status.ValidationError, h.Error, h.Log, h.Resource, h.Action.Update) {
			result, er3 := h.service.Update(r.Context(), &item)
			sv.HandleResult(w, r, &item, result, er3, h.Status, h.Error, h.Log, h.Resource, h.Action.Update)
		}
	}
}
func (h *itemHandler) Patch(w http.ResponseWriter, r *http.Request) {
	var item Item
	r, json, er1 := sv.BuildMapAndCheckId(w, r, &item, h.Keys, h.Indexes)
	if er1 == nil {
		errors, er2 := h.Validate(r.Context(), &item)
		if !sv.HasError(w, r, errors, er2, *h.Status.ValidationError, h.Error, h.Log, h.Resource, h.Action.Patch) {
			result, er3 := h.service.Patch(r.Context(), json)
			sv.HandleResult(w, r, json, result, er3, h.Status, h.Error, h.Log, h.Resource, h.Action.Patch)
		}
	}
}
func (h *itemHandler) Delete(w http.ResponseWriter, r *http.Request) {
	id := sv.GetRequiredParam(w, r)
	if len(id) > 0 {
		result, err := h.service.Delete(r.Context(), id)
		sv.HandleDelete(w, r, result, err, h.Error, h.Log, h.Resource, h.Action.Delete)
	}
}

func (u *itemHandler) GetGallery(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.GetGallery(w, r)
}

func (u *itemHandler) UploadImage(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.UploadImage(w, r)
}

func (u *itemHandler) UploadGallery(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.UploadGallery(w, r)
}

func (u *itemHandler) DeleteGalleryFile(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.DeleteGalleryFile(w, r)
}
func (u *itemHandler) UpdateGallery(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.UpdateGallery(w, r)
}
