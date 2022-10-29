package userinfomation

import (
	"context"
	"net/http"

	sv "github.com/core-go/core"
	"github.com/core-go/search"
)

type UserInfomationHandler interface {
	Search(w http.ResponseWriter, r *http.Request)
	Load(w http.ResponseWriter, r *http.Request)
}

func NewUserInfomationHandler(
	service UserInfomationService,
	// find func(context.Context, interface{}, interface{}, int64, ...int64) (int64, string, error),
	logError func(context.Context, string, ...map[string]interface{}),
	writeLog func(context.Context, string, string, bool, string) error) UserInfomationHandler {
	// searchHandler := search.NewSearchHandler(find, reflect.TypeOf(UserInfomation{}), reflect.TypeOf(UserInfomationFilter{}), logError, writeLog)
	return &userInfomationHandler{service: service, LogError: logError, WriteLog: writeLog}
}

type userInfomationHandler struct {
	*search.SearchHandler
	service  UserInfomationService
	LogError func(context.Context, string, ...map[string]interface{})
	WriteLog func(context.Context, string, string, bool, string) error
}

func (h *userInfomationHandler) Load(w http.ResponseWriter, r *http.Request) {
	id := sv.GetRequiredParam(w, r)
	if len(id) > 0 {
		result, err := h.service.Load(r.Context(), id)
		sv.RespondModel(w, r, result, err, h.LogError, h.WriteLog)
	}
}
