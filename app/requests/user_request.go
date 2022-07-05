package requests

import (
	"github.com/gin-gonic/gin"
	"github.com/thedevsaddam/govalidator"
)

type UserRequest struct {
	Phone string `json:"phone,omitempty" valid:"phone" form:"phone"`
	Month string `json:"month,omitempty" valid:"month" form:"month"`
}

// ValidateByParam 验证表单，返回长度等于零即通过
func ValidateByParam(data interface{}, c *gin.Context) map[string][]string {

	rules := govalidator.MapData{
		"phone": []string{"required", "digits:11"},
		"month": []string{"required"},
	}
	messages := govalidator.MapData{
		"phone": []string{
			"required:手机号为必填项，参数名称 phone",
			"digits:手机号长度必须为 11 位的数字",
		},
		"month": []string{
			"required:月份必填",
		},
	}

	errs := validate(data, rules, messages)

	return errs
}
