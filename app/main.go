package main

import (
	"github.com/Chankuri2049/Workout/db"
	"github.com/Chankuri2049/Workout/routes"
	"github.com/labstack/echo/v4"
)

func main() {
	// DB接続
	db.Init()

	server := echo.New()
	routes.RegisterRoutes(server)

	server.Logger.Fatal(server.Start(":5050"))
}
