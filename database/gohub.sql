/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : gohub

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 06/07/2022 09:40:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for records
-- ----------------------------
DROP TABLE IF EXISTS `records`;
CREATE TABLE `records` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) unsigned DEFAULT NULL COMMENT '用户ID',
  `cost` double DEFAULT NULL COMMENT '消费',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of records
-- ----------------------------
BEGIN;
INSERT INTO `records` VALUES (1, 1, 2, '2022-08-04 16:25:44.944', '2022-08-04 16:25:44.944');
INSERT INTO `records` VALUES (2, 2, 2.5, '2022-08-04 16:25:44.944', '2022-08-04 16:25:44.944');
INSERT INTO `records` VALUES (3, 3, 3, '2022-08-04 16:25:44.944', '2022-08-04 16:25:44.944');
INSERT INTO `records` VALUES (4, 4, 4, '2022-07-04 16:25:44.944', '2022-07-04 16:25:44.944');
INSERT INTO `records` VALUES (5, 5, 5, '2022-06-04 16:25:44.944', '2022-06-04 16:25:44.944');
INSERT INTO `records` VALUES (6, 6, 6, '2022-07-04 16:25:44.944', '2022-07-04 16:25:44.944');
INSERT INTO `records` VALUES (7, 7, 7, '2022-07-04 16:25:44.944', '2022-07-04 16:25:44.944');
INSERT INTO `records` VALUES (8, 8, 2, '2022-07-04 16:25:44.944', '2022-07-04 16:25:44.944');
INSERT INTO `records` VALUES (9, 9, 10, '2022-07-04 16:25:44.944', '2022-07-04 16:25:44.944');
INSERT INTO `records` VALUES (10, 2, 5, '2022-07-04 16:25:44.944', '2022-07-04 16:25:44.944');
INSERT INTO `records` VALUES (11, 10, 10, '2022-07-04 16:25:44.944', '2022-07-04 16:25:44.944');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) unsigned DEFAULT NULL COMMENT '父级ID',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '姓名',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电话',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (1, NULL, 'htj', '18328611098', '2022-07-04 16:25:44.944', '2022-07-04 16:25:44.944');
INSERT INTO `users` VALUES (2, 1, 'hh', '18328611091', '2022-07-04 16:25:44.944', '2022-07-04 16:25:44.944');
INSERT INTO `users` VALUES (3, 1, 'aa', '18328611092', '2022-07-04 16:25:44.944', '2022-07-04 16:25:44.944');
INSERT INTO `users` VALUES (4, 1, 'bb', '18328611093', '2022-07-04 16:25:44.944', '2022-07-04 16:25:44.944');
INSERT INTO `users` VALUES (5, NULL, 'cc', '18328611094', '2022-07-04 16:25:44.944', '2022-07-04 16:25:44.944');
INSERT INTO `users` VALUES (6, 2, 'dd', '18328611096', '2022-07-04 16:25:44.944', '2022-07-04 16:25:44.944');
INSERT INTO `users` VALUES (7, 2, 'ee', '18328611097', '2022-07-04 16:25:44.944', '2022-07-04 16:25:44.944');
INSERT INTO `users` VALUES (8, 2, 'ff', '18328611099', '2022-07-04 16:25:44.944', '2022-07-04 16:25:44.944');
INSERT INTO `users` VALUES (9, 5, 'gg', '18328611010', '2022-07-04 16:25:44.944', '2022-07-04 16:25:44.944');
INSERT INTO `users` VALUES (10, 5, 'ss', '18328611011', '2022-07-04 16:25:44.944', '2022-07-04 16:25:44.944');
COMMIT;


SET FOREIGN_KEY_CHECKS = 1;
