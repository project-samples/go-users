package comment

import (
	"context"
	"github.com/core-go/search"
	"github.com/gorilla/mux"
	sv "github.com/core-go/core"
	"net/http"
	"reflect"
	"math/rand"
	"time"
	"fmt"
)

type CommentHandler interface {
	Search(w http.ResponseWriter, r *http.Request)
	Load(w http.ResponseWriter, r *http.Request)
	Create(w http.ResponseWriter, r *http.Request)
	Update(w http.ResponseWriter, r *http.Request)
	Delete(w http.ResponseWriter, r *http.Request)
}

func NewCommentHandler(find func(context.Context, interface{}, interface{}, int64, ...int64) (int64, string, error), service CommentService, status sv.StatusConfig, logError func(context.Context, string, ...map[string]interface{}), validate func(ctx context.Context, model interface{}) ([]sv.ErrorMessage, error), action *sv.ActionConfig) CommentHandler {
	searchModelType := reflect.TypeOf(CommentFilter{})
	modelType := reflect.TypeOf(Comment{})
	params := sv.CreateParams(modelType, &status, logError, validate, action)
	searchHandler := search.NewSearchHandler(find, modelType, searchModelType, logError, params.Log)
	return &commentHandler{service: service, SearchHandler: searchHandler, Params: params}
}

type commentHandler struct {
	service CommentService
	*search.SearchHandler
	*sv.Params
}

func (h *commentHandler) Load(w http.ResponseWriter, r *http.Request) {
	id := sv.GetRequiredParam(w, r)
	if len(id) > 0 {
		result, err := h.service.Load(r.Context(), id)
		sv.RespondModel(w, r, result, err, h.Error, nil)
	}
}
func (h *commentHandler) Create(w http.ResponseWriter, r *http.Request) {
	var comment Comment
	var t = time.Now()
	er1 := sv.Decode(w, r, &comment)
	comment.CommentId = RandString(10)
	if (mux.Vars(r)["id"] != "") {
		comment.Id = mux.Vars(r)["id"]
	}
	if (mux.Vars(r)["author"] != "") {
		comment.Author = mux.Vars(r)["author"]
	}
	if (mux.Vars(r)["userId"] != "") {
		comment.UserId = mux.Vars(r)["userId"]
	}
	comment.Time = &t
	fmt.Println(comment)
	if er1 == nil {
		errors, er2 := h.Validate(r.Context(), &comment)
		if !sv.HasError(w, r, errors, er2, *h.Status.ValidationError, h.Error, h.Log, h.Resource, h.Action.Create) {
			result, er3 := h.service.Create(r.Context(), &comment)
			sv.AfterCreated(w, r, &comment, result, er3, h.Status, h.Error, h.Log, h.Resource, h.Action.Create)
		}
	}
}

func (h *commentHandler) Update(w http.ResponseWriter, r *http.Request) {
	var comment Comment
	if (mux.Vars(r)["commentId"] != "") {
		comment.CommentId = mux.Vars(r)["commentId"]
	}
	if (mux.Vars(r)["id"] != "") {
		comment.Id = mux.Vars(r)["id"]
	}
	if (mux.Vars(r)["author"] != "") {
		comment.Author = mux.Vars(r)["author"]
	}
	if (mux.Vars(r)["userId"] != "") {
		comment.UserId = mux.Vars(r)["userId"]
	}
	er1 := sv.DecodeAndCheckId(w, r, &comment, h.Keys, h.Indexes)
	if er1 == nil {
		errors, er2 := h.Validate(r.Context(), &comment)
		if !sv.HasError(w, r, errors, er2, *h.Status.ValidationError, h.Error, h.Log, h.Resource, h.Action.Update) {
			result, er3 := h.service.Update(r.Context(), &comment)
			sv.HandleResult(w, r, &comment, result, er3, h.Status, h.Error, h.Log, h.Resource, h.Action.Update)
		}
	}
}

func (h *commentHandler) Delete(w http.ResponseWriter, r *http.Request) {
	var commentId, id, author string
	if (mux.Vars(r)["commentId"] != "") {
		commentId = mux.Vars(r)["commentId"]
	}
	if (mux.Vars(r)["id"] != "") {
		id = mux.Vars(r)["id"]
	}
	if (mux.Vars(r)["author"] != "") {
		author = mux.Vars(r)["author"]
	}
	if len(commentId) > 0 {
		result, err := h.service.Delete(r.Context(), commentId, id, author)
		sv.HandleDelete(w, r, result, err, h.Error, h.Log, h.Resource, h.Action.Delete)
	}
}

const letter = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
func RandString(n int) string {
    b := make([]byte, n)
    for i := range b {
        b[i] = letter[rand.Intn(len(letter))]
    }
    return string(b)
}