/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : web_education

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-12-16 16:16:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `course_id` int(10) NOT NULL AUTO_INCREMENT,
  `course_num` varchar(8) NOT NULL,
  `course_name` varchar(20) DEFAULT NULL,
  `course_type` varchar(4) DEFAULT NULL,
  `course_exam` varchar(4) DEFAULT NULL,
  `course_credit` float DEFAULT NULL,
  `course_explain` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`course_id`,`course_num`),
  KEY `course_id` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '002C1061', '大学英语', '必修', '考试', '3', '');
INSERT INTO `course` VALUES ('2', '002C1062', '大学英语', '必修', '考试', '4', '');
INSERT INTO `course` VALUES ('3', '002C1063', '大学英语', '必修', '考试', '4', '');
INSERT INTO `course` VALUES ('4', '002C1064', '大学英语', '必修', '考试', '4', '');
INSERT INTO `course` VALUES ('5', '004A3280', ' 自动控制原理', '任选', '考试', '3', null);
INSERT INTO `course` VALUES ('6', '005A1080', ' 数字电路与逻辑设计', '必修', '考试', '4', null);
INSERT INTO `course` VALUES ('7', '005A1260', ' 数字信号处理', '必修', '考试', '3', null);
INSERT INTO `course` VALUES ('8', '005A1430', ' 信号与系统', '必修', '考试', '4', null);
INSERT INTO `course` VALUES ('9', '005A1510', ' 电路分析基础Ⅰ', '必修', '考试', '3', null);
INSERT INTO `course` VALUES ('10', '005C3090', ' 电子系统EDA', '任选', '考试', '2', null);
INSERT INTO `course` VALUES ('11', '005C3100', ' 数字图象处理', '任选', '考查', '2', null);
INSERT INTO `course` VALUES ('12', '006A1050', ' 计算机组成原理课程设计', '必修', '考查', '2', '1-2周');
INSERT INTO `course` VALUES ('13', '006A1060', ' 数据结构', '必修', '考试', '4', null);
INSERT INTO `course` VALUES ('14', '006A1280', ' 认识实习', '必修', '考查', '1', '假期');
INSERT INTO `course` VALUES ('15', '006A1290', ' 生产实习', '必修', '考查', '2', '假期');
INSERT INTO `course` VALUES ('16', '006A1310', ' 数据库课程设计', '必修', '考查', '1', '分散');
INSERT INTO `course` VALUES ('17', '006A1320', ' 毕业设计', '必修', '考查', '16', null);
INSERT INTO `course` VALUES ('18', '006A1330', ' 数据库原理', '必修', '考试', '3', null);
INSERT INTO `course` VALUES ('19', '006A1400', ' 计算机组成原理', '必修', '考试', '3', null);
INSERT INTO `course` VALUES ('20', '006A1410', ' 操作系统', '必修', '考试', '3', null);
INSERT INTO `course` VALUES ('21', '006A1440', ' C++语言程序设计', '必修', '考试', '4', null);
INSERT INTO `course` VALUES ('22', '006A2020', ' 计算方法', '限选', '考查', '3', null);
INSERT INTO `course` VALUES ('23', '006A2140', ' 软件工程', '限选', '考查', '3', null);
INSERT INTO `course` VALUES ('24', '006A2190', ' 编译原理', '限选', '考查', '4', null);
INSERT INTO `course` VALUES ('25', '006A2240', ' 计算机导论', '限选', '考试', '2', '18学生上机');
INSERT INTO `course` VALUES ('26', '006A2250', ' 离散数学', '限选', '考试', '4', null);
INSERT INTO `course` VALUES ('27', '006A2260', ' 汇编语言程序设计', '限选', '考查', '4', null);
INSERT INTO `course` VALUES ('28', '006A2290', '数据库语言及应用', '必修', '考试', '3', null);
INSERT INTO `course` VALUES ('29', '006A2390', 'WEB程序设计', '限选', '考查', '3', null);
INSERT INTO `course` VALUES ('30', '006A2410', ' 接口与通信', '限选', '考试', '3', null);
INSERT INTO `course` VALUES ('31', '006A2420', ' 计算机网络原理', '限选', '考试', '3', null);
INSERT INTO `course` VALUES ('32', '006A2440', ' 应用系统分析与设计', '限选', '考查', '3', null);
INSERT INTO `course` VALUES ('33', '006A2500', ' 面向对象高级程序设计', '限选', '考查', '4', null);
INSERT INTO `course` VALUES ('34', '006A3180', ' 计算机图形学', '任选', '考试', '3', null);
INSERT INTO `course` VALUES ('35', '006A3190', ' 人工智能概论', '任选', '考查', '2', null);
INSERT INTO `course` VALUES ('36', '006A3220', ' 计算机系统结构', '任选', '考查', '2', null);
INSERT INTO `course` VALUES ('37', '006A3250', ' 专业英语', '任选', '考查', '2', null);
INSERT INTO `course` VALUES ('38', '006A3260', ' 多媒体技术原理', '任选', '考查', '3', null);
INSERT INTO `course` VALUES ('39', '006A3270', ' 计算机控制技术', '任选', '考试', '3', null);
INSERT INTO `course` VALUES ('40', '006A3420', ' 网络协议分析与编程', '任选', '考试', '3', null);
INSERT INTO `course` VALUES ('41', '008C1010', ' 工程制图', '必修', '考试', '3', null);
INSERT INTO `course` VALUES ('42', '010C1050', ' 线性代数', '必修', '考查', '2', null);
INSERT INTO `course` VALUES ('43', '010C1070', ' 复变函数', '必修', '考查', '2', null);
INSERT INTO `course` VALUES ('44', '010C1180', ' 概率论与数理统计', '必修', '考查', '3', null);
INSERT INTO `course` VALUES ('45', '010C1281', ' 高等数学', '必修', '考试', '5', '一');
INSERT INTO `course` VALUES ('46', '010C1282', ' 高等数学', '必修', '考试', '5', '一');
INSERT INTO `course` VALUES ('47', '010C1301', ' 大学物理', '必修', '考试', '3', null);
INSERT INTO `course` VALUES ('48', '010C1302', ' 大学物理', '必修', '考试', '3', null);
INSERT INTO `course` VALUES ('49', '010C3050', ' 数学建模', '任选', '考查', '2', null);
INSERT INTO `course` VALUES ('50', '012C1011', ' 体育', '必修', '考查', '2', null);
INSERT INTO `course` VALUES ('51', '012C1012', ' 体育', '必修', '考查', '2', null);
INSERT INTO `course` VALUES ('52', '012C1013', ' 体育', '必修', '考查', '2', null);
INSERT INTO `course` VALUES ('53', '012C1014', ' 体育', '必修', '考查', '2', null);
INSERT INTO `course` VALUES ('54', '012C1020', ' 体育达标', '必修', '考查', '1', null);
INSERT INTO `course` VALUES ('55', '013C1420', ' 马克思主义基本原理', '必修', '考查', '3', null);
INSERT INTO `course` VALUES ('56', '013C1430', ' 中国近现代史纲要', '必修', '考查', '2', null);
INSERT INTO `course` VALUES ('57', '013C1440', ' 思想道德修养与法律基础', '必修', '考查', '3', null);
INSERT INTO `course` VALUES ('58', '013C1460', ' 形势与政策', '必修', '考查', '2', '92课外');
INSERT INTO `course` VALUES ('59', '013C1461', ' 形势与政策', '必修', '考查', '0', null);
INSERT INTO `course` VALUES ('60', '013C1462', ' 形势与政策', '必修', '考查', '0', null);
INSERT INTO `course` VALUES ('61', '013C1463', ' 形势与政策', '必修', '考查', '0', null);
INSERT INTO `course` VALUES ('62', '013C1464', ' 形势与政策', '必修', '考查', '0', null);
INSERT INTO `course` VALUES ('63', '013C1465', ' 形势与政策', '必修', '考查', '0', null);
INSERT INTO `course` VALUES ('64', '013C1466', ' 形势与政策', '必修', '考查', '0', null);
INSERT INTO `course` VALUES ('65', '015C1070', ' 军事训练', '必修', '考查', '1', null);
INSERT INTO `course` VALUES ('66', '015C1080', ' 军事理论', '必修', '考查', '1', '22课外');
INSERT INTO `course` VALUES ('67', '017C1030', ' 大学生健康教育', '必修', '考查', '1', null);
INSERT INTO `course` VALUES ('68', '018C1030', ' 电子实习', '必修', '考查', '2', null);
INSERT INTO `course` VALUES ('69', '018C1511', ' 物理实验', '必修', '考查', '1.5', null);
INSERT INTO `course` VALUES ('70', '018C1512', ' 物理实验', '必修', '考查', '1.5', null);
INSERT INTO `course` VALUES ('71', '018C1810', ' 金工实习', '必修', '考查', '2', null);
INSERT INTO `course` VALUES ('72', '019C2101', ' 大学生职业规划与就业指导', '限选', '考查', '0.5', null);
INSERT INTO `course` VALUES ('73', '019C2102', ' 大学生职业规划与就业指导', '限选', '考查', '0.5', null);

-- ----------------------------
-- Table structure for `dept`
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `dept_id` int(10) NOT NULL AUTO_INCREMENT,
  `dept_num` varchar(2) NOT NULL,
  `dept_name` varchar(16) DEFAULT NULL,
  `dept_explain` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`dept_id`,`dept_num`),
  KEY `dept_id` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', '01', '中文', null);
INSERT INTO `dept` VALUES ('2', '02', '外国语', null);
INSERT INTO `dept` VALUES ('3', '03', '经管', null);
INSERT INTO `dept` VALUES ('4', '04', '交通', null);
INSERT INTO `dept` VALUES ('5', '05', '电子', null);
INSERT INTO `dept` VALUES ('6', '06', '计算机', null);
INSERT INTO `dept` VALUES ('7', '07', '土建', null);
INSERT INTO `dept` VALUES ('8', '08', '机械', null);
INSERT INTO `dept` VALUES ('9', '09', '化工', null);
INSERT INTO `dept` VALUES ('10', '10', '数理', null);
INSERT INTO `dept` VALUES ('11', '11', '政法', null);
INSERT INTO `dept` VALUES ('12', '12', '纺织', null);
INSERT INTO `dept` VALUES ('13', '13', '艺术', null);

-- ----------------------------
-- Table structure for `grade`
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `grade_id` int(10) NOT NULL AUTO_INCREMENT,
  `grade_stuId` int(10) NOT NULL,
  `grade_courseId` int(10) NOT NULL,
  `grade_grade` float DEFAULT NULL,
  `grade_itemId` int(10) NOT NULL,
  `grade_explain` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`grade_id`),
  KEY `grade_stuId` (`grade_stuId`),
  KEY `grade_courseId` (`grade_courseId`),
  KEY `grade_itemId` (`grade_itemId`),
  CONSTRAINT `grade_ibfk_1` FOREIGN KEY (`grade_stuId`) REFERENCES `stu` (`stu_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `grade_ibfk_2` FOREIGN KEY (`grade_courseId`) REFERENCES `course` (`course_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `grade_ibfk_3` FOREIGN KEY (`grade_itemId`) REFERENCES `item` (`item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('1', '1', '4', '69', '2', null);
INSERT INTO `grade` VALUES ('2', '1', '15', '84', '2', null);
INSERT INTO `grade` VALUES ('3', '2', '5', '53', '2', null);
INSERT INTO `grade` VALUES ('4', '2', '16', '84', '2', null);
INSERT INTO `grade` VALUES ('5', '3', '8', '70', '2', null);
INSERT INTO `grade` VALUES ('6', '3', '20', '61', '2', null);
INSERT INTO `grade` VALUES ('7', '4', '13', '62', '2', null);
INSERT INTO `grade` VALUES ('8', '4', '23', '70', '2', null);
INSERT INTO `grade` VALUES ('9', '5', '14', '75', '2', null);
INSERT INTO `grade` VALUES ('10', '5', '31', '93', '2', null);
INSERT INTO `grade` VALUES ('11', '6', '27', '69', '2', null);
INSERT INTO `grade` VALUES ('12', '6', '31', '64', '2', null);
INSERT INTO `grade` VALUES ('13', '7', '38', '69', '2', null);
INSERT INTO `grade` VALUES ('14', '7', '44', '75', '2', null);
INSERT INTO `grade` VALUES ('15', '8', '40', '87', '2', null);
INSERT INTO `grade` VALUES ('16', '8', '53', '77', '2', null);
INSERT INTO `grade` VALUES ('17', '9', '61', '68', '2', null);
INSERT INTO `grade` VALUES ('18', '9', '63', '86', '2', null);
INSERT INTO `grade` VALUES ('19', '10', '68', '75', '2', null);
INSERT INTO `grade` VALUES ('20', '10', '73', '83', '2', null);
INSERT INTO `grade` VALUES ('21', '11', '12', '88', '2', null);
INSERT INTO `grade` VALUES ('22', '11', '72', '69', '2', null);
INSERT INTO `grade` VALUES ('23', '12', '6', '77', '2', null);
INSERT INTO `grade` VALUES ('24', '12', '24', '81', '2', null);
INSERT INTO `grade` VALUES ('25', '13', '46', '89', '2', null);
INSERT INTO `grade` VALUES ('26', '13', '63', '93', '2', null);
INSERT INTO `grade` VALUES ('27', '14', '47', '91', '2', null);
INSERT INTO `grade` VALUES ('28', '14', '73', '99', '2', null);
INSERT INTO `grade` VALUES ('29', '15', '12', '60', '2', null);
INSERT INTO `grade` VALUES ('30', '15', '51', '83', '2', null);
INSERT INTO `grade` VALUES ('31', '16', '24', '25', '2', null);
INSERT INTO `grade` VALUES ('32', '18', '56', '65', '2', null);
INSERT INTO `grade` VALUES ('33', '19', '30', '82', '2', null);
INSERT INTO `grade` VALUES ('34', '19', '59', '64', '2', null);
INSERT INTO `grade` VALUES ('35', '21', '65', '70', '2', null);
INSERT INTO `grade` VALUES ('36', '22', '41', '77', '2', null);
INSERT INTO `grade` VALUES ('37', '23', '16', '77', '2', null);
INSERT INTO `grade` VALUES ('38', '23', '50', '90', '2', null);
INSERT INTO `grade` VALUES ('39', '24', '20', '72', '2', null);
INSERT INTO `grade` VALUES ('40', '24', '57', '81', '2', null);
INSERT INTO `grade` VALUES ('41', '25', '23', '15', '2', null);
INSERT INTO `grade` VALUES ('42', '25', '66', '65', '2', null);
INSERT INTO `grade` VALUES ('43', '26', '31', '80', '2', null);
INSERT INTO `grade` VALUES ('44', '26', '67', '67', '2', null);
INSERT INTO `grade` VALUES ('45', '27', '2', '61', '2', null);
INSERT INTO `grade` VALUES ('46', '27', '31', '85', '2', null);
INSERT INTO `grade` VALUES ('47', '28', '21', '74', '2', null);
INSERT INTO `grade` VALUES ('48', '28', '38', '79', '2', null);
INSERT INTO `grade` VALUES ('49', '29', '40', '76', '2', null);
INSERT INTO `grade` VALUES ('50', '29', '42', '65', '2', null);
INSERT INTO `grade` VALUES ('51', '30', '11', '87', '2', null);
INSERT INTO `grade` VALUES ('52', '30', '30', '78', '2', null);
INSERT INTO `grade` VALUES ('53', '31', '18', '53', '2', null);
INSERT INTO `grade` VALUES ('54', '31', '34', '72', '2', null);
INSERT INTO `grade` VALUES ('55', '32', '19', '70', '2', null);
INSERT INTO `grade` VALUES ('56', '32', '35', '88', '2', null);
INSERT INTO `grade` VALUES ('57', '33', '22', '65', '2', null);
INSERT INTO `grade` VALUES ('58', '33', '36', '76', '2', null);
INSERT INTO `grade` VALUES ('59', '34', '33', '94', '2', null);
INSERT INTO `grade` VALUES ('60', '34', '54', '77', '2', null);
INSERT INTO `grade` VALUES ('61', '35', '37', '75', '2', null);
INSERT INTO `grade` VALUES ('62', '35', '58', '68', '2', null);
INSERT INTO `grade` VALUES ('63', '36', '49', '88', '2', null);
INSERT INTO `grade` VALUES ('64', '37', '1', '88', '2', null);
INSERT INTO `grade` VALUES ('65', '37', '62', '91', '2', null);
INSERT INTO `grade` VALUES ('66', '38', '7', '82', '2', null);
INSERT INTO `grade` VALUES ('67', '38', '23', '92', '2', null);
INSERT INTO `grade` VALUES ('68', '39', '10', '65', '2', null);
INSERT INTO `grade` VALUES ('69', '40', '15', '85', '2', null);
INSERT INTO `grade` VALUES ('70', '40', '45', '88', '2', null);
INSERT INTO `grade` VALUES ('71', '41', '37', '77', '2', null);
INSERT INTO `grade` VALUES ('72', '41', '52', '60', '2', null);
INSERT INTO `grade` VALUES ('73', '42', '49', '83', '2', null);
INSERT INTO `grade` VALUES ('74', '42', '55', '82', '2', null);
INSERT INTO `grade` VALUES ('75', '43', '60', '79', '2', null);
INSERT INTO `grade` VALUES ('76', '43', '62', '83', '2', null);
INSERT INTO `grade` VALUES ('77', '44', '7', '63', '2', null);
INSERT INTO `grade` VALUES ('78', '44', '70', '71', '2', null);
INSERT INTO `grade` VALUES ('79', '46', '10', '92', '2', null);
INSERT INTO `grade` VALUES ('80', '46', '71', '75', '2', null);
INSERT INTO `grade` VALUES ('81', '47', '34', '87', '2', null);
INSERT INTO `grade` VALUES ('82', '47', '69', '62', '2', null);
INSERT INTO `grade` VALUES ('83', '48', '3', '60', '2', null);
INSERT INTO `grade` VALUES ('84', '48', '35', '71', '2', null);
INSERT INTO `grade` VALUES ('85', '50', '9', '71', '2', null);
INSERT INTO `grade` VALUES ('86', '50', '36', '82', '2', null);
INSERT INTO `grade` VALUES ('87', '51', '26', '60', '2', null);
INSERT INTO `grade` VALUES ('88', '51', '39', '63', '2', null);
INSERT INTO `grade` VALUES ('89', '52', '43', '64', '2', null);
INSERT INTO `grade` VALUES ('90', '52', '64', '60', '2', null);
INSERT INTO `grade` VALUES ('91', '53', '33', '70', '2', null);
INSERT INTO `grade` VALUES ('92', '53', '48', '85', '2', null);

-- ----------------------------
-- Table structure for `item`
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `item_id` int(10) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(20) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('1', '2009-2010-1');
INSERT INTO `item` VALUES ('2', '2009-2010-2');

-- ----------------------------
-- Table structure for `stu`
-- ----------------------------
DROP TABLE IF EXISTS `stu`;
CREATE TABLE `stu` (
  `stu_id` int(10) NOT NULL AUTO_INCREMENT,
  `stu_num` varchar(10) NOT NULL,
  `stu_name` varchar(10) DEFAULT NULL,
  `stu_sex` varchar(1) DEFAULT NULL,
  `stu_birth` date DEFAULT NULL,
  `stu_address` varchar(10) DEFAULT NULL,
  `stu_deptId` int(10) DEFAULT NULL,
  `stu_type` varchar(8) DEFAULT NULL,
  `stu_stay` varchar(4) DEFAULT NULL,
  `stu_phone` varchar(7) DEFAULT NULL,
  `stu_photo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`stu_id`,`stu_num`),
  KEY `stu_deptId` (`stu_deptId`),
  KEY `stu_id` (`stu_id`),
  CONSTRAINT `stu_ibfk_1` FOREIGN KEY (`stu_deptId`) REFERENCES `dept` (`dept_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu
-- ----------------------------
INSERT INTO `stu` VALUES ('1', 'AP0803104', '刘树森', '男', '2018-12-16', '广东', '1', '团员', '1', '44522', '');
INSERT INTO `stu` VALUES ('2', 'AP0803105', '侯锦兵', '男', '1989-02-07', '广东', '3', '预备党员', '1', '44522', null);
INSERT INTO `stu` VALUES ('3', 'AP0803106', '胡伟', '男', '1989-02-08', '广东', '3', '团员', '1', '44523', null);
INSERT INTO `stu` VALUES ('4', 'AP0803107', '张元元', '女', '1989-02-09', '湖北', '3', '预备党员', '1', '86912', '');
INSERT INTO `stu` VALUES ('5', 'AP0803108', '余海', '男', '1989-02-10', '江西', '3', '预备党员', '1', '44526', null);
INSERT INTO `stu` VALUES ('6', 'AP0803109', '余信明', '男', '1988-01-13', '广东', '3', '团员', '0', null, null);
INSERT INTO `stu` VALUES ('7', 'AP0803110', '张明新', '男', '1988-01-14', '广东', '3', '团员', '1', '44524', null);
INSERT INTO `stu` VALUES ('8', 'AP0803201', '梁丽', '女', '1988-01-15', '广东', '3', '团员', '1', '86911', null);
INSERT INTO `stu` VALUES ('9', 'AP0803202', '梁添', '男', '1988-01-16', '广东', '3', '团员', '1', '44524', null);
INSERT INTO `stu` VALUES ('10', 'AP0803203', '麦林青', '男', '1988-01-17', '广东', '3', '团员', '1', '44524', null);
INSERT INTO `stu` VALUES ('11', 'AP0803204', '莫达尚', '男', '1988-01-18', '广东', '3', '团员', '1', '44524', null);
INSERT INTO `stu` VALUES ('12', 'AP0803205', '欧扬严', '男', '1988-01-19', '广东', '3', '团员', '1', '44525', null);
INSERT INTO `stu` VALUES ('13', 'AP0803303', '余维明', '男', '1989-02-23', '广东', '3', '团员', '1', '74909', null);
INSERT INTO `stu` VALUES ('14', 'AP0803304', '谭敏儿', '女', '1989-02-24', '广东', '3', '党员', '1', '87078', null);
INSERT INTO `stu` VALUES ('15', 'AP0803305', '伍玉珏', '女', '1988-03-04', '湖南', '3', '团员', '0', null, null);
INSERT INTO `stu` VALUES ('16', 'AP0803307', '区芝颖', '女', '1989-09-16', '江西', '3', '群众', '0', null, null);
INSERT INTO `stu` VALUES ('17', 'AP0803308', '王伟', '男', '1989-10-08', '福建', '3', '预备党员', '0', null, null);
INSERT INTO `stu` VALUES ('18', 'AP0803309', '孙小梅', '女', '1988-06-03', '广东', '3', '群众', '0', null, null);
INSERT INTO `stu` VALUES ('19', 'AP0803310', '李伟新', '男', '1989-04-15', '安徽', '3', '群众', '0', null, null);
INSERT INTO `stu` VALUES ('20', 'AP0803342', '余剑立', '男', '1989-02-22', '广东', '3', '团员', '1', '74909', null);
INSERT INTO `stu` VALUES ('21', 'AP0803503', '余浩然', '男', '1988-01-24', '广东', '3', '预备党员', '1', '44526', null);
INSERT INTO `stu` VALUES ('22', 'AP0803506', '俞威魏', '男', '1988-01-25', '广东', '3', '团员', '1', '44526', null);
INSERT INTO `stu` VALUES ('23', 'AP0803508', '袁斌', '男', '1988-01-26', '广东', '3', '群众', '1', '44526', null);
INSERT INTO `stu` VALUES ('24', 'AP0803509', '张平', '男', '1988-01-27', '重庆', '3', '团员', '1', '44527', null);
INSERT INTO `stu` VALUES ('25', 'AP0803510', '张伟', '男', '1989-02-16', '广东', '3', '群众', '1', '44527', null);
INSERT INTO `stu` VALUES ('26', 'AP0803511', '赵洲明', '男', '1989-02-17', '广东', '3', '团员', '1', '44527', null);
INSERT INTO `stu` VALUES ('27', 'AP0803512', '庄伟', '男', '1989-02-18', '广东', '3', '团员', '1', '44527', null);
INSERT INTO `stu` VALUES ('28', 'AP0803513', '洪彬斌', '男', '1989-02-02', '广东', '3', '团员', '1', '44521', null);
INSERT INTO `stu` VALUES ('29', 'AP0803514', '王泽清', '男', '1989-02-03', '广东', '3', '团员', '1', '44521', null);
INSERT INTO `stu` VALUES ('30', 'AP0803606', '王鑫', '男', '1988-01-20', '广东', '3', '团员', '1', '44525', null);
INSERT INTO `stu` VALUES ('31', 'AP0803607', '刘一民', '男', '1988-01-21', '广东', '3', '团员', '1', '44525', null);
INSERT INTO `stu` VALUES ('32', 'AP0803608', '姚健林', '男', '1988-01-22', '广东', '3', '团员', '1', '44525', null);
INSERT INTO `stu` VALUES ('33', 'AP0803609', '姚燕', '女', '1988-01-23', '湖北', '3', '团员', '1', '86906', null);
INSERT INTO `stu` VALUES ('34', 'AP0803701', '蔡锐钦', '男', '1986-01-12', '广东', '3', '团员', '0', '44531', '');
INSERT INTO `stu` VALUES ('35', 'AP0803702', '蔡智明', '男', '1986-01-13', '广东', '3', '团员', '1', '44520', '');
INSERT INTO `stu` VALUES ('36', 'AP0803703', '洪观正', '男', '1986-01-14', '广东', '3', '团员', '0', '44520', '');
INSERT INTO `stu` VALUES ('37', 'AP0803704', '王亮', '男', '1986-01-15', '湖南', '3', '预备党员', '1', '44520', '');
INSERT INTO `stu` VALUES ('38', 'AP0803705', '万泉河', '男', '1989-01-16', '福建', '3', '群众', '0', '44520', '');
INSERT INTO `stu` VALUES ('39', 'AP0803706', '李小武', '男', '1989-01-17', '广东', '3', '团员', '1', '44521', '');
INSERT INTO `stu` VALUES ('40', 'AP0803707', '张明新', '男', '1989-02-01', '广东', '3', '预备党员', '1', '44521', null);
INSERT INTO `stu` VALUES ('41', 'AP0803808', '罗振铭', '男', '1989-02-04', '广东', '3', '团员', '1', '44522', null);
INSERT INTO `stu` VALUES ('42', 'AP0803809', '邹嵩', '男', '1989-02-19', '广东', '3', '团员', '1', '44512', null);
INSERT INTO `stu` VALUES ('43', 'AP0803810', '李景华', '男', '1989-02-20', '广东', '3', '团员', '1', '44512', null);
INSERT INTO `stu` VALUES ('44', 'AP0803811', '蒋敏燕', '女', '1988-11-21', '湖南', '3', '团员', '0', null, null);
INSERT INTO `stu` VALUES ('45', 'AP0803812', '廖淑华', '女', '1989-02-21', '广东', '3', '团员', '1', '87079', null);
INSERT INTO `stu` VALUES ('46', 'AP0803813', '王青青', '男', '1989-02-05', '福建', '3', '团员', '1', '44523', null);
INSERT INTO `stu` VALUES ('47', 'AP0806301', '余杰伟', '男', '1988-01-12', '广东', '6', '团员', '1', '44523', null);
INSERT INTO `stu` VALUES ('48', 'AP0806302', '区小鹏', '男', '1989-02-25', '广东', '6', '团员', '0', null, null);
INSERT INTO `stu` VALUES ('49', 'AP0806303', '肖明明', '男', '1989-02-26', '广东', '6', '团员', '1', '74908', null);
INSERT INTO `stu` VALUES ('50', 'AP0806304', '季铭军', '男', '1989-02-27', '广东', '6', '团员', '0', null, null);
INSERT INTO `stu` VALUES ('51', 'AP0806305', '靳荣声', '男', '1989-02-28', '广东', '6', '团员', '0', null, null);
INSERT INTO `stu` VALUES ('52', 'AP0806306', '刘文明', '男', '1989-03-01', '广东', '6', '群众', '1', '71908', null);
INSERT INTO `stu` VALUES ('53', 'AP0806307', '谢梦娴', '女', '1987-08-17', '广东', '6', '团员', '0', null, null);
INSERT INTO `stu` VALUES ('57', '1', '1', '男', '2018-12-15', '1', '1', '群众', '1', '1', '1');
INSERT INTO `stu` VALUES ('59', '2', '2', '男', '2018-12-16', '2', '1', '群众', '1', '', '');

-- ----------------------------
-- Table structure for `teach`
-- ----------------------------
DROP TABLE IF EXISTS `teach`;
CREATE TABLE `teach` (
  `teach_id` int(10) NOT NULL AUTO_INCREMENT,
  `teach_teacherId` int(10) NOT NULL,
  `teach_courseId` int(10) NOT NULL,
  `teach_itemId` int(10) NOT NULL,
  PRIMARY KEY (`teach_id`),
  KEY `teach_teacherId` (`teach_teacherId`),
  KEY `teach_courseId` (`teach_courseId`),
  KEY `teach_itemId` (`teach_itemId`),
  CONSTRAINT `teach_ibfk_1` FOREIGN KEY (`teach_teacherId`) REFERENCES `teacher` (`teacher_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `teach_ibfk_2` FOREIGN KEY (`teach_courseId`) REFERENCES `course` (`course_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `teach_ibfk_3` FOREIGN KEY (`teach_itemId`) REFERENCES `item` (`item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teach
-- ----------------------------
INSERT INTO `teach` VALUES ('1', '4', '6', '2');
INSERT INTO `teach` VALUES ('2', '5', '6', '2');
INSERT INTO `teach` VALUES ('3', '6', '11', '2');
INSERT INTO `teach` VALUES ('4', '7', '24', '2');
INSERT INTO `teach` VALUES ('5', '8', '24', '2');
INSERT INTO `teach` VALUES ('6', '9', '28', '2');
INSERT INTO `teach` VALUES ('7', '10', '28', '2');
INSERT INTO `teach` VALUES ('8', '11', '29', '2');
INSERT INTO `teach` VALUES ('9', '12', '29', '2');
INSERT INTO `teach` VALUES ('10', '13', '34', '2');
INSERT INTO `teach` VALUES ('11', '14', '34', '2');
INSERT INTO `teach` VALUES ('12', '15', '35', '2');
INSERT INTO `teach` VALUES ('13', '16', '35', '2');
INSERT INTO `teach` VALUES ('14', '17', '36', '2');
INSERT INTO `teach` VALUES ('15', '18', '36', '2');
INSERT INTO `teach` VALUES ('16', '21', '18', '2');
INSERT INTO `teach` VALUES ('17', '22', '18', '2');
INSERT INTO `teach` VALUES ('18', '23', '19', '2');
INSERT INTO `teach` VALUES ('19', '24', '19', '2');
INSERT INTO `teach` VALUES ('20', '25', '22', '2');
INSERT INTO `teach` VALUES ('21', '26', '22', '2');
INSERT INTO `teach` VALUES ('22', '27', '33', '2');
INSERT INTO `teach` VALUES ('23', '28', '33', '2');
INSERT INTO `teach` VALUES ('24', '29', '37', '2');
INSERT INTO `teach` VALUES ('25', '30', '37', '2');
INSERT INTO `teach` VALUES ('26', '32', '64', '2');
INSERT INTO `teach` VALUES ('27', '33', '62', '2');

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `teacher_id` int(10) NOT NULL AUTO_INCREMENT,
  `teacher_num` varchar(9) NOT NULL,
  `teacher_name` varchar(10) DEFAULT NULL,
  `teacher_sex` varchar(2) DEFAULT NULL,
  `teacher_pro` varchar(8) DEFAULT NULL,
  `teacher_deptId` int(10) NOT NULL,
  PRIMARY KEY (`teacher_id`,`teacher_num`),
  KEY `teacher_deptId` (`teacher_deptId`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`teacher_deptId`) REFERENCES `dept` (`dept_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', '005000010', '冯小英', '女', '讲师', '5');
INSERT INTO `teacher` VALUES ('2', '005000011', '李华倩', '女', '副教授', '5');
INSERT INTO `teacher` VALUES ('3', '005000012', '张晚秋', '女', '讲师', '5');
INSERT INTO `teacher` VALUES ('4', '005000024', '周敏怡', '女', '讲师', '5');
INSERT INTO `teacher` VALUES ('5', '005000027', '张宏亮', '男', '副教授', '5');
INSERT INTO `teacher` VALUES ('6', '005000028', '钱立峰', '男', '副教授', '5');
INSERT INTO `teacher` VALUES ('7', '006000012', '周忠民', '男', '讲师', '6');
INSERT INTO `teacher` VALUES ('8', '006000013', '秦一平', '女', '教授', '6');
INSERT INTO `teacher` VALUES ('9', '006000014', '徐光明', '男', '教授', '6');
INSERT INTO `teacher` VALUES ('10', '006000015', '赵明生', '男', '教授', '6');
INSERT INTO `teacher` VALUES ('11', '006000016', '曹陆文', '男', '讲师', '6');
INSERT INTO `teacher` VALUES ('12', '006000017', '曹英健', '男', '讲师', '6');
INSERT INTO `teacher` VALUES ('13', '006000018', '马吉新', '女', '讲师', '6');
INSERT INTO `teacher` VALUES ('14', '006000019', '陈秋丽', '女', '副教授', '6');
INSERT INTO `teacher` VALUES ('15', '006000020', '黄晓鹏', '男', '副教授', '6');
INSERT INTO `teacher` VALUES ('16', '006000021', '刘扬', '男', '副教授', '6');
INSERT INTO `teacher` VALUES ('17', '006000022', '黄新华', '男', '副教授', '6');
INSERT INTO `teacher` VALUES ('18', '006000023', '郑志明', '男', '副教授', '6');
INSERT INTO `teacher` VALUES ('19', '006000024', '林文辉', '男', '副教授', '6');
INSERT INTO `teacher` VALUES ('20', '006000025', '刘伟建', '男', '副教授', '6');
INSERT INTO `teacher` VALUES ('21', '006000029', '张维新', '男', '副教授', '6');
INSERT INTO `teacher` VALUES ('22', '006000030', '马明辉', '男', '副教授', '6');
INSERT INTO `teacher` VALUES ('23', '006000031', '郭凤岙', '男', '副教授', '6');
INSERT INTO `teacher` VALUES ('24', '006000032', '何益容', '男', '副教授', '6');
INSERT INTO `teacher` VALUES ('25', '006000033', '张湘建', '男', '副教授', '6');
INSERT INTO `teacher` VALUES ('26', '006000034', '刘玉铭', '女', '副教授', '6');
INSERT INTO `teacher` VALUES ('27', '006000035', '胡志强', '男', '副教授', '6');
INSERT INTO `teacher` VALUES ('28', '006000036', '罗晖怡', '男', '副教授', '6');
INSERT INTO `teacher` VALUES ('29', '006000037', '赵士洲', '男', '讲师', '6');
INSERT INTO `teacher` VALUES ('30', '010000026', '蔡阳', '男', '副教授', '10');
INSERT INTO `teacher` VALUES ('31', '010000037', '区先民', '男', '教授', '10');
INSERT INTO `teacher` VALUES ('32', '013000010', '江东晓', '男', '讲师', '12');
INSERT INTO `teacher` VALUES ('33', '013000025', '李晓健', '男', '副教授', '12');
INSERT INTO `teacher` VALUES ('34', '013000038', '黄锋', '男', '教授', '12');
INSERT INTO `teacher` VALUES ('35', '013000039', '李永亮', '男', '教授', '12');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(10) DEFAULT NULL,
  `user_password` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin');
INSERT INTO `user` VALUES ('2', 'teacher', 'teacher');
INSERT INTO `user` VALUES ('3', 'student', 'student');
INSERT INTO `user` VALUES ('4', '1', '1');
INSERT INTO `user` VALUES ('5', '2', '2');
