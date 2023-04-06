package ratereactionsearch

import (
	"context"
	"encoding/json"
	"go-service/internal/commentthread"
	"net/http"
)

func NewSearchCommentThreadHandler(
	service CommentSearchService,
) *CommentThreadSearchHandler {
	return &CommentThreadSearchHandler{
		service: service,
	}
}

type SearchResult struct {
	List  []commentthread.CommentThread `json:"list"`
	Total int64                         `json:"total"`
}
type CommentThreadSearchHandler struct {
	service CommentSearchService
}

func (h *CommentThreadSearchHandler) Search(w http.ResponseWriter, r *http.Request) {
	var filter commentthread.CommentThreadFilter
	er1 := Decode(w, r, &filter)
	if er1 != nil {
		http.Error(w, er1.Error(), http.StatusInternalServerError)
		return
	}

	result1, total, er2 := h.service.Search(r.Context(), &filter)
	if er2 != nil {
		http.Error(w, er2.Error(), http.StatusInternalServerError)
		return
	}
	result := SearchResult{
		List:  result1,
		Total: total,
	}
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(200)
	json.NewEncoder(w).Encode(result)
}

func Decode(w http.ResponseWriter, r *http.Request, obj interface{}, options ...func(context.Context, interface{}) (interface{}, error)) error {
	er1 := json.NewDecoder(r.Body).Decode(obj)
	defer r.Body.Close()
	if er1 != nil {
		http.Error(w, er1.Error(), http.StatusBadRequest)
		return er1
	}
	if len(options) > 0 && options[0] != nil {
		_, er2 := options[0](r.Context(), obj)
		if er2 != nil {
			http.Error(w, er2.Error(), http.StatusInternalServerError)
		}
		return er2
	}
	return nil
}
