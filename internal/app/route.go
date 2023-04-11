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
	r.Use(app.AuthTokenCheck.HandleAuthorization)

	r.HandleFunc("/authenticate", app.Authentication.Authenticate).Methods(POST)
	r.HandleFunc("/authentication/signout/{username}", app.SignOut.SignOut).Methods(GET)

	r.HandleFunc("/password/change", app.Password.ChangePassword).Methods(POST)
	r.HandleFunc("/password/forgot", app.Password.ForgotPassword).Methods(POST)
	r.HandleFunc("/password/reset", app.Password.ResetPassword).Methods(POST)

	r.HandleFunc("/signup/signup", app.SignUp.SignUp).Methods(POST)
	r.HandleFunc("/signup/verify/{userId}/{code}", app.SignUp.VerifyUser).Methods(GET)

	//r.HandleFunc("/oauth2/configurations/{type}", app.OAuth2.Configuration).Methods(GET)
	//r.HandleFunc("/oauth2/configurations", app.OAuth2.Configurations).Methods(GET)
	//r.HandleFunc("/oauth2/authenticate", app.OAuth2.Authenticate).Methods(POST)

	r.HandleFunc("/skills", app.Skill.Query).Methods(GET)
	r.HandleFunc("/interests", app.Interest.Query).Methods(GET)
	r.HandleFunc("/looking-for", app.LookingFor.Query).Methods(GET)
	r.HandleFunc("/educations", app.Education.Query).Methods(GET)
	r.HandleFunc("/companies", app.Companies.Query).Methods(GET)
	r.HandleFunc("/works", app.Work.Query).Methods(GET)

	user := "/users"
	r.HandleFunc(user+"/search", app.User.Search).Methods(GET, POST)
	r.HandleFunc(user+"/{id}", app.User.Load).Methods(GET)

	r.HandleFunc(user+"/rates/comments", app.SearchUserRateComment.Search).Methods(POST)
	r.HandleFunc(user+"/rates/search", app.SearchUserRate.Search).Methods(GET, POST)
	r.HandleFunc(user+"/rates/{id}/{author}", app.UserRate.Rate).Methods(POST)
	r.HandleFunc(user+"/rates/{id}/{author}/useful/{userId}", app.UserRateReaction.Create)
	r.HandleFunc(user+"/rates/{id}/{author}/useful/{userId}", app.UserRateReaction.Delete).Methods(DELETE)
	r.HandleFunc(user+"/rates/{id}/{author}/comments", app.UserRateComment.Load).Methods(GET)
	r.HandleFunc(user+"/rates/{id}/{author}/comments/{userId}", app.UserRateComment.Create).Methods(POST)
	r.HandleFunc(user+"/rates/{id}/{author}/comments/{userId}/{commentId}", app.UserRateComment.Update).Methods(PUT)
	r.HandleFunc(user+"/rates/{id}/{author}/comments/{commentId}", app.UserRateComment.Delete).Methods(DELETE)

	r.HandleFunc(user+"/appreciation/{id}/{author}", app.Appreciation.Check).Methods(GET)
	r.HandleFunc(user+"/appreciation/{id}/{author}/{appreciation}", app.Appreciation.Appreciate).Methods(POST)
	r.HandleFunc(user+"/appreciation/{id}/{author}/{appreciation}", app.Appreciation.Delete).Methods(DELETE)

	r.HandleFunc(user+"/reaction/{id}/{author}/{reaction}", app.UserReact.React).Methods(GET)
	r.HandleFunc(user+"/unreaction/{id}/{author}/{reaction}", app.UserReact.Unreact).Methods(DELETE)
	r.HandleFunc(user+"/checkreaction/{id}/{author}", app.UserReact.CheckReact).Methods(GET)

	r.HandleFunc("/my-profile/{id}", app.MyProfile.GetMyProfile).Methods(GET)
	r.HandleFunc("/my-profile/{id}", app.MyProfile.SaveMyProfile).Methods(PATCH)
	r.HandleFunc("/my-profile/{id}/settings", app.MyProfile.GetMySettings).Methods(GET)
	r.HandleFunc("/my-profile/{id}/settings", app.MyProfile.SaveMySettings).Methods(PATCH)

	location := "/locations"
	r.HandleFunc(location, app.Location.Search).Methods(GET)
	r.HandleFunc(location+"/search", app.Location.Search).Methods(GET, POST)
	r.HandleFunc(location+"/{id}", app.Location.Load).Methods(GET)

	r.HandleFunc(location+"/follow/{id}/{target}", app.Follow.Follow).Methods(GET)
	r.HandleFunc(location+"/unfollow/{id}/{target}", app.Follow.UnFollow).Methods(DELETE)
	r.HandleFunc(location+"/checkfollow/{id}/{target}", app.Follow.Check).Methods(GET)
	r.HandleFunc(location+"/loadfollow/{id}", app.UserInfomation.Load).Methods(GET)

	locationRate := "/locations/rates"
	r.HandleFunc(locationRate+"/comments", app.SearchLocationComment.Search)
	r.HandleFunc(locationRate+"/search", app.SearchLocationRate.Search).Methods(GET, POST)
	r.HandleFunc(locationRate+"/{id}/{author}", app.LocationRate.Rate).Methods(POST)
	r.HandleFunc(locationRate+"/{id}/{author}/useful/{userId}", app.LocationReaction.Create).Methods(POST)
	r.HandleFunc(locationRate+"/{id}/{author}/useful/{userId}", app.LocationReaction.Delete).Methods(DELETE)
	r.HandleFunc(locationRate+"/{id}/{author}/comments", app.LocationComment.Load).Methods(GET)
	r.HandleFunc(locationRate+"/{id}/{author}/comments/{userId}", app.LocationComment.Create).Methods(POST)
	r.HandleFunc(locationRate+"/{id}/{author}/comments/{userId}/{commentId}", app.LocationComment.Update).Methods(PUT)
	r.HandleFunc(locationRate+"/{id}/{author}/comments/{commentId}", app.LocationComment.Delete).Methods(DELETE)

	locationcommentthread := "/locations/commentthread"
	r.HandleFunc(locationcommentthread+"/search", app.SearchLocationCommentThread.Search).Methods(GET, POST)
	r.HandleFunc(locationcommentthread+"/{commentThreadId}/reply", app.LocationCommentReply.GetReplyComments).Methods(POST)
	r.HandleFunc(locationcommentthread+"/{id}/{author}/reply/{commentThreadId}", app.LocationCommentReply.Reply).Methods(POST)
	r.HandleFunc(locationcommentthread+"/reply/{commentId}", app.LocationCommentReply.UpdateReply).Methods(PUT)
	r.HandleFunc(locationcommentthread+"/{commentThreadId}/reply/{commentId}", app.LocationCommentReply.Delete).Methods(DELETE)
	r.HandleFunc(locationcommentthread+"/{id}/{author}", app.LocationCommentThread.Comment).Methods(POST)
	r.HandleFunc(locationcommentthread+"/{commentId}", app.LocationCommentThread.Update).Methods(PUT)
	r.HandleFunc(locationcommentthread+"/{commentId}", app.LocationCommentThread.Delete).Methods(DELETE)
	r.HandleFunc(locationcommentthread+"/{commentId}/{author}/useful/{userId}", app.LocationCommentThreadReaction.SetUsetful).Methods(POST)
	r.HandleFunc(locationcommentthread+"/{commentId}/{author}/useful/{userId}", app.LocationCommentThreadReaction.RemoveUseful).Methods(DELETE)
	r.HandleFunc(locationcommentthread+"/reply/{commentId}/{author}/useful/{userId}", app.LocationCommentThreadReplyReaction.SetUsetful).Methods(POST)
	r.HandleFunc(locationcommentthread+"/reply/{commentId}/{author}/useful/{userId}", app.LocationCommentThreadReplyReaction.RemoveUseful).Methods(DELETE)

	locationSave := "/locations/save"
	r.HandleFunc(locationSave+"/{id}/{itemId}", app.Savedlocation.Save).Methods(GET)
	r.HandleFunc(locationSave+"/{id}", app.Savedlocation.Load).Methods(GET)
	r.HandleFunc(locationSave+"/{id}/{itemId}", app.Savedlocation.Remove).Methods(DELETE)

	r.HandleFunc("/locations/follow/{id}/{target}", app.FollowLocation.Follow).Methods(GET)
	r.HandleFunc("/locations/follow/{id}/{target}", app.FollowLocation.UnFollow).Methods(DELETE)
	r.HandleFunc("/locations/checkfollow/{id}/{target}", app.FollowLocation.Check).Methods(GET)

	r.HandleFunc("/locations/loadfollow/{id}", app.LocationInfomation.Load).Methods(GET)

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

	articlerate := "/articles/rates"
	r.HandleFunc(articlerate+"/comments", app.SearchArticleComment.Search).Methods(POST)
	r.HandleFunc(articlerate+"/search", app.ArticleRateSearch.Search).Methods(GET, POST)
	r.HandleFunc(articlerate+"/{id}/{author}", app.ArticleRate.Rate).Methods(POST)
	r.HandleFunc(articlerate+"/{id}/{author}/useful/{userId}", app.ArticleRateReaction.Create).Methods(POST)
	r.HandleFunc(articlerate+"/{id}/{author}/useful/{userId}", app.ArticleRateReaction.Delete).Methods(DELETE)
	r.HandleFunc(articlerate+"/{id}/{author}/comments", app.ArticleComment.Load).Methods(GET)
	r.HandleFunc(articlerate+"/{id}/{author}/comments/{userId}", app.ArticleComment.Create).Methods(POST)
	r.HandleFunc(articlerate+"/{id}/{author}/comments/{userId}/{commentId}", app.ArticleComment.Update).Methods(PUT)
	r.HandleFunc(articlerate+"/{id}/{author}/comments/{commentId}", app.ArticleComment.Delete).Methods(DELETE)

	articlecommentthread := "/articles/commentthread"
	r.HandleFunc(articlecommentthread+"/search", app.SearchArticleCommentThread.Search).Methods(GET, POST)
	r.HandleFunc(articlecommentthread+"/{commentThreadId}/reply", app.ArticleCommentThreadReply.GetReplyComments).Methods(POST)
	r.HandleFunc(articlecommentthread+"/{id}/{author}/reply/{commentThreadId}", app.ArticleCommentThreadReply.Reply).Methods(POST)
	r.HandleFunc(articlecommentthread+"/reply/{commentId}", app.ArticleCommentThreadReply.UpdateReply).Methods(PUT)
	r.HandleFunc(articlecommentthread+"/{commentThreadId}/reply/{commentId}", app.ArticleCommentThreadReply.Delete).Methods(DELETE)
	r.HandleFunc(articlecommentthread+"/{id}/{author}", app.ArticleCommentThread.Comment).Methods(POST)
	r.HandleFunc(articlecommentthread+"/{commentId}", app.ArticleCommentThread.Update).Methods(PUT)
	r.HandleFunc(articlecommentthread+"/{commentId}", app.ArticleCommentThread.Delete).Methods(DELETE)
	r.HandleFunc(articlecommentthread+"/{commentId}/{author}/useful/{userId}", app.ArticleCommentThreadReaction.SetUsetful).Methods(POST)
	r.HandleFunc(articlecommentthread+"/{commentId}/{author}/useful/{userId}", app.ArticleCommentThreadReaction.RemoveUseful).Methods(DELETE)
	r.HandleFunc(articlecommentthread+"/reply/{commentId}/{author}/useful/{userId}", app.ArticleCommentThreadReplyReaction.SetUsetful).Methods(POST)
	r.HandleFunc(articlecommentthread+"/reply/{commentId}/{author}/useful/{userId}", app.ArticleCommentThreadReplyReaction.RemoveUseful).Methods(DELETE)

	item := "/items"
	r.HandleFunc(item+"/search", app.Item.Search).Methods(GET, POST)
	r.HandleFunc(item+"/{id}", app.Item.Load).Methods(GET)
	saveditem := "/saved-items"
	r.HandleFunc(saveditem+"/{id}", app.SavedItem.Load).Methods(GET)
	r.HandleFunc(saveditem+"/{id}/{itemId}", app.SavedItem.Save).Methods(GET)
	r.HandleFunc(saveditem+"/{id}/{itemId}", app.SavedItem.Remove).Methods(DELETE)

	r.HandleFunc(item+"/categories/search", app.ItemCategory.Search).Methods(GET, POST)

	itemResponse := "/items/responses"
	r.HandleFunc(itemResponse+"/search", app.SearchResponse.Search).Methods(GET, POST)
	r.HandleFunc(itemResponse+"/comments/search", app.SearchComment.Search).Methods(GET, POST)
	r.HandleFunc(itemResponse+"/{id}/{author}", app.Response.Response).Methods(POST)
	r.HandleFunc(itemResponse+"/{id}/{author}/useful/{userId}", app.Reaction.Create).Methods(POST)
	r.HandleFunc(itemResponse+"/{id}/{author}/useful/{userId}", app.Reaction.Delete).Methods(DELETE)
	r.HandleFunc(itemResponse+"/{id}/{author}/comments", app.Comment.Load).Methods(GET)
	r.HandleFunc(itemResponse+"/{id}/{author}/comments/{userId}", app.Comment.Create).Methods(POST)
	r.HandleFunc(itemResponse+"/{id}/{author}/comments/{userId}/{commentId}", app.Comment.Update).Methods(PUT)
	r.HandleFunc(itemResponse+"/{id}/{author}/comments/{commentId}", app.Comment.Delete).Methods(DELETE)

	myitem := "/my-items"
	r.HandleFunc(myitem+"/search", app.MyItem.Search).Methods(GET, POST)
	r.HandleFunc(myitem+"/{id}", app.MyItem.Load).Methods(GET)
	r.HandleFunc(myitem, app.MyItem.Create).Methods(POST)
	r.HandleFunc(myitem+"/{id}", app.MyItem.Update).Methods(PUT)
	r.HandleFunc(myitem+"/{id}", app.MyItem.Patch).Methods(PATCH)
	r.HandleFunc(myitem+"/{id}", app.MyItem.Delete).Methods(DELETE)

	filmRate := "/films/rates"
	r.HandleFunc(filmRate+"/search", app.FilmSearchRate.Search).Methods(GET, POST)
	r.HandleFunc(filmRate+"/comments/search", app.SearchComment.Search).Methods(GET, POST)
	r.HandleFunc(filmRate+"/{id}/{author}", app.FilmRate.Rate).Methods(POST)
	r.HandleFunc(filmRate+"/{id}/{author}/useful/{userId}", app.Reaction.Create).Methods(POST)
	r.HandleFunc(filmRate+"/{id}/{author}/useful/{userId}", app.Reaction.Delete).Methods(DELETE)
	r.HandleFunc(filmRate+"/{id}/{author}/comments", app.Comment.Load).Methods(GET)
	r.HandleFunc(filmRate+"/{id}/{author}/comments/{userId}", app.Comment.Create).Methods(POST)
	r.HandleFunc(filmRate+"/{id}/{author}/comments/{userId}/{commentId}", app.Comment.Update).Methods(PUT)
	r.HandleFunc(filmRate+"/{id}/{author}/comments/{commentId}", app.Comment.Delete).Methods(DELETE)

	filmcommentthread := "/films/commentthread"
	r.HandleFunc(filmcommentthread+"/search", app.SearchFilmCommentThread.Search).Methods(GET, POST)
	r.HandleFunc(filmcommentthread+"/{commentThreadId}/reply", app.FilmCommentThreadReply.GetReplyComments).Methods(POST)
	r.HandleFunc(filmcommentthread+"/{id}/{author}/reply/{commentThreadId}", app.FilmCommentThreadReply.Reply).Methods(POST)
	r.HandleFunc(filmcommentthread+"/reply/{commentId}", app.FilmCommentThreadReply.UpdateReply).Methods(PUT)
	r.HandleFunc(filmcommentthread+"/{commentThreadId}/reply/{commentId}", app.FilmCommentThreadReply.Delete).Methods(DELETE)
	r.HandleFunc(filmcommentthread+"/{id}/{author}", app.FilmCommentThread.Comment).Methods(POST)
	r.HandleFunc(filmcommentthread+"/{commentId}", app.FilmCommentThread.Update).Methods(PUT)
	r.HandleFunc(filmcommentthread+"/{commentId}", app.FilmCommentThread.Delete).Methods(DELETE)
	r.HandleFunc(filmcommentthread+"/{commentId}/{author}/useful/{userId}", app.FilmCommentThreadReaction.SetUsetful).Methods(POST)
	r.HandleFunc(filmcommentthread+"/{commentId}/{author}/useful/{userId}", app.FilmCommentThreadReaction.RemoveUseful).Methods(DELETE)
	r.HandleFunc(filmcommentthread+"/reply/{commentId}/{author}/useful/{userId}", app.FilmCommentThreadReplyReaction.SetUsetful).Methods(POST)
	r.HandleFunc(filmcommentthread+"/reply/{commentId}/{author}/useful/{userId}", app.FilmCommentThreadReplyReaction.RemoveUseful).Methods(DELETE)

	// films category
	filmCategory := "/films/categories"
	r.HandleFunc(filmCategory+"/search", app.FilmCategory.Search).Methods(GET, POST)
	r.HandleFunc(filmCategory, app.FilmCategory.Create).Methods(POST)
	r.HandleFunc(filmCategory+"/{id}", app.FilmCategory.Load).Methods(GET)
	r.HandleFunc(filmCategory+"/{id}", app.FilmCategory.Update).Methods(PUT)
	r.HandleFunc(filmCategory+"/{id}", app.FilmCategory.Patch).Methods(PATCH)
	r.HandleFunc(filmCategory+"/{id}", app.FilmCategory.Delete).Methods(DELETE)

	//film
	film := "/films"
	r.HandleFunc(film+"/search", app.Film.Search).Methods(GET, POST)
	r.HandleFunc(film+"/{id}", app.Film.Load).Methods(GET)

	r.HandleFunc("films/save/{id}/{itemId}", app.SavedFilm.Save).Methods(GET)
	r.HandleFunc("films/save/{id}/{itemId}", app.SavedFilm.Remove).Methods(DELETE)
	r.HandleFunc("films/save/{id}", app.SavedFilm.Load).Methods(GET)

	// company category
	companyCategory := "/companies/categories"
	r.HandleFunc(companyCategory+"/search", app.CompanyCategory.Search).Methods(GET, POST)
	r.HandleFunc(companyCategory, app.CompanyCategory.Create).Methods(POST)
	r.HandleFunc(companyCategory+"/{id}", app.CompanyCategory.Load).Methods(GET)
	r.HandleFunc(companyCategory+"/{id}", app.CompanyCategory.Update).Methods(PUT)
	r.HandleFunc(companyCategory+"/{id}", app.CompanyCategory.Patch).Methods(PATCH)
	r.HandleFunc(companyCategory+"/{id}", app.CompanyCategory.Delete).Methods(DELETE)

	//companies
	company := "/companies"
	r.HandleFunc(company+"/search", app.Company.Search).Methods(GET, POST)
	r.HandleFunc(company+"/{id}", app.Company.Load).Methods(GET)

	companyrate := "/companies/rates"
	r.HandleFunc(companyrate+"/search", app.SearchCompanyRate.Search).Methods(GET, POST)
	r.HandleFunc(companyrate+"/comments/search", app.SearchCompanyComment.Search).Methods(GET, POST)
	r.HandleFunc(companyrate+"/{id}/{author}", app.CompanyRate.Rate).Methods(POST)
	r.HandleFunc(companyrate+"/{id}/{author}/useful/{userId}", app.CompanyReaction.Create).Methods(POST)
	r.HandleFunc(companyrate+"/{id}/{author}/useful/{userId}", app.CompanyReaction.Delete).Methods(DELETE)
	r.HandleFunc(companyrate+"/{id}/{author}/comments", app.CompanyComment.Load).Methods(GET)
	r.HandleFunc(companyrate+"/{id}/{author}/comments/{userId}", app.CompanyComment.Create).Methods(POST)
	r.HandleFunc(companyrate+"/{id}/{author}/comments/{userId}/{commentId}", app.CompanyComment.Update).Methods(PUT)
	r.HandleFunc(companyrate+"/{id}/{author}/comments/{commentId}", app.CompanyComment.Delete).Methods(DELETE)

	// cinema
	cinema := "/cinemas"
	r.HandleFunc(cinema+"/search", app.Cinema.Search).Methods(GET, POST)
	r.HandleFunc(cinema+"/{id}", app.Cinema.Load).Methods(GET)
	// job
	job := "/jobs"
	r.HandleFunc(job+"/search", app.Job.Search).Methods(GET, POST)
	r.HandleFunc(job+"/{id}", app.Job.Load).Methods(GET)

	// room
	room := "/rooms"
	r.HandleFunc(room+"/search", app.Room.Search).Methods(GET, POST)
	r.HandleFunc(room+"/{id}", app.Room.Load).Methods(GET)

	// music
	music := "/musics"
	r.HandleFunc(music+"/search", app.Music.Search).Methods(GET, POST)
	r.HandleFunc(music+"/{id}", app.Music.Load).Methods(GET)

	// playlist
	playlist := "/musics/playlist"
	r.HandleFunc(playlist, app.Playlist.Insert).Methods(POST)
	r.HandleFunc(playlist+"/search", app.Playlist.Search).Methods(GET, POST)
	r.HandleFunc(playlist+"/{id}", app.Playlist.Load).Methods(GET)
	r.HandleFunc(playlist+"/{id}", app.Playlist.Update).Methods(PUT)
	r.HandleFunc(playlist+"/{id}", app.Playlist.Patch).Methods(PATCH)

	//backoffice cinema
	bocinema := "/backoffice/cinemas"
	r.HandleFunc(bocinema, app.BackofficeCinema.Create).Methods(POST)
	r.HandleFunc(bocinema+"/search", app.BackofficeCinema.Search).Methods(GET, POST)
	r.HandleFunc(bocinema+"/{id}", app.BackofficeCinema.Load).Methods(GET)
	r.HandleFunc(bocinema+"/{id}", app.BackofficeCinema.Update).Methods(PUT)
	r.HandleFunc(bocinema+"/{id}", app.BackofficeCinema.Patch).Methods(PATCH)

	cinemaRate := "/cinemas/rates"
	r.HandleFunc(cinemaRate+"/search", app.CinemaSearchRate.Search).Methods(GET, POST)
	r.HandleFunc(cinemaRate+"/comments/search", app.CinemaSearchComment.Search).Methods(GET, POST)
	r.HandleFunc(cinemaRate+"/{id}/{author}", app.CinemaRate.Rate).Methods(POST)
	r.HandleFunc(cinemaRate+"/{id}/{author}/useful/{userId}", app.CinemaReaction.Create).Methods(POST)
	r.HandleFunc(cinemaRate+"/{id}/{author}/useful/{userId}", app.CinemaReaction.Delete).Methods(DELETE)
	r.HandleFunc(cinemaRate+"/{id}/{author}/comments", app.CinemaComment.Load).Methods(GET)
	r.HandleFunc(cinemaRate+"/{id}/{author}/comments/{userId}", app.CinemaComment.Create).Methods(POST)
	r.HandleFunc(cinemaRate+"/{id}/{author}/comments/{userId}/{commentId}", app.CinemaComment.Update).Methods(PUT)
	r.HandleFunc(cinemaRate+"/{id}/{author}/comments/{commentId}", app.CinemaComment.Delete).Methods(DELETE)

	//backoffice film
	bofilm := "/backoffice/films"
	r.HandleFunc(bofilm+"/search", app.BackofficeFilm.Search).Methods(GET, POST)
	r.HandleFunc(bofilm+"/{id}", app.BackofficeFilm.Load).Methods(GET)
	r.HandleFunc(bofilm, app.BackofficeFilm.Insert).Methods(POST)
	r.HandleFunc(bofilm+"/{id}", app.BackofficeFilm.Update).Methods(PUT)
	r.HandleFunc(bofilm+"/{id}", app.BackofficeFilm.Patch).Methods(PATCH)
	r.HandleFunc(bofilm+"/{id}", app.BackofficeFilm.Delete).Methods(DELETE)
	// r.HandleFunc(bofilm+"/backoffice/films/{id}/upload",app.Back).Methods(POST)

	// backoffice company
	bocompany := "/backoffice/companies"
	r.HandleFunc(bocompany+"/search", app.BackofficeCompany.Search).Methods(GET, POST)
	r.HandleFunc(bocompany+"/{id}", app.BackofficeCompany.Load).Methods(GET)
	r.HandleFunc(bocompany, app.BackofficeCompany.Insert).Methods(POST)
	r.HandleFunc(bocompany+"/{id}", app.BackofficeCompany.Update).Methods(PUT)
	r.HandleFunc(bocompany+"/{id}", app.BackofficeCompany.Patch).Methods(PATCH)
	r.HandleFunc(bocompany+"/{id}", app.BackofficeCompany.Delete).Methods(DELETE)

	// backoffice location
	bolocation := "/backoffice/locations"
	r.HandleFunc(bolocation+"/search", app.BackofficeLocation.Search).Methods(GET, POST)
	r.HandleFunc(bolocation+"/{id}", app.BackofficeLocation.Load).Methods(GET)
	r.HandleFunc(bolocation, app.BackofficeLocation.Insert).Methods(POST)
	r.HandleFunc(bolocation+"/{id}", app.BackofficeLocation.Update).Methods(PUT)
	r.HandleFunc(bolocation+"/{id}", app.BackofficeLocation.Patch).Methods(PATCH)
	r.HandleFunc(bolocation+"/{id}", app.BackofficeLocation.Delete).Methods(DELETE)

	// backoffice
	// backoffice rooms
	borooms := "/backoffice/rooms"
	r.HandleFunc(borooms+"/search", app.BackofficeRoom.Search).Methods(GET, POST)
	r.HandleFunc(borooms+"/{id}", app.BackofficeRoom.Load).Methods(GET)
	r.HandleFunc(borooms, app.BackofficeRoom.Insert).Methods(POST)
	r.HandleFunc(borooms+"/{id}", app.BackofficeRoom.Update).Methods(PUT)
	r.HandleFunc(borooms+"/{id}", app.BackofficeRoom.Patch).Methods(PATCH)
	r.HandleFunc(borooms+"/{id}", app.BackofficeRoom.Delete).Methods(DELETE)

	// backoffice job
	bojob := "/backoffice/jobs"
	r.HandleFunc(bojob+"/search", app.BackofficeJob.Search).Methods(GET, POST)
	r.HandleFunc(bojob+"/{id}", app.BackofficeJob.Load).Methods(GET)
	r.HandleFunc(bojob, app.BackofficeJob.Insert).Methods(POST)
	r.HandleFunc(bojob+"/{id}", app.BackofficeJob.Update).Methods(PUT)
	r.HandleFunc(bojob+"/{id}", app.BackofficeJob.Patch).Methods(PATCH)
	r.HandleFunc(bojob+"/{id}", app.BackofficeJob.Delete).Methods(DELETE)

	// backoffice music
	bomusic := "/backoffice/musics"
	r.HandleFunc(bomusic+"/search", app.BackofficeMusic.Search).Methods(GET, POST)
	r.HandleFunc(bomusic+"/{id}", app.BackofficeMusic.Load).Methods(GET)
	r.HandleFunc(bomusic, app.BackofficeMusic.Insert).Methods(POST)
	r.HandleFunc(bomusic+"/{id}", app.BackofficeMusic.Update).Methods(PUT)
	r.HandleFunc(bomusic+"/{id}", app.BackofficeMusic.Patch).Methods(PATCH)
	r.HandleFunc(bomusic+"/{id}", app.BackofficeMusic.Delete).Methods(DELETE)

	return err
}
