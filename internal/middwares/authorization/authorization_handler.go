package authorization

import (
	"context"
	"github.com/gorilla/mux"
	"net"
	"net/http"
	"time"
)

type AuthorizationChecker struct {
	GetAndVerifyToken func(authorization string, secret string) (bool, string, map[string]interface{}, int64, int64, error)
	Secret            string
	Ip                string
	Authorization     string
	Author            string
	UserId            string
	CheckBlacklist    func(id string, token string, createAt time.Time) string
	Key               string
	CheckWhitelist    func(id string, token string) bool
}

func NewDefaultAuthorizationChecker(verifyToken func(string, string) (bool, string, map[string]interface{}, int64, int64, error), secret string, key string, author string, userId string, options ...string) *AuthorizationChecker {
	var authorization string
	if len(options) >= 1 {
		authorization = options[0]
	}
	return &AuthorizationChecker{Authorization: authorization, GetAndVerifyToken: verifyToken, Secret: secret, Key: key, Author: author, UserId: userId}
}

func (h *AuthorizationChecker) Check(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		au := r.Header["Authorization"]
		if len(au) == 0 {
			http.Error(w, "'Authorization' is required in http request header.", http.StatusUnauthorized)
			return
		}
		authorization := au[0]
		isToken, token, data, issuedAt, exp, err := h.GetAndVerifyToken(authorization, h.Secret)
		if !isToken || err != nil {
			http.Error(w, "invalid Authorization token", http.StatusUnauthorized)
			return
		}
		if data == nil {
			data = make(map[string]interface{})
		}
		iat := time.Unix(issuedAt, 0)
		expiresAt := time.Unix(exp, 0)
		if isTokenExpired(expiresAt) {
			http.Error(w, "token is expired", http.StatusUnauthorized)
		}
		data["token"] = token
		data["issuedAt"] = iat
		var ctx context.Context
		ctx = r.Context()
		if len(h.Ip) > 0 {
			ip := getRemoteIp(r)
			ctx = context.WithValue(ctx, h.Ip, ip)
		}
		if h.CheckBlacklist != nil {
			user := ValueFromMap(h.Key, data)
			reason := h.CheckBlacklist(user, token, iat)
			if len(reason) > 0 {
				http.Error(w, "token is not valid anymore", http.StatusUnauthorized)
			} else {
				if h.CheckWhitelist != nil {
					valid := h.CheckWhitelist(user, token)
					if !valid {
						http.Error(w, "token is not valid anymore", http.StatusUnauthorized)
						return
					}
				}
				if len(h.Authorization) > 0 {
					ctx := context.WithValue(ctx, h.Authorization, data)
					next.ServeHTTP(w, r.WithContext(ctx))
				} else {
					for k, e := range data {
						if len(k) > 0 {
							ctx = context.WithValue(ctx, k, e)
						}
					}
					next.ServeHTTP(w, r.WithContext(ctx))
				}
			}
		} else {
			if h.CheckWhitelist != nil {
				user := ValueFromMap(h.Key, data)
				valid := h.CheckWhitelist(user, token)
				if !valid {
					http.Error(w, "token is not valid anymore", http.StatusUnauthorized)
					return
				}
			}
			if len(h.Authorization) > 0 {
				ctx := context.WithValue(ctx, h.Authorization, data)
				next.ServeHTTP(w, r.WithContext(ctx))
			} else {
				for k, e := range data {
					if len(k) > 0 {
						ctx = context.WithValue(ctx, k, e)
					}
				}
				next.ServeHTTP(w, r.WithContext(ctx))
			}
		}
	})
}

func (c *AuthorizationChecker) AuthorizationReactionChecker(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		var ctx = r.Context()
		var data map[string]interface{}
		dctx := ctx.Value(c.Authorization)
		if dctx == nil {
			http.Error(w, "no permission reaction", http.StatusForbidden)
			return
		}
		if d, ok := dctx.(map[string]interface{}); ok {
			data = d
		}
		pAuthor := mux.Vars(r)[c.Author]
		pUserId := mux.Vars(r)[c.UserId]
		if pAuthor == "" {
			http.Error(w, "missing authorId", http.StatusBadRequest)
			return
		}
		if pUserId == "" {
			pUserId = pAuthor
		}
		userID := ValueFromMap(c.Key, data)
		if len(userID) == 0 || pUserId != userID {
			http.Error(w, "no permission reaction", http.StatusForbidden)
			return
		}
		ctx = context.WithValue(ctx, "userid", userID)
		next.ServeHTTP(w, r.WithContext(ctx))
	})
}

func isTokenExpired(issuedAt time.Time) bool {
	expiryTime := issuedAt
	currentTime := time.Now()
	return expiryTime.Before(currentTime)
}

func getRemoteIp(r *http.Request) string {
	remoteIP, _, err := net.SplitHostPort(r.RemoteAddr)
	if err != nil {
		remoteIP = r.RemoteAddr
	}
	return remoteIP
}

func ValueFromMap(key string, data map[string]interface{}) string {
	u := data[key]
	if u != nil {
		v, ok := u.(string)
		if ok {
			return v
		}
	}
	return ""
}
