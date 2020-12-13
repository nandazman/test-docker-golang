package main

import (
	"net/http"

	"github.com/labstack/echo"
	"github.com/labstack/echo/middleware"
)

func main() {
	e := echo.New()
	e.Use(middleware.CORS())
	e.GET("/", func(c echo.Context) error {
		return c.String(http.StatusOK, "Hello, World!")
	})
	e.GET("/mantap", func(c echo.Context) error {
		return c.String(http.StatusOK, "MANTAP PISAN GANSSS")
	})
	e.Logger.Fatal(e.Start(":1323"))
}
