package commentthread

import (
	"context"
	"net/http"
	"reflect"
	"time"

	"github.com/core-go/core"
	"github.com/core-go/search"
)

type CommentThreadHandler interface {
	Search(w http.ResponseWriter, r *http.Request)
	Comment(w http.ResponseWriter, r *http.Request)
	Update(w http.ResponseWriter, r *http.Request)
}

func NewCommentThreadHandler(
	service CommentThreadService,
	find func(context.Context, interface{}, interface{}, int64, ...int64) (int64, string, error),
	logError func(context.Context, string, ...map[string]interface{}),
	writeLog func(context.Context, string, string, bool, string) error,
	generateId func(ctx context.Context) (string, error),
	validate func(ctx context.Context, model interface{}) ([]core.ErrorMessage, error),
	status core.StatusConfig,
	action core.ActionConfig,
) CommentThreadHandler {
	modelType := reflect.TypeOf(CommentThread{})
	filterType := reflect.TypeOf(CommentThreadFilter{})
	searchHandler := search.NewSearchHandler(find, modelType, filterType, logError, writeLog)
	params := core.CreateParams(modelType, &status, logError, validate, &action)
	return &commentThreadHandler{
		SearchHandler: *searchHandler,
		service:       service,

		generateId: generateId,
		Params:     params,
	}
}

type commentThreadHandler struct {
	search.SearchHandler
	service    CommentThreadService
	generateId func(ctx context.Context) (string, error)
	*core.Params
}

func (h *commentThreadHandler) Comment(w http.ResponseWriter, r *http.Request) {
	var comment CommentThread
	t := time.Now()
	er1 := core.Decode(w, r, &comment)
	comment.Id = core.GetRequiredParam(w, r, 3)
	comment.Author = core.GetRequiredParam(w, r, 2)
	comment.UserId = comment.Author
	comment.CommentId, _ = h.generateId(r.Context())
	comment.Time = t
	if er1 == nil {
		errors, er2 := h.Validate(r.Context(), comment)
		if core.HasError(w, r, errors, er2, *h.Status.ValidationError, h.LogError, h.WriteLog) {
			result, er3 := h.service.Comment(r.Context(), comment)
			core.AfterCreated(w, r, comment, result, er3, h.Status, h.LogError, h.WriteLog)
		}
	}
}

func (h *commentThreadHandler) Update(w http.ResponseWriter, r *http.Request) {
	// var comment CommentThread
	// t:= time.Now()
	// er1 := core.Decode(w, r, &comment)
}
