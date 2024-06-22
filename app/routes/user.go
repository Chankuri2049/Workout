package routes

import (
	"net/http"

	"github.com/Chankuri2049/Workout/models"
	"github.com/labstack/echo/v4"
)

func getAllUsers(context echo.Context) error {
	users, err := models.GetAllUsers()
	// ※注意：エラーハンドリングはテキトーです
	if err != nil {
		return context.JSON(http.StatusInternalServerError, "ユーザーを取得できませんでした。")
	}
	return context.JSON(http.StatusOK, users)
}

func getUserById(context echo.Context) error {
	userId := context.Param("userId")
	user, err := models.GetUserById(userId)
	// ※注意：エラーハンドリングはテキトーです
	if err != nil {
		return context.JSON(http.StatusInternalServerError, "ユーザーを取得できませんでした。")
	}
	return context.JSON(http.StatusOK, user)
}