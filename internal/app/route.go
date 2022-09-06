package app

import (
	"context"
	. "github.com/core-go/security"
	"github.com/gorilla/mux"
)

func Route(r *mux.Router, context context.Context, root Config) error {
	app, err := NewApp(context, root)
	if err != nil {
		return err
	}
	r.HandleFunc("/health", app.Health.Check).Methods(GET)

	r.HandleFunc("/authentication", app.Authentication.Authenticate).Methods(POST)
	r.HandleFunc("/authentication/signout/{username}", app.SignOut.SignOut).Methods(GET)

	r.HandleFunc("/password/change", app.Password.ChangePassword).Methods(POST)
	r.HandleFunc("/password/forgot", app.Password.ForgotPassword).Methods(POST)
	r.HandleFunc("/password/reset", app.Password.ResetPassword).Methods(POST)

	r.HandleFunc("/signup/signup", app.SignUp.SignUp).Methods(POST)
	r.HandleFunc("/signup/verify/{userId}/{code}", app.SignUp.VerifyUser).Methods(GET)

	r.HandleFunc("/oauth2/configurations/{type}", app.OAuth2.Configuration).Methods(GET)
	r.HandleFunc("/oauth2/configurations", app.OAuth2.Configurations).Methods(GET)
	r.HandleFunc("/oauth2/authenticate", app.OAuth2.Authenticate).Methods(POST)

	r.HandleFunc("/skills", app.Skill.Query).Methods(GET)
	r.HandleFunc("/interests", app.Interest.Query).Methods(GET)
	r.HandleFunc("/looking-for", app.LookingFor.Query).Methods(GET)

	user := "/users"
	r.HandleFunc(user+"/search", app.User.Search).Methods(GET, POST)
	r.HandleFunc(user+"/{id}", app.User.Load).Methods(GET)
	r.HandleFunc(user+"/follow/{id}/{target}", app.Follow.Check).Methods(GET)
	r.HandleFunc(user+"/follow/{id}/{target}", app.Follow.Follow).Methods(POST)
	r.HandleFunc(user+"/follow/{id}/{target}", app.Follow.UnFollow).Methods(DELETE)
	r.HandleFunc(user+"/appreciation/{id}/{author}", app.Appreciation.Check).Methods(GET)
	r.HandleFunc(user+"/appreciation/{id}/{author}/{appreciation}", app.Appreciation.Appreciate).Methods(POST)
	r.HandleFunc(user+"/appreciation/{id}/{author}/{appreciation}", app.Appreciation.Delete).Methods(DELETE)

	r.HandleFunc("/my-profile/{id}", app.MyProfile.GetMyProfile).Methods(GET)
	r.HandleFunc("/my-profile/{id}", app.MyProfile.SaveMyProfile).Methods(PATCH)
	r.HandleFunc("/my-profile/{id}/settings", app.MyProfile.GetMySettings).Methods(GET)
	r.HandleFunc("/my-profile/{id}/settings", app.MyProfile.SaveMySettings).Methods(PATCH)

	location := "/locations"
	r.HandleFunc(location, app.Location.Search).Methods(GET)
	r.HandleFunc(location+"/search", app.Location.Search).Methods(GET, POST)
	r.HandleFunc(location+"/{id}", app.Location.Load).Methods(GET)

	locationRate := "/locationsrate"
	r.HandleFunc(locationRate+"/search", app.LocationRate.Search).Methods(GET, POST)
	r.HandleFunc(locationRate+"/{id}", app.LocationRate.Load).Methods(GET)

	myarticle := "/my-articles"
	r.HandleFunc(myarticle+"/search", app.MyArticles.Search).Methods(GET, POST)
	r.HandleFunc(myarticle+"/{id}", app.MyArticles.Load).Methods(GET)
	r.HandleFunc(myarticle, app.MyArticles.Create).Methods(POST)
	r.HandleFunc(myarticle+"/{id}", app.MyArticles.Update).Methods(PUT)
	r.HandleFunc(myarticle+"/{id}", app.MyArticles.Patch).Methods(PATCH)
	r.HandleFunc(myarticle+"/{id}", app.MyArticles.Delete).Methods(DELETE)

	article := "/articles"
	r.HandleFunc(article+"/search", app.Article.Search).Methods(GET, POST)
	r.HandleFunc(article+"/{id}", app.Article.Load).Methods(GET)
	
	filmRate := "/films/rates"
	r.HandleFunc(filmRate+"/search", app.Rate.Search).Methods(GET, POST)
	r.HandleFunc(filmRate+"/{id}/{author}", app.Rate.Rate).Methods(POST)
	r.HandleFunc(filmRate+"/{id}/{author}/useful/{userId}", app.Reaction.Create).Methods(POST)
	r.HandleFunc(filmRate+"/{id}/{author}/useful/{userId}", app.Reaction.Delete).Methods(DELETE)
	r.HandleFunc(filmRate+"/{id}/{author}/comments", app.Comment.Search).Methods(GET, POST)
	r.HandleFunc(filmRate+"/{id}/{author}/comments/{userId}", app.Comment.Create).Methods(POST)
	r.HandleFunc(filmRate+"/{id}/{author}/comments/{userId}/{commentId}", app.Comment.Update).Methods(PUT)
	r.HandleFunc(filmRate+"/{id}/{author}/comments/{userId}/{commentId}", app.Comment.Delete).Methods(DELETE)

	return err
}
