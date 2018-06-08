/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.40 : Database - ssm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssm` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ssm`;

/*Table structure for table `collect` */

DROP TABLE IF EXISTS `collect`;

CREATE TABLE `collect` (
  `msgId` varchar(50) DEFAULT NULL COMMENT '消息的主键',
  `collectUserId` varchar(50) DEFAULT NULL COMMENT '收藏用户主键',
  `collectUserType` varchar(50) DEFAULT NULL COMMENT '收藏用户类型',
  `collectTime` datetime DEFAULT NULL COMMENT '收藏时间',
  KEY `msg_index` (`msgId`),
  KEY `collectUserId_index` (`collectUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='用户收藏帖子表';

/*Data for the table `collect` */

/*Table structure for table `follow` */

DROP TABLE IF EXISTS `follow`;

CREATE TABLE `follow` (
  `initiativeUserID` varchar(50) DEFAULT NULL COMMENT '主动方用户id',
  `passivityUserId` varchar(50) DEFAULT NULL COMMENT '被动用户id',
  `operationTime` datetime DEFAULT NULL COMMENT '操作时间',
  `initiativeUserType` varchar(50) DEFAULT NULL COMMENT '主动方的用户类型',
  `passivityUserType` varchar(50) DEFAULT NULL COMMENT '被动方的用户类型',
  KEY `initiativeUserID_index` (`initiativeUserID`),
  KEY `passivityUserId_index` (`passivityUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='用户的关注与被关注的关系表';

/*Data for the table `follow` */

insert  into `follow`(`initiativeUserID`,`passivityUserId`,`operationTime`,`initiativeUserType`,`passivityUserType`) values ('c86381c6-3be2-11e8-92ac-c45444ac03ce','6bf40f07-3be3-11e8-92ac-c45444ac03ce',NULL,'student','school'),('c86381c6-3be2-11e8-92ac-c45444ac03ce','a81cfc68-3be2-11e8-92ac-c45444ac03ce',NULL,'student','club'),('a81cfc68-3be2-11e8-92ac-c45444ac03ce','c86381c6-3be2-11e8-92ac-c45444ac03ce',NULL,'club','student'),('6bf40f07-3be3-11e8-92ac-c45444ac03ce','2e2037ba-3be9-11e8-92ac-c45444ac03ce','2018-04-10 13:22:19','student','club'),('6bf40f07-3be3-11e8-92ac-c45444ac03ce','03fa16fc-3be9-11e8-92ac-c45444ac03ce','2018-04-10 13:22:26','student','club'),('6bf40f07-3be3-11e8-92ac-c45444ac03ce','937597ad-3be3-11e8-92ac-c45444ac03ce','2018-04-10 13:22:29','student','school'),('6bf40f07-3be3-11e8-92ac-c45444ac03ce','d265031e-3be2-11e8-92ac-c45444ac03ce','2018-04-10 13:22:33','student','undefined'),('6bf40f07-3be3-11e8-92ac-c45444ac03ce','c86381c6-3be2-11e8-92ac-c45444ac03ce','2018-04-10 13:22:37','student','undefined'),('6bf40f07-3be3-11e8-92ac-c45444ac03ce','a81cfc68-3be2-11e8-92ac-c45444ac03ce','2018-04-10 13:22:39','student','undefined'),('7af8c65e-3be2-11e8-92ac-c45444ac03ce','5589abe8-3be9-11e8-92ac-c45444ac03ce','2018-04-10 13:25:13','student','club'),('7af8c65e-3be2-11e8-92ac-c45444ac03ce','29932a4f-3be3-11e8-92ac-c45444ac03ce','2018-04-10 13:25:26','student','undefined'),('7af8c65e-3be2-11e8-92ac-c45444ac03ce','5119ad3b-3be5-11e8-92ac-c45444ac03ce','2018-04-10 13:25:40','student','school'),('6bf40f07-3be3-11e8-92ac-c45444ac03ce','7af8c65e-3be2-11e8-92ac-c45444ac03ce','2018-04-10 13:50:00','student','student'),('6bf40f07-3be3-11e8-92ac-c45444ac03ce','29932a4f-3be3-11e8-92ac-c45444ac03ce','2018-04-10 16:28:02','student','student');

/*Table structure for table `group` */

DROP TABLE IF EXISTS `group`;

CREATE TABLE `group` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `groupName` varchar(100) DEFAULT NULL COMMENT '分组名字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='分组表';

/*Data for the table `group` */

/*Table structure for table `msg_baseinfo` */

DROP TABLE IF EXISTS `msg_baseinfo`;

CREATE TABLE `msg_baseinfo` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `content` text COMMENT '内容',
  `userId` varchar(50) DEFAULT NULL COMMENT '用户主键',
  `userType` varchar(32) DEFAULT NULL COMMENT '用户类型',
  `contentType` varchar(32) DEFAULT NULL COMMENT '内容类型',
  `transpondMsgId` varchar(50) DEFAULT NULL COMMENT '转发的父类消息主键',
  `releaseTime` datetime DEFAULT NULL COMMENT '发布时间',
  `privilege` varchar(50) DEFAULT NULL COMMENT '权限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='消息的基本信息表';

/*Data for the table `msg_baseinfo` */

insert  into `msg_baseinfo`(`id`,`content`,`userId`,`userType`,`contentType`,`transpondMsgId`,`releaseTime`,`privilege`) values ('00452226-3da4-11e8-aaa8-c45444ac03ce','发布学习讨论在这里才对','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','study',NULL,'2018-04-12 00:18:45','public'),('02c11678-58ff-11e8-add8-c45444ac03ce','测试测试转发','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','default','fdc97259-5115-11e8-991a-c45444ac03ce','2018-05-16 19:48:13','public'),('04864734-5110-11e8-991a-c45444ac03ce','gefds','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','default',NULL,'2018-05-06 17:29:58','public'),('0a96b66d-3da4-11e8-aaa8-c45444ac03ce','找工作不容易','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','job',NULL,'2018-04-12 00:19:02','public'),('1767dd5c-5902-11e8-add8-c45444ac03ce','测试测试转发','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','default','bcd9e793-5900-11e8-add8-c45444ac03ce','2018-05-16 20:10:16','public'),('18b92428-3c83-11e8-92ac-c45444ac03ce','测试就业<img src=\"http://localhost:8888/bysj/base/img/f2.png\" style=\"width:25px;height:25px\"><img src=\"http://localhost:8888/bysj/base/img/f3.png\" style=\"width:25px;height:25px\"><img src=\"http://localhost:8888/bysj/base/img/f4.png\" style=\"width:25px;height:25px\">','6bf40f07-3be3-11e8-92ac-c45444ac03ce','student','job',NULL,'2018-04-10 13:50:41','public'),('19d3feae-510a-11e8-991a-c45444ac03ce','测试测试','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','default',NULL,'2018-05-06 16:47:37','public'),('1b96eb52-5901-11e8-add8-c45444ac03ce','测试测试','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','default','bcd9e793-5900-11e8-add8-c45444ac03ce','2018-05-16 20:03:13','public'),('22ec8012-5115-11e8-991a-c45444ac03ce','EARSGN','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','default',NULL,'2018-05-06 18:06:37','public'),('23829b62-3c83-11e8-92ac-c45444ac03ce','测试社团<img src=\"http://localhost:8888/bysj/base/img/f41.png\" style=\"width:25px;height:25px\"><img src=\"http://localhost:8888/bysj/base/img/f59.png\" style=\"width:25px;height:25px\"><img src=\"http://localhost:8888/bysj/base/img/h43.png\" style=\"width:25px;height:25px\"><img src=\"http://localhost:8888/bysj/base/img/h25.png\" style=\"width:25px;height:25px\"><img src=\"http://localhost:8888/bysj/base/img/h7.png\" style=\"width:25px;height:25px\">','6bf40f07-3be3-11e8-92ac-c45444ac03ce','student','club',NULL,'2018-04-10 13:50:59','public'),('25c58e9c-3bf1-11e8-92ac-c45444ac03ce','坏EVAV哈我；发顺丰哈市；的风景我<br>','c86381c6-3be2-11e8-92ac-c45444ac03ce','student','default',NULL,'2018-04-09 20:25:55','public'),('25ea26cb-58fa-11e8-add8-c45444ac03ce','测试转发<img src=\"http://localhost:8888/bysj/base/img/f20.png\" style=\"width:25px;height:25px\"><img src=\"http://localhost:8888/bysj/base/img/f2.png\" style=\"width:25px;height:25px\">','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','default','6cb75b20-5114-11e8-991a-c45444ac03ce','2018-05-16 19:13:24','public'),('2beda183-5105-11e8-991a-c45444ac03ce','而投入个爱我的钱','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','default',NULL,'2018-05-06 16:12:20','public'),('2cbaf7d4-3c83-11e8-92ac-c45444ac03ce','测试学习交流','6bf40f07-3be3-11e8-92ac-c45444ac03ce','student','study',NULL,'2018-04-10 13:51:15','public'),('3b503077-3bf2-11e8-92ac-c45444ac03ce','额给他任何团队','5589abe8-3be9-11e8-92ac-c45444ac03ce','club','default',NULL,'2018-04-09 20:33:41','public'),('40a696da-3bf1-11e8-92ac-c45444ac03ce','是的vae废话额','d265031e-3be2-11e8-92ac-c45444ac03ce','student','default',NULL,'2018-04-09 20:26:40','public'),('47b6d9c6-510f-11e8-991a-c45444ac03ce','safgrst','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','default',NULL,'2018-05-06 17:24:41','public'),('5554dd88-3bf1-11e8-92ac-c45444ac03ce','啊手机挂封号','29932a4f-3be3-11e8-92ac-c45444ac03ce','student','default',NULL,'2018-04-09 20:27:15','public'),('5c49c022-5104-11e8-991a-c45444ac03ce','犬瘟热','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','default',NULL,'2018-05-06 16:06:31','public'),('6726be84-3bf1-11e8-92ac-c45444ac03ce','啊而韩国vs附近的','937597ad-3be3-11e8-92ac-c45444ac03ce','school','default',NULL,'2018-04-09 20:27:45','private'),('6cb75b20-5114-11e8-991a-c45444ac03ce','qewerfhj','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','default',NULL,'2018-05-06 18:01:31','public'),('74066310-58fe-11e8-add8-c45444ac03ce','测试转发','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','default','22ec8012-5115-11e8-991a-c45444ac03ce','2018-05-16 19:44:13','public'),('7847dadf-3bf1-11e8-92ac-c45444ac03ce','啊如果如果不放','5119ad3b-3be5-11e8-92ac-c45444ac03ce','school','default',NULL,'2018-04-09 20:28:13','public'),('83a6c8df-3ec5-11e8-a93e-c45444ac03ce','fvesrdtfh<img src=\"http://localhost:8888/bysj/base/img/f20.png\" style=\"width:25px;height:25px\"><img src=\"http://localhost:8888/bysj/base/img/f24.png\" style=\"width:25px;height:25px\"><img src=\"http://localhost:8888/bysj/base/img/f4.png\" style=\"width:25px;height:25px\">&nbsp;','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','default',NULL,'2018-04-13 10:51:07','public'),('84a2df59-50e2-11e8-991a-c45444ac03ce','gfds','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','default',NULL,'2018-05-06 12:04:16','public'),('8b481496-58ff-11e8-add8-c45444ac03ce','测试一下不行吗','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','default','22ec8012-5115-11e8-991a-c45444ac03ce','2018-05-16 19:52:02','public'),('8e01d4ac-3bf1-11e8-92ac-c45444ac03ce','儿果然不同','03fa16fc-3be9-11e8-92ac-c45444ac03ce','club','default',NULL,'2018-04-09 20:28:50','public'),('9838dbe8-58f9-11e8-add8-c45444ac03ce','测试测试','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','default','fdc97259-5115-11e8-991a-c45444ac03ce','2018-05-16 19:09:26','public'),('a5987795-3bf1-11e8-92ac-c45444ac03ce','啊干涉然后他','2e2037ba-3be9-11e8-92ac-c45444ac03ce','club','default',NULL,'2018-04-09 20:29:29','public'),('abd99c49-3bf0-11e8-92ac-c45444ac03ce','测试小婚纱放假啊的风景<img src=\"http://localhost:8888/bysj/base/img/f1.png\" style=\"width:25px;height:25px\"><img src=\"http://localhost:8888/bysj/base/img/f2.png\" style=\"width:25px;height:25px\"><img src=\"http://localhost:8888/bysj/base/img/f3.png\" style=\"width:25px;height:25px\">','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','default',NULL,'2018-04-09 20:22:30','public'),('b3767a4e-50e2-11e8-991a-c45444ac03ce','ytr','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','default',NULL,'2018-05-06 12:05:34','public'),('bcd9e793-5900-11e8-add8-c45444ac03ce','测试测试','a81cfc68-3be2-11e8-92ac-c45444ac03ce','student','default',NULL,'2018-05-16 20:00:34','public'),('bd744545-5115-11e8-991a-c45444ac03ce','awretrhgh','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','default',NULL,'2018-05-06 18:10:56','public'),('c2aec3e6-503b-11e8-991a-c45444ac03ce','sdfg','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','default',NULL,'2018-05-05 16:10:23','public'),('c57735a8-5104-11e8-991a-c45444ac03ce','儿童画','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','default',NULL,'2018-05-06 16:09:28','public'),('d08b7ca6-5902-11e8-add8-c45444ac03ce','测试测试测试测试车市场额喜欢吃','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','default','bcd9e793-5900-11e8-add8-c45444ac03ce','2018-05-16 20:15:26','public'),('d145a60f-5111-11e8-991a-c45444ac03ce','啊沙发都是官方代购','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','default',NULL,'2018-05-06 17:42:51','public'),('d6980fcc-5104-11e8-991a-c45444ac03ce','回娘家','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','default',NULL,'2018-05-06 16:09:56','public'),('d7c9f796-5115-11e8-991a-c45444ac03ce','lkujytgrew','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','default',NULL,'2018-05-06 18:11:40','public'),('d92c8306-503b-11e8-991a-c45444ac03ce','hgfds','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','default',NULL,'2018-05-05 16:11:01','public'),('def46018-58f8-11e8-add8-c45444ac03ce','测试测试','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','default',NULL,'2018-05-16 19:04:15','public'),('dfbdb353-3bf0-11e8-92ac-c45444ac03ce','用户即可','a81cfc68-3be2-11e8-92ac-c45444ac03ce','student','default',NULL,'2018-04-09 20:23:57','public'),('e57bd121-5bc0-11e8-888c-c45444ac03ce','测试测试测试<img src=\"http://localhost:8888/bysj/base/img/f24.png\" style=\"width:25px;height:25px\"><img src=\"http://localhost:8888/bysj/base/img/f28.png\" style=\"width:25px;height:25px\"><img src=\"http://localhost:8888/bysj/base/img/f43.png\" style=\"width:25px;height:25px\"><img src=\"http://localhost:8888/bysj/base/img/f39.png\" style=\"width:25px;height:25px\"><img src=\"http://localhost:8888/bysj/base/img/h45.png\" style=\"width:25px;height:25px\"><img src=\"http://localhost:8888/bysj/base/img/h24.png\" style=\"width:25px;height:25px\"><img src=\"http://localhost:8888/bysj/base/img/h26.png\" style=\"width:25px;height:25px\"><img src=\"http://localhost:8888/bysj/base/img/h23.png\" style=\"width:25px;height:25px\"><img src=\"http://localhost:8888/bysj/base/img/h39.png\" style=\"width:25px;height:25px\">','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','default',NULL,'2018-05-20 08:01:08','public'),('e9844a65-3da3-11e8-aaa8-c45444ac03ce','发布社团活动','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','club',NULL,'2018-04-12 00:18:07','public'),('ebcc63e5-5103-11e8-991a-c45444ac03ce','大概烦恼','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','default',NULL,'2018-05-06 16:03:23','public'),('f1a7b790-3da3-11e8-aaa8-c45444ac03ce','发布学习讨论','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','club',NULL,'2018-04-12 00:18:21','public'),('f61800ab-5bbe-11e8-888c-c45444ac03ce','早上测试测试<img src=\"http://localhost:8888/bysj/base/img/f3.png\" style=\"width:25px;height:25px\"><img src=\"http://localhost:8888/bysj/base/img/f4.png\" style=\"width:25px;height:25px\"><img src=\"http://localhost:8888/bysj/base/img/f5.png\" style=\"width:25px;height:25px\"><img src=\"http://localhost:8888/bysj/base/img/f6.png\" style=\"width:25px;height:25px\"><img src=\"http://localhost:8888/bysj/base/img/f7.png\" style=\"width:25px;height:25px\">','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','default',NULL,'2018-05-20 07:47:17','public'),('fa937685-50e1-11e8-991a-c45444ac03ce','hgf','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','default',NULL,'2018-05-06 12:00:24','public'),('fab8049f-5111-11e8-991a-c45444ac03ce','具有洪涛股份','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','default',NULL,'2018-05-06 17:44:01','public'),('fbddd889-58f8-11e8-add8-c45444ac03ce','测试测试','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','default',NULL,'2018-05-16 19:05:04','public'),('fdc97259-5115-11e8-991a-c45444ac03ce','WRetrtcghv','7af8c65e-3be2-11e8-92ac-c45444ac03ce','student','default',NULL,'2018-05-06 18:12:44','public');

/*Table structure for table `msg_comment` */

DROP TABLE IF EXISTS `msg_comment`;

CREATE TABLE `msg_comment` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `msgId` varchar(50) DEFAULT NULL COMMENT '消息主键',
  `userId` varchar(50) DEFAULT NULL COMMENT '评论用户',
  `content` varchar(500) DEFAULT NULL COMMENT '评论内容',
  `userType` varchar(50) DEFAULT NULL COMMENT '评论用户的类型',
  `releaseTime` datetime DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='消息的评论表';

/*Data for the table `msg_comment` */

insert  into `msg_comment`(`id`,`msgId`,`userId`,`content`,`userType`,`releaseTime`) values ('2d392f37-3bf1-11e8-92ac-c45444ac03ce','25c58e9c-3bf1-11e8-92ac-c45444ac03ce','c86381c6-3be2-11e8-92ac-c45444ac03ce','单刷二姐夫','student','2018-04-09 20:26:07'),('434a38a4-3bf1-11e8-92ac-c45444ac03ce','40a696da-3bf1-11e8-92ac-c45444ac03ce','d265031e-3be2-11e8-92ac-c45444ac03ce','啊过生日他呢','student','2018-04-09 20:26:44'),('587e5965-3bf1-11e8-92ac-c45444ac03ce','5554dd88-3bf1-11e8-92ac-c45444ac03ce','29932a4f-3be3-11e8-92ac-c45444ac03ce','I犹太人天天喝','student','2018-04-09 20:27:20'),('6314f050-3c03-11e8-92ac-c45444ac03ce','3b503077-3bf2-11e8-92ac-c45444ac03ce','a81cfc68-3be2-11e8-92ac-c45444ac03ce','测试一下咯','student','2018-04-09 22:36:29'),('63f7a273-3c83-11e8-92ac-c45444ac03ce','2cbaf7d4-3c83-11e8-92ac-c45444ac03ce','7af8c65e-3be2-11e8-92ac-c45444ac03ce','哈哈哈我在这里','student','2018-04-10 13:52:48'),('699a0011-3bf1-11e8-92ac-c45444ac03ce','6726be84-3bf1-11e8-92ac-c45444ac03ce','937597ad-3be3-11e8-92ac-c45444ac03ce','二个外人看见额','school','2018-04-09 20:27:49'),('6b821099-3c03-11e8-92ac-c45444ac03ce','3b503077-3bf2-11e8-92ac-c45444ac03ce','d265031e-3be2-11e8-92ac-c45444ac03ce','测试老李子','student','2018-04-09 22:36:43'),('7ac0cf23-3bf1-11e8-92ac-c45444ac03ce','7847dadf-3bf1-11e8-92ac-c45444ac03ce','5119ad3b-3be5-11e8-92ac-c45444ac03ce','啊热投诉热点提高','school','2018-04-09 20:28:17'),('90ae917d-3bf1-11e8-92ac-c45444ac03ce','8e01d4ac-3bf1-11e8-92ac-c45444ac03ce','03fa16fc-3be9-11e8-92ac-c45444ac03ce','而个很温柔','club','2018-04-09 20:28:54'),('a7d1546f-3bf1-11e8-92ac-c45444ac03ce','a5987795-3bf1-11e8-92ac-c45444ac03ce','2e2037ba-3be9-11e8-92ac-c45444ac03ce','哭教育厅韩国人','club','2018-04-09 20:29:33'),('aab3f2e9-45e0-11e8-bd84-c45444ac03ce','83a6c8df-3ec5-11e8-a93e-c45444ac03ce','7af8c65e-3be2-11e8-92ac-c45444ac03ce','dgfhjj','student','2018-04-22 11:53:07'),('b33c90fb-3bf0-11e8-92ac-c45444ac03ce','abd99c49-3bf0-11e8-92ac-c45444ac03ce','7af8c65e-3be2-11e8-92ac-c45444ac03ce','测试','student','2018-04-09 20:22:43'),('c00ec690-5bbf-11e8-888c-c45444ac03ce','f61800ab-5bbe-11e8-888c-c45444ac03ce','7af8c65e-3be2-11e8-92ac-c45444ac03ce','测试测试','student','2018-05-20 07:52:56'),('de6a07d9-5bbf-11e8-888c-c45444ac03ce','3b503077-3bf2-11e8-92ac-c45444ac03ce','7af8c65e-3be2-11e8-92ac-c45444ac03ce','测试测试','student','2018-05-20 07:53:47'),('e1a5e725-3c5e-11e8-92ac-c45444ac03ce','a5987795-3bf1-11e8-92ac-c45444ac03ce','4ae0a3df-3be3-11e8-92ac-c45444ac03ce','哈哈哈测试测试玩玩','student','2018-04-10 09:31:27'),('e3826576-3bf0-11e8-92ac-c45444ac03ce','dfbdb353-3bf0-11e8-92ac-c45444ac03ce','a81cfc68-3be2-11e8-92ac-c45444ac03ce','还预计','student','2018-04-09 20:24:04'),('fe04c0c3-3c5e-11e8-92ac-c45444ac03ce','8e01d4ac-3bf1-11e8-92ac-c45444ac03ce','4ae0a3df-3be3-11e8-92ac-c45444ac03ce','有什么不同','student','2018-04-10 09:32:14'),('fe61268c-5bbe-11e8-888c-c45444ac03ce','f61800ab-5bbe-11e8-888c-c45444ac03ce','7af8c65e-3be2-11e8-92ac-c45444ac03ce','测试乘车时','student','2018-05-20 07:47:31');

/*Table structure for table `msg_pic` */

DROP TABLE IF EXISTS `msg_pic`;

CREATE TABLE `msg_pic` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `minUrl` varchar(100) DEFAULT NULL COMMENT '小图',
  `url` varchar(100) DEFAULT NULL COMMENT '大图',
  `msgId` varchar(50) DEFAULT NULL COMMENT '消息主键',
  `releaseTime` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='消息的图片表';

/*Data for the table `msg_pic` */

insert  into `msg_pic`(`id`,`minUrl`,`url`,`msgId`,`releaseTime`) values ('1413cc92-4fbe-4bba-a281-0ce64ab31a58',NULL,'http://localhost:8888/images/2b90f71a-d99d-4470-a403-ffd2de7a8fa2.jpg','bd744545-5115-11e8-991a-c45444ac03ce','2018-05-06 18:10:56'),('282d0501-0013-416d-a2ea-1d0c5db20aa5',NULL,'http://localhost:8888/images/7a0e3b2f-f529-4cf4-b4d0-67ca35b3a028.jpg','bd744545-5115-11e8-991a-c45444ac03ce','2018-05-06 18:10:56'),('29175157-5eb5-4074-8fb4-a76121c73733',NULL,'http://localhost:8888/images/a184dbb7-a9ae-47eb-8902-b7c14be94f5f.jpg','02c11678-58ff-11e8-add8-c45444ac03ce','2018-05-16 19:48:13'),('332b456c-da61-4c35-9fae-aeb2d76da849',NULL,'http://localhost:8888/images/10eeb1d8-095e-4fae-8b0c-1c2729b9301a.jpg','fdc97259-5115-11e8-991a-c45444ac03ce','2018-05-06 18:12:44'),('3d962803-b3c3-4644-895a-2b5d803d1ea1',NULL,'http://localhost:8888/images/8f899a62-6738-4bf9-8e56-f6751357a7de.jpg','25ea26cb-58fa-11e8-add8-c45444ac03ce','2018-05-16 19:13:24'),('415e67a2-ec5f-4a31-9be9-cf36858ec390',NULL,'http://localhost:8888/images/4326b808-57e5-428f-bbe7-c10d9e389bc2.jpg','d7c9f796-5115-11e8-991a-c45444ac03ce','2018-05-06 18:11:40'),('422da55f-11b6-43dd-aa2a-41a52dce0266',NULL,'http://localhost:8888/images/53ef939f-99b5-43b3-9987-f7370f3b2efe.jpg','1767dd5c-5902-11e8-add8-c45444ac03ce','2018-05-16 20:10:16'),('44c03598-e46b-41c6-8061-267d6d33b647',NULL,'http://localhost:8888/images/6fbae144-efa7-47c9-89d9-90161097a884.jpg','d08b7ca6-5902-11e8-add8-c45444ac03ce','2018-05-16 20:15:26'),('62d02bf1-c205-4f27-af77-70475ae67f43',NULL,'http://localhost:8888/images/de7598f1-5756-48b3-be72-4808e1184bf2.jpg','22ec8012-5115-11e8-991a-c45444ac03ce','2018-05-06 18:06:37'),('63403bae-efe2-4ebf-8f70-709ecfa66adc',NULL,'http://localhost:8888/images/3d72ac8b-fd6b-42e5-b83b-bf4d77ff10c2.jpg','6cb75b20-5114-11e8-991a-c45444ac03ce','2018-05-06 18:01:31'),('65406e15-b81a-442e-a277-497dca55812f',NULL,'http://localhost:8888/images/5c980f3e-9360-4a3c-9387-47126e88e9cf.jpg','1b96eb52-5901-11e8-add8-c45444ac03ce','2018-05-16 20:03:13'),('66873eed-9a13-4bab-b59f-7a062667103e',NULL,'http://localhost:8888/images/b2ccb9d4-7a6d-4b38-a8ca-c19dd09e1bb8.jpg','def46018-58f8-11e8-add8-c45444ac03ce','2018-05-16 19:04:15'),('80988cfd-b998-4eff-a5c3-f640cbc76ddc',NULL,'http://localhost:8888/images/0ea14ed5-952e-4f06-a885-08ebfea3911b.jpg','e57bd121-5bc0-11e8-888c-c45444ac03ce','2018-05-20 08:01:08'),('8bcc3d84-005d-4e21-aa85-a63dd4788568',NULL,'http://localhost:8888/images/ab08845e-135e-482e-8d12-eb2d7a35f386.jpg','74066310-58fe-11e8-add8-c45444ac03ce','2018-05-16 19:44:13'),('991b873f-9085-4b94-8a89-dc1f438c94c5',NULL,'http://localhost:8888/images/2cb1bd99-6c05-4203-aefc-1c2e74b13d59.jpg','fdc97259-5115-11e8-991a-c45444ac03ce','2018-05-06 18:12:44'),('9f46832c-162b-4d6b-8f4c-d98be5d16f15',NULL,'http://localhost:8888/images/895c44f7-e68d-4d94-b937-b1b75125eb4b.jpg','e57bd121-5bc0-11e8-888c-c45444ac03ce','2018-05-20 08:01:08'),('a8961a0a-d907-44f3-b8dd-5dda6b775f16',NULL,'http://localhost:8888/images/d7e42934-1483-418b-85f9-82e739c06169.jpg','8b481496-58ff-11e8-add8-c45444ac03ce','2018-05-16 19:52:02'),('ad5f800f-8378-48a0-a0db-24bfcc52bd8a',NULL,'http://localhost:8888/images/caa695ce-57b1-47b6-a1c3-8df78d96b7ef.jpg','d7c9f796-5115-11e8-991a-c45444ac03ce','2018-05-06 18:11:40'),('bbe3a607-362e-4863-ac43-6ae446c9f0a8',NULL,'http://localhost:8888/images/e7ad6082-9343-43cb-be22-15de838964ba.jpg','f61800ab-5bbe-11e8-888c-c45444ac03ce','2018-05-20 07:47:17'),('cb12553c-785e-4713-95b0-1864cc083254',NULL,'http://localhost:8888/images/eb4bf724-7ec7-43f1-98be-e827b5f5417f.jpg','9838dbe8-58f9-11e8-add8-c45444ac03ce','2018-05-16 19:09:26'),('e5824ad7-cb8b-4973-9ebc-6e3ec5278fdc',NULL,'http://localhost:8888/images/37cfc53f-ea6a-4ea8-b509-ad89e424d13c.jpg','def46018-58f8-11e8-add8-c45444ac03ce','2018-05-16 19:04:15'),('f4635d40-646c-4adb-9e39-3426628f3da8',NULL,'http://localhost:8888/images/6149d840-57bc-4046-ac0f-f31f8e1ed8d4.jpg','22ec8012-5115-11e8-991a-c45444ac03ce','2018-05-06 18:06:37'),('f56d494f-c63a-441e-a894-653dcec3005f',NULL,'http://localhost:8888/images/661e0b24-6c66-4f94-ba9a-8f5e82710dae.jpg','bcd9e793-5900-11e8-add8-c45444ac03ce','2018-05-16 20:00:34');

/*Table structure for table `msg_referto` */

DROP TABLE IF EXISTS `msg_referto`;

CREATE TABLE `msg_referto` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `msgId` varchar(50) DEFAULT NULL COMMENT '消息主键',
  `UserId` varchar(50) DEFAULT NULL COMMENT '用户主键',
  `userType` varchar(50) DEFAULT NULL COMMENT '用户类型',
  `status` varchar(50) DEFAULT NULL COMMENT '是否已读',
  `releaseTime` datetime DEFAULT NULL COMMENT '发布时间',
  `referType` varchar(50) DEFAULT NULL COMMENT '提及的类型：@，点赞，转发，评论，回复，',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='消息@提及用户表';

/*Data for the table `msg_referto` */

/*Table structure for table `msg_reply` */

DROP TABLE IF EXISTS `msg_reply`;

CREATE TABLE `msg_reply` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `msgCommentId` varchar(50) DEFAULT NULL COMMENT '评论的主键',
  `replyType` varchar(50) DEFAULT NULL COMMENT 'reply_type表示回复的类型，因为回复可以是针对评论的回复(comment)，也可以是针对回复的回复(reply)， 通过这个字段来区分两种情景。',
  `replyId` varchar(50) DEFAULT NULL COMMENT 'reply_id表示回复目标的id，如果reply_type是comment的话，那么reply_id＝评论id，如果reply_type是reply的话，这表示这条回复的父回复的id。',
  `replyTargetUserId` varchar(50) DEFAULT NULL COMMENT '回复目标用户的主键',
  `replyUserId` varchar(50) DEFAULT NULL COMMENT '回复用户主键',
  `replyContent` varchar(500) DEFAULT NULL COMMENT '回复内容',
  `replyTime` datetime DEFAULT NULL COMMENT '回复时间',
  `replyUserType` varchar(50) DEFAULT NULL COMMENT '回复用户类型',
  `replyTargetUserType` varchar(50) DEFAULT NULL COMMENT '回复目标用户类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='消息的回复表';

/*Data for the table `msg_reply` */

insert  into `msg_reply`(`id`,`msgCommentId`,`replyType`,`replyId`,`replyTargetUserId`,`replyUserId`,`replyContent`,`replyTime`,`replyUserType`,`replyTargetUserType`) values ('042fb641-3c1f-11e8-92ac-c45444ac03ce','b33c90fb-3bf0-11e8-92ac-c45444ac03ce','comment','b33c90fb-3bf0-11e8-92ac-c45444ac03ce','7af8c65e-3be2-11e8-92ac-c45444ac03ce','29932a4f-3be3-11e8-92ac-c45444ac03ce','测试好吗','2018-04-10 01:54:16','student','undefined'),('1d7184f6-3c5f-11e8-92ac-c45444ac03ce','e3826576-3bf0-11e8-92ac-c45444ac03ce','reply','e76dd555-3bf0-11e8-92ac-c45444ac03ce','a81cfc68-3be2-11e8-92ac-c45444ac03ce','4ae0a3df-3be3-11e8-92ac-c45444ac03ce','你怎么在自言自语的','2018-04-10 09:33:07','student','student'),('32a53387-3bf1-11e8-92ac-c45444ac03ce','2d392f37-3bf1-11e8-92ac-c45444ac03ce','comment','2d392f37-3bf1-11e8-92ac-c45444ac03ce','c86381c6-3be2-11e8-92ac-c45444ac03ce','c86381c6-3be2-11e8-92ac-c45444ac03ce','师傅哈俄日I噶尔','2018-04-09 20:26:16','student','student'),('4629ee86-3bf1-11e8-92ac-c45444ac03ce','434a38a4-3bf1-11e8-92ac-c45444ac03ce','comment','434a38a4-3bf1-11e8-92ac-c45444ac03ce','d265031e-3be2-11e8-92ac-c45444ac03ce','d265031e-3be2-11e8-92ac-c45444ac03ce','爱海滔滔一句','2018-04-09 20:26:49','student','student'),('4eb91398-3c1f-11e8-92ac-c45444ac03ce','b33c90fb-3bf0-11e8-92ac-c45444ac03ce','reply','bebf4845-3bf0-11e8-92ac-c45444ac03ce','7af8c65e-3be2-11e8-92ac-c45444ac03ce','29932a4f-3be3-11e8-92ac-c45444ac03ce','第二个测试','2018-04-10 01:56:21','student','student'),('5a7fbd3d-3bf1-11e8-92ac-c45444ac03ce','587e5965-3bf1-11e8-92ac-c45444ac03ce','comment','587e5965-3bf1-11e8-92ac-c45444ac03ce','29932a4f-3be3-11e8-92ac-c45444ac03ce','29932a4f-3be3-11e8-92ac-c45444ac03ce','特好男人呀','2018-04-09 20:27:23','student','student'),('603b0e00-3c1f-11e8-92ac-c45444ac03ce','6314f050-3c03-11e8-92ac-c45444ac03ce','comment','6314f050-3c03-11e8-92ac-c45444ac03ce','a81cfc68-3be2-11e8-92ac-c45444ac03ce','29932a4f-3be3-11e8-92ac-c45444ac03ce','测试一下呀大哥','2018-04-10 01:56:50','student','undefined'),('6c721ba8-3bf1-11e8-92ac-c45444ac03ce','699a0011-3bf1-11e8-92ac-c45444ac03ce','comment','699a0011-3bf1-11e8-92ac-c45444ac03ce','937597ad-3be3-11e8-92ac-c45444ac03ce','937597ad-3be3-11e8-92ac-c45444ac03ce','方大同富贵花','2018-04-09 20:27:53','school','school'),('7966842a-3ec8-11e8-a93e-c45444ac03ce','7ac0cf23-3bf1-11e8-92ac-c45444ac03ce','reply','7d0e5add-3bf1-11e8-92ac-c45444ac03ce','5119ad3b-3be5-11e8-92ac-c45444ac03ce','7af8c65e-3be2-11e8-92ac-c45444ac03ce','wsedrtyuj','2018-04-13 11:12:18','student','school'),('7d0e5add-3bf1-11e8-92ac-c45444ac03ce','7ac0cf23-3bf1-11e8-92ac-c45444ac03ce','comment','7ac0cf23-3bf1-11e8-92ac-c45444ac03ce','5119ad3b-3be5-11e8-92ac-c45444ac03ce','5119ad3b-3be5-11e8-92ac-c45444ac03ce','而对于符合国家不能','2018-04-09 20:28:21','school','school'),('7ec8fa59-3ec8-11e8-a93e-c45444ac03ce','7ac0cf23-3bf1-11e8-92ac-c45444ac03ce','comment','7ac0cf23-3bf1-11e8-92ac-c45444ac03ce','5119ad3b-3be5-11e8-92ac-c45444ac03ce','7af8c65e-3be2-11e8-92ac-c45444ac03ce','3we45r6tyu','2018-04-13 11:12:27','student','school'),('91f27fe0-3ec8-11e8-a93e-c45444ac03ce','7ac0cf23-3bf1-11e8-92ac-c45444ac03ce','reply','7966842a-3ec8-11e8-a93e-c45444ac03ce','7af8c65e-3be2-11e8-92ac-c45444ac03ce','7af8c65e-3be2-11e8-92ac-c45444ac03ce','rt6y','2018-04-13 11:12:59','student','student'),('92c6c39b-3bf1-11e8-92ac-c45444ac03ce','90ae917d-3bf1-11e8-92ac-c45444ac03ce','comment','90ae917d-3bf1-11e8-92ac-c45444ac03ce','03fa16fc-3be9-11e8-92ac-c45444ac03ce','03fa16fc-3be9-11e8-92ac-c45444ac03ce','额土壤条件愉快','2018-04-09 20:28:58','club','club'),('ad0165d9-3bf1-11e8-92ac-c45444ac03ce','a7d1546f-3bf1-11e8-92ac-c45444ac03ce','comment','a7d1546f-3bf1-11e8-92ac-c45444ac03ce','2e2037ba-3be9-11e8-92ac-c45444ac03ce','2e2037ba-3be9-11e8-92ac-c45444ac03ce','和爱人监理公司','2018-04-09 20:29:42','club','club'),('bebf4845-3bf0-11e8-92ac-c45444ac03ce','b33c90fb-3bf0-11e8-92ac-c45444ac03ce','comment','b33c90fb-3bf0-11e8-92ac-c45444ac03ce','7af8c65e-3be2-11e8-92ac-c45444ac03ce','7af8c65e-3be2-11e8-92ac-c45444ac03ce','测试','2018-04-09 20:23:02','student','student'),('e76dd555-3bf0-11e8-92ac-c45444ac03ce','e3826576-3bf0-11e8-92ac-c45444ac03ce','comment','e3826576-3bf0-11e8-92ac-c45444ac03ce','a81cfc68-3be2-11e8-92ac-c45444ac03ce','a81cfc68-3be2-11e8-92ac-c45444ac03ce','怕loki句话','2018-04-09 20:24:10','student','student'),('eb6d974c-3c5e-11e8-92ac-c45444ac03ce','a7d1546f-3bf1-11e8-92ac-c45444ac03ce','reply','ad0165d9-3bf1-11e8-92ac-c45444ac03ce','2e2037ba-3be9-11e8-92ac-c45444ac03ce','4ae0a3df-3be3-11e8-92ac-c45444ac03ce','你怎么在自言自语呢','2018-04-10 09:31:43','student','club'),('ef95a47f-3c59-11e8-92ac-c45444ac03ce','6b821099-3c03-11e8-92ac-c45444ac03ce','comment','6b821099-3c03-11e8-92ac-c45444ac03ce','d265031e-3be2-11e8-92ac-c45444ac03ce','29932a4f-3be3-11e8-92ac-c45444ac03ce','测试重复','2018-04-10 08:56:02','student','undefined'),('fe02ba3a-3c59-11e8-92ac-c45444ac03ce','6314f050-3c03-11e8-92ac-c45444ac03ce','comment','6314f050-3c03-11e8-92ac-c45444ac03ce','a81cfc68-3be2-11e8-92ac-c45444ac03ce','29932a4f-3be3-11e8-92ac-c45444ac03ce','第二次测试重复','2018-04-10 08:56:27','student','undefined');

/*Table structure for table `praise` */

DROP TABLE IF EXISTS `praise`;

CREATE TABLE `praise` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `praiseUserId` varchar(50) DEFAULT NULL COMMENT '点赞的用户',
  `praiseType` varchar(50) DEFAULT NULL COMMENT '点赞的类型，有消息，评论，回复',
  `praiseId` varchar(50) DEFAULT NULL COMMENT '点赞类型对应的id',
  `praiseTime` datetime DEFAULT NULL COMMENT '点赞时间',
  `praiseUserType` varchar(50) DEFAULT NULL COMMENT '点赞的用户类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='点赞表';

/*Data for the table `praise` */

insert  into `praise`(`id`,`praiseUserId`,`praiseType`,`praiseId`,`praiseTime`,`praiseUserType`) values ('0ec9f0be-3c00-11e8-92ac-c45444ac03ce','7af8c65e-3be2-11e8-92ac-c45444ac03ce','msg','3b503077-3bf2-11e8-92ac-c45444ac03ce','2018-04-09 22:12:39','student'),('15ef760e-3c00-11e8-92ac-c45444ac03ce','7af8c65e-3be2-11e8-92ac-c45444ac03ce','msg','3b503077-3bf2-11e8-92ac-c45444ac03ce','2018-04-09 22:12:51','student'),('1969467e-3c00-11e8-92ac-c45444ac03ce','7af8c65e-3be2-11e8-92ac-c45444ac03ce','msg','3b503077-3bf2-11e8-92ac-c45444ac03ce','2018-04-09 22:12:57','student'),('1a687f52-3c00-11e8-92ac-c45444ac03ce','7af8c65e-3be2-11e8-92ac-c45444ac03ce','msg','3b503077-3bf2-11e8-92ac-c45444ac03ce','2018-04-09 22:12:58','student'),('1a9606b3-3c03-11e8-92ac-c45444ac03ce','d265031e-3be2-11e8-92ac-c45444ac03ce','msg','6726be84-3bf1-11e8-92ac-c45444ac03ce','2018-04-09 22:34:27','student'),('1cd53000-3c02-11e8-92ac-c45444ac03ce','c86381c6-3be2-11e8-92ac-c45444ac03ce','msg','abd99c49-3bf0-11e8-92ac-c45444ac03ce','2018-04-09 22:27:22','student'),('1d2f0f95-3c03-11e8-92ac-c45444ac03ce','d265031e-3be2-11e8-92ac-c45444ac03ce','msg','a5987795-3bf1-11e8-92ac-c45444ac03ce','2018-04-09 22:34:32','student'),('1fd308b9-3c03-11e8-92ac-c45444ac03ce','d265031e-3be2-11e8-92ac-c45444ac03ce','msg','3b503077-3bf2-11e8-92ac-c45444ac03ce','2018-04-09 22:34:36','student'),('1fd81737-3c5f-11e8-92ac-c45444ac03ce','4ae0a3df-3be3-11e8-92ac-c45444ac03ce','comment','e3826576-3bf0-11e8-92ac-c45444ac03ce','2018-04-10 09:33:11','student'),('273ca927-3c03-11e8-92ac-c45444ac03ce','d265031e-3be2-11e8-92ac-c45444ac03ce','msg','3b503077-3bf2-11e8-92ac-c45444ac03ce','2018-04-09 22:34:48','student'),('2f22cd3f-3bf1-11e8-92ac-c45444ac03ce','c86381c6-3be2-11e8-92ac-c45444ac03ce','msg','25c58e9c-3bf1-11e8-92ac-c45444ac03ce','2018-04-09 20:26:11','student'),('2fab6808-3bf1-11e8-92ac-c45444ac03ce','c86381c6-3be2-11e8-92ac-c45444ac03ce','comment','2d392f37-3bf1-11e8-92ac-c45444ac03ce','2018-04-09 20:26:11','student'),('342f55b1-3bf1-11e8-92ac-c45444ac03ce','c86381c6-3be2-11e8-92ac-c45444ac03ce','reply','32a53387-3bf1-11e8-92ac-c45444ac03ce','2018-04-09 20:26:19','student'),('43e15116-3bf1-11e8-92ac-c45444ac03ce','d265031e-3be2-11e8-92ac-c45444ac03ce','comment','434a38a4-3bf1-11e8-92ac-c45444ac03ce','2018-04-09 20:26:45','student'),('4441eaca-3bf1-11e8-92ac-c45444ac03ce','d265031e-3be2-11e8-92ac-c45444ac03ce','msg','40a696da-3bf1-11e8-92ac-c45444ac03ce','2018-04-09 20:26:46','student'),('46efdc85-3bf1-11e8-92ac-c45444ac03ce','d265031e-3be2-11e8-92ac-c45444ac03ce','reply','4629ee86-3bf1-11e8-92ac-c45444ac03ce','2018-04-09 20:26:51','student'),('4c08e83a-3c5f-11e8-92ac-c45444ac03ce','a81cfc68-3be2-11e8-92ac-c45444ac03ce','comment','e3826576-3bf0-11e8-92ac-c45444ac03ce','2018-04-10 09:34:25','student'),('564aa2ab-3bf1-11e8-92ac-c45444ac03ce','29932a4f-3be3-11e8-92ac-c45444ac03ce','msg','5554dd88-3bf1-11e8-92ac-c45444ac03ce','2018-04-09 20:27:16','student'),('6110f245-3c1f-11e8-92ac-c45444ac03ce','29932a4f-3be3-11e8-92ac-c45444ac03ce','reply','603b0e00-3c1f-11e8-92ac-c45444ac03ce','2018-04-10 01:56:52','student'),('61db8629-3c1f-11e8-92ac-c45444ac03ce','29932a4f-3be3-11e8-92ac-c45444ac03ce','comment','6314f050-3c03-11e8-92ac-c45444ac03ce','2018-04-10 01:56:53','student'),('6cf1d965-3bf1-11e8-92ac-c45444ac03ce','937597ad-3be3-11e8-92ac-c45444ac03ce','reply','6c721ba8-3bf1-11e8-92ac-c45444ac03ce','2018-04-09 20:27:54','school'),('6d43857d-3bf1-11e8-92ac-c45444ac03ce','937597ad-3be3-11e8-92ac-c45444ac03ce','comment','699a0011-3bf1-11e8-92ac-c45444ac03ce','2018-04-09 20:27:55','school'),('6dbdbc83-3bf1-11e8-92ac-c45444ac03ce','937597ad-3be3-11e8-92ac-c45444ac03ce','msg','6726be84-3bf1-11e8-92ac-c45444ac03ce','2018-04-09 20:27:56','school'),('740db884-3c03-11e8-92ac-c45444ac03ce','d265031e-3be2-11e8-92ac-c45444ac03ce','comment','6b821099-3c03-11e8-92ac-c45444ac03ce','2018-04-09 22:36:57','student'),('756574d3-3c03-11e8-92ac-c45444ac03ce','a81cfc68-3be2-11e8-92ac-c45444ac03ce','comment','6314f050-3c03-11e8-92ac-c45444ac03ce','2018-04-09 22:37:00','student'),('7dba2717-3bf1-11e8-92ac-c45444ac03ce','5119ad3b-3be5-11e8-92ac-c45444ac03ce','reply','7d0e5add-3bf1-11e8-92ac-c45444ac03ce','2018-04-09 20:28:22','school'),('7e0c2ba8-3bf1-11e8-92ac-c45444ac03ce','5119ad3b-3be5-11e8-92ac-c45444ac03ce','comment','7ac0cf23-3bf1-11e8-92ac-c45444ac03ce','2018-04-09 20:28:23','school'),('7e83fb60-3bf1-11e8-92ac-c45444ac03ce','5119ad3b-3be5-11e8-92ac-c45444ac03ce','msg','7847dadf-3bf1-11e8-92ac-c45444ac03ce','2018-04-09 20:28:24','school'),('9347d768-3bf1-11e8-92ac-c45444ac03ce','03fa16fc-3be9-11e8-92ac-c45444ac03ce','reply','92c6c39b-3bf1-11e8-92ac-c45444ac03ce','2018-04-09 20:28:59','club'),('939ad54f-3bf1-11e8-92ac-c45444ac03ce','03fa16fc-3be9-11e8-92ac-c45444ac03ce','comment','90ae917d-3bf1-11e8-92ac-c45444ac03ce','2018-04-09 20:28:59','club'),('94111c6c-3bf1-11e8-92ac-c45444ac03ce','03fa16fc-3be9-11e8-92ac-c45444ac03ce','msg','8e01d4ac-3bf1-11e8-92ac-c45444ac03ce','2018-04-09 20:29:00','club'),('9d2d00e0-3c84-11e8-92ac-c45444ac03ce','6bf40f07-3be3-11e8-92ac-c45444ac03ce','msg','2cbaf7d4-3c83-11e8-92ac-c45444ac03ce','2018-04-10 14:01:33','student'),('a5b1598c-3c15-11e8-92ac-c45444ac03ce','4ae0a3df-3be3-11e8-92ac-c45444ac03ce','comment','7ac0cf23-3bf1-11e8-92ac-c45444ac03ce','2018-04-10 00:47:12','student'),('a87c3e62-3bf1-11e8-92ac-c45444ac03ce','2e2037ba-3be9-11e8-92ac-c45444ac03ce','comment','a7d1546f-3bf1-11e8-92ac-c45444ac03ce','2018-04-09 20:29:34','club'),('ad793702-3bf1-11e8-92ac-c45444ac03ce','2e2037ba-3be9-11e8-92ac-c45444ac03ce','reply','ad0165d9-3bf1-11e8-92ac-c45444ac03ce','2018-04-09 20:29:43','club'),('ade2e58a-3bf0-11e8-92ac-c45444ac03ce','7af8c65e-3be2-11e8-92ac-c45444ac03ce','msg','abd99c49-3bf0-11e8-92ac-c45444ac03ce','2018-04-09 20:22:34','student'),('ae0556d7-3bf1-11e8-92ac-c45444ac03ce','2e2037ba-3be9-11e8-92ac-c45444ac03ce','msg','a5987795-3bf1-11e8-92ac-c45444ac03ce','2018-04-09 20:29:43','club'),('b71c688f-3c15-11e8-92ac-c45444ac03ce','4ae0a3df-3be3-11e8-92ac-c45444ac03ce','comment','b33c90fb-3bf0-11e8-92ac-c45444ac03ce','2018-04-10 00:47:41','student'),('b95bab84-568e-11e8-973a-c45444ac03ce','7af8c65e-3be2-11e8-92ac-c45444ac03ce','msg','fdc97259-5115-11e8-991a-c45444ac03ce','2018-05-13 17:19:23','student'),('c325c038-3bf0-11e8-92ac-c45444ac03ce','7af8c65e-3be2-11e8-92ac-c45444ac03ce','comment','b33c90fb-3bf0-11e8-92ac-c45444ac03ce','2018-04-09 20:23:09','student'),('c3abf0c3-3bf0-11e8-92ac-c45444ac03ce','7af8c65e-3be2-11e8-92ac-c45444ac03ce','reply','bebf4845-3bf0-11e8-92ac-c45444ac03ce','2018-04-09 20:23:10','student'),('c75c80b7-45de-11e8-bd84-c45444ac03ce','7af8c65e-3be2-11e8-92ac-c45444ac03ce','msg','3b503077-3bf2-11e8-92ac-c45444ac03ce','2018-04-22 11:39:36','student'),('cef2cb24-5bbf-11e8-888c-c45444ac03ce','7af8c65e-3be2-11e8-92ac-c45444ac03ce','msg','3b503077-3bf2-11e8-92ac-c45444ac03ce','2018-05-20 07:53:21','student'),('e0c6d1f7-3bf0-11e8-92ac-c45444ac03ce','a81cfc68-3be2-11e8-92ac-c45444ac03ce','msg','dfbdb353-3bf0-11e8-92ac-c45444ac03ce','2018-04-09 20:23:59','student'),('e435fdc6-3bf0-11e8-92ac-c45444ac03ce','a81cfc68-3be2-11e8-92ac-c45444ac03ce','comment','e3826576-3bf0-11e8-92ac-c45444ac03ce','2018-04-09 20:24:05','student'),('e824fc02-3bf0-11e8-92ac-c45444ac03ce','a81cfc68-3be2-11e8-92ac-c45444ac03ce','reply','e76dd555-3bf0-11e8-92ac-c45444ac03ce','2018-04-09 20:24:11','student'),('fc89e883-45de-11e8-bd84-c45444ac03ce','7af8c65e-3be2-11e8-92ac-c45444ac03ce','msg','83a6c8df-3ec5-11e8-a93e-c45444ac03ce','2018-04-22 11:41:05','student');

/*Table structure for table `school` */

DROP TABLE IF EXISTS `school`;

CREATE TABLE `school` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='学校';

/*Data for the table `school` */

insert  into `school`(`id`,`name`) values ('e0b5b7ad-315b-11e8-9d23-c45444ac03ce','仲恺农业工程学院'),('e0b9a9b5-315b-11e8-9d23-c45444ac03ce','中山大学'),('e0ba41ed-315b-11e8-9d23-c45444ac03ce','北京大学'),('e0bac3c2-315b-11e8-9d23-c45444ac03ce','清华大学'),('e0bb460e-315b-11e8-9d23-c45444ac03ce','浙江大学'),('e0bbc4ec-315b-11e8-9d23-c45444ac03ce','上海交通大学'),('e0bc43e2-315b-11e8-9d23-c45444ac03ce','华南理工大学'),('e0bcbf07-315b-11e8-9d23-c45444ac03ce','广东工业大学'),('e0bd8d19-315b-11e8-9d23-c45444ac03ce','华南师范大学'),('e0be1265-315b-11e8-9d23-c45444ac03ce','华中科技大学'),('e0be9fde-315b-11e8-9d23-c45444ac03ce','哈尔滨工业大学'),('e0bf8d15-315b-11e8-9d23-c45444ac03ce','南京大学'),('e0c010ba-315b-11e8-9d23-c45444ac03ce','暨南大学'),('e0c08998-315b-11e8-9d23-c45444ac03ce','华南农业大学'),('e0c108fd-315b-11e8-9d23-c45444ac03ce','深圳大学'),('e0c1b218-315b-11e8-9d23-c45444ac03ce','广州大学'),('e0c28237-315b-11e8-9d23-c45444ac03ce','中科院'),('e0c30b23-315b-11e8-9d23-c45444ac03ce','北京电影学院'),('e0c39584-315b-11e8-9d23-c45444ac03ce','北京戏剧学院'),('e0c42865-315b-11e8-9d23-c45444ac03ce','中央美术学院');

/*Table structure for table `user_official_baseinfo` */

DROP TABLE IF EXISTS `user_official_baseinfo`;

CREATE TABLE `user_official_baseinfo` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `phone` varchar(11) DEFAULT NULL COMMENT '登录账号手机号',
  `password` varchar(16) DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `school_id` varchar(50) DEFAULT NULL COMMENT '学校主键id',
  `creat_time` datetime DEFAULT NULL,
  `updata_time` datetime DEFAULT NULL,
  `brief_introduction` varchar(500) DEFAULT NULL COMMENT '简介',
  `user_type` varchar(8) DEFAULT NULL COMMENT '用户类型',
  `account_picture` varchar(200) DEFAULT NULL COMMENT '头像',
  `admin_type` varchar(50) DEFAULT NULL COMMENT '超级管理员还是普通管理员',
  `club_name` varchar(200) DEFAULT NULL COMMENT '社团名称',
  `status` varchar(50) DEFAULT NULL COMMENT '是否验证',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='官方用户信息表包括学校和社团用户';

/*Data for the table `user_official_baseinfo` */

insert  into `user_official_baseinfo`(`id`,`phone`,`password`,`nickname`,`school_id`,`creat_time`,`updata_time`,`brief_introduction`,`user_type`,`account_picture`,`admin_type`,`club_name`,`status`) values ('03fa16fc-3be9-11e8-92ac-c45444ac03ce','18816794958','88888888','信科党支部的官方微校','e0b5b7ad-315b-11e8-9d23-c45444ac03ce','2018-04-09 19:27:42','2018-04-09 19:28:25','这里是党员部门','club','http://localhost:8888/images/145be864-ca9c-4858-a8fb-80302048ed09.jpg','super','信科党支部','true'),('2e2037ba-3be9-11e8-92ac-c45444ac03ce','18816794958','88888888','音乐协会官方微校','e0b9a9b5-315b-11e8-9d23-c45444ac03ce','2018-04-09 19:28:53','2018-04-09 19:29:32','这里是中大的音乐协会','club','http://localhost:8888/images/145be864-ca9c-4858-a8fb-80302048ed09.jpg','super','音乐协会','true'),('5119ad3b-3be5-11e8-92ac-c45444ac03ce','18816794958','88888888','中大的官方微校','e0b9a9b5-315b-11e8-9d23-c45444ac03ce','2018-04-09 19:01:13','2018-04-09 19:01:29','中大最叼','school','http://localhost:8888/images/145be864-ca9c-4858-a8fb-80302048ed09.jpg','super',NULL,'true'),('5589abe8-3be9-11e8-92ac-c45444ac03ce','18816794958','88888888','摄影协会官方微校','e0ba41ed-315b-11e8-9d23-c45444ac03ce','2018-04-09 19:29:59','2018-04-09 19:30:34','这里是北大的摄影协会','club','http://localhost:8888/images/145be864-ca9c-4858-a8fb-80302048ed09.jpg','super','摄影协会','true'),('631f38f0-3be5-11e8-92ac-c45444ac03ce','18816794958','88888888','北大的官方微校','e0ba41ed-315b-11e8-9d23-c45444ac03ce','2018-04-09 19:01:44','2018-04-09 19:02:10','北大美女很多','school','http://localhost:8888/images/145be864-ca9c-4858-a8fb-80302048ed09.jpg','super',NULL,'true'),('7a7ae217-3be5-11e8-92ac-c45444ac03ce','18816794958','88888888','清华的官方微校','e0bac3c2-315b-11e8-9d23-c45444ac03ce','2018-04-09 19:02:23','2018-04-09 19:02:45','朱自清说的清华园很美','school','http://localhost:8888/images/145be864-ca9c-4858-a8fb-80302048ed09.jpg','super',NULL,'true'),('8092e1b5-3be6-11e8-92ac-c45444ac03ce','18816794958','88888888','上海交大的官方微校','e0bbc4ec-315b-11e8-9d23-c45444ac03ce','2018-04-09 19:09:43','2018-04-09 19:10:57','交大的史严是说段子的','school','http://localhost:8888/images/145be864-ca9c-4858-a8fb-80302048ed09.jpg','super',NULL,'true'),('937597ad-3be3-11e8-92ac-c45444ac03ce','18816794958','88888888','仲恺的官方微校','e0b5b7ad-315b-11e8-9d23-c45444ac03ce','2018-04-09 18:48:46','2018-04-09 18:59:31','仲恺无敌','school','http://localhost:8888/images/145be864-ca9c-4858-a8fb-80302048ed09.jpg','super',NULL,'true'),('fee3d5a2-3be5-11e8-92ac-c45444ac03ce','18816794958','88888888','浙大的官方微校','e0bb460e-315b-11e8-9d23-c45444ac03ce','2018-04-09 19:06:05','2018-04-09 19:09:26','浙大美女又美又多','school','http://localhost:8888/images/145be864-ca9c-4858-a8fb-80302048ed09.jpg','super',NULL,'true');

/*Table structure for table `user_student_baseinfo` */

DROP TABLE IF EXISTS `user_student_baseinfo`;

CREATE TABLE `user_student_baseinfo` (
  `id` varchar(100) NOT NULL,
  `phone` varchar(11) DEFAULT NULL COMMENT '登录账号，即手机号',
  `password` varchar(16) DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `real_name` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `identity_card` varchar(50) DEFAULT NULL COMMENT '身份证号码',
  `student_number` varchar(50) DEFAULT NULL COMMENT '学号',
  `school_id` varchar(50) DEFAULT NULL COMMENT '学校主键id',
  `student_class` varchar(100) DEFAULT NULL COMMENT '班级',
  `student_major` varchar(100) DEFAULT NULL COMMENT '专业',
  `creat_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `account_picture` varchar(100) DEFAULT NULL COMMENT '用户头像路径',
  `status` varchar(50) DEFAULT NULL COMMENT '状态，是否验证',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='学生用户信息表';

/*Data for the table `user_student_baseinfo` */

insert  into `user_student_baseinfo`(`id`,`phone`,`password`,`nickname`,`real_name`,`identity_card`,`student_number`,`school_id`,`student_class`,`student_major`,`creat_time`,`update_time`,`account_picture`,`status`) values ('29932a4f-3be3-11e8-92ac-c45444ac03ce','18816794958','88888888','楼下小黑','小黑','440882199501245032','214563987','e0bb460e-315b-11e8-9d23-c45444ac03ce','终极三班','全能的','2018-04-09 18:45:48','2018-04-09 18:46:29','http://localhost:8888/images/145be864-ca9c-4858-a8fb-80302048ed09.jpg','true'),('2fccb2dc-3be5-11e8-92ac-c45444ac03ce','18816794958','88888888','下床的傻逼','傻逼','440882199501245032','214785369','e0bcbf07-315b-11e8-9d23-c45444ac03ce','终极一班','逗比的','2018-04-09 19:00:18','2018-04-09 19:00:59','http://localhost:8888/images/145be864-ca9c-4858-a8fb-80302048ed09.jpg','true'),('4ae0a3df-3be3-11e8-92ac-c45444ac03ce','18816794958','88888888','门口看车的大爷','大爷','440882199501245032','258741369','e0bbc4ec-315b-11e8-9d23-c45444ac03ce','终极一班','看车的','2018-04-09 18:46:44','2018-04-09 18:47:19','http://localhost:8888/images/145be864-ca9c-4858-a8fb-80302048ed09.jpg','true'),('6bf40f07-3be3-11e8-92ac-c45444ac03ce','18816794958','88888888','对面的小美女','小美女','440882199501245032','8796541230','e0bc43e2-315b-11e8-9d23-c45444ac03ce','终极三班','撩帅哥','2018-04-09 18:47:39','2018-04-09 18:48:26','http://localhost:8888/images/145be864-ca9c-4858-a8fb-80302048ed09.jpg','true'),('7af8c65e-3be2-11e8-92ac-c45444ac03ce','18816794958','88888888','小池子','小池子','440882199501245032','123456789','e0b5b7ad-315b-11e8-9d23-c45444ac03ce','终极一班','搬砖','2018-04-09 18:40:55','2018-04-09 18:41:31','http://localhost:8888/images/7db2566a-f355-4a6e-b8f1-759fbe44bef6.jpg','true'),('a81cfc68-3be2-11e8-92ac-c45444ac03ce','18816794958','88888888','中大一哥','一哥无敌','440882199501245032','741258963','e0b9a9b5-315b-11e8-9d23-c45444ac03ce','终极一班','扫地的','2018-04-09 18:42:11','2018-04-09 18:42:47','http://localhost:8888/images/145be864-ca9c-4858-a8fb-80302048ed09.jpg','true'),('c86381c6-3be2-11e8-92ac-c45444ac03ce','18816794958','88888888','隔壁的老王','老王','440882199501245032','369852147','e0ba41ed-315b-11e8-9d23-c45444ac03ce','终极二班','拆迁大队队长','2018-04-09 18:43:05','2018-04-09 18:45:23','http://localhost:8888/images/145be864-ca9c-4858-a8fb-80302048ed09.jpg','true'),('d265031e-3be2-11e8-92ac-c45444ac03ce','18816794958','88888888','老李子','老李','440882199501245032','123654789','e0bac3c2-315b-11e8-9d23-c45444ac03ce','终极二班','洗厕所的','2018-04-09 18:43:22','2018-04-09 18:44:06','http://localhost:8888/images/145be864-ca9c-4858-a8fb-80302048ed09.jpg','true');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
