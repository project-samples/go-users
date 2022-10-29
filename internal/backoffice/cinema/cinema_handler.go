package cinema

import (
	"context"
	"go-service/internal/upload"
	"net/http"
	"reflect"

	"github.com/core-go/core"
	"github.com/core-go/search"
)

type CinemaHandler interface {
	core.Handler
	upload.UploadHander
}

func NewBackOfficeCinemaHandler(find func(context.Context, interface{}, interface{}, int64, ...int64) (int64, string, error),
	writeLog func(context.Context, string, string, bool, string) error,
	service CinemaService,
	logError func(context.Context, string, ...map[string]interface{}),
	validate func(context.Context, interface{}) ([]core.ErrorMessage, error),
	status core.StatusConfig, action core.ActionConfig,
	uploadService upload.UploadService,
	keyFile string,
	generate func(ctx context.Context) (string, error)) CinemaHandler {
	searchModelType := reflect.TypeOf(CinemaFilter{})
	modelType := reflect.TypeOf(Cinema{})
	searchHandler := search.NewSearchHandler(find, modelType, searchModelType, logError, writeLog)
	params := core.CreateParams(modelType, &status, logError, validate, &action)
	handler := core.NewHandler(service, modelType, nil, logError, validate)
	UploadHandler := upload.NewUploadHandler(uploadService, logError, &status, keyFile, generate)
	return &cinemaHandler{SearchHandler: searchHandler, GenericHandler: handler, cinemaService: service, Error: logError, Params: params, UploadHandler: UploadHandler}
}

type cinemaHandler struct {
	cinemaService CinemaService
	*core.GenericHandler
	*search.SearchHandler
	*core.Params
	Error         func(context.Context, string, ...map[string]interface{})
	UploadHandler upload.UploadHander
}

func (u *cinemaHandler) GetGallery(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.GetGallery(w, r)
}

func (u *cinemaHandler) UploadImage(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.UploadImage(w, r)
}

func (u *cinemaHandler) UploadGallery(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.UploadGallery(w, r)
}

func (u *cinemaHandler) UploadCover(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.UploadCover(w, r)
}

func (u *cinemaHandler) DeleteGalleryFile(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.DeleteGalleryFile(w, r)
}
func (u *cinemaHandler) UpdateGallery(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.UpdateGallery(w, r)
}
