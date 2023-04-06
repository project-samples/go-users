package app

import (
	"context"
	bofilm "go-service/internal/backoffice/film"
	"go-service/internal/commentthread"
	commentthreadreply "go-service/internal/commentthread/comment"
	muxcomment "go-service/internal/commentthread/comment/mux"
	muxcommentthread "go-service/internal/commentthread/mux"
	commentthreadreaction "go-service/internal/commentthread/reaction"
	"go-service/internal/userinfo"
	"reflect"

	. "github.com/core-go/auth"
	authhandler "github.com/core-go/auth/handler"
	sqlauth "github.com/core-go/auth/sql"
	sv "github.com/core-go/core"
	"github.com/core-go/core/shortid"
	v "github.com/core-go/core/v10"
	. "github.com/core-go/health"
	"github.com/core-go/log"
	. "github.com/core-go/mail"
	. "github.com/core-go/mail/sendgrid"
	. "github.com/core-go/mail/smtp"
	mgo "github.com/core-go/mongo"
	. "github.com/core-go/password"
	sqlpm "github.com/core-go/password/sql"
	// "github.com/core-go/rate"
	// "github.com/core-go/rate/rates"
	// searchrate "github.com/core-go/rate/search"
	// "github.com/core-go/reaction"
	// "github.com/core-go/reaction/comment"
	// commentmux "github.com/core-go/reaction/comment/mux"
	// searchcomment "github.com/core-go/reaction/comment/search"
	// "github.com/core-go/reaction/follow"
	// "github.com/core-go/reaction/response"
	// searchresponse "github.com/core-go/reaction/response/response"
	// "github.com/core-go/reaction/save"
	// userreaction "github.com/core-go/reaction/user-reaction"

	"go-service/internal/rate"
	"go-service/internal/rate/rates"
	searchrate "go-service/internal/rate/search"
	"go-service/internal/reaction"
	"go-service/internal/reaction/comment"
	commentmux "go-service/internal/reaction/comment/mux"
	searchcomment "go-service/internal/reaction/comment/search"
	"go-service/internal/reaction/follow"
	"go-service/internal/reaction/response"
	searchresponse "go-service/internal/reaction/response/response"
	"go-service/internal/reaction/save"
	userreaction "go-service/internal/reaction/user-reaction"

	"github.com/core-go/redis"
	"github.com/core-go/search"
	"github.com/core-go/search/convert"
	sq "github.com/core-go/search/query"
	. "github.com/core-go/security/crypto"
	. "github.com/core-go/security/jwt"
	. "github.com/core-go/signup"
	. "github.com/core-go/signup/mail"
	sqlsm "github.com/core-go/signup/sql"
	"github.com/core-go/sql"
	s "github.com/core-go/sql"
	sqlgo "github.com/core-go/sql"
	q "github.com/core-go/sql/query"
	"github.com/core-go/sql/template"
	"github.com/core-go/storage"
	"github.com/core-go/storage/google"
	"github.com/lib/pq"
	_ "github.com/lib/pq"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"

	"go-service/internal/app/cinema"
	"go-service/internal/appreciation"
	"go-service/internal/article"
	bocinema "go-service/internal/backoffice/cinema"
	bocompany "go-service/internal/backoffice/company"
	bojob "go-service/internal/backoffice/job"
	bolocation "go-service/internal/backoffice/location"
	bomusic "go-service/internal/backoffice/music"
	boroom "go-service/internal/backoffice/room"
	"go-service/internal/category"
	commentreactionsearch "go-service/internal/commentreactionsearch"
	"go-service/internal/company"
	"go-service/internal/film"
	"go-service/internal/item"
	"go-service/internal/job"
	"go-service/internal/location"
	"go-service/internal/locationinfomation"
	"go-service/internal/music"
	"go-service/internal/myarticles"
	"go-service/internal/myitem"
	"go-service/internal/myprofile"
	"go-service/internal/playlist"
	"go-service/internal/ratereactionsearch"
	ratereaction "go-service/internal/ratereactionsearch"
	"go-service/internal/room"
	saveditem "go-service/internal/save"
	"go-service/internal/user"
	"go-service/internal/userinfomation"

	"github.com/core-go/storage/upload"
)

type ApplicationContext struct {
	Health                *Handler
	Authentication        *authhandler.AuthenticationHandler
	SignOut               *authhandler.SignOutHandler
	Password              *PasswordHandler
	SignUp                *SignUpHandler
	User                  user.UserHandler
	MyProfile             myprofile.MyProfileHandler
	Skill                 *q.QueryHandler
	Interest              *q.QueryHandler
	LookingFor            *q.QueryHandler
	Director              *q.QueryHandler
	Education             *q.QueryHandler
	Companies             *q.QueryHandler
	Work                  *q.QueryHandler
	Cast                  *q.QueryHandler
	Country               *q.QueryHandler
	Production            *q.QueryHandler
	Location              location.LocationHandler
	LocationRate          rate.RateHandler
	SearchLocationRate    *search.SearchHandler
	MyArticles            myarticles.ArticleHandler
	Article               article.ArticleHandler
	ArticleRate           rate.RateHandler
	ArticleRateSearch     *search.SearchHandler
	ArticleRateReaction   reaction.ReactionHandler
	Appreciation          appreciation.AppreciationHandler
	Follow                follow.FollowHandler
	SavedItem             saveditem.SaveHandler
	Comment               commentmux.CommentHandler
	Reaction              reaction.ReactionHandler
	Rate                  rate.RateHandler
	Response              response.ResponseHandler
	SearchRate            *ratereactionsearch.RateSearchHandler
	SearchResponse        *search.SearchHandler
	SearchComment         *search.SearchHandler
	CinemaComment         commentmux.CommentHandler
	CinemaReaction        reaction.ReactionHandler
	CinemaRate            rate.RateHandler
	CinemaResponse        response.ResponseHandler
	CinemaSearchRate      *search.SearchHandler
	CinemaSearchResponse  *search.SearchHandler
	CinemaSearchComment   *search.SearchHandler
	Item                  item.ItemHandler
	MyItem                myitem.MyItemHandler
	Company               company.CompanyHandler
	Film                  film.FilmHandler
	BackofficeCinema      bocinema.CinemaHandler
	BackofficeFilm        bofilm.BackOfficeFilmHandler
	BackofficeCompany     bocompany.BackofficeCompanyHandler
	FilmCategory          category.CategoryHandler
	CompanyCategory       category.CategoryHandler
	ItemCategory          category.CategoryHandler
	SavedFilm             save.SaveHandler
	Savedlocation         saveditem.SaveHandler
	FollowLocation        follow.FollowHandler
	LocationInfomation    locationinfomation.LocationInfomationHandler
	LocationReaction      reaction.ReactionHandler
	LocationComment       commentmux.CommentHandler
	SearchLocationComment *search.SearchHandler
	BackofficeLocation    bolocation.BackOfficeLocationHandler

	ArticleComment                    commentmux.CommentHandler
	ArticleCommentThread              muxcommentthread.CommentThreadHandler
	FilmCommentThread                 muxcommentthread.CommentThreadHandler
	ArticleCommentThreadReply         muxcomment.CommentHandler
	FilmCommentThreadReply            muxcomment.CommentHandler
	SearchArticleComment              *search.SearchHandler
	SearchArticleCommentThread        *search.SearchHandler
	SearchFilmCommentThread           *commentreactionsearch.CommentThreadSearchHandler
	Cinema                            cinema.CinemaHandler
	SearchCompanyRate                 *search.SearchHandler
	SearchCompanyComment              *search.SearchHandler
	Job                               job.JobHandler
	Room                              room.RoomHandler
	Music                             music.MusicHandler
	Playlist                          playlist.PlaylistHandler
	BackofficeRoom                    boroom.BackofficeRoomHandler
	BackofficeMusic                   bomusic.BackofficeMusicHandler
	BackofficeJob                     bojob.BackofficeJobHandler
	CompanyRate                       rates.RatesHandler
	CompanyReaction                   reaction.ReactionHandler
	CompanyComment                    commentmux.CommentHandler
	UserReact                         userreaction.UserReactionHandler
	UserInfomation                    userinfomation.UserInfomationHandler
	SearchUserRate                    *search.SearchHandler
	SearchUserRateComment             *search.SearchHandler
	UserRate                          rate.RateHandler
	UserRateReaction                  reaction.ReactionHandler
	UserRateComment                   commentmux.CommentHandler
	ArticleCommentThreadReaction      commentthreadreaction.CommentReactionHandler
	FilmCommentThreadReaction         commentthreadreaction.CommentReactionHandler
	FilmCommentThreadReactionHandnler commentthreadreaction.CommentReactionHandler
	ArticleCommentThreadReplyReaction commentthreadreaction.CommentReactionHandler
	FilmCommentThreadReplyReaction    commentthreadreaction.CommentReactionHandler
}

func NewApp(ctx context.Context, conf Config) (*ApplicationContext, error) {
	client, err := mongo.Connect(ctx, options.Client().ApplyURI(conf.Mongo.Uri))
	if err != nil {
		return nil, err
	}
	mongoDb := client.Database(conf.Mongo.Database)
	db, err := s.OpenByConfig(conf.Sql)
	if err != nil {
		return nil, err
	}
	// locationDb, err1 := mgo.Setup(ctx, conf.Location)
	// if err1 != nil {
	// 	return nil, err1
	// }
	logError := log.LogError
	modelStatus := sv.InitializeStatus(conf.ModelStatus)
	action := sv.InitializeAction(conf.Action)
	validator := v.NewValidator()
	generateId := shortid.Generate
	cloudService, _ := CreateCloudService(ctx, conf)

	buildParam := q.GetBuild(db)
	templates, err := template.LoadTemplates(template.Trim, "configs/query.xml")
	if err != nil {
		return nil, err
	}

	//testQuery := "select username,email from users where username = $1 or email = $2"
	//rows, err := db.QueryContext(ctx, testQuery, "vinhtq2020", "vinhtq2020@gmail.com")
	//fmt.Println("rows, err", rows, err)
	//userCollection := "user"
	//authentication := "authentication"

	redisService, err := redis.NewRedisServiceByConfig(conf.Redis)
	if err != nil {
		return nil, err
	}
	tokenBlacklistChecker := NewTokenBlacklistChecker("blacklist:", conf.Token.Expires, redisService)

	mailService := NewMailService(conf.Mail)

	userInfoService, err := sqlauth.NewUserRepository(db, conf.Authorize.Query, conf.Authorize.DB, conf.Authorize.UserStatus)
	if err != nil {
		return nil, err
	}
	authStatus := InitStatus(conf.Authorize.Status)
	//authenticationRepositorySQL, err := sqlauth.NewSqlUserRepository(db, conf.AuthSqlConfig, conf.AuthQuery, conf.UserStatus)
	//if err != nil {
	//	return nil, err
	//}
	bcryptComparator := &BCryptStringComparator{}
	tokenService := NewTokenService()
	//verifiedCodeSender := NewPasscodeSender(mailService, conf.Mail.From, NewTemplateLoaderByConfig(conf.Auth.Template))
	//passCodeService := mgo.NewPasscodeRepository(mongoDb, "authenpasscode")
	//authenticator := NewAuthenticatorWithTwoFactors(status, userInfoService, bcryptComparator, tokenService.GenerateToken, conf.Token, conf.Payload, nil, verifiedCodeSender.Send, passCodeService, conf.Auth.Expires)
	//authenticationHandler := authhandler.NewAuthenticationHandler(authenticator.Authenticate, status.Error, status.Timeout, logError1)
	//signOutHandler := authhandler.NewSignOutHandler(tokenService.VerifyToken, conf.Token.Secret, tokenBlacklistChecker.Revoke, logError)
	authenticator := NewAuthenticator(authStatus, userInfoService, bcryptComparator, tokenService.GenerateToken, conf.Authorize.Token, conf.Authorize.Payload)
	authenticationHandler := authhandler.NewAuthenticationHandler(authenticator.Authenticate, authStatus.Error, authStatus.Timeout, logError)
	signOutHandler := authhandler.NewSignOutHandler(tokenService.VerifyToken, conf.Authorize.Token.Secret, tokenBlacklistChecker.Revoke, log.ErrorMsg)

	passwordResetCode := "passwordcodes"
	//passwordRepository := pm.NewPasswordRepositoryByConfig(mongoDb, userCollection, authentication, userCollection, "userId", conf.Password.Schema)
	//passResetCodeRepository := mgo.NewPasscodeRepository(mongoDb, passwordResetCode)
	passwordRepositorySQL := sqlpm.NewPasswordRepositoryByConfig(db, "users", "passwords", "history", "id", conf.Password.Schema, 5, pq.Array)
	passResetCodeRepositorySQL := sqlgo.NewPasscodeService(db, passwordResetCode, "expiredat", "id", "code")
	p := conf.Password
	exps := []string{p.Exp1, p.Exp2, p.Exp3, p.Exp4, p.Exp5, p.Exp6}
	signupSender := NewVerifiedEmailSender(mailService, *conf.SignUp.UserVerified, conf.Mail.From, NewTemplateLoaderByConfig(*conf.SignUp.Template))
	passwordResetSender := NewPasscodeSender(mailService, conf.Mail.From, NewTemplateLoaderByConfig(conf.Password.Template.ResetTemplate))
	passwordChangeSender := NewPasscodeSender(mailService, conf.Mail.From, NewTemplateLoaderByConfig(conf.Password.Template.ChangeTemplate))
	passwordService := NewPasswordService(bcryptComparator, passwordRepositorySQL, conf.Password.ResetExpires, passResetCodeRepositorySQL, passwordResetSender.Send, tokenBlacklistChecker.RevokeAllTokens, exps, 5, nil, conf.Password.ChangeExpires, passResetCodeRepositorySQL, passwordChangeSender.Send)
	passwordHandler := NewPasswordHandler(passwordService, log.LogError, nil)

	signUpCode := "signupCodes"
	signupStatus := InitSignUpStatus(conf.SignUp.Status)
	emailValidator := NewEmailValidator(true, "")
	//signUpRepository := sm.NewSignUpRepositoryByConfig(mongoDb, userCollection, authentication, conf.SignUp.UserStatus, conf.MaxPasswordAge, conf.SignUp.Schema, nil)
	//signUpCodeRepository := mgo.NewPasscodeRepository(mongoDb, signUpCode)
	//signUpService := NewSignUpService(signupStatus, true, signUpRepository, generateId, bcryptComparator.Hash, bcryptComparator, signUpCodeRepository, signupSender.Send, conf.SignUp.Expires, emailValidator.Validate, exps)
	//signupHandler := NewSignUpHandler(signUpService, signupStatus.Error, log.LogError, conf.SignUp.Action)
	signUpRepositorySQL := sqlsm.NewSignUpRepositoryByConfig(db, "users", "passwords", conf.SignUp.UserStatus, conf.MaxPasswordAge, conf.SignUp.Schema, nil)
	signUpCodeRepositorySQL := sqlgo.NewPasscodeService(db, signUpCode, "", "", "code")
	signUpService := NewSignUpService(signupStatus, true, signUpRepositorySQL, generateId, bcryptComparator.Hash, bcryptComparator, signUpCodeRepositorySQL, signupSender.Send, conf.SignUp.Expires, emailValidator.Validate, exps)
	signupHandler := NewSignUpHandler(signUpService, signupStatus.Error, log.LogError, conf.SignUp.Action)

	//integrationConfiguration := "integrationconfiguration"
	//sources := []string{SourceGoogle, SourceFacebook, SourceLinkedIn, SourceAmazon, SourceMicrosoft, SourceDropbox}
	//oauth2UserRepositories := make(map[string]OAuth2UserRepository)
	//oauth2UserRepositories[SourceGoogle] = NewGoogleUserRepository()
	//oauth2UserRepositories[SourceFacebook] = NewFacebookUserRepository()
	//oauth2UserRepositories[SourceLinkedIn] = NewLinkedInUserRepository()
	//oauth2UserRepositories[SourceAmazon] = NewAmazonUserRepository(conf.CallBackURL.Amazon)
	//oauth2UserRepositories[SourceMicrosoft] = NewMicrosoftUserRepository(conf.CallBackURL.Microsoft)
	//oauth2UserRepositories[SourceDropbox] = NewDropboxUserRepository()

	//activatedStatus := conf.SignUp.UserStatus.Activated
	//schema := conf.OAuth2.Schema
	//services := strings.Split(conf.OAuth2.Services, ",")
	//userRepositories := make(map[string]UserRepository)
	//for _, source := range sources {
	//	userRepository := om.NewUserRepositoryByConfig(mongoDb, userCollection, source, activatedStatus, services, schema, &conf.UserStatus)
	//	userRepositories[source] = userRepository
	//}
	//configurationRepository := om.NewConfigurationRepository(mongoDb, integrationConfiguration, oauth2UserRepositories, "status", "A")
	//
	//oauth2Service := NewOAuth2Service(status, oauth2UserRepositories, userRepositories, configurationRepository, generateId, tokenService, conf.Token, nil)
	//oauth2Handler := NewDefaultOAuth2Handler(oauth2Service, status.Error, log.LogError)

	mongoHealthChecker := mgo.NewHealthChecker(mongoDb)
	redisHealthChecker := redis.NewHealthChecker(redisService.Pool)

	// user
	userType := reflect.TypeOf(user.User{})
	userQuery, err := template.UseQueryWithArray(conf.Template, nil, "users", templates, &userType, convert.ToMap, buildParam, pq.Array)
	if err != nil {
		return nil, err
	}
	userSearchBuilder, err := s.NewSearchBuilderWithArray(db, userType, userQuery, pq.Array)
	if err != nil {
		return nil, err
	}
	getUser, err := s.UseGetWithArray(db, "users", userType, pq.Array)
	if err != nil {
		return nil, err
	}
	userHandler := user.NewUserHandler(userSearchBuilder.Search, getUser, log.LogError, nil)

	userReactService := userreaction.NewUserReactionService(db, "userreaction", "id", "author", "reaction",
		"userinfo", "id", "reactioncount", "level", "count")
	userReactHandler := userreaction.NewUserReactionHandler(userReactService, "id", "author", "reaction")

	userRateReactionService := reaction.NewReactionService(db, "userratereaction", "id", "author", "userid", "time", "reaction",
		"userrate", "id", "author", "usefulcount")
	userRateReactionHandler := reaction.NewReactionHandler(userRateReactionService, 0, 2, 3)
	// user rate
	userRateService := rate.NewRateService(db, "userrate", "id", "author", "rate", "review", "time", "usefulcount", "replycount",
		"userrateinfo", "id", "rate", "count", "score", pq.Array)

	userRateHandler := rate.NewRateHandler(userRateService, 0, 1, 5)

	// search user rate
	userRateType := reflect.TypeOf(rate.Rate{})
	userRateFilterType := reflect.TypeOf(searchrate.RateFilter{})
	searchUserRateQuery, err := template.UseQueryWithArray(conf.Template, nil, "userrate", templates, &userRateType, convert.ToMap, buildParam)
	if err != nil {
		return nil, err
	}
	userRateSearchBuilder, err := s.NewSearchBuilderWithArray(db, userRateType, searchUserRateQuery, pq.Array)
	if err != nil {
		return nil, err
	}
	searchUserRateHandler := search.NewSearchHandler(userRateSearchBuilder.Search, userRateType, userRateFilterType, log.LogError, nil)

	// user rate comment
	userRateCommentService := comment.NewCommentService(db, "userratecomment", "commentid", "id", "author", "userid", "comment", "anonymous", "time", "updatedat", "userrate", "id", "author", "replycount", "users", "id", "imageurl", "username", nil, pq.Array)
	userRateCommentHandler := commentmux.NewCommentHandler(userRateCommentService, "commentId", "id", "author", "userId")
	// search user rate comment
	searchUserRateCommentType := reflect.TypeOf(searchcomment.Comment{})
	searchUserRateCommentFilterType := reflect.TypeOf(searchcomment.CommentFilter{})
	searchUserRateCommentQuery, err := template.UseQueryWithArray(conf.Template, nil, "userratecomment", templates, &searchUserRateCommentType, convert.ToMap, buildParam)
	if err != nil {
		return nil, err
	}
	searchUserRateCommentBuilder, err := s.NewSearchBuilderWithArray(db, searchUserRateCommentType, searchUserRateCommentQuery, pq.Array)
	if err != nil {
		return nil, err
	}
	searchUserRateCommentHandler := search.NewSearchHandler(searchUserRateCommentBuilder.Search, searchUserRateCommentType, searchUserRateCommentFilterType, logError, nil)
	skillService := q.NewStringService(db, "skills", "skill")
	skillHandler := q.NewQueryHandler(skillService.Load, log.LogError)
	interestService := q.NewStringService(db, "interests", "interest")
	interestHandler := q.NewQueryHandler(interestService.Load, log.LogError)
	lookingForService := q.NewStringService(db, "searchs", "item")
	lookingForHandler := q.NewQueryHandler(lookingForService.Load, log.LogError)
	directorService := q.NewStringService(db, "filmdirectors", "director")
	directorHandler := q.NewQueryHandler(directorService.Load, log.LogError)
	educationService := q.NewStringService(db, "usereducation", "education")
	educationHandler := q.NewQueryHandler(educationService.Load, log.LogError)
	companiesService := q.NewStringService(db, "usercompany", "company")
	companiesHandler := q.NewQueryHandler(companiesService.Load, log.LogError)
	workService := q.NewStringService(db, "userwork", "work")
	workHandler := q.NewQueryHandler(workService.Load, log.LogError)
	// castService := q.NewStringService(db, "casts", "cast")
	// castHandler := q.NewQueryHandler(castService.Load, log.LogError)
	castService := q.NewStringService(db, "filmcasts", "actor")
	castHandler := q.NewQueryHandler(castService.Load, log.LogError)
	productionService := q.NewStringService(db, "filmproductions", "production")
	productionHandler := q.NewQueryHandler(productionService.Load, log.LogError)
	countryService := q.NewStringService(db, "filmcasts", "actor")
	countryHander := q.NewQueryHandler(countryService.Load, log.LogError)
	Cover := "coverurl"
	Image := "imageurl"
	Gallery := "gallery"
	myprofileType := reflect.TypeOf(myprofile.User{})
	myProfileRepository, _ := s.NewRepositoryWithArray(db, "users", myprofileType, pq.Array)
	uploadProfileRepository := upload.NewRepository(db, "users", "", upload.UploadFieldColumn{Image: &Image, Cover: &Cover, Gallery: &Gallery, Id: "id"}, pq.Array)
	uploadService := upload.NewUploadService(uploadProfileRepository, cloudService, conf.Provider, conf.GeneralDirectory,
		conf.KeyFile, conf.Storage.Directory, []int{}, []int{})
	myProfileService := myprofile.NewUserService(myProfileRepository)
	myProfileHandler := myprofile.NewMyProfileHandler(myProfileService, log.LogError, nil, skillService.Save, interestService.Save, lookingForService.Save,
		educationService.Save, companiesService.Save, workService.Save, uploadService, conf.KeyFile, generateId)
	// user info
	loadUserInfo := userinfo.NewInfoQuery(db, "users", "imageURL", "id", "username", "displayname")

	// LOCATION

	locationType := reflect.TypeOf(location.Location{})
	locationInfoType := reflect.TypeOf(location.LocationInfo{})

	// using mongo
	// locationMapper := geo.NewMapper(locationType)
	// locationQuery := query.UseQuery(locationType)
	// locationSearchBuilder := mgo.NewSearchBuilder(locationDb, "location", locationQuery, search.GetSort, locationMapper.DbToModel)
	// locationRepository := mgo.NewViewRepository(locationDb, "location", locationType, locationMapper.DbToModel)
	// locationInfoRepository := mgo.NewViewRepository(locationDb, "locationInfo", locationInfoType)
	// locationService := location.NewLocationService(locationRepository, locationInfoRepository)
	// locationHandler := location.NewLocationHandler(locationSearchBuilder.Search, locationService, log.LogError, nil)

	locationQuery, err := template.UseQueryWithArray(conf.Template, nil, "location", templates, &locationType, convert.ToMap, buildParam, pq.Array)
	if err != nil {
		return nil, err
	}
	locationSearchBuilder, err := s.NewSearchBuilderWithArray(db, locationType, locationQuery, pq.Array)
	if err != nil {
		return nil, err
	}
	locationRepository, err := s.NewViewRepositoryWithArray(db, "location", locationType, pq.Array)
	if err != nil {
		return nil, err
	}
	locationInfoRepository, err := sql.NewViewRepositoryWithArray(db, "locationinfo", locationInfoType, pq.Array)
	if err != nil {
		return nil, err
	}
	locationService := location.NewLocationService(locationRepository, locationInfoRepository)
	locationHandler := location.NewLocationHandler(locationSearchBuilder.Search, locationService, log.LogError, nil)

	// search location rate
	locationRateType := reflect.TypeOf(rate.Rate{})
	locationRateFilterType := reflect.TypeOf(searchrate.RateFilter{})
	locationRateQuery, err := template.UseQueryWithArray(conf.Template, nil, "locationrate", templates, &locationRateType, convert.ToMap, buildParam, pq.Array)
	if err != nil {
		return nil, err
	}
	locationRateSearchBuilder, err := s.NewSearchBuilder(db, locationRateType, locationRateQuery)
	if err != nil {
		return nil, err
	}
	searchLocationRateHandler := search.NewSearchHandler(locationRateSearchBuilder.Search, locationRateType, locationRateFilterType, logError, nil)

	// locationRateService := locationrate.NewLocationRateService(db)
	locationRateService := rate.NewRateService(db, "locationrate", "id", "author", "rate", "review", "ratetime", "usefulcount", "replycount", "locationinfo", "id", "rate", "count", "score", pq.Array)
	locationRateHandler := rate.NewRateHandler(locationRateService, 0, 1, 5)

	// saved location

	// locationSaveService := savedlocation.NewSavedLocationService(db, "savedlocation", "id", "items", 50)
	// locationSaveHandler := savedlocation.NewSavedLocationHandler(locationSaveService, modelStatus, log.LogError, validator.Validate, &action)
	locationSaveService := saveditem.NewSaveService(db, reflect.TypeOf(location.Location{}), "savedlocation", "id", "items", 50, "location", "id", pq.Array)
	locationSaveHandler := saveditem.NewSaveHandler(locationSaveService, 0, 1)
	// follow location
	locationFollowService := follow.NewFollowService(db, "locationfollower", "id", "follower", "locationfollowing", "id", "following", "userinfo", "id", "followercount", "followingcount")
	locationFollowHandler := follow.NewFollowHandler(locationFollowService, 0, 1)
	// information location
	locationInfomationType := reflect.TypeOf(locationinfomation.LocationInfomation{})
	locationInfomationRepository, err := s.NewViewRepositoryWithArray(db, "locationinfomation", locationInfomationType, pq.Array)
	if err != nil {
		return nil, err
	}
	locationInfomationService := locationinfomation.NewLocationInfomationService(locationInfomationRepository)
	locationInfomationQuery, err := template.UseQueryWithArray(conf.Template, nil, "locationinfomation", templates, &locationInfomationType, convert.ToMap, buildParam, pq.Array)
	if err != nil {
		return nil, err
	}
	locationInfomationSearchBuilder, err := s.NewSearchBuilderWithArray(db, locationInfomationType, locationInfomationQuery, pq.Array)
	if err != nil {
		return nil, err
	}
	locationInfomationHandler := locationinfomation.NewLocationInfomationHandler(locationInfomationService, locationInfomationSearchBuilder.Search, log.LogError, nil)

	// reaction location
	locationReactionService := reaction.NewReactionService(db, "locationratereaction", "id", "author", "userid", "time", "reaction", "locationrate", "id", "author", "usefulcount")
	locationReactionHandler := reaction.NewReactionHandler(locationReactionService, 0, 2, 3)

	// comment location
	locationCommentService := comment.NewCommentService(db, "locationcomment", "commentid", "id", "author", "userid", "comment", "anonymous", "time", "updatedat", "locationrate", "id", "author", "replycount", "users", "id", "imageurl", "username", nil, pq.Array)
	locationCommentHandler := commentmux.NewCommentHandler(locationCommentService, "commentId", "id", "author", "userId")

	// search location
	locationCommentType := reflect.TypeOf(searchcomment.Comment{})
	locationCommentFilterType := reflect.TypeOf(searchcomment.CommentFilter{})
	queryLocationComment, _ := template.UseQueryWithArray(conf.Template, nil, "locationcomment", templates, &locationCommentType, convert.ToMap, buildParam, pq.Array)
	locationCommentSearchBuilder, err := s.NewSearchBuilderWithArray(db, locationCommentType, queryLocationComment, pq.Array)
	if err != nil {
		return nil, err
	}
	searchLocationCommentHandler := search.NewSearchHandler(locationCommentSearchBuilder.Search, locationCommentType, locationCommentFilterType, logError, nil)

	// myarticlesType := reflect.TypeOf(myarticles.Article{})
	// myarticlesQuery := query.UseQuery(myarticlesType)
	// myarticlesSearchBuilder := mgo.NewSearchBuilder(locationDb, "article", myarticlesQuery, search.GetSort)
	// myarticlesRepository := mgo.NewRepository(locationDb, "article", myarticlesType)
	// myarticlesService := myarticles.NewArticleService(myarticlesRepository)
	// myarticlesHandler := myarticles.NewArticleHandler(myarticlesSearchBuilder.Search, myarticlesService, generateId, modelStatus, log.LogError, validator.Validate, conf.Tracking, &action, nil)

	myarticlesType := reflect.TypeOf(myarticles.Article{})
	myarticlesQuery, err := template.UseQueryWithArray(conf.Template, nil, "article", templates, &myarticlesType, convert.ToMap, buildParam, pq.Array)

	if err != nil {
		return nil, err
	}
	myarticleSearchBuilder, err := s.NewSearchBuilderWithArray(db, myarticlesType, myarticlesQuery, pq.Array)
	if err != nil {
		return nil, err
	}
	myarticlesRepository, err := s.NewRepositoryWithArray(db, "article", myarticlesType, pq.Array)
	if err != nil {
		return nil, err
	}
	myarticlesService := myarticles.NewArticleService(myarticlesRepository)
	myarticlesHandler := myarticles.NewArticleHandler(myarticleSearchBuilder.Search, myarticlesService, generateId, modelStatus, log.LogError, validator.Validate, conf.Tracking, &action, nil)

	articleType := reflect.TypeOf(article.Article{})
	articleSearchQuery, err := template.UseQueryWithArray(conf.Template, nil, "article", templates, &articleType, convert.ToMap, buildParam, pq.Array)
	if err != nil {
		return nil, err
	}
	articleSearchBuilder, err := s.NewSearchBuilderWithArray(db, articleType, articleSearchQuery, pq.Array)
	if err != nil {
		return nil, err
	}
	articleRepository, err := s.NewRepositoryWithArray(db, "article", articleType, pq.Array)
	if err != nil {
		return nil, err
	}
	articleService := article.NewArticleService(articleRepository)
	articleHandler := article.NewArticleHandler(articleSearchBuilder.Search, articleService, log.LogError, nil)

	searchArticleCommentType := reflect.TypeOf(searchcomment.Comment{})
	searchArticleCommentQuery, err := template.UseQueryWithArray(conf.Template, nil, "articleratecomment", templates, &searchArticleCommentType, convert.ToMap, buildParam)
	if err != nil {
		return nil, err
	}
	searchArticleCommentBuilder, err := s.NewSearchBuilderWithArray(db, searchArticleCommentType, searchArticleCommentQuery, pq.Array)
	if err != nil {
		return nil, err
	}
	searchArticleRateCommentHandler := search.NewSearchHandler(searchArticleCommentBuilder.Search, reflect.TypeOf(searchcomment.Comment{}), reflect.TypeOf(searchcomment.CommentFilter{}), logError, nil)

	articleCommentService := comment.NewCommentService(db, "articleratecomment", "commentid", "id", "author", "userid", "comment", "anonymous", "time", "updatedat", "articlerate", "id", "author", "replycount", "users", "id", "imageurl", "username", nil, pq.Array)
	articleCommentHandler := commentmux.NewCommentHandler(articleCommentService, "commentId", "id", "author", "userId")

	articleRateService := rate.NewRateService(db, "articlerate", "id", "author", "rate", "review", "time", "usefulcount",
		"replycount", "articleinfo", "id", "rate", "count", "score", pq.Array)
	articleRateHandler := rate.NewRateHandler(articleRateService, 0, 1, 5)

	articleRateType := reflect.TypeOf(searchrate.Rate{})
	articleRateFilterType := reflect.TypeOf(searchrate.RateFilter{})
	articleRateQuery, err := template.UseQueryWithArray(conf.Template, nil, "articlerate", templates, &articleRateType, convert.ToMap, buildParam, pq.Array)
	if err != nil {
		return nil, err
	}
	articleRateSearchBuilder, err := s.NewSearchBuilderWithArray(db, articleRateType, articleRateQuery, pq.Array)
	if err != nil {
		return nil, err
	}
	articleRateSearchHandler := search.NewSearchHandler(articleRateSearchBuilder.Search, articleRateType, articleRateFilterType, logError, nil)

	articleRateReactionService := reaction.NewReactionService(db, "articleratereaction", "id", "author", "userid", "time", "reaction", "articlerate", "id", "author", "usefulcount")
	articleRateReactionHandler := reaction.NewReactionHandler(articleRateReactionService, 0, 2, 3)
	articleCommentThreadType := reflect.TypeOf(commentthread.CommentThread{})
	articleCommentThreadQuery, err := template.UseQueryWithArray(conf.Template, nil, "articlecommentthread", templates, &articleCommentThreadType, convert.ToMap, buildParam)
	if err != nil {
		return nil, err
	}
	articleCommentthreadBuilder, err := s.NewSearchBuilderWithArray(db, articleCommentThreadType, articleCommentThreadQuery, pq.Array)
	if err != nil {
		return nil, err
	}
	articleCommentThreadSearchHandler := search.NewSearchHandler(articleCommentthreadBuilder.Search, articleCommentThreadType, reflect.TypeOf(commentthread.CommentThreadFilter{}), logError, nil)

	// ------------- FILM-------------
	commentThreadType := reflect.TypeOf(commentthread.CommentThread{})
	filmCommentThreadQuery, err := template.UseQueryWithArray(conf.Template, nil, "filmcommentthread", templates, &commentThreadType, convert.ToMap, buildParam)
	if err != nil {
		return nil, err
	}

	filmCommentSearchBuilder, err := commentreactionsearch.NewCommentSearchService(db, filmCommentThreadQuery, pq.Array, loadUserInfo.Load)
	if err != nil {
		return nil, err
	}
	filmCommentThreadSearchHandler := commentreactionsearch.NewSearchCommentThreadHandler(filmCommentSearchBuilder)

	filmCommentThreadReplyService := commentthreadreply.NewCommentService(db, "filmcomment", "commentId", "author", "id", "updated", "comment", "userId", "time", "parent", "histories", "commentthreadId", "reaction", "filmcommentreaction", "commentId", "users", "id", "username", "imageurl", "filmcommentinfo", "usefulcount", "commentId", "filmcommentthreadinfo", "commentId", "replycount", "usefulcount", loadUserInfo.Load, pq.Array)
	filmCommentThreadReplyHandler := muxcomment.NewCommentHandler(filmCommentThreadReplyService, "commentThreadId", "userId", "author", "id", "commentId", generateId)
	filmCommentThreadService := commentthread.NewCommentThreadService(db, pq.Array, "filmcommentthread", "commentId", "id", "author", "histories", "comment", "time", "userid", "updatedat",
		"filmcomment", "commentid", "commentthreadid", "filmcommentthreadinfo", "commentid",
		"filmcommentinfo", "commentid", "filmcommentthreadreaction", "commentid", "filmcommentreaction", "commentId")
	filmCommentThreadHandler := muxcommentthread.NewCommentThreadHandler(filmCommentThreadService, shortid.Generate, "commentId", "author", "id")

	filmCommentThreadReactionService := commentthreadreaction.NewCommentReactionService(db, "filmcommentthreadreaction", "commentid", "author", "userId", "time", "reaction", "filmcommentthreadinfo", "commentId", "usefulcount")
	filmCommentThreadReactionHandnler := commentthreadreaction.NewCommentReactionHandler(filmCommentThreadReactionService, 3, 2, 0)
	filmCommentThreadReplyReactionService := commentthreadreaction.NewCommentReactionService(db, "filmcommentreaction", "commentId", "author", "userId", "time", "reaction", "filmcommentinfo", "commentId", "usefulcount")
	filmCommentThreadReplyReactionHandler := commentthreadreaction.NewCommentReactionHandler(filmCommentThreadReplyReactionService, 3, 2, 0)

	// ------------- FILM-------------

	articleCommentThreadReplyService := commentthreadreply.NewCommentService(db, "articlecomment", "commentId", "author", "id", "updated", "comment", "userId", "time", "parent", "histories", "commentthreadId", "reaction", "articlecommentreaction", "commentId", "users", "id", "username", "imageurl", "articlecommentinfo", "usefulcount", "commentId", "articlecommentthreadinfo", "commentId", "replycount", "usefulcount", loadUserInfo.Load, pq.Array)
	articleCommentThreadReplyHandler := muxcomment.NewCommentHandler(articleCommentThreadReplyService, "commentThreadId", "userId", "author", "id", "commentId", generateId)
	articleCommentThreadService := commentthread.NewCommentThreadService(db, pq.Array, "articlecommentthread", "commentId", "id", "author", "histories", "comment", "time", "userid", "updatedat",
		"articlecomment", "commentid", "commentthreadid", "articlecommentthreadinfo", "commentid",
		"articlecommentinfo", "commentid", "articlecommentthreadreaction", "commentid", "articlecommentreaction", "commentId")
	articleCommentThreadHandler := muxcommentthread.NewCommentThreadHandler(articleCommentThreadService, shortid.Generate, "commentId", "author", "id")
	articleCommentThreadReactionService := commentthreadreaction.NewCommentReactionService(db, "articlecommentthreadreaction", "commentId", "author", "userId", "time", "reaction", "articlecommentthreadinfo", "commentId", "usefulcount")
	articleCommentThreadReactionHandnler := commentthreadreaction.NewCommentReactionHandler(articleCommentThreadReactionService, 3, 2, 0)
	articleCommentThreadReplyReactionService := commentthreadreaction.NewCommentReactionService(db, "articlecommentreaction", "commentId", "author", "userId", "time", "reaction", "articlecommentinfo", "commentId", "usefulcount")
	articleCommentThreadReplyReactionHandler := commentthreadreaction.NewCommentReactionHandler(articleCommentThreadReplyReactionService, 3, 2, 0)
	// Follow
	followService := follow.NewFollowService(
		db,
		"userfollower", "id", "follower",
		"userfollowing", "id", "following",
		"userinfo", "id", "followercount", "followingcount")
	followHandler := follow.NewFollowHandler(followService, 0, 1)

	// Userinfomation
	userinfoType := reflect.TypeOf(userinfomation.UserInfomation{})
	userInfomationRepository, err := s.NewViewRepository(db, "userinfo", userinfoType)
	if err != nil {
		return nil, err
	}

	userInfomationService := userinfomation.NewUserInfomationService(userInfomationRepository)

	// userinfosearchquery, err := template.UseQuery(conf.Template, nil, "userinfo", templates, &userinfoType, convert.ToMap, buildParam)
	// if err != nil {
	// 	return nil, err
	// }
	// userInfoSearchBuilder, err := s.NewSearchBuilder(db, userinfoType, userinfosearchquery)
	// if err != nil {
	// 	return nil, err
	// }
	userInfomationHandler := userinfomation.NewUserInfomationHandler(userInfomationService, log.LogError, nil)

	// Appreciation
	appreciationService := appreciation.NewAppreciationService(
		db,
		"userreaction", "id", "author", "reaction",
		"level", "count",
		"userinfo", "id", "reactioncount")
	appreciationHandler := appreciation.NewAppreciationHandler(appreciationService, modelStatus, log.LogError, validator.Validate, &action)

	//Film Comment
	commentService := comment.NewCommentService(
		db,
		"filmratecomment", "commentid", "id", "author", "userid", "comment", "anonymous", "time", "updatedat",
		"filmrate", "id", "author", "replycount", "users", "id", "imageurl", "username", loadUserInfo.Load, pq.Array)
	commentHandler := commentmux.NewCommentHandler(commentService, "commentId", "id", "author", "userId")

	// SearchComment
	commentType := reflect.TypeOf(searchcomment.Comment{})
	queryComment, _ := template.UseQueryWithArray(conf.Template, nil, "comment", templates, &commentType, convert.ToMap, buildParam, pq.Array)
	commentSearchBuilder, err := s.NewSearchBuilderWithArray(db, commentType, queryComment, pq.Array)
	if err != nil {
		return nil, err
	}
	searchCommentHandler := search.NewSearchHandler(commentSearchBuilder.Search, commentType, reflect.TypeOf(searchcomment.CommentFilter{}), logError, nil)

	// Film Reaction
	reactionService := reaction.NewReactionService(
		db,
		"filmratereaction", "id", "author", "userid", "time", "reaction",
		"filmrate", "id", "author", "usefulcount")
	reactionHandler := reaction.NewReactionHandler(reactionService, 0, 2, 3)

	// Film Rate
	rateService := rate.NewRateService(
		db,
		"filmrate", "id", "author", "rate", "review", "time", "usefulcount", "replycount",
		"filmrateinfo", "id", "rate", "count", "score",
		pq.Array)
	rateHandler := rate.NewRateHandler(rateService, 0, 1, 10)

	//Film Search Rate
	rateType := reflect.TypeOf(searchrate.Rate{})
	queryRate, _ := template.UseQueryWithArray(conf.Template, nil, "rate", templates, &rateType, convert.ToMap, buildParam, pq.Array)
	rateSearchBuilder, err := ratereaction.NewRateSearchService(db, queryRate, pq.Array, loadUserInfo.Load)
	if err != nil {
		return nil, err
	}
	searchRateHandler := ratereaction.NewSearchRateHandler(rateSearchBuilder)

	// Item
	itemType := reflect.TypeOf(item.Item{})
	queryItem, _ := template.UseQueryWithArray(conf.Template, nil, "item", templates, &itemType, convert.ToMap, buildParam, pq.Array)
	itemSearchBuilder, err := s.NewSearchBuilderWithArray(db, itemType, queryItem, pq.Array)
	if err != nil {
		return nil, err
	}
	itemRepository, err := s.NewRepositoryWithArray(db, "item", itemType, pq.Array)
	if err != nil {
		return nil, err
	}
	itemService := item.NewItemService(itemRepository)
	itemHandler := item.NewItemHandler(itemSearchBuilder.Search, itemService, modelStatus, log.LogError, validator.Validate, &action)

	// saveService := save.NewSaveService(db, "saveditem", "id", "items", 50)
	// saveHandler := save.NewSaveHandler(saveService, modelStatus, log.LogError, validator.Validate, &action)
	saveditemService := saveditem.NewSaveService(db, itemType, "saveditem", "id", "items", 50, "item", "id", pq.Array)
	savedItemHandler := saveditem.NewSaveHandler(saveditemService, 1, 0)
	// Item Response
	responseService := response.NewResponseService(
		db,
		"itemresponse", "id", "author", "description", "time", "usefulcount", "replycount",
		"itemresponseinfo", "id", "count",
		pq.Array)
	responseHandler := response.NewResponseHandler(responseService, "id", "author")

	// Item Search Response
	responseType := reflect.TypeOf(searchresponse.Response{})
	queryResponse, _ := template.UseQueryWithArray(conf.Template, nil, "itemresponse", templates, &responseType, convert.ToMap, buildParam, pq.Array)
	responseSearchBuilder, err := s.NewSearchBuilderWithArray(db, responseType, queryResponse, pq.Array)
	if err != nil {
		return nil, err
	}
	searchResponseHandler := search.NewSearchHandler(responseSearchBuilder.Search, responseType, reflect.TypeOf(searchresponse.ResponseFilter{}), logError, nil)

	// My Item
	myitemType := reflect.TypeOf(myitem.Item{})
	queryMyItem, _ := template.UseQueryWithArray(conf.Template, nil, "item", templates, &myitemType, convert.ToMap, buildParam, pq.Array)
	myItemSearchBuilder, err := s.NewSearchBuilderWithArray(db, myitemType, queryMyItem, pq.Array)
	if err != nil {
		return nil, err
	}
	myItemRepository, err := s.NewRepositoryWithArray(db, "item", myitemType, pq.Array)
	if err != nil {
		return nil, err
	}
	uploadItemRepository := upload.NewRepository(db, "item", "", upload.UploadFieldColumn{Image: &Image, Cover: &Cover, Gallery: &Gallery, Id: "id"}, pq.Array)

	itemUploadService := upload.NewUploadService(uploadItemRepository, cloudService, conf.Provider, conf.GeneralDirectory,
		conf.KeyFile, conf.Storage.Directory, []int{}, []int{})
	myItemService := myitem.NewMyItemService(myItemRepository)
	myItemHandler := myitem.NewMyItemHandler(myItemSearchBuilder.Search, myItemService, modelStatus,
		log.LogError, validator.Validate, &action, itemUploadService, conf.KeyFile, generateId)

	// Film
	filmType := reflect.TypeOf(film.Film{})
	// filmQuery := sq.UseQuery(db, "film", filmType)
	filmQuery, err := template.UseQueryWithArray(conf.Template, nil, "film", templates, &filmType, convert.ToMap, buildParam, pq.Array)
	if err != nil {
		return nil, err
	}
	filmSearchBuilder, err := s.NewSearchBuilderWithArray(db, filmType, filmQuery, pq.Array)
	if err != nil {
		return nil, err
	}
	filmRepository, err := s.NewRepositoryWithArray(db, "film", filmType, pq.Array)
	if err != nil {
		return nil, err
	}
	infoType := reflect.TypeOf(film.Info10{})
	infoRepository, err := s.NewRepository(db, "filmrateInfo", infoType)
	if err != nil {
		return nil, err
	}
	filmService := film.NewFilmService(filmRepository, infoRepository)
	filmHandler := film.NewFilmHandler(filmSearchBuilder.Search, filmService, log.LogError, nil)

	// SaveFilm
	// savedfilmService := film.NewSavedFilmService(db, "savedfilm", "items", "id", 50)
	// savedFilmHandler := film.NewSavedFilmHanlder(savedfilmService)
	savedfilmService := save.NewSaveService(db, "savedfilm", "id", "item", 50)
	savedfilmHandler := save.NewSaveHandler(savedfilmService, 0, 1)
	// Filmcategory
	filmCategoryType := reflect.TypeOf(category.Category{})
	filmCategoryQuery := sq.UseQuery(db, "filmcategory", filmCategoryType)
	filmCategoryBuilder, err := s.NewSearchBuilder(db, filmCategoryType, filmCategoryQuery)
	if err != nil {
		return nil, err
	}
	filmCategoryRepository, err := s.NewRepository(db, "filmcategory", filmCategoryType)

	if err != nil {
		return nil, err
	}
	filmCategoryService := category.NewCategoryService(filmCategoryRepository)
	filmCategoryHandler := category.NewCategoryHandler(filmCategoryBuilder.Search, filmCategoryService, modelStatus, log.LogError, validator.Validate, nil, &action)

	// CompanyCategory
	companyCategoryType := reflect.TypeOf(category.Category{})
	companyCategoryQuery := sq.UseQuery(db, "companycategory", companyCategoryType)
	companyCategorySearchBuilder, err := s.NewSearchBuilder(db, companyCategoryType, companyCategoryQuery)
	if err != nil {
		return nil, err
	}
	companyCategoryRepository, err := s.NewRepository(db, "companycategory", filmCategoryType)

	if err != nil {
		return nil, err
	}
	companyCategoryService := category.NewCategoryService(companyCategoryRepository)
	companyCategoryHandler := category.NewCategoryHandler(companyCategorySearchBuilder.Search, companyCategoryService, modelStatus, log.LogError, validator.Validate, nil, &action)

	// item category
	itemCategoryType := reflect.TypeOf(category.Category{})
	itemCategoryQuery := sq.UseQuery(db, "itemcategory", itemCategoryType)
	if err != nil {
		return nil, err
	}
	itemCategorySearchBuilder, err := s.NewSearchBuilder(db, itemCategoryType, itemCategoryQuery)
	if err != nil {
		return nil, err
	}
	itemCategoryRepository, err := s.NewRepository(db, "itemcategory", itemCategoryType)
	if err != nil {
		return nil, err
	}
	itemCategoryService := category.NewCategoryService(itemCategoryRepository)
	itemCategoryHandler := category.NewCategoryHandler(itemCategorySearchBuilder.Search, itemCategoryService, modelStatus, log.LogError, validator.Validate, nil, &action)

	// Company
	companyInfoType := reflect.TypeOf(company.Info{})
	companyInfoRepository, err := s.NewViewRepositoryWithArray(db, "companyratefullinfo", companyInfoType, pq.Array)
	if err != nil {
		return nil, err
	}

	companyType := reflect.TypeOf(company.Company{})
	companySearchQuery, err := template.UseQueryWithArray(conf.Template, nil, "company", templates, &companyType, convert.ToMap, buildParam, pq.Array)
	if err != nil {
		return nil, err
	}
	companySearchBuilder, err := s.NewSearchBuilderWithArray(db, companyType, companySearchQuery, pq.Array)
	if err != nil {
		return nil, err
	}
	companyRepository, err := s.NewViewRepositoryWithArray(db, "company", companyType, pq.Array)
	if err != nil {
		return nil, err
	}

	companyService := company.NewCompanyService(companyRepository, companyInfoRepository)
	companyHandler := company.NewCompanyHandler(companySearchBuilder.Search, companyService, log.LogError, nil)

	// Job
	jobType := reflect.TypeOf(job.Job{})
	jobRepository, err := s.NewRepositoryWithArray(db, "job", jobType, pq.Array)
	if err != nil {
		return nil, err
	}
	jobSearchQuery := sq.UseQuery(db, "job", jobType)
	jobSearchBuilder, err := s.NewSearchBuilderWithArray(db, jobType, jobSearchQuery, pq.Array)
	if err != nil {
		return nil, err
	}
	jobService := job.NewJobService(jobRepository)
	jobHandler := job.NewJobHandler(jobSearchBuilder.Search, jobService, log.LogError, nil, validator.Validate, modelStatus, action)

	// Room
	typeRoom := reflect.TypeOf(room.Room{})
	roomRepository, err := s.NewRepositoryWithArray(db, "room", typeRoom, pq.Array)
	if err != nil {
		return nil, err
	}
	roomSearchQuery, err := template.UseQueryWithArray(conf.Template, nil, "room", templates, &typeRoom, convert.ToMap, buildParam, pq.Array)
	if err != nil {
		return nil, err
	}
	roomSearchBuilder, err := s.NewSearchBuilderWithArray(db, typeRoom, roomSearchQuery, pq.Array)
	if err != nil {
		return nil, err
	}
	roomService := room.NewRoomService(roomRepository)
	roomHandler := room.NewRoomHandler(roomSearchBuilder.Search, roomService, log.LogError, nil, validator.Validate, modelStatus, action)

	// Backoffice - Cinema
	boCinemaType := reflect.TypeOf(bocinema.Cinema{})
	boCinemaSearchQuery := sq.UseQuery(db, "cinema", boCinemaType)
	boCinemaSearchBuilder, err := s.NewSearchBuilderWithArray(db, boCinemaType, boCinemaSearchQuery, pq.Array)
	if err != nil {
		return nil, err
	}
	boCinemaRepository, err := s.NewRepositoryWithArray(db, "cinema", boCinemaType, pq.Array)
	if err != nil {
		return nil, err
	}
	uploadBOCinemaRepository := upload.NewRepository(db, "cinema", "", upload.UploadFieldColumn{Image: &Image, Cover: &Cover, Gallery: &Gallery, Id: "id"}, pq.Array)

	boCinemaUploadService := upload.NewUploadService(uploadBOCinemaRepository, cloudService, conf.Provider, conf.GeneralDirectory,
		conf.KeyFile, conf.Storage.Directory, []int{}, []int{})
	boCinemaService := bocinema.NewCinemaService(boCinemaRepository)
	boCinemaHandler := bocinema.NewBackOfficeCinemaHandler(boCinemaSearchBuilder.Search, nil,
		boCinemaService, log.LogError, validator.Validate, modelStatus, action, boCinemaUploadService, conf.KeyFile, generateId)

	cinemaType := reflect.TypeOf(cinema.Cinema{})
	cinemaRepository, err := s.NewRepositoryWithArray(db, "cinema", cinemaType, pq.Array)
	if err != nil {
		return nil, err
	}
	cinemaService := cinema.NewCinemaService(cinemaRepository)
	cinemaSearchQuery, err := template.UseQueryWithArray(conf.Template, nil, "cinema", templates, &cinemaType, convert.ToMap, buildParam, pq.Array)
	if err != nil {
		return nil, err
	}
	cinemaSearchBuilder, err := s.NewSearchBuilderWithArray(db, cinemaType, cinemaSearchQuery, pq.Array)
	if err != nil {
		return nil, err
	}
	cinemaHandler := cinema.NewCinemaHandler(cinemaSearchBuilder.Search, nil, cinemaService, log.LogError, validator.Validate, modelStatus, action)

	cinemaCommentService := comment.NewCommentService(db, "cinemaratecomment", "commentid", "id", "author", "userid", "comment", "anonymous", "time", "updatedat", "cinemarate", "id", "author", "replycount", "users", "id", "imageurl", "username", nil, pq.Array)
	cinemaCommentHandler := commentmux.NewCommentHandler(cinemaCommentService, "commentId", "id", "author", "userId")
	// SearchCommentCinema
	cinemaCommentType := reflect.TypeOf(searchcomment.Comment{})
	queryCinemaComment, _ := template.UseQueryWithArray(conf.Template, nil, "comment", templates, &cinemaCommentType, convert.ToMap, buildParam, pq.Array)
	cinemaCommentSearchBuilder, err := s.NewSearchBuilderWithArray(db, commentType, queryCinemaComment, pq.Array)
	if err != nil {
		return nil, err
	}
	searchCinemaCommentHandler := search.NewSearchHandler(cinemaCommentSearchBuilder.Search, cinemaCommentType, reflect.TypeOf(searchcomment.CommentFilter{}), logError, nil)
	// Cinema Reaction
	cinemaReactionService := reaction.NewReactionService(
		db,
		"cinemaratereaction", "id", "author", "userid", "time", "reaction",
		"cinemarate", "id", "author", "usefulcount")
	cinemaReactionHandler := reaction.NewReactionHandler(cinemaReactionService, 0, 2, 3)

	// Cinema Rate
	cinemaRateService := rate.NewRateService(
		db,
		"cinemarate", "id", "author", "rate", "review", "time", "usefulcount", "replycount",
		"cinemarateinfo", "id", "rate", "count", "score",
		pq.Array)
	cinemaRateHandler := rate.NewRateHandler(cinemaRateService, 0, 1, 5)

	//Cinema Search Rate
	cinemaRateType := reflect.TypeOf(searchrate.Rate{})
	cinemaRateFilterType := reflect.TypeOf(searchrate.RateFilter{})
	queryCinemaRate, _ := template.UseQueryWithArray(conf.Template, nil, "rate", templates, &rateType, convert.ToMap, buildParam, pq.Array)
	cinemaRateSearchBuilder, err := s.NewSearchBuilderWithArray(db, cinemaRateType, queryCinemaRate, pq.Array)
	if err != nil {
		return nil, err
	}
	searchCinemaRateHandler := search.NewSearchHandler(cinemaRateSearchBuilder.Search, cinemaRateType, cinemaRateFilterType, log.LogError, nil)
	/////////////
	// Backoffice - Film
	bofilmType := reflect.TypeOf(bofilm.Film{})
	// bofilmSearchQuery := sq.UseQuery(db, "film", bofilmType)
	bofilmSearchQuery, err := template.UseQueryWithArray(conf.Template, nil, "film", templates, &filmType, convert.ToMap, buildParam, pq.Array)
	if err != nil {
		return nil, err
	}
	bofilmSearchBuilder, err := s.NewSearchBuilderWithArray(db, bofilmType, bofilmSearchQuery, pq.Array)
	if err != nil {
		return nil, err
	}
	boFilmRepository, err := s.NewRepositoryWithArray(db, "film", bofilmType, pq.Array)
	if err != nil {
		return nil, err
	}
	filmBOUploadRepository := upload.NewRepository(db, "film", "", upload.UploadFieldColumn{Image: &Image, Cover: &Cover, Gallery: &Gallery, Id: "id"}, pq.Array)

	filmBOUploadService := upload.NewUploadService(filmBOUploadRepository, cloudService, conf.Provider, conf.GeneralDirectory,
		conf.KeyFile, conf.Storage.Directory, []int{}, []int{})
	boFilmService := bofilm.NewBackOfficeFilmService(boFilmRepository)
	boFilmHandler := bofilm.NewBackOfficeFilmHandler(bofilmSearchBuilder.Search, boFilmService, validator.Validate, log.LogError,
		nil, directorService.Save, castService.Save, productionService.Save, countryService.Save, modelStatus, &action, nil, conf.Tracking, filmBOUploadService, conf.KeyFile, generateId)

	// music
	musicType := reflect.TypeOf(music.Music{})
	musicSearchQuery, err := template.UseQueryWithArray(conf.Template, nil, "music", templates, &musicType, convert.ToMap, buildParam, pq.Array)
	if err != nil {
		return nil, err
	}
	musicSearchBuilder, err := s.NewSearchBuilderWithArray(db, musicType, musicSearchQuery, pq.Array)
	if err != nil {
		return nil, err
	}
	musicRepository, err := s.NewRepositoryWithArray(db, "music", musicType, pq.Array)
	if err != nil {
		return nil, err
	}

	musicService := music.NewMusicService(musicRepository)
	musicHandler := music.NewMusicHandler(musicSearchBuilder.Search, musicService, log.LogError, nil, validator.Validate, modelStatus, action)

	// playlist
	playlistType := reflect.TypeOf(playlist.Playlist{})
	playlistSearchQuery, err := template.UseQueryWithArray(conf.Template, nil, "playlist", templates, &playlistType, convert.ToMap, buildParam, pq.Array)
	if err != nil {
		return nil, err
	}
	playlistSearchBuilder, err := s.NewSearchBuilderWithArray(db, playlistType, playlistSearchQuery, pq.Array)
	if err != nil {
		return nil, err
	}
	playlistRepository, err := s.NewRepositoryWithArray(db, "playlist", playlistType, pq.Array)
	if err != nil {
		return nil, err
	}
	playlistService := playlist.NewPlaylistService(playlistRepository)
	playlistHandler := playlist.NewPlaylistHandler(playlistSearchBuilder.Search, playlistService, log.LogError, nil, validator.Validate, modelStatus, action)

	// backoffice company
	boCompanyType := reflect.TypeOf(bocompany.Company{})
	boCompanyRepository, err := s.NewRepositoryWithArray(db, "company", boCompanyType, pq.Array)
	if err != nil {
		return nil, err
	}
	boCompanyService := bocompany.NewBackofficeCompanyService(boCompanyRepository)
	boCompanySearchQuery, err := template.UseQueryWithArray(conf.Template, nil, "company", templates, &boCompanyType, convert.ToMap, buildParam, pq.Array)
	if err != nil {
		return nil, err
	}
	bocompanySearchBuilder, err := s.NewSearchBuilderWithArray(db, boCompanyType, boCompanySearchQuery, pq.Array)
	if err != nil {
		return nil, err
	}
	boCompanyUploadRepository := upload.NewRepository(db, "company", "", upload.UploadFieldColumn{Image: &Image, Cover: &Cover, Gallery: &Gallery, Id: "id"}, pq.Array)

	boCompanyUploadService := upload.NewUploadService(boCompanyUploadRepository, cloudService, conf.Provider, conf.GeneralDirectory,
		conf.KeyFile, conf.Storage.Directory, []int{}, []int{})

	boCompanyHandler := bocompany.NewBackofficeCompanyHandler(bocompanySearchBuilder.Search, boCompanyService, log.LogError, nil, validator.Validate, modelStatus, action, boCompanyUploadService, conf.KeyFile, generateId)

	// rate company
	companyRateService := rates.NewRatesService(db, 5,
		"companyrate", "id", "rate", "rates", "review", "author", "time", "usefulcount", "replycount",
		"companyratefullinfo", "id", "score", "count", "rate", []string{"companyrateinfo01", "companyrateinfo02", "companyrateinfo03", "companyrateinfo04", "companyrateinfo05"}, "id", "rate", "count", "score")
	companyRateHandler := rates.NewRatesHandler(companyRateService, 0, 1, 5)

	companyReactionService := reaction.NewReactionService(db, "companyratereaction", "id", "author", "userid", "time", "reaction",
		"companyrate", "id", "author", "usefulcount")
	companyReactionHandler := reaction.NewReactionHandler(companyReactionService, 0, 2, 3)

	companyCommentService := comment.NewCommentService(db, "companycomment", "commentid", "id", "author", "userid", "comment", "anonymous", "time", "updatedat", "companyrate", "id", "author", "replycount", "users", "id", "imageurl", "username", nil, pq.Array)
	companyCommentHandler := commentmux.NewCommentHandler(companyCommentService, "commentId", "id", "author", "userId")
	// company search rate
	companyRateType := reflect.TypeOf(searchrate.Rates{})
	companyRateFilterType := reflect.TypeOf(searchrate.RatesFilter{})
	queryCompanyRate, err := template.UseQueryWithArray(conf.Template, nil, "companyrate", templates, &companyRateType, convert.ToMap, buildParam, pq.Array)
	if err != nil {
		return nil, err
	}
	companyRateSearchBuilder, err := s.NewSearchBuilderWithArray(db, companyRateType, queryCompanyRate, pq.Array)
	if err != nil {
		return nil, err
	}
	searchCompanyRateHandler := search.NewSearchHandler(companyRateSearchBuilder.Search, companyRateType, companyRateFilterType, logError, nil)
	// SearchRate Company
	companyCommentType := reflect.TypeOf(searchcomment.Comment{})
	queryCompanyComment, _ := template.UseQueryWithArray(conf.Template, nil, "comment", templates, &companyCommentType, convert.ToMap, buildParam, pq.Array)
	companyCommentSearchBuilder, err := s.NewSearchBuilderWithArray(db, commentType, queryCompanyComment, pq.Array)
	if err != nil {
		return nil, err
	}

	searchCompanyCommentHandler := search.NewSearchHandler(companyCommentSearchBuilder.Search, companyCommentType, reflect.TypeOf(searchcomment.CommentFilter{}), logError, nil)

	// Comment Company
	// companyCommentService := comment.NewCommentService(db, "",)
	// companyCommentHandler := comment.NewCommentHandler()

	// backoffice room
	boRoomType := reflect.TypeOf(boroom.Room{})
	boRoomSearchQuery, err := template.UseQueryWithArray(conf.Template, nil, "room", templates, &boRoomType, convert.ToMap, buildParam, pq.Array)
	if err != nil {
		return nil, err
	}
	boRoomSearchBuilder, err := s.NewSearchBuilderWithArray(db, boRoomType, boRoomSearchQuery, pq.Array)
	if err != nil {
		return nil, err
	}
	boRoomRepository, err := s.NewRepositoryWithArray(db, "room", boRoomType, pq.Array)
	if err != nil {
		return nil, err
	}
	// Backoffice Location
	boLocationType := reflect.TypeOf(bolocation.Location{})
	boLocationRepository, err := s.NewRepositoryWithArray(db, "location", boLocationType, pq.Array)
	if err != nil {
		return nil, err
	}
	boLocationService := bolocation.NewBackOfficeLocationService(boLocationRepository)
	bolocationSearchQuery, err := template.UseQueryWithArray(conf.Template, nil, "location", templates, &boLocationType, convert.ToMap, buildParam, pq.Array)
	if err != nil {
		return nil, err
	}
	bolocationSearchBuilder, err := s.NewSearchBuilderWithArray(db, boLocationType, bolocationSearchQuery, pq.Array)
	if err != nil {
		return nil, err
	}
	boLocationUploadRepository := upload.NewRepository(db, "item", "", upload.UploadFieldColumn{Image: &Image, Cover: &Cover, Gallery: &Gallery, Id: "id"}, pq.Array)

	boLocationUploadService := upload.NewUploadService(boLocationUploadRepository, cloudService, conf.Provider, conf.GeneralDirectory,
		conf.KeyFile, conf.Storage.Directory, []int{}, []int{})

	boLocationHandler := bolocation.NewBackOfficeLocationHandler(bolocationSearchBuilder.Search, boLocationService, log.LogError, nil, modelStatus, action, validator.Validate, boLocationUploadService, conf.KeyFile, generateId)
	healthHandler := NewHandler(
		redisHealthChecker,
		mongoHealthChecker,
	)
	if err != nil {
		return nil, err
	}
	boRoomUploadRepository := upload.NewRepository(db, "item", "", upload.UploadFieldColumn{Image: &Image, Cover: &Cover, Gallery: &Gallery, Id: "id"}, pq.Array)

	boRoomUploadService := upload.NewUploadService(boRoomUploadRepository, cloudService, conf.Provider, conf.GeneralDirectory,
		conf.KeyFile, conf.Storage.Directory, []int{}, []int{})
	boRoomService := boroom.NewBackOfficeRoomService(boRoomRepository)
	boRoomHandler := boroom.NewBackofficeRoomHandler(boRoomSearchBuilder.Search, boRoomService, log.LogError, nil, validator.Validate, modelStatus, action, boRoomUploadService, conf.KeyFile, generateId)

	// backoffice job
	boJobType := reflect.TypeOf(bojob.Job{})
	boJobSearchQuery, err := template.UseQueryWithArray(conf.Template, nil, "job", templates, &boJobType, convert.ToMap, buildParam, pq.Array)
	if err != nil {
		return nil, err
	}
	boJobSearchBuilder, err := s.NewSearchBuilderWithArray(db, boJobType, boJobSearchQuery, pq.Array)
	if err != nil {
		return nil, err
	}
	boJobRepository, err := s.NewRepositoryWithArray(db, "job", boJobType, pq.Array)
	if err != nil {
		return nil, err
	}
	boJobService := bojob.NewBackOfficeJobService(boJobRepository)
	boJobHandler := bojob.NewBackofficeJobHandler(boJobSearchBuilder.Search, boJobService, log.LogError, nil, validator.Validate, modelStatus, action)

	// backoffice music
	bomusicType := reflect.TypeOf(bomusic.Music{})
	bomusicSearchQuery, err := template.UseQueryWithArray(conf.Template, nil, "music", templates, &bomusicType, convert.ToMap, buildParam, pq.Array)
	if err != nil {
		return nil, err
	}
	bomusicSearchBuilder, err := s.NewSearchBuilderWithArray(db, bomusicType, bomusicSearchQuery, pq.Array)
	if err != nil {
		return nil, err
	}
	bomusicRepository, err := s.NewRepositoryWithArray(db, "music", bomusicType, pq.Array)
	if err != nil {
		return nil, err
	}
	bomusicService := bomusic.NewBackOfficeMusicService(bomusicRepository)
	bomusicHandler := bomusic.NewBackofficeMusicHandler(bomusicSearchBuilder.Search, bomusicService, log.LogError, nil, validator.Validate, modelStatus, action)

	app := ApplicationContext{
		Health:                     healthHandler,
		Authentication:             authenticationHandler,
		SignOut:                    signOutHandler,
		Password:                   passwordHandler,
		SignUp:                     signupHandler,
		User:                       userHandler,
		MyProfile:                  myProfileHandler,
		Skill:                      skillHandler,
		Interest:                   interestHandler,
		LookingFor:                 lookingForHandler,
		Director:                   directorHandler,
		Education:                  educationHandler,
		Companies:                  companiesHandler,
		Work:                       workHandler,
		Cast:                       castHandler,
		Country:                    countryHander,
		Production:                 productionHandler,
		Location:                   locationHandler,
		LocationRate:               locationRateHandler,
		SearchLocationRate:         searchLocationRateHandler,
		MyArticles:                 myarticlesHandler,
		Article:                    articleHandler,
		ArticleRate:                articleRateHandler,
		ArticleRateSearch:          articleRateSearchHandler,
		ArticleRateReaction:        articleRateReactionHandler,
		Appreciation:               appreciationHandler,
		Follow:                     followHandler,
		SavedItem:                  savedItemHandler,
		Comment:                    commentHandler,
		Reaction:                   reactionHandler,
		Rate:                       rateHandler,
		Response:                   responseHandler,
		SearchRate:                 searchRateHandler,
		SearchResponse:             searchResponseHandler,
		SearchComment:              searchCommentHandler,
		CinemaComment:              cinemaCommentHandler,
		CinemaReaction:             cinemaReactionHandler,
		CinemaRate:                 cinemaRateHandler,
		CinemaResponse:             responseHandler,
		CinemaSearchRate:           searchCinemaRateHandler,
		CinemaSearchResponse:       searchResponseHandler,
		CinemaSearchComment:        searchCinemaCommentHandler,
		Item:                       itemHandler,
		MyItem:                     myItemHandler,
		Company:                    companyHandler,
		Film:                       filmHandler,
		BackofficeCinema:           boCinemaHandler,
		BackofficeFilm:             boFilmHandler,
		BackofficeCompany:          boCompanyHandler,
		FilmCategory:               filmCategoryHandler,
		CompanyCategory:            companyCategoryHandler,
		ItemCategory:               itemCategoryHandler,
		SavedFilm:                  savedfilmHandler,
		Savedlocation:              locationSaveHandler,
		FollowLocation:             locationFollowHandler,
		LocationInfomation:         locationInfomationHandler,
		LocationReaction:           locationReactionHandler,
		LocationComment:            locationCommentHandler,
		SearchLocationComment:      searchLocationCommentHandler,
		BackofficeLocation:         boLocationHandler,
		ArticleComment:             articleCommentHandler,
		SearchArticleComment:       searchArticleRateCommentHandler,
		SearchArticleCommentThread: articleCommentThreadSearchHandler,
		SearchFilmCommentThread:    filmCommentThreadSearchHandler,
		Cinema:                     cinemaHandler,
		SearchCompanyRate:          searchCompanyRateHandler,
		SearchCompanyComment:       searchCompanyCommentHandler,
		Job:                        jobHandler,
		Room:                       roomHandler,
		Music:                      musicHandler,
		Playlist:                   playlistHandler,
		BackofficeRoom:             boRoomHandler,
		BackofficeMusic:            bomusicHandler,
		BackofficeJob:              boJobHandler,
		CompanyRate:                companyRateHandler,
		CompanyReaction:            companyReactionHandler,
		CompanyComment:             companyCommentHandler,
		UserReact:                  userReactHandler,
		UserInfomation:             userInfomationHandler,
		SearchUserRate:             searchUserRateHandler,
		SearchUserRateComment:      searchUserRateCommentHandler,
		UserRate:                   userRateHandler,
		UserRateReaction:           userRateReactionHandler,
		UserRateComment:            userRateCommentHandler,

		ArticleCommentThread:              articleCommentThreadHandler,
		ArticleCommentThreadReply:         articleCommentThreadReplyHandler,
		ArticleCommentThreadReaction:      articleCommentThreadReactionHandnler,
		ArticleCommentThreadReplyReaction: articleCommentThreadReplyReactionHandler,

		// comment
		FilmCommentThread:      filmCommentThreadHandler,
		FilmCommentThreadReply: filmCommentThreadReplyHandler,
		// reaction
		FilmCommentThreadReaction:      filmCommentThreadReactionHandnler,
		FilmCommentThreadReplyReaction: filmCommentThreadReplyReactionHandler,
	}
	return &app, nil
}

func NewMailService(mailConfig MailConfig) SimpleMailSender {
	if mailConfig.Provider == "sendgrid" {
		return NewSimpleMailSender(NewSendGridMailSender(mailConfig.APIkey))
	}
	return NewSimpleMailSender(NewSmtpMailSender(mailConfig.SMTP))
}
func CreateCloudService(ctx context.Context, config Config) (storage.StorageService, error) {
	return google.NewGoogleStorageServiceWithCredentials(ctx, []byte(config.GoogleCredentials), config.Storage)
}
