/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : book_drift

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2016-05-04 22:32:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `username` varchar(64) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL,
  `salt` char(128) NOT NULL,
  `email` varchar(64) NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('001', 'zzz', '1q2yCAVoDjlw7n0t26FN1A==', '001@pku.edu.cn');
INSERT INTO `account` VALUES ('002', 'zzz', 'dgB6BFElVchmoJKRh4lyVA==', '002@pku.edu.cn');
INSERT INTO `account` VALUES ('003', 'zzz', 'dGsLVbiyXWQ+qW627VxL4w==', '003@pku.edu.cn');
INSERT INTO `account` VALUES ('004', 'zzz', 'BCpk7qJB+BRUYMYaM7nbJw==', '004@pku.edu.cn');
INSERT INTO `account` VALUES ('005', 'zzz', 'fGkP8nguwqHFJi7G2fGBVw==', '005@pku.edu.cn');
INSERT INTO `account` VALUES ('006', 'zzz', '7V070ybbFDB1MniYqcv8HA==', '006@pku.edu.cn');
INSERT INTO `account` VALUES ('007', 'zzz', 'RHycgPKLWGNPAV5qy0OlFQ==', '007@pku.edu.cn');
INSERT INTO `account` VALUES ('008', 'zzz', 'pfOLKWxTY7fCIGr3/Xf0sg==', '008@pku.edu.cn');
INSERT INTO `account` VALUES ('009', 'zzz', 'm/plZZTQq5WYXwUIFNBDwg==', '009@pku.edu.cn');
INSERT INTO `account` VALUES ('010', 'zzz', 'UKcfh462faImzD5W/HI0tQ==', '010@pku.edu.cn');
INSERT INTO `account` VALUES ('011', 'zzz', 'LIo6nTyTsYEgu9LR5e/13w==', '011@pku.edu.cn');
INSERT INTO `account` VALUES ('012', 'zzz', '8iXG0rk9dfjjd6f7ass7xQ==', '012@pku.edu.cn');
INSERT INTO `account` VALUES ('013', 'zzz', 'AWbGeBUcFMcgrI2LZ/7C1A==', '013@pku.edu.cn');
INSERT INTO `account` VALUES ('014', 'zzz', '/tsVGJHl2Tw5lzXiPkO4Ng==', '014@pku.edu.cn');
INSERT INTO `account` VALUES ('015', 'zzz', 'ZlZds3mejMyhd003ImNkNw==', '015@pku.edu.cn');
INSERT INTO `account` VALUES ('daniel', 'zzz', 'EX2tfxfrk9fRhGPixobr2g==', 'perseids10@139.com');
INSERT INTO `account` VALUES ('david', 'abcdefg', 'Un Know', '123@pku.edu.cn');
INSERT INTO `account` VALUES ('davidblus', 'davidblus', 'Un Know', 'davidblus@pku.edu.cn');
INSERT INTO `account` VALUES ('hitler', 'zzz', 'OX23paHWBbnfqWgriBihng==', 'hitler@king.de');
INSERT INTO `account` VALUES ('suitmyself', '12345', 'Un Know', '1100011608@pku.edu.cn');
INSERT INTO `account` VALUES ('suitmyself2', '1234', 'Un Know', '1100011608@pku');

-- ----------------------------
-- Table structure for `add_friend_request`
-- ----------------------------
DROP TABLE IF EXISTS `add_friend_request`;
CREATE TABLE `add_friend_request` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_username` varchar(64) DEFAULT NULL,
  `to_username` varchar(64) DEFAULT NULL,
  `message` text,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of add_friend_request
-- ----------------------------
INSERT INTO `add_friend_request` VALUES ('1', '2014-06-21 16:07:26', 'suitmyself2', 'suitmyself', '你好', '1');
INSERT INTO `add_friend_request` VALUES ('2', '2014-06-21 16:09:17', 'suitmyself2', 'suitmyself', '', '1');
INSERT INTO `add_friend_request` VALUES ('3', '2016-05-04 17:14:01', 'davidblus', '001', '', null);

-- ----------------------------
-- Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `articleID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT NULL,
  `sharetime` datetime DEFAULT NULL,
  `article_title` varchar(255) DEFAULT NULL,
  `article_details` text,
  `article_score` double DEFAULT NULL,
  `bookName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`articleID`),
  KEY `username` (`username`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`username`) REFERENCES `account` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '001', '2016-05-04 22:26:56', 'test', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbbbbbbbbbbccccccccccccccccccccccdddddddddddddddddddddddddddddeeeeeeeeeeee', '10', 'what the fuck!');
INSERT INTO `article` VALUES ('2', '002', '2016-05-04 22:27:38', 'hello', 'fff', '2', 'fff');

-- ----------------------------
-- Table structure for `ask_drift`
-- ----------------------------
DROP TABLE IF EXISTS `ask_drift`;
CREATE TABLE `ask_drift` (
  `ask_driftID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT NULL,
  `ask_time` datetime DEFAULT NULL,
  `ask_infor` varchar(255) DEFAULT NULL,
  `ask_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`ask_driftID`),
  KEY `username` (`username`),
  CONSTRAINT `ask_drift_ibfk_1` FOREIGN KEY (`username`) REFERENCES `account` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ask_drift
-- ----------------------------
INSERT INTO `ask_drift` VALUES ('1', '004', '2016-05-04 22:28:14', '求求求', '1');
INSERT INTO `ask_drift` VALUES ('2', 'suitmyself', '2016-05-04 22:28:31', 'ask ask', '2');

-- ----------------------------
-- Table structure for `book`
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `bookID` int(11) NOT NULL AUTO_INCREMENT,
  `ISBN` varchar(20) DEFAULT NULL,
  `bookName` varchar(20) DEFAULT NULL,
  `author` varchar(20) DEFAULT NULL,
  `publishment` varchar(50) DEFAULT NULL,
  `publish_time` datetime DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL,
  `own_username` varchar(64) DEFAULT NULL,
  `now_username` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`bookID`),
  KEY `own_username` (`own_username`),
  KEY `now_username` (`now_username`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`own_username`) REFERENCES `account` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `book_ibfk_2` FOREIGN KEY (`now_username`) REFERENCES `account` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', '99937-0-014-2', 'test', 'david', 'peking university', '2016-05-04 22:19:34', '0', '001', '001');

-- ----------------------------
-- Table structure for `friend_pair`
-- ----------------------------
DROP TABLE IF EXISTS `friend_pair`;
CREATE TABLE `friend_pair` (
  `username1` varchar(64) NOT NULL DEFAULT '',
  `username2` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`username1`,`username2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of friend_pair
-- ----------------------------
INSERT INTO `friend_pair` VALUES ('suitmyself', 'suitmyself2');
INSERT INTO `friend_pair` VALUES ('suitmyself2', 'suitmyself');

-- ----------------------------
-- Table structure for `post`
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `re_id` int(11) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `content` text,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES ('1', '-1', 'suitmyself', '2014-06-21 16:04:31', '发表一条状态');
INSERT INTO `post` VALUES ('2', '1', 'suitmyself', '2014-06-21 16:04:42', '回复一下');
INSERT INTO `post` VALUES ('3', '1', 'suitmyself2', '2014-06-21 16:10:10', '我来回复一下');
INSERT INTO `post` VALUES ('4', '-1', 'suitmyself', '2014-06-21 16:19:53', '在发表一条状态\n');
INSERT INTO `post` VALUES ('5', '4', 'suitmyself', '2014-06-21 16:22:17', '你好啊');
INSERT INTO `post` VALUES ('6', '-1', 'suitmyself', '2015-03-21 20:04:16', '傻逼');
INSERT INTO `post` VALUES ('7', '-1', 'suitmyself', '2015-06-13 13:35:11', '闲来无事');
INSERT INTO `post` VALUES ('8', '-1', 'davidblus', '2016-05-04 17:15:41', 'df dfg dfg');
INSERT INTO `post` VALUES ('9', '-1', 'davidblus', '2016-05-04 17:16:32', 'fgdfg ');
INSERT INTO `post` VALUES ('10', '-1', 'davidblus', '2016-05-04 18:56:55', 'fafaf');

-- ----------------------------
-- Table structure for `put_drift`
-- ----------------------------
DROP TABLE IF EXISTS `put_drift`;
CREATE TABLE `put_drift` (
  `put_driftID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT NULL,
  `put_time` datetime DEFAULT NULL,
  `bookID` int(11) DEFAULT NULL,
  PRIMARY KEY (`put_driftID`),
  KEY `username` (`username`),
  KEY `bookID` (`bookID`),
  CONSTRAINT `put_drift_ibfk_1` FOREIGN KEY (`username`) REFERENCES `account` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `put_drift_ibfk_2` FOREIGN KEY (`bookID`) REFERENCES `book` (`bookID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of put_drift
-- ----------------------------
INSERT INTO `put_drift` VALUES ('1', 'davidblus', '2016-05-04 22:28:51', '1');

-- ----------------------------
-- Table structure for `system_message`
-- ----------------------------
DROP TABLE IF EXISTS `system_message`;
CREATE TABLE `system_message` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) DEFAULT NULL,
  `content` text,
  `to_username` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_message
-- ----------------------------
INSERT INTO `system_message` VALUES ('1', '2014-06-21 16:06:21', '1', 'suitmyself2,welcome to our SNS webSite, the webSite is designed by WeiChen and HanDong, enjoy it and good luck!', 'suitmyself2');
INSERT INTO `system_message` VALUES ('2', '2014-06-21 16:07:44', '1', 'suitmyself now is your friend!!! Remerber to contact with him/her!', 'suitmyself2');
INSERT INTO `system_message` VALUES ('3', '2014-06-21 16:07:44', '1', 'suitmyself2 now is your friend!!! Remerber to contact with him/her!', 'suitmyself');
INSERT INTO `system_message` VALUES ('4', '2016-05-04 16:16:20', '1', 'davidblus,welcome to our SNS webSite, the webSite is designed by WeiChen and HanDong, enjoy it and good luck!', 'davidblus');
INSERT INTO `system_message` VALUES ('5', '2016-05-04 19:14:40', '0', 'david,welcome to our SNS webSite, the webSite is designed by WeiChen and HanDong, enjoy it and good luck!', 'david');

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `username` varchar(64) NOT NULL DEFAULT '',
  `realname` varchar(64) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `photo` blob,
  `birthday` date DEFAULT NULL,
  `university` varchar(64) DEFAULT NULL,
  `school` varchar(64) DEFAULT NULL,
  `major` varchar(64) DEFAULT NULL,
  `entry_year` year(4) DEFAULT NULL,
  `signature` text,
  `sig_update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `user_info_ibfk_1` FOREIGN KEY (`username`) REFERENCES `account` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('001', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('002', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('003', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('004', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('005', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('006', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('007', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('008', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('009', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('010', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('011', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('012', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('013', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('014', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('015', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('daniel', 'Daniel Dong', '1', null, '1992-02-02', 'Peking University', 'School of Foundational Education', 'Biomedical English', '2011', null, null);
INSERT INTO `user_info` VALUES ('david', null, '1', null, null, null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('davidblus', null, '1', null, null, null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('hitler', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('suitmyself', 'null', '1', null, '1900-01-01', 'peking university', '', 'null', null, '醉过才知酒浓，爱过才知情重，我不能做你的诗，正如你不能做我的梦。', null);
INSERT INTO `user_info` VALUES ('suitmyself2', null, '1', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `user_step`
-- ----------------------------
DROP TABLE IF EXISTS `user_step`;
CREATE TABLE `user_step` (
  `user_stepID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT NULL,
  `bookID` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_stepID`),
  KEY `user_step_ibfk_1` (`username`),
  KEY `user_step_ibfk_2` (`bookID`),
  CONSTRAINT `user_step_ibfk_1` FOREIGN KEY (`username`) REFERENCES `account` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_step_ibfk_2` FOREIGN KEY (`bookID`) REFERENCES `book` (`bookID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_step
-- ----------------------------
INSERT INTO `user_step` VALUES ('1', '001', '1');
INSERT INTO `user_step` VALUES ('2', '002', '1');
