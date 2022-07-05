package v1

import (
	"gohub/app/models/record"
	"gohub/app/models/user"
	"gohub/app/requests"
	"gohub/pkg/response"

	"github.com/gin-gonic/gin"
)

type UsersController struct {
	BaseAPIController
}

// UserCost 所有用户
func (ctrl *UsersController) UserCost(c *gin.Context) {
	flag := true
	// 用户ID
	var userIds []uint64

	// 总消费
	var totalCost float64
	request := requests.UserRequest{}
	if ok := requests.Validate(c, &request, requests.ValidateByParam); !ok {
		return
	}

	data := user.GetByPhone(request.Phone)
	if data.ID == 0 {
		response.Abort404(c)
		return
	}
	userIds = append(userIds, data.ID)
	var tmpIds []uint64
	tmpIds = append(tmpIds, data.ID)
	// 循环查找子级用户
	for flag {
		res := user.GetByPid(tmpIds)
		tmpIds = tmpIds[:0] // 清空slice
		if len(res) == 0 {
			break
		}
		for i := 0; i < len(res); i++ {
			if res[i].ID == 0 {
				flag = false
				break
			}
			userIds = append(userIds, res[i].ID)
			tmpIds = append(tmpIds, res[i].ID) // 重新添加用户id数据
		}
	}
	if len(userIds)>0 {
		records := record.GetByUid(userIds,request.Month)
		for i:=0;i<len(records);i++ {
			totalCost +=records[i].Cost
		}
	}

	response.JSON(c, gin.H{
		"total_cost":  totalCost,
	})
}
