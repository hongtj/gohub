package user

import (
	"gohub/pkg/database"
)

// GetByPhone 通过手机号来获取用户
func GetByPhone(phone string) (userModel User) {
	database.DB.Where("phone = ?", phone).First(&userModel)
	return
}

// GetByPid 通过 pid 获取用户
func GetByPid(pid []uint64) (users []User) {
	database.DB.Where("pid in ?", pid).Find(&users)
	return
}


