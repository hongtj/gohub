package record

import "gohub/app/models"

// Record 用户模型
type Record struct {
	models.BaseModel

	Uid   uint64  `json:"pid,omitempty" gorm:"default:;comment:用户ID"`
	Cost  float64 `json:"cost,omitempty" gorm:"default:;comment:消费"`

	models.CommonTimestampsField
}