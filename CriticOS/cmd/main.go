package main

import (
	"github.com/crisywini/Go4/CriticOS/internal/handler"
	"github.com/crisywini/Go4/CriticOS/internal/service"
	"github.com/gin-gonic/gin"
)

func main() {

	r := gin.Default()
	reviewService := service.NewReviewService()

	handler := handler.NewReviewServiceHandler(reviewService)

	r.GET("/reviews", handler.GetReviews)

	r.Run(":8080")

}
