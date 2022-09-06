package app

import (
	"context"
	"reflect"
	"strings"

	. "github.com/core-go/auth"
	am "github.com/core-go/auth/mongo"
	sv "github.com/core-go/core"
	"github.com/core-go/core/shortid"
	v "github.com/core-go/core/v10"
	. "github.com/core-go/health"
	"github.com/core-go/log"
	. "github.com/core-go/mail"
	. "github.com/core-go/mail/sendgrid"
	. "github.com/core-go/mail/smtp"
	mgo "github.com/core-go/mongo"
	"github.com/core-go/mongo/geo"
	. "github.com/core-go/oauth2"
	om "github.com/core-go/oauth2/mongo"
	. "github.com/core-go/password"
	pm "github.com/core-go/password/mongo"
	"github.com/core-go/redis"
	"github.com/core-go/search"
	"github.com/core-go/search/convert"
	"github.com/core-go/search/mongo"
	. "github.com/core-go/security/crypto"
	. "github.com/core-go/security/jwt"
	. "github.com/core-go/signup"
	. "github.com/core-go/signup/mail"
	sm "github.com/core-go/signup/mongo"
	s "github.com/core-go/sql"
	q "github.com/core-go/sql/query"
	"github.com/core-go/sql/template"
	"github.com/lib/pq"
	_ "github.com/lib/pq"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"

	"go-service/internal/appreciation"
	"go-service/internal/article"
	"go-service/internal/comment"
	"go-service/internal/follow"
	"go-service/internal/location"
	"go-service/internal/locationrate"
	"go-service/internal/myarticles"
	"go-service/internal/myprofile"
	"go-service/internal/rate"
	"go-service/internal/reaction"
	"go-service/internal/user"
)

type ApplicationContext struct {
	Health         *Handler
	Authentication *AuthenticationHandler
	SignOut        *SignOutHandler
	Password       *PasswordHandler
	SignUp         *SignUpHandler
	OAuth2         *OAuth2Handler
	User           user.UserHandler
	MyProfile      myprofile.MyProfileHandler
	Skill          *q.QueryHandler
	Interest       *q.QueryHandler
	LookingFor     *q.QueryHandler
	Location       location.LocationHandler
	LocationRate   locationrate.RateHandler
	MyArticles     myarticles.ArticleHandler
	Article        article.ArticleHandler
	Appreciation   appreciation.AppreciationHandler
	Follow         follow.FollowHandler
	Comment        comment.CommentHandler
	Reaction       reaction.ReactionHandler
	Rate           rate.RateHandler
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
	locationDb, err := mgo.Setup(ctx, conf.Location)
	if err != nil {
		return nil, err
	}
	logError := log.ErrorMsg
	modelStatus := sv.InitializeStatus(conf.ModelStatus)
	action := sv.InitializeAction(conf.Action)
	validator := v.NewValidator()
	generateId := shortid.Generate

	buildParam := q.GetBuild(db)
	templates, err := template.LoadTemplates(template.Trim, "configs/query.xml")
	if err != nil {
		return nil, err
	}

	userCollection := "user"
	authentication := "authentication"

	redisService, err := redis.NewRedisServiceByConfig(conf.Redis)
	if err != nil {
		return nil, err
	}
	tokenBlacklistChecker := NewTokenBlacklistChecker("blacklist:", conf.Token.Expires, redisService)

	mailService := NewMailService(conf.Mail)

	authenticationRepository := am.NewAuthenticationRepositoryByConfig(mongoDb, userCollection, authentication, conf.SignUp.UserStatus.Activated, conf.UserStatus, conf.Auth.Schema)
	userInfoService := NewUserInfoService(authenticationRepository, conf.MaxPasswordAge, conf.MaxPasswordFailed, conf.LockedMinutes)
	bcryptComparator := &BCryptStringComparator{}
	tokenService := NewTokenService()
	verifiedCodeSender := NewPasscodeSender(mailService, conf.Mail.From, NewTemplateLoaderByConfig(conf.Auth.Template))
	passCodeService := mgo.NewPasscodeRepository(mongoDb, "authenpasscode")
	status := InitStatus(conf.Status)
	authenticator := NewAuthenticatorWithTwoFactors(status, userInfoService, bcryptComparator, tokenService.GenerateToken, conf.Token, conf.Payload, nil, verifiedCodeSender.Send, passCodeService, conf.Auth.Expires)
	authenticationHandler := NewAuthenticationHandler(authenticator.Authenticate, status.Error, status.Timeout, logError)
	signOutHandler := NewSignOutHandler(tokenService.VerifyToken, conf.Token.Secret, tokenBlacklistChecker.Revoke, logError)

	passwordResetCode := "passwordResetCode"
	passwordRepository := pm.NewPasswordRepositoryByConfig(mongoDb, userCollection, authentication, userCollection, "userId", conf.Password.Schema)
	passResetCodeRepository := mgo.NewPasscodeRepository(mongoDb, passwordResetCode)
	p := conf.Password
	exps := []string{p.Exp1, p.Exp2, p.Exp3, p.Exp4, p.Exp5, p.Exp6}
	signupSender := NewVerifiedEmailSender(mailService, *conf.SignUp.UserVerified, conf.Mail.From, NewTemplateLoaderByConfig(*conf.SignUp.Template))
	passwordResetSender := NewPasscodeSender(mailService, conf.Mail.From, NewTemplateLoaderByConfig(conf.Password.Template.ResetTemplate))
	passwordChangeSender := NewPasscodeSender(mailService, conf.Mail.From, NewTemplateLoaderByConfig(conf.Password.Template.ChangeTemplate))
	passwordService := NewPasswordService(bcryptComparator, passwordRepository, conf.Password.ResetExpires, passResetCodeRepository, passwordResetSender.Send, tokenBlacklistChecker.RevokeAllTokens, exps, 5, nil, conf.Password.ChangeExpires, passResetCodeRepository, passwordChangeSender.Send)
	passwordHandler := NewPasswordHandler(passwordService, log.LogError, nil)

	signUpCode := "signupCode"
	signUpRepository := sm.NewSignUpRepositoryByConfig(mongoDb, userCollection, authentication, conf.SignUp.UserStatus, conf.MaxPasswordAge, conf.SignUp.Schema, nil)
	signUpCodeRepository := mgo.NewPasscodeRepository(mongoDb, signUpCode)
	signupStatus := InitSignUpStatus(conf.SignUp.Status)
	emailValidator := NewEmailValidator(true, "")
	signUpService := NewSignUpService(signupStatus, true, signUpRepository, generateId, bcryptComparator.Hash, bcryptComparator, signUpCodeRepository, signupSender.Send, conf.SignUp.Expires, emailValidator.Validate, exps)
	signupHandler := NewSignUpHandler(signUpService, signupStatus.Error, log.LogError, conf.SignUp.Action)

	integrationConfiguration := "integrationconfiguration"
	sources := []string{SourceGoogle, SourceFacebook, SourceLinkedIn, SourceAmazon, SourceMicrosoft, SourceDropbox}
	oauth2UserRepositories := make(map[string]OAuth2UserRepository)
	oauth2UserRepositories[SourceGoogle] = NewGoogleUserRepository()
	oauth2UserRepositories[SourceFacebook] = NewFacebookUserRepository()
	oauth2UserRepositories[SourceLinkedIn] = NewLinkedInUserRepository()
	oauth2UserRepositories[SourceAmazon] = NewAmazonUserRepository(conf.CallBackURL.Amazon)
	oauth2UserRepositories[SourceMicrosoft] = NewMicrosoftUserRepository(conf.CallBackURL.Microsoft)
	oauth2UserRepositories[SourceDropbox] = NewDropboxUserRepository()

	activatedStatus := conf.SignUp.UserStatus.Activated
	schema := conf.OAuth2.Schema
	services := strings.Split(conf.OAuth2.Services, ",")
	userRepositories := make(map[string]UserRepository)
	for _, source := range sources {
		userRepository := om.NewUserRepositoryByConfig(mongoDb, userCollection, source, activatedStatus, services, schema, &conf.UserStatus)
		userRepositories[source] = userRepository
	}
	configurationRepository := om.NewConfigurationRepository(mongoDb, integrationConfiguration, oauth2UserRepositories, "status", "A")

	oauth2Service := NewOAuth2Service(status, oauth2UserRepositories, userRepositories, configurationRepository, generateId, tokenService, conf.Token, nil)
	oauth2Handler := NewDefaultOAuth2Handler(oauth2Service, status.Error, log.LogError)

	mongoHealthChecker := mgo.NewHealthChecker(mongoDb)
	redisHealthChecker := redis.NewHealthChecker(redisService.Pool)

	userType := reflect.TypeOf(user.User{})
	userSearchBuilder := mgo.NewSearchBuilder(mongoDb, "user", user.BuildQuery, search.GetSort)
	getUser := mgo.UseGet(mongoDb, "user", userType)
	userHandler := user.NewUserHandler(userSearchBuilder.Search, getUser, log.LogError, nil)

	skillService := q.NewStringService(db, "skills", "skill")
	skillHandler := q.NewQueryHandler(skillService.Load, log.LogError)
	interestService := q.NewStringService(db, "interests", "interest")
	interestHandler := q.NewQueryHandler(interestService.Load, log.LogError)
	lookingForService := q.NewStringService(db, "searchs", "item")
	lookingForHandler := q.NewQueryHandler(lookingForService.Load, log.LogError)

	myprofileType := reflect.TypeOf(myprofile.User{})
	userRepository := mgo.NewRepository(mongoDb, "user", myprofileType)
	myProfileService := myprofile.NewUserService(userRepository)
	myProfileHandler := myprofile.NewMyProfileHandler(myProfileService, log.LogError, nil, skillService.Save, interestService.Save, lookingForService.Save)

	locationType := reflect.TypeOf(location.Location{})
	locationInfoType := reflect.TypeOf(location.LocationInfo{})
	locationMapper := geo.NewMapper(locationType)
	locationQuery := query.UseQuery(locationType)
	locationSearchBuilder := mgo.NewSearchBuilder(locationDb, "location", locationQuery, search.GetSort, locationMapper.DbToModel)
	locationRepository := mgo.NewViewRepository(locationDb, "location", locationType, locationMapper.DbToModel)
	locationInfoRepository := mgo.NewViewRepository(locationDb, "locationInfo", locationInfoType)
	locationService := location.NewLocationService(locationRepository, locationInfoRepository)
	locationHandler := location.NewLocationHandler(locationSearchBuilder.Search, locationService, log.LogError, nil)

	locationRateType := reflect.TypeOf(locationrate.Rate{})
	locationRateQuery := query.UseQuery(locationRateType)
	locationRateSearchBuilder := mgo.NewSearchBuilder(locationDb, "locationRate", locationRateQuery, search.GetSort)
	getLocationRate := mgo.UseGet(locationDb, "locationRate", locationRateType)
	locationRateHandler := locationrate.NewRateHandler(locationRateSearchBuilder.Search, getLocationRate, log.LogError, nil)

	myarticlesType := reflect.TypeOf(myarticles.Article{})
	myarticlesQuery := query.UseQuery(myarticlesType)
	myarticlesSearchBuilder := mgo.NewSearchBuilder(locationDb, "article", myarticlesQuery, search.GetSort)
	myarticlesRepository := mgo.NewRepository(locationDb, "article", myarticlesType)
	myarticlesService := myarticles.NewArticleService(myarticlesRepository)
	myarticlesHandler := myarticles.NewArticleHandler(myarticlesSearchBuilder.Search, myarticlesService, generateId, modelStatus, log.LogError, validator.Validate, conf.Tracking, &action, nil)

	articleType := reflect.TypeOf(article.Article{})
	articleQuery := query.UseQuery(articleType)
	articleSearchBuilder := mgo.NewSearchBuilder(locationDb, "article", articleQuery, search.GetSort)
	articleRepository := mgo.NewRepository(locationDb, "article", articleType)
	articleService := article.NewArticleService(articleRepository)
	articleHandler := article.NewArticleHandler(articleSearchBuilder.Search, articleService, log.LogError, nil)

	// Follow
	followService := follow.NewFollowService(db, "userfollower", "userfollowing", "userinfo")
	followHandler := follow.NewFollowHandler(followService, modelStatus, log.LogError, validator.Validate, &action)

	// Appreciation
	appreciationService := appreciation.NewAppreciationService(
		db,
		"userreaction", "id", "author", "reaction",
		"level", "count",
		"userinfo", "id", "reactioncount")
	appreciationHandler := appreciation.NewAppreciationHandler(appreciationService, modelStatus, log.LogError, validator.Validate, &action)

	// Comment
	commentType := reflect.TypeOf(comment.Comment{})
	queryComment, _ := template.UseQueryWithArray(conf.Template, comment.BuildCommentQuery, "comment", templates, &commentType, convert.ToMap, buildParam, pq.Array)
	commentSearchBuilder, err := s.NewSearchBuilderWithArray(db, commentType, queryComment, pq.Array)
	if err != nil {
		return nil, err
	}
	commentService := comment.NewCommentService(
		db,
		"gocomment", "commentid", "id", "author", "userid", "comment", "time", "updateat",
		"gorate", "id", "author", "commentcount",
		pq.Array)
	commentHandler := comment.NewCommentHandler(commentSearchBuilder.Search, commentService, modelStatus, log.LogError, validator.Validate, &action)

	// Reaction
	reactionService := reaction.NewReactionService(
		db,
		"goreaction", "id", "author", "userid", "time", "type",
		"gorate", "id", "author", "usefulcount")
	reactionHandler := reaction.NewReactionHandler(reactionService, modelStatus, log.LogError, validator.Validate, &action)

	// Rate
	rateType := reflect.TypeOf(rate.Rate{})
	queryRate, _ := template.UseQueryWithArray(conf.Template, rate.BuildRateQuery, "rate", templates, &rateType, convert.ToMap, buildParam, pq.Array)
	rateSearchBuilder, err := s.NewSearchBuilderWithArray(db, rateType, queryRate, pq.Array)
	if err != nil {
		return nil, err
	}
	rateService := rate.NewRateService(
		db,
		"gorate", "id", "author", "rate", "review", "time", "usefulcount", "commentcount",
		"gorateinfo", "id", "rate", "count", "score",
		pq.Array)
	rateHandler := rate.NewRateHandler(rateSearchBuilder.Search, rateService, modelStatus, log.LogError, validator.Validate, &action)

	healthHandler := NewHandler(redisHealthChecker, mongoHealthChecker)

	app := ApplicationContext{
		Health:         healthHandler,
		Authentication: authenticationHandler,
		SignOut:        signOutHandler,
		Password:       passwordHandler,
		SignUp:         signupHandler,
		OAuth2:         oauth2Handler,
		User:           userHandler,
		MyProfile:      myProfileHandler,
		Skill:          skillHandler,
		Interest:       interestHandler,
		LookingFor:     lookingForHandler,
		Location:       locationHandler,
		LocationRate:   locationRateHandler,
		MyArticles:     myarticlesHandler,
		Article:        articleHandler,
		Appreciation:   appreciationHandler,
		Follow:         followHandler,
		Comment:        commentHandler,
		Reaction:       reactionHandler,
		Rate:           rateHandler,
	}
	return &app, nil
}

func NewMailService(mailConfig MailConfig) SimpleMailSender {
	if mailConfig.Provider == "sendgrid" {
		return NewSimpleMailSender(NewSendGridMailSender(mailConfig.APIkey))
	}
	return NewSimpleMailSender(NewSmtpMailSender(mailConfig.SMTP))
}
