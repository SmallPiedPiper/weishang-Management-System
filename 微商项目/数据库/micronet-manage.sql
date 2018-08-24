/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50527
Source Host           : 127.0.0.1:3306
Source Database       : micronet-manage

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2017-12-28 23:48:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `notice_id` varchar(32) DEFAULT NULL COMMENT '公告Id',
  `title` varchar(32) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `image` varchar(320) DEFAULT NULL COMMENT '图片',
  `user_id` varchar(32) DEFAULT NULL COMMENT '发布人id',
  `state` char(1) DEFAULT NULL COMMENT '逻辑删除',
  `create_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` varchar(32) NOT NULL COMMENT '产品id',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户id',
  `product_name` varchar(20) DEFAULT NULL COMMENT '产品名称',
  `product_desc` text COMMENT '产品描述',
  `product_price_two` double(10,2) DEFAULT NULL COMMENT '二级代理价格',
  `product_price_three` double(10,2) DEFAULT NULL COMMENT '三级代理单价',
  `sort_id` varchar(32) DEFAULT NULL COMMENT '类别id',
  `state` char(1) DEFAULT NULL COMMENT '逻辑删除',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------

-- ----------------------------
-- Table structure for purchase_notice
-- ----------------------------
DROP TABLE IF EXISTS `purchase_notice`;
CREATE TABLE `purchase_notice` (
  `purchase_notice_id` varchar(32) NOT NULL COMMENT '购买通知Id',
  `state` char(1) DEFAULT NULL COMMENT '状态，0：未处理，1：同意，2：拒绝',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`purchase_notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchase_notice
-- ----------------------------

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart` (
  `shopping_cart_id` varchar(32) NOT NULL,
  `product_id` varchar(32) DEFAULT NULL COMMENT '产品Id',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户Id',
  `state` char(1) DEFAULT NULL COMMENT '状态，1 未付费 2 已付费',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`shopping_cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------

-- ----------------------------
-- Table structure for sort_list
-- ----------------------------
DROP TABLE IF EXISTS `sort_list`;
CREATE TABLE `sort_list` (
  `sort_id` varchar(32) NOT NULL COMMENT '分类id',
  `sort_name` varchar(20) DEFAULT NULL COMMENT '分类名称',
  `num` int(2) DEFAULT NULL COMMENT '序号',
  `state` char(1) DEFAULT NULL COMMENT '逻辑删除',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`sort_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sort_list
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` varchar(32) NOT NULL COMMENT '用户id',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号',
  `email` varchar(20) DEFAULT NULL COMMENT '邮箱',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `integral` int(5) DEFAULT NULL COMMENT '积分',
  `identity` char(1) DEFAULT NULL COMMENT '身份:1:一级，2：二级，3：三级',
  `up_agent` varchar(32) DEFAULT NULL COMMENT '上级代理',
  `down_agent` varchar(32) DEFAULT NULL COMMENT '下级代理',
  `state` char(1) DEFAULT NULL COMMENT '逻辑删除，1：未删除，0删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for user_purchase
-- ----------------------------
DROP TABLE IF EXISTS `user_purchase`;
CREATE TABLE `user_purchase` (
  `user_purchase_id` varchar(32) NOT NULL COMMENT '用户购买id',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户Id',
  `product_id` varchar(32) DEFAULT NULL COMMENT '产品id',
  `logistics_number` varchar(32) DEFAULT NULL COMMENT '物流单号',
  `mark` char(1) DEFAULT NULL COMMENT '标志，0：拒绝，1，未发货，2已发货',
  `number` int(2) DEFAULT NULL COMMENT '数量',
  `purchase_nitice_id` varchar(32) DEFAULT NULL COMMENT '购买通知',
  `state` char(1) DEFAULT NULL COMMENT '逻辑删除',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`user_purchase_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_purchase
-- ----------------------------
