// Package user 存放用户 Model 相关逻辑
package user

import (
	"gohub/app/models"
	"gohub/pkg/database"
)

// User 用户模型
type User struct {
	models.BaseModel

	Pid   uint64  `json:"pid,omitempty" gorm:"default:;comment:父级ID"`
	Name  string  `json:"name,omitempty" gorm:"size:50;comment:姓名"`
	Phone string  `json:"phone,omitempty" gorm:"index:,unique;size:20;comment:电话"`

	models.CommonTimestampsField
}

// Create 创建用户，通过 User.ID 来判断是否创建成功
func (userModel *User) Create() {
	database.DB.Create(&userModel)
}

func (userModel *User) Save() (rowsAffected int64) {
	result := database.DB.Save(&userModel)
	return result.RowsAffected
}
