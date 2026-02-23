package handler

import (
	"log"
	"net/http"

	"github.com/crisywini/Go4/oracle-of-delphi/internal/service"
	"github.com/gin-gonic/gin"
)

type OracleHandler struct {
	service *service.OracleService
}

type createQuestionRequest struct {
	User     string `json:"user" binding:"required"`
	Question string `json:"question" binding:"required"`
}

func NewOracleHandler(service *service.OracleService) *OracleHandler {
	return &OracleHandler{
		service: service,
	}
}

func (oh *OracleHandler) CreateQuestion(c *gin.Context) {

	var req createQuestionRequest
	if err := c.ShouldBindBodyWithJSON(&req); err != nil {
		log.Printf("[CreateQuestion] bind error: %v", err)
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusCreated, oh.service.AskQuestion(req.User, req.Question))
}
