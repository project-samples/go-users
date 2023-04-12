package myprofile

import (
	"context"
	"encoding/json"
	"net/http"
	"reflect"

	"github.com/core-go/storage"
	"github.com/core-go/storage/upload"

	sv "github.com/core-go/core"
	v "github.com/core-go/core/v10"
)

type MyProfileHandler interface {
	GetMyProfile(w http.ResponseWriter, r *http.Request)
	SaveMyProfile(w http.ResponseWriter, r *http.Request)
	GetMySettings(w http.ResponseWriter, r *http.Request)
	SaveMySettings(w http.ResponseWriter, r *http.Request)
	storage.UploadHandler
}

func NewMyProfileHandler(service UserService, logError func(context.Context, string, ...map[string]interface{}), status *sv.StatusConfig,
	saveSkills func(ctx context.Context, values []string) (int64, error),
	saveInterests func(ctx context.Context, values []string) (int64, error),
	saveLookingFor func(ctx context.Context, values []string) (int64, error),
	saveEducation func(ctx context.Context, values []string) (int64, error),
	saveCompany func(ctx context.Context, values []string) (int64, error),
	saveWork func(ctx context.Context, values []string) (int64, error),
	uploadService upload.UploadManager,
	keyFile string,
	generate func(ctx context.Context) (string, error)) MyProfileHandler {
	var user User
	userType := reflect.TypeOf(user)
	keys, indexes, _ := sv.BuildMapField(userType)
	validator := v.NewValidator()
	s := sv.InitializeStatus(status)
	UploadHandler := upload.NewHandler(uploadService, logError, keyFile, generate)
	return &myProfileHandler{service: service, Validate: validator.Validate, LogError: logError,
		Keys: keys, Indexes: indexes, Status: s, SaveSkills: saveSkills, SaveInterests: saveInterests,
		SaveLookingFor: saveLookingFor, SaveEducations: saveEducation, SaveCompanies: saveCompany, SaveWorks: saveWork,
		UploadHandler: UploadHandler}
}

type myProfileHandler struct {
	service        UserService
	Validate       func(ctx context.Context, model interface{}) ([]sv.ErrorMessage, error)
	LogError       func(context.Context, string, ...map[string]interface{})
	Keys           []string
	Indexes        map[string]int
	Status         sv.StatusConfig
	SaveSkills     func(ctx context.Context, values []string) (int64, error)
	SaveInterests  func(ctx context.Context, values []string) (int64, error)
	SaveLookingFor func(ctx context.Context, values []string) (int64, error)
	SaveEducations func(ctx context.Context, values []string) (int64, error)
	SaveCompanies  func(ctx context.Context, values []string) (int64, error)
	SaveWorks      func(ctx context.Context, values []string) (int64, error)
	UploadHandler  storage.UploadHandler
}

func (h *myProfileHandler) GetMyProfile(w http.ResponseWriter, r *http.Request) {
	id := sv.GetRequiredParam(w, r)
	if len(id) > 0 {
		user, err := h.service.GetMyProfile(r.Context(), id)
		sv.RespondModel(w, r, user, err, h.LogError, nil)
	}
}
func (h *myProfileHandler) SaveMyProfile(w http.ResponseWriter, r *http.Request) {
	var user User
	r, json, er1 := sv.BuildMapAndCheckId(w, r, &user, h.Keys, h.Indexes)
	if er1 == nil {
		errors, er2 := h.Validate(r.Context(), &user)
		if !sv.HasError(w, r, errors, er2, *h.Status.ValidationError, h.LogError, nil) {
			if h.SaveSkills != nil && len(user.Skills) > 0 {
				skills := make([]string, 0)
				for _, s := range user.Skills {
					skills = append(skills, s.Skill)
				}
				h.SaveSkills(r.Context(), skills)
			}
			if h.SaveCompanies != nil && len(user.Companies) > 0 {
				company := make([]string, 0)
				for _, s := range user.Companies {
					company = append(company, s.Name)
				}
				h.SaveCompanies(r.Context(), company)
			}
			if h.SaveEducations != nil && len(user.Educations) > 0 {
				education := make([]string, 0)
				for _, s := range user.Educations {
					education = append(education, s.School)
				}
				h.SaveEducations(r.Context(), education)
			}
			if h.SaveWorks != nil && len(user.Works) > 0 {
				work := make([]string, 0)
				for _, s := range user.Works {
					work = append(work, s.Position)
				}
				h.SaveWorks(r.Context(), work)
			}
			if h.SaveInterests != nil && len(user.Interests) > 0 {
				h.SaveInterests(r.Context(), user.Interests)
			}
			if h.SaveLookingFor != nil && len(user.LookingFor) > 0 {
				h.SaveLookingFor(r.Context(), user.LookingFor)
			}
			res, er3 := h.service.SaveMyProfile(r.Context(), json)
			sv.HandleResult(w, r, json, res, er3, h.Status, h.LogError, nil)
		}
	}
}
func (h *myProfileHandler) GetMySettings(w http.ResponseWriter, r *http.Request) {
	id := sv.GetRequiredParam(w, r, 1)
	if len(id) > 0 {
		settings, err := h.service.GetMySettings(r.Context(), id)
		sv.RespondModel(w, r, settings, err, h.LogError, nil)
	}
}
func (h *myProfileHandler) SaveMySettings(w http.ResponseWriter, r *http.Request) {
	id := sv.GetRequiredParam(w, r, 1)
	if len(id) > 0 {
		var settings Settings
		err := json.NewDecoder(r.Body).Decode(&settings)
		if err != nil {
			http.Error(w, "Invalid Data", http.StatusBadRequest)
			return
		}
		res, err := h.service.SaveMySettings(r.Context(), id, &settings)
		sv.RespondModel(w, r, res, err, h.LogError, nil)
	}
}

func (u *myProfileHandler) GetGallery(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.GetGallery(w, r)
}

func (u *myProfileHandler) UploadImage(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.UploadImage(w, r)
}

func (u *myProfileHandler) UploadGallery(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.UploadGallery(w, r)
}

func (u *myProfileHandler) UploadCover(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.UploadCover(w, r)
}

func (u *myProfileHandler) DeleteGalleryFile(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.DeleteGalleryFile(w, r)
}
func (u *myProfileHandler) UpdateGallery(w http.ResponseWriter, r *http.Request) {
	u.UploadHandler.UpdateGallery(w, r)
}
