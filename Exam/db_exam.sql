/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : db_exam

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-06-15 17:52:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_exam`
-- ----------------------------
DROP TABLE IF EXISTS `t_exam`;
CREATE TABLE `t_exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `examDate` datetime DEFAULT NULL,
  `moreScore` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `singleScore` int(11) NOT NULL,
  `paperId` int(11) DEFAULT NULL,
  `studentId` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_l14kkd2w86mpy8v2snw37hskx` (`paperId`),
  KEY `FK_sl2v4qucyp0qe9yvnk6icka10` (`studentId`),
  CONSTRAINT `FK_l14kkd2w86mpy8v2snw37hskx` FOREIGN KEY (`paperId`) REFERENCES `t_paper` (`id`),
  CONSTRAINT `FK_sl2v4qucyp0qe9yvnk6icka10` FOREIGN KEY (`studentId`) REFERENCES `t_student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_exam
-- ----------------------------
INSERT INTO `t_exam` VALUES ('1', null, '0', '20', '0', '1', 'JS123');
INSERT INTO `t_exam` VALUES ('2', null, '0', '120', '0', '1', 'JS123');
INSERT INTO `t_exam` VALUES ('3', '2017-02-01 17:59:54', '0', '0', '0', '1', 'JS123');
INSERT INTO `t_exam` VALUES ('4', '2017-02-01 17:59:54', '0', '0', '0', '1', 'JS123');
INSERT INTO `t_exam` VALUES ('5', '2017-02-01 17:59:54', '30', '50', '20', '1', 'JS123');
INSERT INTO `t_exam` VALUES ('6', '2017-02-01 17:59:54', '30', '50', '20', '1', 'JS123');
INSERT INTO `t_exam` VALUES ('7', '2017-02-01 17:59:54', '0', '20', '20', '1', 'JS123');
INSERT INTO `t_exam` VALUES ('8', '2017-02-01 17:59:54', '0', '20', '20', '1', 'JS123');
INSERT INTO `t_exam` VALUES ('9', '2017-02-01 17:59:54', '0', '20', '20', '1', 'JS123');
INSERT INTO `t_exam` VALUES ('10', '2017-02-01 17:59:54', '0', '20', '20', '1', 'JS123');
INSERT INTO `t_exam` VALUES ('11', '2017-02-01 17:59:54', '0', '20', '20', '1', 'JS123');
INSERT INTO `t_exam` VALUES ('13', '2017-02-01 17:59:54', '0', '60', '60', '1', 'JS123');
INSERT INTO `t_exam` VALUES ('14', '2017-02-01 17:59:54', '60', '100', '40', '1', 'JS123');
INSERT INTO `t_exam` VALUES ('15', '2017-02-01 17:59:54', '30', '70', '40', '1', 'JS123');
INSERT INTO `t_exam` VALUES ('16', '2017-02-01 17:59:54', '30', '50', '20', '1', 'JS123');
INSERT INTO `t_exam` VALUES ('17', '2017-02-01 17:59:54', '30', '50', '20', '1', 'JS123');
INSERT INTO `t_exam` VALUES ('18', '2017-02-01 17:59:54', '30', '50', '20', '1', 'JS123');
INSERT INTO `t_exam` VALUES ('19', '2017-02-01 17:59:54', '0', '20', '20', '1', 'JS123');

-- ----------------------------
-- Table structure for `t_manager`
-- ----------------------------
DROP TABLE IF EXISTS `t_manager`;
CREATE TABLE `t_manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_manager
-- ----------------------------
INSERT INTO `t_manager` VALUES ('1', '管理员', '123456', 'admin');

-- ----------------------------
-- Table structure for `t_paper`
-- ----------------------------
DROP TABLE IF EXISTS `t_paper`;
CREATE TABLE `t_paper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `joinDate` datetime DEFAULT NULL,
  `paperName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_paper
-- ----------------------------
INSERT INTO `t_paper` VALUES ('1', '2017-02-01 17:59:54', 'Java试卷一');
INSERT INTO `t_paper` VALUES ('2', '2017-02-01 17:59:54', '语文试卷二');
INSERT INTO `t_paper` VALUES ('3', '2017-02-01 17:59:54', '数学试卷一');

-- ----------------------------
-- Table structure for `t_question`
-- ----------------------------
DROP TABLE IF EXISTS `t_question`;
CREATE TABLE `t_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` varchar(255) DEFAULT NULL,
  `joinTime` datetime DEFAULT NULL,
  `optionA` varchar(255) DEFAULT NULL,
  `optionB` varchar(255) DEFAULT NULL,
  `optionC` varchar(255) DEFAULT NULL,
  `optionD` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `paperId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ebouwob97chiilpjmc6gtgwkw` (`paperId`),
  CONSTRAINT `FK_ebouwob97chiilpjmc6gtgwkw` FOREIGN KEY (`paperId`) REFERENCES `t_paper` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_question
-- ----------------------------
INSERT INTO `t_question` VALUES ('1', 'D', '2017-02-01 17:59:54', 'A. a1', 'B. $1', 'C. _1', 'D .11', '下列不可作为java语言修饰符的是？', '1', '1');
INSERT INTO `t_question` VALUES ('2', 'A', '2017-02-01 17:59:54', 'A. a1.java', 'B. a.class', 'C. a1', 'D. 都可以', '有一段java应用程序，它的主类名是a1，那么保存 它的源文件名可以是？', '1', '1');
INSERT INTO `t_question` VALUES ('3', 'A,B', '2017-02-01 17:59:54', 'A. String []a', 'B. String a[]', 'C. char a[][]', 'D. String a[10]', '下面正确声明一个一维数组的是？', '2', '1');
INSERT INTO `t_question` VALUES ('4', 'A,D', '2017-02-01 17:59:54', 'A. 在java中只允许单继承。', 'B. 在java中一个类只能实现一个接口。', 'C. 在java中一个类不能同时继承一个类和实现一个接口。', 'D. java的单一继承使代码更可靠。', '下面关于继承的叙述哪些是正确的？', '2', '1');
INSERT INTO `t_question` VALUES ('5', 'C', '2017-02-01 17:59:54', 'A. 一个子类可以有多个父类，一个父类也可以有多个子类', 'B. 一个子类可以有多个父类，但一个父类只可以有一个子类', 'C. 一个子类可以有一个父类，但一个父类可以有多个子类', 'D. 上述说法都不对', '在Java中？', '1', '1');
INSERT INTO `t_question` VALUES ('6', 'A,D', '2017-02-01 17:59:54', 'A. 包的声明必须是源文件的第一句代码。', 'B. 包的声明必须紧跟在import语句的后面。', 'C. 只有公共类才能放在包中。', 'D. 可以将多个源文件中的类放在同一个包中。', '可以将多个源文件中的类放在同一个包中？', '2', '1');
INSERT INTO `t_question` VALUES ('7', 'C', '2017-02-01 17:59:54', 'A. Java是跨平台的编程语言', 'B. Java支持分布式计算', 'C. Java是面向过程的编程语言', 'D. Java是面向对象的编程语言', '下列关于Java语言的特点，描述错误的是？', '1', '1');
INSERT INTO `t_question` VALUES ('14', 'A', '2017-02-01 17:59:54', '1', '21', '3', '4', 'q', '1', '2');
INSERT INTO `t_question` VALUES ('16', 'A,B', '2017-02-01 17:59:54', '1122', '2223', '3322', '4422', '测试题目2', '2', '2');
INSERT INTO `t_question` VALUES ('17', 'A,D', '2017-02-01 17:59:54', '2321', '321', '321', '321', '测试题目', '2', '1');
INSERT INTO `t_question` VALUES ('18', 'A,D', '2017-02-01 17:59:54', '1114', '2224', '3334', '4444', '测试题目2233', '2', '1');

-- ----------------------------
-- Table structure for `t_student`
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student` (
  `id` varchar(40) NOT NULL,
  `cardNo` varchar(50) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `prefession` varchar(40) DEFAULT NULL,
  `sex` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student` VALUES ('JS110', '1616516165161615616', '阿三发', '123456', '软件', '男');
INSERT INTO `t_student` VALUES ('JS123', '21321321', '张三', '1234', '计算机', '男');
INSERT INTO `t_student` VALUES ('JS124', '221321', '李四', '1234', '网络', '女');
INSERT INTO `t_student` VALUES ('JS125', null, null, null, null, null);
INSERT INTO `t_student` VALUES ('JS1252', null, null, null, null, null);
INSERT INTO `t_student` VALUES ('JS1253', null, null, null, null, null);
INSERT INTO `t_student` VALUES ('JS1254', null, null, null, null, null);
INSERT INTO `t_student` VALUES ('JS1255', null, null, null, null, null);
INSERT INTO `t_student` VALUES ('JS1256', null, null, null, null, null);
INSERT INTO `t_student` VALUES ('JS126', null, null, null, null, null);
INSERT INTO `t_student` VALUES ('JS127', null, null, null, null, null);
INSERT INTO `t_student` VALUES ('JS20140701094518', '21', '张三2', '21', '21', '男');
INSERT INTO `t_student` VALUES ('JS20140701094708', '22', '11', '344', '33', '男');
INSERT INTO `t_student` VALUES ('JS20140701094728', '223', '113', '34433', '3333', '女');
INSERT INTO `t_student` VALUES ('JS20140704052827', 'fa', 'fda2', 'fda', 'fda', '男');
INSERT INTO `t_student` VALUES ('Js20170607104040', 'asfasf', '查娜', 'sdgs', '阿三', '男');
