package room

import (
	"context"
	"fmt"
	"net/http"
	"reflect"

	"github.com/core-go/storage"
	"github.com/core-go/storage/upload"

	"github.com/core-go/core"
	"github.com/core-go/search"
)

type backofficeRoomHandler struct {
	service BackOfficeRoomService
	*search.SearchHandler
	*core.Params
	UploadHandler storage.UploadHandler
}

type BackofficeRoomHandler interface {
	Search(w http.ResponseWriter, r *http.Request)
	Load(w http.ResponseWriter, r *http.Request)
	Insert(w http.ResponseWriter, r *http.Request)
	Update(w http.ResponseWriter, r *http.Request)
	Patch(w http.ResponseWriter, r *http.Request)
	Delete(w http.ResponseWriter, r *http.Request)
	storage.UploadHandler
}

func NewBackofficeRoomHandler(
	Find func(context.Context, interface{}, interface{}, int64, ...int64) (int64, string, error),
	service BackOfficeRoomService,
	Error func(context.Context, string, ...map[string]interface{}),
	Log func(context.Context, string, string, bool, string) error,
	Validate func(context.Context, interface{}) ([]core.ErrorMessage, error),
	status core.StatusConfig,
	action core.ActionConfig,
	uploadService upload.UploadManager,
	keyFile string,
	generate func(ctx context.Context) (string, error),
) BackofficeRoomHandler {
	modelType := reflect.TypeOf(Room{})
	searchType := reflect.TypeOf(RoomFilter{})
	searchHandler := search.NewSearchHandler(Find, modelType, searchType, Error, Log)
	params := core.CreateParams(modelType, &status, Error, Validate, &action)
	UploadHandler := upload.NewHandler(uploadService, Error, keyFile, generate)

	return &backofficeRoomHandler{
		service:       service,
		SearchHandler: searchHandler,
		Params:        params,
		UploadHandler: UploadHandler,
	}
}

func (h *backofficeRoomHandler) Delete(w http.ResponseWriter, r *http.Request) {
	id := core.GetRequiredParam(w, r)
	if len(id) > 0 {
		result, err := h.service.Delete(r.Context(), id)
		core.HandleDelete(w, r, result, err, h.Error, h.Log, h.Resource, h.Action.Delete)
	}
}

func (h *backofficeRoomHandler) Insert(w http.ResponseWriter, r *http.Request) {
	var room Room
	er1 := core.Decode(w, r, &room)
	if er1 == nil {
		errors, er2 := h.Validate(r.Context(), &room)
		if !core.HasError(w, r, errors, er2, *h.Status.ValidationError, h.Error, h.Log, h.Action.Create) {

			result, er3 := h.service.Insert(r.Context(), &room)
			core.AfterCreated(w, r, &room, result, er3, h.Status, h.Error, h.Log)
		}
	}
}

func (h *backofficeRoomHandler) Load(w http.ResponseWriter, r *http.Request) {
	id := core.GetRequiredParam(w, r)
	if len(id) > 0 {
		result, err := h.service.Load(r.Context(), id)
		core.RespondModel(w, r, result, err, h.Error, nil)
	}
}

func (h *backofficeRoomHandler) Patch(w http.ResponseWriter, r *http.Request) {
	var room Room
	r, json, er1 := core.BuildMapAndCheckId(w, r, &room, h.Keys, h.Indexes)
	if er1 == nil {
		errors, er2 := h.Validate(r.Context(), &room)
		fmt.Println(errors, er2)

		if !core.HasError(w, r, errors, er2, *h.Status.ValidationError, h.Error, h.Log, h.Resource, h.Action.Patch) {
			result, er3 := h.service.Patch(r.Context(), json)
			core.HandleResult(w, r, json, result, er3, h.Status, h.Error, h.Log, h.Resource, h.Action.Patch)
		}
	}
}

func (h *backofficeRoomHandler) Update(w http.ResponseWriter, r *http.Request) {
	var room Room
	err1 := core.DecodeAndCheckId(w, r, &room, h.Keys, h.Indexes)
	if err1 == nil {
		errors, err2 := h.Validate(r.Context(), &room)
		if !core.HasError(w, r, errors, err2, *h.Status.ValidationError, h.Error, h.Log, h.Resource, h.Action.Update) {
			result, er3 := h.service.Update(r.Context(), &room)
			core.HandleResult(w, r, &room, result, er3, h.Status, h.Error, h.Log)
		}
	}
}
func (u *backofficeRoomHandler) GetGallery(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.GetGallery(w, r)
}

func (u *backofficeRoomHandler) UploadImage(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.UploadImage(w, r)
}

func (u *backofficeRoomHandler) UploadGallery(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.UploadGallery(w, r)
}

func (u *backofficeRoomHandler) UploadCover(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.UploadCover(w, r)
}

func (u *backofficeRoomHandler) DeleteGalleryFile(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.DeleteGalleryFile(w, r)
}
func (u *backofficeRoomHandler) UpdateGallery(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.UpdateGallery(w, r)
}
