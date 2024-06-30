package main

import (
	"log"
	"net/http"

	"github.com/99designs/gqlgen/graphql/handler"
	"github.com/99designs/gqlgen/graphql/playground"
	"github.com/Chankuri2049/Workout/db"
	"github.com/Chankuri2049/Workout/graph"
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

func main() {
	db.Init()

	e := echo.New()

	e.Use(middleware.Logger())
	e.Use(middleware.Recover())

	e.GET("/", welcome())

	graphqlHandler := handler.NewDefaultServer(
		graph.NewExecutableSchema(
			graph.Config{Resolvers: &graph.Resolver{}},
		),
	)
	playgroundHandler := playground.Handler("GraphQL", "/query")

	e.POST("/query", func(c echo.Context) error {
		graphqlHandler.ServeHTTP(c.Response(), c.Request())
		return nil
	})

	e.GET("/playground", func(c echo.Context) error {
		playgroundHandler.ServeHTTP(c.Response(), c.Request())
		return nil
	})

	err := e.Start(":5050")
	if err != nil {
		log.Fatalln(err)
	}
}

func welcome() echo.HandlerFunc {
	return func(c echo.Context) error {
		return c.String(http.StatusOK, "Welcome!")
	}
}
