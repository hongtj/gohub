// Package routes 注册路由
package routes

import (
	"github.com/gin-gonic/gin"
	controllers "gohub/app/http/controllers/api/v1"
)

// RegisterAPIRoutes 注册 API 相关路由
func RegisterAPIRoutes(r *gin.Engine) {

	// 测试一个 v1 的路由组，我们所有的 v1 版本的路由都将存放到这里
	v1 := r.Group("/v1")
	{

		uc := new(controllers.UsersController)
		// 获取当前用户
		usersGroup := v1.Group("/user-cost")
		{
			usersGroup.GET("", uc.UserCost)
		}
	}
}