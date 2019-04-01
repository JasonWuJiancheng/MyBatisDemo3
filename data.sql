/*
 Navicat Premium Data Transfer

 Source Server         : xamapp_Mysql
 Source Server Type    : MySQL
 Source Server Version : 50626
 Source Host           : localhost:3306
 Source Schema         : mybatis2

 Target Server Type    : MySQL
 Target Server Version : 50626
 File Encoding         : 65001

 Date: 01/04/2019 20:45:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商品名称',
  `price` float(10, 1) NOT NULL COMMENT '商品定价',
  `detail` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '商品描述',
  `pic` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '商品图片',
  `createtime` datetime(0) NOT NULL COMMENT '生产日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES (1, '台式机', 3000.0, '该电脑质量非常好！！！！', NULL, '2015-02-03 13:22:53');
INSERT INTO `items` VALUES (2, '笔记本', 6000.0, '笔记本性能好，质量好！！！！！', NULL, '2015-02-09 13:22:57');
INSERT INTO `items` VALUES (3, '背包', 200.0, '名牌背包，容量大质量好！！！！', NULL, '2015-02-06 13:23:02');

-- ----------------------------
-- Table structure for orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL COMMENT '订单id',
  `items_id` int(11) NOT NULL COMMENT '商品id',
  `items_num` int(11) NULL DEFAULT NULL COMMENT '商品购买数量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_orderdetail_1`(`orders_id`) USING BTREE,
  INDEX `FK_orderdetail_2`(`items_id`) USING BTREE,
  CONSTRAINT `FK_orderdetail_1` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_orderdetail_2` FOREIGN KEY (`items_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------
INSERT INTO `orderdetail` VALUES (1, 3, 1, 1);
INSERT INTO `orderdetail` VALUES (2, 3, 2, 3);
INSERT INTO `orderdetail` VALUES (3, 4, 3, 4);
INSERT INTO `orderdetail` VALUES (4, 4, 2, 3);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '下单用户id',
  `number` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '订单号',
  `createtime` datetime(0) NOT NULL COMMENT '创建订单时间',
  `note` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_orders_1`(`user_id`) USING BTREE,
  CONSTRAINT `FK_orders_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (3, 1, '1000010', '2015-02-04 13:22:35', NULL);
INSERT INTO `orders` VALUES (4, 1, '1000011', '2015-02-03 13:22:41', NULL);
INSERT INTO `orders` VALUES (5, 10, '1000012', '2015-02-12 16:13:23', NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户名称',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '性别',
  `address` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'testUser1', '2014-07-10', '2', '四川眉山');
INSERT INTO `user` VALUES (10, 'testUser2', '2014-07-10', '1', '北京市');
INSERT INTO `user` VALUES (16, 'testUser3', '2014-06-15', '1', '四川成都');
INSERT INTO `user` VALUES (22, 'testUser4', '2012-10-17', '1', '河南郑州');
INSERT INTO `user` VALUES (24, 'JasonWu', '2014-07-10', '1', '河南郑州');
INSERT INTO `user` VALUES (25, 'ChangyuanWu', '2015-01-19', '1', '河南郑州');
INSERT INTO `user` VALUES (26, 'YiyunWang', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
