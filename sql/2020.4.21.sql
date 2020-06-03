/*
 Navicat Premium Data Transfer

 Source Server         : glish
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : city

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 21/04/2020 15:15:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for city_camera
-- ----------------------------
DROP TABLE IF EXISTS `city_camera`;
CREATE TABLE `city_camera`  (
  `camera_id` int(11) NOT NULL AUTO_INCREMENT,
  `camera_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `coordinate_id` int(11) NOT NULL,
  PRIMARY KEY (`camera_id`) USING BTREE,
  INDEX `camera_coordinate_id`(`coordinate_id`) USING BTREE,
  CONSTRAINT `camera_coordinate_id` FOREIGN KEY (`coordinate_id`) REFERENCES `city_coordinate` (`coordinate_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of city_camera
-- ----------------------------
INSERT INTO `city_camera` VALUES (1, '北京', 1);
INSERT INTO `city_camera` VALUES (2, '测试', 1);

-- ----------------------------
-- Table structure for city_city
-- ----------------------------
DROP TABLE IF EXISTS `city_city`;
CREATE TABLE `city_city`  (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` int(11) NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`city_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of city_city
-- ----------------------------
INSERT INTO `city_city` VALUES (1, 1, '上饶市');
INSERT INTO `city_city` VALUES (2, 1, '南昌市');

-- ----------------------------
-- Table structure for city_coordinate
-- ----------------------------
DROP TABLE IF EXISTS `city_coordinate`;
CREATE TABLE `city_coordinate`  (
  `coordinate_id` int(11) NOT NULL AUTO_INCREMENT,
  `latitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `longitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`coordinate_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of city_coordinate
-- ----------------------------
INSERT INTO `city_coordinate` VALUES (1, '116.395645', '39.929986');
INSERT INTO `city_coordinate` VALUES (2, '110.35', '40.00');
INSERT INTO `city_coordinate` VALUES (3, '110', '15');
INSERT INTO `city_coordinate` VALUES (4, '111.25', '32.01');
INSERT INTO `city_coordinate` VALUES (5, '125.112', '45.12');
INSERT INTO `city_coordinate` VALUES (6, '114.12', '24.12');
INSERT INTO `city_coordinate` VALUES (7, '134.148', '45.684');
INSERT INTO `city_coordinate` VALUES (8, '123.456', '15.464');
INSERT INTO `city_coordinate` VALUES (9, '243.125', '12.545');
INSERT INTO `city_coordinate` VALUES (11, '121.125', '45.12');

-- ----------------------------
-- Table structure for city_district
-- ----------------------------
DROP TABLE IF EXISTS `city_district`;
CREATE TABLE `city_district`  (
  `district_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) NULL DEFAULT NULL,
  `district` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`district_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of city_district
-- ----------------------------
INSERT INTO `city_district` VALUES (1, 1, '信州区');
INSERT INTO `city_district` VALUES (2, 2, '南昌县');
INSERT INTO `city_district` VALUES (3, 1, '广丰区');
INSERT INTO `city_district` VALUES (4, 1, '玉山县');

-- ----------------------------
-- Table structure for city_image
-- ----------------------------
DROP TABLE IF EXISTS `city_image`;
CREATE TABLE `city_image`  (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `image_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position_id` int(11) NULL DEFAULT NULL,
  `result_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `coordinate_id` int(11) NULL DEFAULT NULL,
  `image_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`image_id`) USING BTREE,
  INDEX `image_position_id`(`position_id`) USING BTREE,
  INDEX `image_result_id`(`result_id`) USING BTREE,
  INDEX `image_user_id`(`user_id`) USING BTREE,
  INDEX `image_coordinate_id`(`coordinate_id`) USING BTREE,
  CONSTRAINT `image_coordinate_id` FOREIGN KEY (`coordinate_id`) REFERENCES `city_coordinate` (`coordinate_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `image_position_id` FOREIGN KEY (`position_id`) REFERENCES `city_position` (`position_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `image_result_id` FOREIGN KEY (`result_id`) REFERENCES `city_result` (`result_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `image_user_id` FOREIGN KEY (`user_id`) REFERENCES `city_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of city_image
-- ----------------------------
INSERT INTO `city_image` VALUES (4, '测试王五1', 'http://120.26.65.52:80/group1/M00/00/00/rBAc3l6ei-6AZUZuAAAL9PJVLeE894.jpg', '1', '测试王五1', '用户', 1, 1, 7, 3, '2020-04-21 14:00:15');
INSERT INTO `city_image` VALUES (5, '测试王五2', 'http://120.26.65.52:80/group1/M00/00/00/rBAc3l6ekdKAStVPAAAM9FtpgnE479.jpg', '1', '测试王五2', '用户', 1, 1, 7, 4, '2020-04-21 14:25:22');
INSERT INTO `city_image` VALUES (6, '测试李四1', 'http://120.26.65.52:80/group1/M00/00/00/rBAc3l6ekrKAWvheAAALjjG9tY0480.jpg', '1', '测试李四1', '用户', 1, 1, 5, 5, '2020-04-21 14:29:07');
INSERT INTO `city_image` VALUES (7, '测试李四2', 'http://120.26.65.52:80/group1/M00/00/00/rBAc3l6elTWACYAFAAAQrdrJUUU857.jpg', '1', '测试李四2', '用户', 1, 1, 5, 6, '2020-04-21 14:39:48');
INSERT INTO `city_image` VALUES (8, '测试李四3', 'http://120.26.65.52:80/group1/M00/00/00/rBAc3l6elZ2ARxfWAAAM8Go3VuI379.jpg', '1', '测试李四3', '用户', 1, 1, 5, 7, '2020-04-21 14:41:33');
INSERT INTO `city_image` VALUES (10, '测试李四4', 'http://120.26.65.52:80/group1/M00/00/00/rBAc3l6emhqAXTYyAAANIJ_E2Vs085.jpg', '1', '测试李四4', '用户', 1, 1, 5, 9, '2020-04-21 15:00:42');
INSERT INTO `city_image` VALUES (11, '测试李四5', 'http://120.26.65.52:80/group1/M00/00/00/rBAc3l6emvaAYwcNAAANEZ96Jhc929.jpg', '1', '测试李四5', '用户', 1, 1, 5, 11, '2020-04-21 15:04:22');

-- ----------------------------
-- Table structure for city_manager
-- ----------------------------
DROP TABLE IF EXISTS `city_manager`;
CREATE TABLE `city_manager`  (
  `manager_id` int(11) NOT NULL AUTO_INCREMENT,
  `manager_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`manager_id`) USING BTREE,
  UNIQUE INDEX `manager_name`(`manager_name`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of city_manager
-- ----------------------------
INSERT INTO `city_manager` VALUES (1, '张三', '123456', 'http://120.26.65.52:80/group1/M00/00/00/rBAc3l6RhCKANmBPAAIvYDWV9Lg468.jpg', '1746661428@qq.com', '2020-04-11 16:47:31');

-- ----------------------------
-- Table structure for city_message
-- ----------------------------
DROP TABLE IF EXISTS `city_message`;
CREATE TABLE `city_message`  (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `coordinate_id` int(11) NULL DEFAULT NULL,
  `image_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`message_id`) USING BTREE,
  INDEX `message_coordinate_id`(`coordinate_id`) USING BTREE,
  INDEX `message_image_id`(`image_id`) USING BTREE,
  CONSTRAINT `message_coordinate_id` FOREIGN KEY (`coordinate_id`) REFERENCES `city_coordinate` (`coordinate_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `message_image_id` FOREIGN KEY (`image_id`) REFERENCES `city_image` (`image_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of city_message
-- ----------------------------
INSERT INTO `city_message` VALUES (2, '测试', 1, 4);

-- ----------------------------
-- Table structure for city_position
-- ----------------------------
DROP TABLE IF EXISTS `city_position`;
CREATE TABLE `city_position`  (
  `position_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` int(11) NULL DEFAULT NULL,
  `city_id` int(11) NULL DEFAULT NULL,
  `district_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`position_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of city_position
-- ----------------------------
INSERT INTO `city_position` VALUES (1, 1, 1, 1);
INSERT INTO `city_position` VALUES (3, 1, 2, 2);

-- ----------------------------
-- Table structure for city_province
-- ----------------------------
DROP TABLE IF EXISTS `city_province`;
CREATE TABLE `city_province`  (
  `province_id` int(11) NOT NULL AUTO_INCREMENT,
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`province_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of city_province
-- ----------------------------
INSERT INTO `city_province` VALUES (1, '江西省');

-- ----------------------------
-- Table structure for city_result
-- ----------------------------
DROP TABLE IF EXISTS `city_result`;
CREATE TABLE `city_result`  (
  `result_id` int(11) NOT NULL AUTO_INCREMENT,
  `result_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`result_id`) USING BTREE,
  UNIQUE INDEX `result_name`(`result_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of city_result
-- ----------------------------
INSERT INTO `city_result` VALUES (2, '内涝');
INSERT INTO `city_result` VALUES (4, '冰雪');
INSERT INTO `city_result` VALUES (1, '无积水');
INSERT INTO `city_result` VALUES (3, '积水');

-- ----------------------------
-- Table structure for city_user
-- ----------------------------
DROP TABLE IF EXISTS `city_user`;
CREATE TABLE `city_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id(数据库自增)|int',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名(不可重复，用于登录)|varchar(255)',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码|varchar(255)',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像(存url)|varchar(255)',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱(不可重复)|varchar(255)',
  `flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '激活状态(1or2)|char',
  `create_time` datetime(0) NOT NULL COMMENT '注册时间|datetime',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`user_name`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of city_user
-- ----------------------------
INSERT INTO `city_user` VALUES (5, '李四', '123456', 'http://192.168.0.2:80/group1/M00/00/00/wKgAAl6RUWOAUTJ5AAJsqF93I_c166.jpg', '1746661428@qq.com', '1', '2020-04-11 13:10:59');
INSERT INTO `city_user` VALUES (6, '张三', '123456', 'http://120.26.65.52:80/group1/M00/00/00/rBAc3l6RZLmALwgcAAIvYDWV9Lg854.jpg', '344962079@qq.com', '1', '2020-04-11 14:33:29');
INSERT INTO `city_user` VALUES (7, '王五', '123456', 'http://120.26.65.52:80/group1/M00/00/00/rBAc3l6dLy6AfTEHAAamktmMelo212.jpg', '1234567@qq', '1', '2020-04-20 13:12:15');

SET FOREIGN_KEY_CHECKS = 1;
