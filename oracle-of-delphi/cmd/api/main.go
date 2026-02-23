package main

import (
	"log"

	"github.com/crisywini/Go4/oracle-of-delphi/internal/handler"
	"github.com/crisywini/Go4/oracle-of-delphi/internal/service"
	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()

	oracleService := service.NewOracleService()

	oracleHandler := handler.NewOracleHandler(oracleService)

	r.POST("/ask", oracleHandler.CreateQuestion)

	log.Printf("Server up and running")

	r.Run(":8080")
}
