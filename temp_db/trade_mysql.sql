/*
 Navicat Premium Data Transfer

 Source Server : 192.168.19.150
 Source Server Type : MySQL
 Source Server Version : 50717
 Source Host : 192.168.19.150:3306
 Source Schema : trade_stock

 Target Server Type : MySQL
 Target Server Version : 50717
 File Encoding : 65001

 Date: 27/02/2020 21:32:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

------------------------------
-- Table structure for t_account_warn_template
------------------------------
DROP TABLE IF EXISTS `t_account_warn_template`;
CREATE TABLE `t_account_warn_template` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT 'Primary key identifier',
  `warnType` tinyint(3) NOT NULL COMMENT 'warning type (0: stop loss, 1: take profit)',
  `notifyType` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Notification method (APP: internal letter, EMAIL: mail, SMS: text message)',
  `content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'template content',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'message title',
  `status` tinyint(3) NULL DEFAULT NULL COMMENT 'Message status (0: enabled, 1: disabled)',
  `lastUpdateBy` bigint(19) NULL DEFAULT NULL COMMENT 'last new person id',
  `lastUpdateUser` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'The name of the last updater',
  `createTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'create time',
  `updateTime` timestamp(0) NOT NULL COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_warnType`(`warnType`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Account Alert Notification Template' ROW_FORMAT = Dynamic;

------------------------------
-- Records of t_account_warn_template
------------------------------
INSERT INTO `t_account_warn_template` VALUES (14, 0, 'SMS', 'Dear customer, the product you hold ${stockCode}$, the current price is ${stockPrice}$ yuan, and the stop loss ratio ${stopProfitRate} has been reached $, please deal with it in time.', 'Account Alert Notification', 0, 10429, 'haper_center2', '2020-02-27 04:00:40', '2020-02-27 04:00:40');
INSERT INTO `t_account_warn_template` VALUES (15, 1, 'EMAIL', 'Dear customer, your product ${stockCode}$, the current price ${stockPrice}$, has reached the stop loss ratio ${stopProfitRate} $, please deal with it in time.', 'Account Alert Notification', 0, 10429, 'haper_center2', '2020-02-27 04:29:06', '2020-02-27 04:29:06');

------------------------------
-- Table structure for t_authority_menu
------------------------------
DROP TABLE IF EXISTS `t_authority_menu`;
CREATE TABLE `t_authority_menu` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT 'Auto increment primary key',
  `parentId` bigint(19) NULL DEFAULT NULL COMMENT 'Superior menu_id',
  `institutionTypeId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Institution type id',
  `menuCode` varchar(160) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Menu code',
  `menuName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Menu name',
  `menuUri` varchar(160) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Menu URI',
  `menuLevel` tinyint(3) NOT NULL COMMENT 'Menu Level',
  `operationSecurity` tinyint(3) NOT NULL COMMENT 'Whether operation authorization is required (0 is not required (default), 1 is required)',
  `menuSeq` tinyint(3) NOT NULL COMMENT 'Position sort',
  `menuIco` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(3) NOT NULL COMMENT 'Menu status (0 is invalid, 1 is valid)',
  `isOpen` tinyint(3) NULL DEFAULT 0 COMMENT ' Only valid for level 2 menu. 0 closes, 1 opens',
  `isShow` tinyint(3) NULL DEFAULT NULL COMMENT 'whether to display (0--no 1--yes)',
  `componentSrc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Component ID (used separately before and after)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Menu table' ROW_FORMAT=Dynamic;

------------------------------
-- Records of t_authority_menu
------------------------------
INSERT INTO `t_authority_menu` VALUES (1, NULL, 'COMPANY', 'Sys', 'sysadmin test', '/sys', 0, 1, 0, 'example', 1, 0, 1, 'Layout') ;
INSERT INTO `t_authority_menu` VALUES (2, 1, 'COMPANY', 'SysAdmin', 'User Admin', '/sys/admin', 0, 1, 0, 'table', 1, 0, 1, '/sysAdmin /index');
INSERT INTO `t_authority_menu` VALUES (3, 1, 'COMPANY', 'SysAccess', 'menu management', 'access', 0, 1, 2, 'table', 1, 0, 1, '/sysAccess/index' );
INSERT INTO `t_authority_menu` VALUES (4, 1, 'COMPANY', 'SysRole', 'role management', 'role', 0, 1, 1, 'table', 1, 0, 1, '/sysRole/index' );
INSERT INTO `t_authority_menu` VALUES (5, 1, 'COMPANY', 'authorityMenu', 'authority menu management', '/authorityMenu.*', 0, 1, 1, 'table', 1, 0, 1, '/ authorityMenu/index');
INSERT INTO `t_authority_menu` VALUES (6, 1, 'COMPANY', 'authorityInstitution', 'authorityInstitution', '/authorityInstitution.*', 0, 1, 1, 'table', 1, 0, 1, '/ authorityInstitution/index');
INSERT INTO `t_authority_menu` VALUES (7, 1, 'COMPANY', 'authorityRole', 'authority role management list', '/authorityRole.*', 0, 1, 1, 'table', 1, 0, 1, ' /authorityRole/index');
INSERT INTO `t_authority_menu` VALUES (8, 1, 'COMPANY', 'authorityUser', 'system operation user management', '/authorityUser.*', 0, 1, 1, 'table', 1, 0, 1, ' /authorityUser/index');
INSERT INTO `t_authority_menu` VALU