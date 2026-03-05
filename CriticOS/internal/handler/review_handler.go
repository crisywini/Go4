package handler

import (
	"github.com/crisywini/Go4/CriticOS/internal/service"
	"github.com/gin-gonic/gin"
)

type ReviewServiceHandler struct {
	service *service.ReviewService
}

func NewReviewServiceHandler(service *service.ReviewService) *ReviewServiceHandler {
	return &ReviewServiceHandler{
		service: service,
	}
}

func (sh ReviewServiceHandler) GetReviews(c *gin.Context) {

	response := sh.service.GetReviews()
	c.JSON(200, response)
}
