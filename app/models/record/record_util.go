package record

import "gohub/pkg/database"

// GetByUid 通过 uid 获取用户
func GetByUid(uid []uint64,month string) (records []Record) {
	database.DB.Where("uid in ? ", uid).Where("created_at like ?", month+"%").Find(&records)
	return
}