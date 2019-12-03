/*
Navicat MySQL Data Transfer

Source Server         : yzw2
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : myblog

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2019-12-03 17:21:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for acticle_category 
-- ----------------------------
DROP TABLE IF EXISTS `acticle_category`;
CREATE TABLE `acticle_category` (
  `categoryid` int(11) DEFAULT NULL,
  `articleid` int(11) DEFAULT NULL,
  KEY `article_cid` (`articleid`),
  KEY `category_cid` (`categoryid`),
  CONSTRAINT `article_cid` FOREIGN KEY (`articleid`) REFERENCES `article` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `category_cid` FOREIGN KEY (`categoryid`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acticle_category
-- ----------------------------
INSERT INTO `acticle_category` VALUES ('4', '1');
INSERT INTO `acticle_category` VALUES ('5', '2');
INSERT INTO `acticle_category` VALUES ('6', '3');
INSERT INTO `acticle_category` VALUES ('4', '4');
INSERT INTO `acticle_category` VALUES ('7', '5');
INSERT INTO `acticle_category` VALUES ('5', '6');
INSERT INTO `acticle_category` VALUES ('4', '10');
INSERT INTO `acticle_category` VALUES ('6', '11');
INSERT INTO `acticle_category` VALUES ('7', '12');
INSERT INTO `acticle_category` VALUES ('7', '13');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_boid` int(11) DEFAULT NULL,
  `articletitle` varchar(255) DEFAULT NULL,
  `articleabstract` varchar(255) DEFAULT NULL,
  `ariticlecontext` mediumtext,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `a_bid` (`article_boid`),
  CONSTRAINT `a_bid` FOREIGN KEY (`article_boid`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '1', '富可敌国K歌价格', '国际快递发克给客人国际金融饭卡里说的了国家的封建快攻和肉附件是的卡卡更健康价格肯定发感慨给大家看个尽快接口规范即可观看科技馆反馈反馈个国家开个咖啡馆看i', '感动和运营管理客人购房客户客人的话十五分四个角更好的隔日提给大家给u瑞丰还是个如今该机二二月入俄通过i日', '2019-11-25 12:31:36');
INSERT INTO `article` VALUES ('2', '1', '尽快决定房价', '高考辅导功课看的我i就较高房东房客钢结构架构开发客户尽快结果反馈好看高科技房价看空法国工具开发客户看开关打开两个路口可否考虑好了顾客反馈回来了喝咖啡可乐和管理家咯热OK根据客户开发就赶快赶快', '放大看价格会恶恶合法的即可将飞赴哈哈发货到付款上课u房价降幅', '2019-11-25 16:44:23');
INSERT INTO `article` VALUES ('3', '1', 'java设计模式', '大家都尽快反馈给尽快韩国对口高考空间的警告解放军几号放假帝国海军二ui额ui夫i回复开发规范门面房密码不能可高多了加空格分隔开发接口看过JFK就公开反对据考古发掘看过', '国际快递看过了接口供电和客观艰苦结构框架交公积金贷款放款飓风肯定更加开放接口ui欸i欸经国家贷款公开JFK菊科代理理论概括', '2019-11-26 15:09:41');
INSERT INTO `article` VALUES ('4', '1', 'java八大排序', '疯狂减肥公开价格肯定更加干净的感觉看过的进攻机会优惠的价格和u欸i欸哦孤苦伶仃给疯狂看过克利夫兰很简单家具韩国的机构行家韩国的机构行家u二u估计都分为哦更多罚款扣分韩国的经济', '过来的法律量化考核考虑海陆空联合考虑考核合格了科技馆开馆就结过婚的肌肤更加二uu如今给大家', '2019-11-26 15:10:21');
INSERT INTO `article` VALUES ('5', '1', '数控雕刻手法', '辅导功课付款了几方面更好的空间广阔感觉大家快过来将扩大飞机购房价款公检法机关看看发动机工况尽快更何况都看过了国家的开发零零后即可落落大方空间广阔的浪费了价格肯定裂缝裂缝更加可靠的管理带来', '反对开挂分类来看国际快递给尽快进入更加健康疯狂购物共iGIF考虑价格的过快的国家的可可哦关键看都快高考了可根据带过来的价格肯定看我OK的看见过对口高考', '2019-11-26 15:12:01');
INSERT INTO `article` VALUES ('6', '1', 'JFK肯定是疯狂的', '辅导功课付款了几方面更好的空间广阔感觉大家快过来将扩大飞机购房价款公检法机关看看发动机工况尽快更何况都看过了国家的开发零零后即可落落大方空间广阔的浪费了价格肯定裂缝裂缝更加可靠的管理带来', '反对开挂分类来看国际快递给尽快进入更加健康疯狂购物共iGIF考虑价格的过快的国家的可可哦关键看都快高考了可根据带过来的价格肯定看我OK的看见过对口高考', '2019-11-26 15:20:48');
INSERT INTO `article` VALUES ('7', '1', '放得开了卡夫卡公开', '辅导功课付款了几方面更好的空间广阔感觉大家快过来将扩大飞机购房价款公检法机关看看发动机工况尽快更何况都看过了国家的开发零零后即可落落大方空间广阔的浪费了价格肯定裂缝裂缝更加可靠的管理带来', '反对开挂分类来看国际快递给尽快进入更加健康疯狂购物共iGIF考虑价格的过快的国家的可可哦关键看都快高考了可根据带过来的价格肯定看我OK的看见过对口高考', '2019-11-26 15:21:06');
INSERT INTO `article` VALUES ('8', '1', '飞机还是大家', '辅导功课付款了几方面更好的空间广阔感觉大家快过来将扩大飞机购房价款公检法机关看看发动机工况尽快更何况都看过了国家的开发零零后即可落落大方空间广阔的浪费了价格肯定裂缝裂缝更加可靠的管理带来', '反对开挂分类来看国际快递给尽快进入更加健康疯狂购物共iGIF考虑价格的过快的国家的可可哦关键看都快高考了可根据带过来的价格肯定看我OK的看见过对口高考', '2019-11-26 15:36:45');
INSERT INTO `article` VALUES ('10', '1', '浮动空间', '搭建开发开发管理和老公进口的公积金合肥京东方即可分号结束了看过了佛i而饿哦回来反对开挂法国航空发动机看看海口观澜湖', '<h3 id=\"h3-u5927u5BB6u7EB7u7EB7u5C31\"><a name=\"大家纷纷就\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>大家纷纷就</h3><hr>\n<ul>\n<li>地方法规</li><li>仿佛看见的公共航空fk</li><li>九回复官方公开<br><img src=\"http://q1ip7q933.bkt.clouddn.com/fdca94a0ec0c4ff0bd85b4b383698c3a.jpg\" alt=\"\"></li></ul>\n', '2019-12-01 14:01:48');
INSERT INTO `article` VALUES ('11', '1', '一日游记', '今天天气好好，看到几个大美女，没忍住拍了几张照片', '', '2019-12-01 21:39:50');
INSERT INTO `article` VALUES ('12', '1', '客服反馈跟进接口开发工具开发工具', '的发货尽快给联合健康高峰时段根据客户了月日哦一篇', '<p><i class=\"fa fa-smile-o fa-emoji\" title=\"smile-o\"></i> <i class=\"fa fa-frown-o fa-emoji\" title=\"frown-o\"></i> <i class=\"fa fa-meh-o fa-emoji\" title=\"meh-o\"></i></p>\n<h2 id=\"h2--i-\"><a name=\"如同i肉发了个看\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>如同i肉发了个看</h2><ul>\n<li>飞机和佛教</li><li>飞机发动机工况</li><li>房价过快</li><li>发动反攻看</li></ul>\n<hr>\n<ol>\n<li>飞机和佛教</li><li>飞机发动机工况</li><li>房价过快</li><li>发动反攻看<br>2019-12-02 13&#58;00&#58;28 星期一<img src=\"http://q1ip7q933.bkt.clouddn.com/76c8d1a0bea64663b6d2936633aac6ee.jpg\" alt=\"|   |   |\n| ------------ | ------------ |\n|   |   |\n|   |   |\n\"></li></ol>\n', '2019-12-02 13:01:44');
INSERT INTO `article` VALUES ('13', '1', '今天上课好开心呀', '', '<p><i class=\"fa fa-thumbs-o-up fa-emoji\" title=\"thumbs-o-up\"></i> <i class=\"fa fa-smile-o fa-emoji\" title=\"smile-o\"></i> <i class=\"fa fa-qq fa-emoji\" title=\"qq\"></i></p>\n<h5 id=\"h5-u9EC4u91D1u65F6u4EE3u89C9u5F97u5927u5BB6\"><a name=\"黄金时代觉得大家\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>黄金时代觉得大家</h5><hr>\n<p>2019-12-03 14&#58;46&#58;34 星期二<br><img src=\"http://q1ip7q933.bkt.clouddn.com/ad13bf7606164b9a998a8ca5ab844095.jpg\" alt=\"\"></p>\n', '2019-12-03 14:47:29');

-- ----------------------------
-- Table structure for article_tag
-- ----------------------------
DROP TABLE IF EXISTS `article_tag`;
CREATE TABLE `article_tag` (
  `articleid` int(11) DEFAULT NULL,
  `tagid` int(11) DEFAULT NULL,
  KEY `tag_id` (`tagid`),
  KEY `article_id` (`articleid`),
  CONSTRAINT `article_id` FOREIGN KEY (`articleid`) REFERENCES `article` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `tag_id` FOREIGN KEY (`tagid`) REFERENCES `tag` (`tagid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_tag
-- ----------------------------
INSERT INTO `article_tag` VALUES ('1', '2');
INSERT INTO `article_tag` VALUES ('1', '1');
INSERT INTO `article_tag` VALUES ('1', '3');
INSERT INTO `article_tag` VALUES ('2', '1');
INSERT INTO `article_tag` VALUES ('3', '1');
INSERT INTO `article_tag` VALUES ('4', '3');
INSERT INTO `article_tag` VALUES ('5', '5');
INSERT INTO `article_tag` VALUES ('6', '1');
INSERT INTO `article_tag` VALUES ('2', '6');
INSERT INTO `article_tag` VALUES ('3', '1');
INSERT INTO `article_tag` VALUES ('4', '2');
INSERT INTO `article_tag` VALUES ('10', '1');
INSERT INTO `article_tag` VALUES ('10', '2');
INSERT INTO `article_tag` VALUES ('10', '3');
INSERT INTO `article_tag` VALUES ('11', '2');
INSERT INTO `article_tag` VALUES ('11', '4');
INSERT INTO `article_tag` VALUES ('11', '6');
INSERT INTO `article_tag` VALUES ('12', '2');
INSERT INTO `article_tag` VALUES ('12', '4');
INSERT INTO `article_tag` VALUES ('12', '5');
INSERT INTO `article_tag` VALUES ('13', '1');
INSERT INTO `article_tag` VALUES ('13', '3');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(20) DEFAULT NULL,
  `categorycontext` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('4', '的第三个的风格', '更符合甲方和');
INSERT INTO `category` VALUES ('5', '的规范和个人个人', '搞得风风火火和');
INSERT INTO `category` VALUES ('6', '翻跟斗风格和', '梵蒂冈地方合同和人');
INSERT INTO `category` VALUES ('7', '是否如果', '是东方大哥');
INSERT INTO `category` VALUES ('8', '是否东哥特', '的跌幅高达');
INSERT INTO `category` VALUES ('9', '大使馆的个人', '的功夫');
INSERT INTO `category` VALUES ('10', '的是否东哥特人', '官方的合同');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_uid` int(11) DEFAULT NULL,
  `comment_boid` int(11) DEFAULT NULL,
  `comment_arid` int(11) DEFAULT NULL,
  `commentcontext` varchar(255) DEFAULT NULL,
  `commenttime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `c_time` (`commenttime`) USING HASH,
  KEY `c_uid` (`comment_uid`),
  KEY `c_boid` (`comment_boid`),
  KEY `c_arid` (`comment_arid`),
  CONSTRAINT `c_arid` FOREIGN KEY (`comment_arid`) REFERENCES `article` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `c_boid` FOREIGN KEY (`comment_boid`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `c_uid` FOREIGN KEY (`comment_uid`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('2', '3', '1', '1', '广东高考', '2019-11-25 12:33:46');
INSERT INTO `comment` VALUES ('3', '4', '1', '1', '梵蒂冈看到了分割开来', '2019-11-25 12:34:00');
INSERT INTO `comment` VALUES ('4', '5', '1', '1', '感到乐观开朗', '2019-11-25 12:34:11');
INSERT INTO `comment` VALUES ('15', '2', '1', '1', '你**东西', '2019-11-29 13:35:10');
INSERT INTO `comment` VALUES ('16', '2', '1', '1', '你个**东西，写的啥玩意？', '2019-11-29 13:39:26');
INSERT INTO `comment` VALUES ('18', '2', '1', '7', '来玩玩呀', '2019-11-29 18:43:13');
INSERT INTO `comment` VALUES ('19', '2', '1', '7', '你个小垃圾', '2019-11-29 18:51:58');
INSERT INTO `comment` VALUES ('21', '2', '1', '7', '博主牛逼', '2019-11-29 18:56:21');
INSERT INTO `comment` VALUES ('24', '2', '1', '7', '博主**，写的啥玩意？', '2019-11-29 18:58:51');
INSERT INTO `comment` VALUES ('25', '2', '1', '6', '好好玩哦', '2019-11-29 19:06:57');
INSERT INTO `comment` VALUES ('26', '2', '1', '8', '博主**', '2019-11-29 19:39:12');
INSERT INTO `comment` VALUES ('27', '2', '1', '8', '你大爷的', '2019-11-29 19:39:38');
INSERT INTO `comment` VALUES ('28', '2', '1', '10', '我是你爸爸', '2019-12-01 21:13:33');
INSERT INTO `comment` VALUES ('29', '3', '1', '10', '你个**博主', '2019-12-01 21:13:59');
INSERT INTO `comment` VALUES ('30', '2', '1', '11', '美女好漂亮', '2019-12-01 21:40:29');
INSERT INTO `comment` VALUES ('31', '2', '1', '12', '你个***', '2019-12-02 13:02:34');

-- ----------------------------
-- Table structure for fans
-- ----------------------------
DROP TABLE IF EXISTS `fans`;
CREATE TABLE `fans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fanid` int(11) DEFAULT NULL,
  `boid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fan_u` (`fanid`),
  KEY `bo_u` (`boid`),
  CONSTRAINT `bo_u` FOREIGN KEY (`boid`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fan_u` FOREIGN KEY (`fanid`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fans
-- ----------------------------
INSERT INTO `fans` VALUES ('1', '2', '1');
INSERT INTO `fans` VALUES ('2', '3', '1');
INSERT INTO `fans` VALUES ('3', '4', '1');
INSERT INTO `fans` VALUES ('4', '5', '1');

-- ----------------------------
-- Table structure for imgpool
-- ----------------------------
DROP TABLE IF EXISTS `imgpool`;
CREATE TABLE `imgpool` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `arid` int(11) DEFAULT NULL,
  `imageurl` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`img_id`),
  KEY `img_art` (`arid`),
  CONSTRAINT `img_art` FOREIGN KEY (`arid`) REFERENCES `article` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imgpool
-- ----------------------------
INSERT INTO `imgpool` VALUES ('11', '10', 'http://q1ip7q933.bkt.clouddn.com/75362f6a14bc4cb69cff26fb520546c7.jpg');
INSERT INTO `imgpool` VALUES ('12', '10', 'http://q1ip7q933.bkt.clouddn.com/f5aca99c6d9e44a4abc169ab1d823b05.jpg');
INSERT INTO `imgpool` VALUES ('13', '10', 'http://q1ip7q933.bkt.clouddn.com/0b8ae508e7864e27b5b8594931cdc8c0.jpg');
INSERT INTO `imgpool` VALUES ('14', '11', 'http://q1ip7q933.bkt.clouddn.com/9cdc7361a43f47f4a4e43695b5a941fe.jpg');
INSERT INTO `imgpool` VALUES ('15', '11', 'http://q1ip7q933.bkt.clouddn.com/c019d58431ff462d8ae85733c15920d4.jpg');
INSERT INTO `imgpool` VALUES ('16', '11', 'http://q1ip7q933.bkt.clouddn.com/deffce86097c46fe94eaed6c45e8aebd.jpg');
INSERT INTO `imgpool` VALUES ('17', '11', 'http://q1ip7q933.bkt.clouddn.com/ac2d5829b7c845ce93ee6f0868126913.jpg');
INSERT INTO `imgpool` VALUES ('18', '12', 'http://q1ip7q933.bkt.clouddn.com/a6bdff84343c421c98c90691fd27f01f.jpg');
INSERT INTO `imgpool` VALUES ('19', '12', 'http://q1ip7q933.bkt.clouddn.com/9c32923c5da34b2cb55d8d42ca200f0e.jpg');
INSERT INTO `imgpool` VALUES ('20', '13', 'http://q1ip7q933.bkt.clouddn.com/0b3ef00f16724eaf8e1aa6a945f0811b.jpg');
INSERT INTO `imgpool` VALUES ('21', '13', 'http://q1ip7q933.bkt.clouddn.com/a1b16278cef6483fbd6c75948e8205ad.png');
INSERT INTO `imgpool` VALUES ('22', '13', 'http://q1ip7q933.bkt.clouddn.com/bf93003d145643ddba7b32db65593e9f.jpg');
INSERT INTO `imgpool` VALUES ('23', '13', 'http://q1ip7q933.bkt.clouddn.com/aeb0e084110b4c299ddf3d03bfa31977.jpg');

-- ----------------------------
-- Table structure for letter
-- ----------------------------
DROP TABLE IF EXISTS `letter`;
CREATE TABLE `letter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lettercomtext` varchar(255) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `bo_id` int(11) DEFAULT NULL,
  `letterstate` int(11) DEFAULT NULL,
  `lettertime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `le_userid` (`userid`),
  KEY `le_boid` (`bo_id`),
  CONSTRAINT `le_boid` FOREIGN KEY (`bo_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `le_userid` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of letter
-- ----------------------------
INSERT INTO `letter` VALUES ('1', '你的博客写的不咋地呀', '2', '1', '0', '2019-11-25 12:58:53');
INSERT INTO `letter` VALUES ('2', '好好写博客', '2', '1', '0', '2019-11-25 12:58:55');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '用户');
INSERT INTO `role` VALUES ('2', '管理员');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `tagid` int(11) NOT NULL AUTO_INCREMENT,
  `tagname` varchar(20) DEFAULT NULL,
  `tagcontext` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tagid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES ('1', '生活', '记录生活每一天');
INSERT INTO `tag` VALUES ('2', '校园', '精彩校园生活');
INSERT INTO `tag` VALUES ('3', '旅行', '旅行记录');
INSERT INTO `tag` VALUES ('4', '摄影', '拍下每个笑脸');
INSERT INTO `tag` VALUES ('5', '美食', '香甜可口');
INSERT INTO `tag` VALUES ('6', '美女', '米欸');
INSERT INTO `tag` VALUES ('7', '美文', '的收费改革');
INSERT INTO `tag` VALUES ('8', '新增标签', '新增测试');

-- ----------------------------
-- Table structure for thumbs_up
-- ----------------------------
DROP TABLE IF EXISTS `thumbs_up`;
CREATE TABLE `thumbs_up` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bo_id` int(11) DEFAULT NULL,
  `art_id` int(11) DEFAULT NULL,
  `utime` datetime DEFAULT NULL,
  `use_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `u_boid` (`bo_id`),
  KEY `u_artid` (`art_id`),
  KEY `u_uid` (`use_id`),
  CONSTRAINT `u_artid` FOREIGN KEY (`art_id`) REFERENCES `article` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `u_boid` FOREIGN KEY (`bo_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `u_uid` FOREIGN KEY (`use_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thumbs_up
-- ----------------------------
INSERT INTO `thumbs_up` VALUES ('2', '1', '1', '2019-11-25 12:52:49', '3');
INSERT INTO `thumbs_up` VALUES ('3', '1', '8', '2019-11-29 19:43:36', '2');
INSERT INTO `thumbs_up` VALUES ('4', '1', '8', '2019-11-29 19:50:04', '2');
INSERT INTO `thumbs_up` VALUES ('5', '1', '8', '2019-11-29 19:50:19', '2');
INSERT INTO `thumbs_up` VALUES ('6', '1', '8', '2019-11-29 19:50:20', '2');
INSERT INTO `thumbs_up` VALUES ('7', '1', '11', '2019-12-02 12:54:37', '2');
INSERT INTO `thumbs_up` VALUES ('8', '1', '11', '2019-12-02 12:56:47', '2');
INSERT INTO `thumbs_up` VALUES ('9', '1', '8', '2019-12-02 12:57:17', '2');
INSERT INTO `thumbs_up` VALUES ('10', '1', '12', '2019-12-02 19:06:20', '2');
INSERT INTO `thumbs_up` VALUES ('11', '1', '7', '2019-12-02 19:06:29', '2');
INSERT INTO `thumbs_up` VALUES ('12', '1', '6', '2019-12-02 19:06:33', '2');
INSERT INTO `thumbs_up` VALUES ('13', '1', '5', '2019-12-02 19:06:39', '2');
INSERT INTO `thumbs_up` VALUES ('14', '1', '5', '2019-12-02 19:06:44', '2');
INSERT INTO `thumbs_up` VALUES ('15', '1', '6', '2019-12-02 19:06:48', '2');
INSERT INTO `thumbs_up` VALUES ('16', '1', '8', '2019-12-02 19:06:52', '2');
INSERT INTO `thumbs_up` VALUES ('17', '1', '10', '2019-12-02 19:06:57', '2');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL,
  `registertime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_role` (`roleid`),
  CONSTRAINT `user_role` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1008611', '1293500705@qq.com', '35d2a13044b68f643e56774466e14177', '小菜鸡', '2', '2019-11-19 20:53:31');
INSERT INTO `user` VALUES ('2', '10001', '1293500705@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '雯雯', '1', '2019-11-19 20:54:09');
INSERT INTO `user` VALUES ('3', '10002', '1293500705@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '地方', '1', '2019-11-25 12:29:12');
INSERT INTO `user` VALUES ('4', '10003', '1293500705@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '发发给法国', '1', '2019-11-25 12:29:35');
INSERT INTO `user` VALUES ('5', '10004', '1293500705@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '广东富豪', '1', '2019-11-25 12:29:58');

-- ----------------------------
-- Table structure for view
-- ----------------------------
DROP TABLE IF EXISTS `view`;
CREATE TABLE `view` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bo_id` int(11) DEFAULT NULL,
  `art_id` int(11) DEFAULT NULL,
  `vtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `v_boid` (`bo_id`),
  KEY `v_artid` (`art_id`),
  CONSTRAINT `v_artid` FOREIGN KEY (`art_id`) REFERENCES `article` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `v_boid` FOREIGN KEY (`bo_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of view
-- ----------------------------
INSERT INTO `view` VALUES ('1', '1', '1', '2019-11-25 12:47:16');
INSERT INTO `view` VALUES ('2', '1', '1', '2019-11-25 12:47:25');
INSERT INTO `view` VALUES ('3', '1', '1', '2019-11-25 12:47:34');
INSERT INTO `view` VALUES ('4', '1', '2', '2019-11-25 16:44:37');
INSERT INTO `view` VALUES ('5', '1', '3', '2019-11-26 15:26:33');
INSERT INTO `view` VALUES ('6', '1', '1', '2019-11-26 15:26:36');
INSERT INTO `view` VALUES ('7', '1', '3', '2019-11-26 15:26:39');
INSERT INTO `view` VALUES ('8', '1', '3', '2019-11-26 15:26:41');
INSERT INTO `view` VALUES ('9', '1', '2', '2019-11-26 15:26:43');
INSERT INTO `view` VALUES ('10', '1', '5', '2019-11-26 15:26:45');
INSERT INTO `view` VALUES ('11', '1', '5', '2019-11-26 15:26:47');
INSERT INTO `view` VALUES ('12', '1', '2', '2019-11-26 15:26:50');
INSERT INTO `view` VALUES ('13', '1', '5', '2019-11-26 15:26:53');
INSERT INTO `view` VALUES ('14', '1', '8', '2019-11-28 08:25:27');
INSERT INTO `view` VALUES ('15', '1', '8', '2019-11-28 08:25:32');
INSERT INTO `view` VALUES ('16', '1', '8', '2019-11-28 08:25:33');
INSERT INTO `view` VALUES ('17', '1', '8', '2019-11-28 08:25:34');
INSERT INTO `view` VALUES ('18', '1', '8', '2019-11-28 08:25:39');
INSERT INTO `view` VALUES ('19', '1', '8', '2019-11-28 08:25:40');
INSERT INTO `view` VALUES ('20', '1', '8', '2019-11-28 08:25:40');
INSERT INTO `view` VALUES ('21', '1', '8', '2019-11-28 08:25:41');
INSERT INTO `view` VALUES ('22', '1', '8', '2019-11-28 08:25:42');
INSERT INTO `view` VALUES ('23', '1', '8', '2019-11-28 08:25:42');
INSERT INTO `view` VALUES ('24', '1', '8', '2019-11-28 08:25:43');
INSERT INTO `view` VALUES ('25', '1', '8', '2019-11-28 08:25:44');
INSERT INTO `view` VALUES ('26', '1', '1', '2019-11-28 08:25:49');
INSERT INTO `view` VALUES ('27', '1', '2', '2019-11-28 08:25:55');
INSERT INTO `view` VALUES ('28', '1', '4', '2019-11-28 08:26:07');
INSERT INTO `view` VALUES ('29', '1', '4', '2019-11-28 08:26:13');
INSERT INTO `view` VALUES ('30', '1', '4', '2019-11-28 08:26:14');
INSERT INTO `view` VALUES ('31', '1', '4', '2019-11-28 08:26:15');
INSERT INTO `view` VALUES ('32', '1', '4', '2019-11-28 08:26:16');
INSERT INTO `view` VALUES ('33', '1', '4', '2019-11-28 08:26:16');
INSERT INTO `view` VALUES ('34', '1', '4', '2019-11-28 08:26:17');
INSERT INTO `view` VALUES ('35', '1', '4', '2019-11-28 08:26:18');
INSERT INTO `view` VALUES ('36', '1', '4', '2019-11-28 08:26:18');
INSERT INTO `view` VALUES ('37', '1', '5', '2019-11-28 08:26:48');
INSERT INTO `view` VALUES ('38', '1', '5', '2019-11-28 08:26:51');
INSERT INTO `view` VALUES ('39', '1', '1', '2019-11-28 08:27:22');
INSERT INTO `view` VALUES ('40', '1', '5', '2019-11-28 08:28:30');
INSERT INTO `view` VALUES ('41', '1', '1', '2019-11-28 08:50:55');
INSERT INTO `view` VALUES ('42', '1', '8', '2019-11-28 08:51:07');
INSERT INTO `view` VALUES ('43', '1', '1', '2019-11-28 08:51:19');
INSERT INTO `view` VALUES ('44', '1', '4', '2019-11-28 08:51:21');
INSERT INTO `view` VALUES ('45', '1', '4', '2019-11-28 09:06:14');
INSERT INTO `view` VALUES ('46', '1', '8', '2019-11-28 12:09:46');
INSERT INTO `view` VALUES ('47', '1', '1', '2019-11-28 12:10:00');
INSERT INTO `view` VALUES ('48', '1', '8', '2019-11-28 12:12:58');
INSERT INTO `view` VALUES ('49', '1', '1', '2019-11-28 12:13:11');
INSERT INTO `view` VALUES ('50', '1', '1', '2019-11-28 12:14:08');
INSERT INTO `view` VALUES ('51', '1', '1', '2019-11-28 12:15:09');
INSERT INTO `view` VALUES ('52', '1', '1', '2019-11-28 12:17:01');
INSERT INTO `view` VALUES ('53', '1', '2', '2019-11-28 12:17:13');
INSERT INTO `view` VALUES ('54', '1', '7', '2019-11-28 12:17:38');
INSERT INTO `view` VALUES ('55', '1', '2', '2019-11-28 12:18:14');
INSERT INTO `view` VALUES ('56', '1', '7', '2019-11-28 12:18:21');
INSERT INTO `view` VALUES ('57', '1', '1', '2019-11-28 12:18:31');
INSERT INTO `view` VALUES ('58', '1', '1', '2019-11-29 13:00:04');
INSERT INTO `view` VALUES ('59', '1', '1', '2019-11-29 13:01:37');
INSERT INTO `view` VALUES ('60', '1', '1', '2019-11-29 13:02:14');
INSERT INTO `view` VALUES ('61', '1', '1', '2019-11-29 13:03:28');
INSERT INTO `view` VALUES ('62', '1', '1', '2019-11-29 13:03:49');
INSERT INTO `view` VALUES ('63', '1', '1', '2019-11-29 13:03:51');
INSERT INTO `view` VALUES ('64', '1', '1', '2019-11-29 13:04:38');
INSERT INTO `view` VALUES ('65', '1', '1', '2019-11-29 13:04:44');
INSERT INTO `view` VALUES ('66', '1', '1', '2019-11-29 13:05:25');
INSERT INTO `view` VALUES ('67', '1', '1', '2019-11-29 13:07:19');
INSERT INTO `view` VALUES ('68', '1', '1', '2019-11-29 13:08:07');
INSERT INTO `view` VALUES ('69', '1', '1', '2019-11-29 13:10:22');
INSERT INTO `view` VALUES ('70', '1', '1', '2019-11-29 13:10:39');
INSERT INTO `view` VALUES ('71', '1', '1', '2019-11-29 13:11:15');
INSERT INTO `view` VALUES ('72', '1', '1', '2019-11-29 13:12:46');
INSERT INTO `view` VALUES ('73', '1', '1', '2019-11-29 13:15:03');
INSERT INTO `view` VALUES ('74', '1', '1', '2019-11-29 13:15:11');
INSERT INTO `view` VALUES ('75', '1', '1', '2019-11-29 13:15:40');
INSERT INTO `view` VALUES ('76', '1', '1', '2019-11-29 13:18:52');
INSERT INTO `view` VALUES ('77', '1', '1', '2019-11-29 13:19:18');
INSERT INTO `view` VALUES ('78', '1', '1', '2019-11-29 13:19:30');
INSERT INTO `view` VALUES ('79', '1', '1', '2019-11-29 13:20:18');
INSERT INTO `view` VALUES ('80', '1', '1', '2019-11-29 13:21:00');
INSERT INTO `view` VALUES ('81', '1', '1', '2019-11-29 13:21:18');
INSERT INTO `view` VALUES ('82', '1', '1', '2019-11-29 13:22:42');
INSERT INTO `view` VALUES ('83', '1', '1', '2019-11-29 13:30:50');
INSERT INTO `view` VALUES ('84', '1', '1', '2019-11-29 13:31:26');
INSERT INTO `view` VALUES ('85', '1', '1', '2019-11-29 13:31:59');
INSERT INTO `view` VALUES ('86', '1', '1', '2019-11-29 13:32:12');
INSERT INTO `view` VALUES ('87', '1', '1', '2019-11-29 13:36:31');
INSERT INTO `view` VALUES ('88', '1', '1', '2019-11-29 13:38:36');
INSERT INTO `view` VALUES ('89', '1', '1', '2019-11-29 13:40:01');
INSERT INTO `view` VALUES ('90', '1', '7', '2019-11-29 18:42:34');
INSERT INTO `view` VALUES ('91', '1', '7', '2019-11-29 18:42:55');
INSERT INTO `view` VALUES ('92', '1', '7', '2019-11-29 18:43:34');
INSERT INTO `view` VALUES ('93', '1', '7', '2019-11-29 18:54:44');
INSERT INTO `view` VALUES ('94', '1', '7', '2019-11-29 18:55:35');
INSERT INTO `view` VALUES ('95', '1', '7', '2019-11-29 18:56:10');
INSERT INTO `view` VALUES ('96', '1', '7', '2019-11-29 18:57:29');
INSERT INTO `view` VALUES ('97', '1', '7', '2019-11-29 18:58:21');
INSERT INTO `view` VALUES ('98', '1', '8', '2019-11-29 18:58:57');
INSERT INTO `view` VALUES ('99', '1', '1', '2019-11-29 18:59:01');
INSERT INTO `view` VALUES ('100', '1', '6', '2019-11-29 19:00:27');
INSERT INTO `view` VALUES ('101', '1', '6', '2019-11-29 19:05:44');
INSERT INTO `view` VALUES ('102', '1', '8', '2019-11-29 19:31:38');
INSERT INTO `view` VALUES ('103', '1', '8', '2019-11-29 19:32:31');
INSERT INTO `view` VALUES ('104', '1', '8', '2019-11-29 19:33:12');
INSERT INTO `view` VALUES ('105', '1', '8', '2019-11-29 19:34:42');
INSERT INTO `view` VALUES ('106', '1', '8', '2019-11-29 19:35:03');
INSERT INTO `view` VALUES ('107', '1', '8', '2019-11-29 19:39:03');
INSERT INTO `view` VALUES ('108', '1', '8', '2019-11-29 19:42:27');
INSERT INTO `view` VALUES ('109', '1', '8', '2019-11-29 19:43:30');
INSERT INTO `view` VALUES ('110', '1', '8', '2019-11-29 19:43:43');
INSERT INTO `view` VALUES ('111', '1', '8', '2019-11-29 19:45:30');
INSERT INTO `view` VALUES ('112', '1', '8', '2019-11-29 19:50:02');
INSERT INTO `view` VALUES ('113', '1', '8', '2019-11-29 19:50:15');
INSERT INTO `view` VALUES ('114', '1', '8', '2019-11-29 19:50:24');
INSERT INTO `view` VALUES ('115', '1', '8', '2019-11-30 10:13:29');
INSERT INTO `view` VALUES ('116', '1', '1', '2019-11-30 10:13:45');
INSERT INTO `view` VALUES ('117', '1', '1', '2019-11-30 10:14:46');
INSERT INTO `view` VALUES ('118', '1', '1', '2019-11-30 10:15:01');
INSERT INTO `view` VALUES ('119', '1', '1', '2019-11-30 10:15:56');
INSERT INTO `view` VALUES ('120', '1', '1', '2019-11-30 10:16:15');
INSERT INTO `view` VALUES ('121', '1', '1', '2019-11-30 10:18:56');
INSERT INTO `view` VALUES ('122', '1', '10', '2019-12-01 14:03:15');
INSERT INTO `view` VALUES ('123', '1', '10', '2019-12-01 19:40:49');
INSERT INTO `view` VALUES ('124', '1', '10', '2019-12-01 19:42:08');
INSERT INTO `view` VALUES ('125', '1', '10', '2019-12-01 19:42:12');
INSERT INTO `view` VALUES ('126', '1', '10', '2019-12-01 19:42:14');
INSERT INTO `view` VALUES ('127', '1', '10', '2019-12-01 19:42:16');
INSERT INTO `view` VALUES ('128', '1', '10', '2019-12-01 19:42:43');
INSERT INTO `view` VALUES ('129', '1', '10', '2019-12-01 19:42:45');
INSERT INTO `view` VALUES ('130', '1', '8', '2019-12-01 19:42:51');
INSERT INTO `view` VALUES ('131', '1', '10', '2019-12-01 19:43:00');
INSERT INTO `view` VALUES ('132', '1', '7', '2019-12-01 19:43:51');
INSERT INTO `view` VALUES ('133', '1', '7', '2019-12-01 19:44:42');
INSERT INTO `view` VALUES ('134', '1', '10', '2019-12-01 19:44:47');
INSERT INTO `view` VALUES ('135', '1', '10', '2019-12-01 19:45:27');
INSERT INTO `view` VALUES ('136', '1', '10', '2019-12-01 19:45:59');
INSERT INTO `view` VALUES ('137', '1', '10', '2019-12-01 19:52:10');
INSERT INTO `view` VALUES ('138', '1', '10', '2019-12-01 19:54:26');
INSERT INTO `view` VALUES ('139', '1', '10', '2019-12-01 19:55:52');
INSERT INTO `view` VALUES ('140', '1', '10', '2019-12-01 20:06:51');
INSERT INTO `view` VALUES ('141', '1', '10', '2019-12-01 20:23:42');
INSERT INTO `view` VALUES ('142', '1', '10', '2019-12-01 20:25:28');
INSERT INTO `view` VALUES ('143', '1', '8', '2019-12-01 20:26:19');
INSERT INTO `view` VALUES ('144', '1', '10', '2019-12-01 20:26:56');
INSERT INTO `view` VALUES ('145', '1', '10', '2019-12-01 20:27:22');
INSERT INTO `view` VALUES ('146', '1', '10', '2019-12-01 20:27:34');
INSERT INTO `view` VALUES ('147', '1', '10', '2019-12-01 20:27:44');
INSERT INTO `view` VALUES ('148', '1', '8', '2019-12-01 20:31:38');
INSERT INTO `view` VALUES ('149', '1', '10', '2019-12-01 20:42:32');
INSERT INTO `view` VALUES ('150', '1', '10', '2019-12-01 20:44:03');
INSERT INTO `view` VALUES ('151', '1', '10', '2019-12-01 20:48:08');
INSERT INTO `view` VALUES ('152', '1', '10', '2019-12-01 21:09:12');
INSERT INTO `view` VALUES ('153', '1', '10', '2019-12-01 21:09:40');
INSERT INTO `view` VALUES ('154', '1', '10', '2019-12-01 21:10:55');
INSERT INTO `view` VALUES ('155', '1', '10', '2019-12-01 21:11:07');
INSERT INTO `view` VALUES ('156', '1', '10', '2019-12-01 21:11:23');
INSERT INTO `view` VALUES ('157', '1', '10', '2019-12-01 21:11:48');
INSERT INTO `view` VALUES ('158', '1', '10', '2019-12-01 21:13:21');
INSERT INTO `view` VALUES ('159', '1', '10', '2019-12-01 21:13:47');
INSERT INTO `view` VALUES ('160', '1', '11', '2019-12-01 21:40:11');
INSERT INTO `view` VALUES ('161', '1', '11', '2019-12-01 21:41:28');
INSERT INTO `view` VALUES ('162', '1', '10', '2019-12-01 21:47:44');
INSERT INTO `view` VALUES ('163', '1', '10', '2019-12-01 21:48:08');
INSERT INTO `view` VALUES ('164', '1', '11', '2019-12-01 21:48:58');
INSERT INTO `view` VALUES ('165', '1', '11', '2019-12-02 12:54:02');
INSERT INTO `view` VALUES ('166', '1', '11', '2019-12-02 12:54:34');
INSERT INTO `view` VALUES ('167', '1', '11', '2019-12-02 12:56:45');
INSERT INTO `view` VALUES ('168', '1', '8', '2019-12-02 12:57:15');
INSERT INTO `view` VALUES ('169', '1', '12', '2019-12-02 13:01:56');
INSERT INTO `view` VALUES ('170', '1', '12', '2019-12-02 13:07:02');
INSERT INTO `view` VALUES ('171', '1', '10', '2019-12-02 13:12:15');
INSERT INTO `view` VALUES ('172', '1', '12', '2019-12-02 16:15:53');
INSERT INTO `view` VALUES ('173', '1', '12', '2019-12-02 16:16:21');
INSERT INTO `view` VALUES ('174', '1', '12', '2019-12-02 19:06:18');
INSERT INTO `view` VALUES ('175', '1', '7', '2019-12-02 19:06:27');
INSERT INTO `view` VALUES ('176', '1', '6', '2019-12-02 19:06:32');
INSERT INTO `view` VALUES ('177', '1', '5', '2019-12-02 19:06:37');
INSERT INTO `view` VALUES ('178', '1', '5', '2019-12-02 19:06:43');
INSERT INTO `view` VALUES ('179', '1', '6', '2019-12-02 19:06:47');
INSERT INTO `view` VALUES ('180', '1', '8', '2019-12-02 19:06:51');
INSERT INTO `view` VALUES ('181', '1', '10', '2019-12-02 19:06:55');
INSERT INTO `view` VALUES ('182', '1', '1', '2019-12-02 19:48:54');
INSERT INTO `view` VALUES ('183', '1', '1', '2019-12-02 19:49:42');
INSERT INTO `view` VALUES ('184', '1', '12', '2019-12-02 19:55:49');
INSERT INTO `view` VALUES ('185', '1', '12', '2019-12-02 19:55:54');
INSERT INTO `view` VALUES ('186', '1', '7', '2019-12-02 19:56:06');
INSERT INTO `view` VALUES ('187', '1', '12', '2019-12-02 20:08:54');
INSERT INTO `view` VALUES ('188', '1', '1', '2019-12-02 21:29:51');
INSERT INTO `view` VALUES ('189', '1', '13', '2019-12-03 14:47:36');
INSERT INTO `view` VALUES ('190', '1', '13', '2019-12-03 14:47:54');
INSERT INTO `view` VALUES ('191', '1', '12', '2019-12-03 15:54:51');

-- ----------------------------
-- Table structure for visitor
-- ----------------------------
DROP TABLE IF EXISTS `visitor`;
CREATE TABLE `visitor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `vtime` datetime DEFAULT NULL,
  `location` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of visitor
-- ----------------------------
INSERT INTO `visitor` VALUES ('29', '游客', '127.0.0.1', '2019-11-27 14:20:32', '内网IP');
INSERT INTO `visitor` VALUES ('30', '游客', '0:0:0:0:0:0:0:1', '2019-11-27 14:20:34', '内网ip');
INSERT INTO `visitor` VALUES ('31', '游客', '0:0:0:0:0:0:0:1', '2019-11-27 14:22:20', '内网ip');
INSERT INTO `visitor` VALUES ('32', '游客', '0:0:0:0:0:0:0:1', '2019-11-27 14:22:29', '内网ip');
INSERT INTO `visitor` VALUES ('33', '游客', '0:0:0:0:0:0:0:1', '2019-11-27 14:26:24', '内网ip');
INSERT INTO `visitor` VALUES ('34', '游客', '0:0:0:0:0:0:0:1', '2019-11-27 14:26:40', '内网ip');
INSERT INTO `visitor` VALUES ('35', '游客', '127.0.0.1', '2019-11-27 14:30:06', '内网IP');
INSERT INTO `visitor` VALUES ('36', '游客', '0:0:0:0:0:0:0:1', '2019-11-27 14:30:09', '内网ip');
INSERT INTO `visitor` VALUES ('37', '游客', '127.0.0.1', '2019-11-27 14:46:43', '内网IP');
INSERT INTO `visitor` VALUES ('38', '游客', '0:0:0:0:0:0:0:1', '2019-11-27 14:46:45', '内网ip');
INSERT INTO `visitor` VALUES ('39', '游客', '0:0:0:0:0:0:0:1', '2019-11-27 14:49:09', '内网ip');
INSERT INTO `visitor` VALUES ('40', '游客', '127.0.0.1', '2019-11-27 14:51:18', '内网IP');
INSERT INTO `visitor` VALUES ('41', '游客', '0:0:0:0:0:0:0:1', '2019-11-27 14:51:21', '内网ip');
INSERT INTO `visitor` VALUES ('42', '游客', '127.0.0.1', '2019-11-27 14:54:07', '内网IP');
INSERT INTO `visitor` VALUES ('43', '游客', '0:0:0:0:0:0:0:1', '2019-11-27 14:54:09', '内网ip');
INSERT INTO `visitor` VALUES ('44', '游客', '127.0.0.1', '2019-11-27 15:02:06', '内网IP');
INSERT INTO `visitor` VALUES ('45', '游客', '0:0:0:0:0:0:0:1', '2019-11-27 15:02:09', '内网ip');
INSERT INTO `visitor` VALUES ('46', '游客', '0:0:0:0:0:0:0:1', '2019-11-27 15:02:14', '内网ip');
INSERT INTO `visitor` VALUES ('47', '游客', '0:0:0:0:0:0:0:1', '2019-11-27 15:17:43', '内网ip');
INSERT INTO `visitor` VALUES ('48', '游客', '0:0:0:0:0:0:0:1', '2019-11-27 15:19:27', '内网ip');
INSERT INTO `visitor` VALUES ('49', '游客', '0:0:0:0:0:0:0:1', '2019-11-27 15:19:41', '内网ip');
INSERT INTO `visitor` VALUES ('50', '游客', '0:0:0:0:0:0:0:1', '2019-11-27 15:26:43', '内网ip');
INSERT INTO `visitor` VALUES ('51', '游客', '127.0.0.1', '2019-11-28 08:25:19', '内网ip');
INSERT INTO `visitor` VALUES ('52', '游客', '0:0:0:0:0:0:0:1', '2019-11-28 08:25:23', '内网ip');
INSERT INTO `visitor` VALUES ('53', '游客', '0:0:0:0:0:0:0:1', '2019-11-28 08:26:04', '内网ip');
INSERT INTO `visitor` VALUES ('54', '游客', '0:0:0:0:0:0:0:1', '2019-11-28 08:27:04', '内网ip');
INSERT INTO `visitor` VALUES ('55', '游客', '0:0:0:0:0:0:0:1', '2019-11-28 08:27:14', '内网ip');
INSERT INTO `visitor` VALUES ('56', '游客', '0:0:0:0:0:0:0:1', '2019-11-28 08:28:20', '内网ip');
INSERT INTO `visitor` VALUES ('57', '游客', '127.0.0.1', '2019-11-28 08:50:47', '内网ip');
INSERT INTO `visitor` VALUES ('58', '游客', '0:0:0:0:0:0:0:1', '2019-11-28 08:50:48', '内网ip');
INSERT INTO `visitor` VALUES ('59', '游客', '0:0:0:0:0:0:0:1', '2019-11-28 08:50:54', '内网ip');
INSERT INTO `visitor` VALUES ('60', '游客', '127.0.0.1', '2019-11-28 09:09:22', '内网ip');
INSERT INTO `visitor` VALUES ('61', '游客', '0:0:0:0:0:0:0:1', '2019-11-28 09:09:24', '内网ip');
INSERT INTO `visitor` VALUES ('63', '游客', '0:0:0:0:0:0:0:1', '2019-11-28 12:02:05', '内网ip');
INSERT INTO `visitor` VALUES ('65', '游客', '127.0.0.1', '2019-11-28 12:03:26', '内网IP');
INSERT INTO `visitor` VALUES ('66', '游客', '0:0:0:0:0:0:0:1', '2019-11-28 12:03:27', '内网ip');
INSERT INTO `visitor` VALUES ('67', '游客', '0:0:0:0:0:0:0:1', '2019-11-28 12:03:31', '内网ip');
INSERT INTO `visitor` VALUES ('69', '游客', '127.0.0.1', '2019-11-28 12:09:09', '内网IP');
INSERT INTO `visitor` VALUES ('70', '游客', '0:0:0:0:0:0:0:1', '2019-11-28 12:09:11', '内网ip');
INSERT INTO `visitor` VALUES ('71', '雯雯', '0:0:0:0:0:0:0:1', '2019-11-28 12:09:24', '内网ip');
INSERT INTO `visitor` VALUES ('72', '雯雯', '0:0:0:0:0:0:0:1', '2019-11-28 12:12:52', '内网ip');
INSERT INTO `visitor` VALUES ('73', '雯雯', '0:0:0:0:0:0:0:1', '2019-11-28 12:17:36', '内网ip');
INSERT INTO `visitor` VALUES ('74', '雯雯', '0:0:0:0:0:0:0:1', '2019-11-28 12:18:29', '内网ip');
INSERT INTO `visitor` VALUES ('75', '游客', '127.0.0.1', '2019-11-28 19:40:20', '内网ip');
INSERT INTO `visitor` VALUES ('76', '游客', '0:0:0:0:0:0:0:1', '2019-11-28 19:40:22', '内网ip');
INSERT INTO `visitor` VALUES ('77', '游客', '127.0.0.1', '2019-11-29 12:59:55', '内网IP');
INSERT INTO `visitor` VALUES ('78', '游客', '0:0:0:0:0:0:0:1', '2019-11-29 12:59:57', '内网ip');
INSERT INTO `visitor` VALUES ('79', '游客', '0:0:0:0:0:0:0:1', '2019-11-29 13:00:11', '内网ip');
INSERT INTO `visitor` VALUES ('80', '游客', '127.0.0.1', '2019-11-29 13:01:21', '内网IP');
INSERT INTO `visitor` VALUES ('81', '游客', '0:0:0:0:0:0:0:1', '2019-11-29 13:01:23', '内网ip');
INSERT INTO `visitor` VALUES ('82', '游客', '0:0:0:0:0:0:0:1', '2019-11-29 13:01:25', '内网ip');
INSERT INTO `visitor` VALUES ('83', '雯雯', '0:0:0:0:0:0:0:1', '2019-11-29 13:01:34', '内网ip');
INSERT INTO `visitor` VALUES ('84', '游客', '127.0.0.1', '2019-11-29 18:42:18', '内网IP');
INSERT INTO `visitor` VALUES ('85', '游客', '0:0:0:0:0:0:0:1', '2019-11-29 18:42:19', '内网ip');
INSERT INTO `visitor` VALUES ('86', '雯雯', '0:0:0:0:0:0:0:1', '2019-11-29 18:42:29', '内网ip');
INSERT INTO `visitor` VALUES ('87', '雯雯', '0:0:0:0:0:0:0:1', '2019-11-29 19:00:13', '内网ip');
INSERT INTO `visitor` VALUES ('88', '雯雯', '0:0:0:0:0:0:0:1', '2019-11-29 19:13:00', '内网ip');
INSERT INTO `visitor` VALUES ('89', '雯雯', '0:0:0:0:0:0:0:1', '2019-11-29 19:31:36', '内网ip');
INSERT INTO `visitor` VALUES ('90', '游客', '127.0.0.1', '2019-11-29 19:32:26', '内网IP');
INSERT INTO `visitor` VALUES ('91', '游客', '0:0:0:0:0:0:0:1', '2019-11-29 19:32:28', '内网ip');
INSERT INTO `visitor` VALUES ('92', '游客', '0:0:0:0:0:0:0:1', '2019-11-29 19:34:30', '内网ip');
INSERT INTO `visitor` VALUES ('93', '游客', '0:0:0:0:0:0:0:1', '2019-11-29 19:38:45', '内网ip');
INSERT INTO `visitor` VALUES ('94', '雯雯', '0:0:0:0:0:0:0:1', '2019-11-29 19:39:00', '内网ip');
INSERT INTO `visitor` VALUES ('95', '雯雯', '0:0:0:0:0:0:0:1', '2019-11-29 19:40:59', '内网ip');
INSERT INTO `visitor` VALUES ('96', '游客', '127.0.0.1', '2019-11-30 10:13:23', '内网IP');
INSERT INTO `visitor` VALUES ('97', '游客', '0:0:0:0:0:0:0:1', '2019-11-30 10:13:26', '内网ip');
INSERT INTO `visitor` VALUES ('98', '游客', '127.0.0.1', '2019-12-01 14:03:10', '内网IP');
INSERT INTO `visitor` VALUES ('99', '游客', '0:0:0:0:0:0:0:1', '2019-12-01 14:03:12', '内网ip');
INSERT INTO `visitor` VALUES ('100', '游客', '127.0.0.1', '2019-12-01 19:40:45', '内网ip');
INSERT INTO `visitor` VALUES ('101', '游客', '0:0:0:0:0:0:0:1', '2019-12-01 19:40:46', '内网ip');
INSERT INTO `visitor` VALUES ('102', '游客', '127.0.0.1', '2019-12-01 19:45:55', '内网IP');
INSERT INTO `visitor` VALUES ('103', '游客', '0:0:0:0:0:0:0:1', '2019-12-01 19:45:56', '内网ip');
INSERT INTO `visitor` VALUES ('104', '游客', '127.0.0.1', '2019-12-01 19:52:07', '内网IP');
INSERT INTO `visitor` VALUES ('105', '游客', '0:0:0:0:0:0:0:1', '2019-12-01 19:52:08', '内网ip');
INSERT INTO `visitor` VALUES ('106', '游客', '127.0.0.1', '2019-12-01 19:54:20', '内网IP');
INSERT INTO `visitor` VALUES ('107', '游客', '0:0:0:0:0:0:0:1', '2019-12-01 19:54:21', '内网ip');
INSERT INTO `visitor` VALUES ('108', '游客', '127.0.0.1', '2019-12-01 20:04:22', '内网IP');
INSERT INTO `visitor` VALUES ('109', '游客', '0:0:0:0:0:0:0:1', '2019-12-01 20:04:24', '内网ip');
INSERT INTO `visitor` VALUES ('110', '游客', '127.0.0.1', '2019-12-01 20:05:40', '内网IP');
INSERT INTO `visitor` VALUES ('111', '游客', '0:0:0:0:0:0:0:1', '2019-12-01 20:05:41', '内网ip');
INSERT INTO `visitor` VALUES ('112', '游客', '127.0.0.1', '2019-12-01 20:06:48', '内网IP');
INSERT INTO `visitor` VALUES ('113', '游客', '0:0:0:0:0:0:0:1', '2019-12-01 20:06:49', '内网ip');
INSERT INTO `visitor` VALUES ('114', '游客', '127.0.0.1', '2019-12-01 20:11:54', '内网IP');
INSERT INTO `visitor` VALUES ('115', '游客', '0:0:0:0:0:0:0:1', '2019-12-01 20:11:56', '内网ip');
INSERT INTO `visitor` VALUES ('116', '游客', '127.0.0.1', '2019-12-01 20:13:39', '内网IP');
INSERT INTO `visitor` VALUES ('117', '游客', '0:0:0:0:0:0:0:1', '2019-12-01 20:13:40', '内网ip');
INSERT INTO `visitor` VALUES ('118', '游客', '127.0.0.1', '2019-12-01 20:23:38', '内网IP');
INSERT INTO `visitor` VALUES ('119', '游客', '0:0:0:0:0:0:0:1', '2019-12-01 20:23:39', '内网ip');
INSERT INTO `visitor` VALUES ('120', '游客', '127.0.0.1', '2019-12-01 20:25:21', '内网IP');
INSERT INTO `visitor` VALUES ('121', '游客', '0:0:0:0:0:0:0:1', '2019-12-01 20:25:22', '内网ip');
INSERT INTO `visitor` VALUES ('122', '游客', '0:0:0:0:0:0:0:1', '2019-12-01 20:31:43', '内网ip');
INSERT INTO `visitor` VALUES ('123', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-01 20:31:53', '内网ip');
INSERT INTO `visitor` VALUES ('124', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-01 20:32:04', '内网ip');
INSERT INTO `visitor` VALUES ('125', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-01 20:43:57', '内网ip');
INSERT INTO `visitor` VALUES ('126', '游客', '127.0.0.1', '2019-12-01 20:47:47', '内网IP');
INSERT INTO `visitor` VALUES ('127', '游客', '0:0:0:0:0:0:0:1', '2019-12-01 20:47:48', '内网ip');
INSERT INTO `visitor` VALUES ('128', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-01 20:47:57', '内网ip');
INSERT INTO `visitor` VALUES ('129', '游客', '0:0:0:0:0:0:0:1', '2019-12-01 21:09:07', '内网ip');
INSERT INTO `visitor` VALUES ('130', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-01 21:09:28', '内网ip');
INSERT INTO `visitor` VALUES ('131', '游客', '0:0:0:0:0:0:0:1', '2019-12-01 21:09:37', '内网ip');
INSERT INTO `visitor` VALUES ('132', '地方', '0:0:0:0:0:0:0:1', '2019-12-01 21:09:58', '内网ip');
INSERT INTO `visitor` VALUES ('133', '地方', '0:0:0:0:0:0:0:1', '2019-12-01 21:11:20', '内网ip');
INSERT INTO `visitor` VALUES ('134', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-01 21:11:45', '内网ip');
INSERT INTO `visitor` VALUES ('135', '游客', '127.0.0.1', '2019-12-01 21:12:18', '内网IP');
INSERT INTO `visitor` VALUES ('136', '游客', '0:0:0:0:0:0:0:1', '2019-12-01 21:12:19', '内网ip');
INSERT INTO `visitor` VALUES ('137', '游客', '0:0:0:0:0:0:0:1', '2019-12-01 21:13:03', '内网ip');
INSERT INTO `visitor` VALUES ('138', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-01 21:13:18', '内网ip');
INSERT INTO `visitor` VALUES ('139', '地方', '0:0:0:0:0:0:0:1', '2019-12-01 21:13:40', '内网ip');
INSERT INTO `visitor` VALUES ('140', '地方', '0:0:0:0:0:0:0:1', '2019-12-01 21:13:45', '内网ip');
INSERT INTO `visitor` VALUES ('141', '游客', '127.0.0.1', '2019-12-01 21:38:50', '内网IP');
INSERT INTO `visitor` VALUES ('142', '游客', '0:0:0:0:0:0:0:1', '2019-12-01 21:38:51', '内网ip');
INSERT INTO `visitor` VALUES ('143', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-01 21:39:01', '内网ip');
INSERT INTO `visitor` VALUES ('144', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-01 21:40:10', '内网ip');
INSERT INTO `visitor` VALUES ('145', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-01 21:40:37', '内网ip');
INSERT INTO `visitor` VALUES ('146', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-01 21:41:26', '内网ip');
INSERT INTO `visitor` VALUES ('147', '游客', '127.0.0.1', '2019-12-01 21:47:01', '内网IP');
INSERT INTO `visitor` VALUES ('148', '游客', '0:0:0:0:0:0:0:1', '2019-12-01 21:47:03', '内网ip');
INSERT INTO `visitor` VALUES ('149', '游客', '127.0.0.1', '2019-12-02 12:53:52', '内网IP');
INSERT INTO `visitor` VALUES ('150', '游客', '0:0:0:0:0:0:0:1', '2019-12-02 12:53:54', '内网ip');
INSERT INTO `visitor` VALUES ('151', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-02 12:54:27', '内网ip');
INSERT INTO `visitor` VALUES ('152', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-02 12:54:46', '内网ip');
INSERT INTO `visitor` VALUES ('153', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-02 12:56:49', '内网ip');
INSERT INTO `visitor` VALUES ('154', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-02 12:57:18', '内网ip');
INSERT INTO `visitor` VALUES ('155', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-02 12:58:19', '内网ip');
INSERT INTO `visitor` VALUES ('156', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-02 13:01:52', '内网ip');
INSERT INTO `visitor` VALUES ('157', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-02 13:02:44', '内网ip');
INSERT INTO `visitor` VALUES ('158', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-02 13:07:01', '内网ip');
INSERT INTO `visitor` VALUES ('159', '游客', '127.0.0.1', '2019-12-02 13:10:09', '内网IP');
INSERT INTO `visitor` VALUES ('160', '游客', '0:0:0:0:0:0:0:1', '2019-12-02 13:10:11', '内网ip');
INSERT INTO `visitor` VALUES ('161', '游客', '127.0.0.1', '2019-12-02 13:11:56', '内网IP');
INSERT INTO `visitor` VALUES ('162', '游客', '0:0:0:0:0:0:0:1', '2019-12-02 13:11:58', '内网ip');
INSERT INTO `visitor` VALUES ('163', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-02 13:12:36', '内网ip');
INSERT INTO `visitor` VALUES ('164', '游客', '127.0.0.1', '2019-12-02 14:51:46', '内网IP');
INSERT INTO `visitor` VALUES ('165', '游客', '0:0:0:0:0:0:0:1', '2019-12-02 14:51:48', '内网ip');
INSERT INTO `visitor` VALUES ('166', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-02 14:51:56', '内网ip');
INSERT INTO `visitor` VALUES ('167', '游客', '127.0.0.1', '2019-12-02 16:14:19', '内网IP');
INSERT INTO `visitor` VALUES ('168', '游客', '0:0:0:0:0:0:0:1', '2019-12-02 16:14:24', '内网ip');
INSERT INTO `visitor` VALUES ('169', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-02 16:14:41', '内网ip');
INSERT INTO `visitor` VALUES ('170', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-02 16:15:40', '内网ip');
INSERT INTO `visitor` VALUES ('171', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-02 16:16:13', '内网ip');
INSERT INTO `visitor` VALUES ('172', '游客', '127.0.0.1', '2019-12-02 16:23:16', '内网IP');
INSERT INTO `visitor` VALUES ('173', '游客', '0:0:0:0:0:0:0:1', '2019-12-02 16:23:19', '内网ip');
INSERT INTO `visitor` VALUES ('174', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-02 16:23:29', '内网ip');
INSERT INTO `visitor` VALUES ('175', '游客', '127.0.0.1', '2019-12-02 16:52:52', '内网IP');
INSERT INTO `visitor` VALUES ('176', '游客', '0:0:0:0:0:0:0:1', '2019-12-02 16:52:54', '内网ip');
INSERT INTO `visitor` VALUES ('177', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-02 16:53:10', '内网ip');
INSERT INTO `visitor` VALUES ('178', '游客', '0:0:0:0:0:0:0:1', '2019-12-02 19:02:43', '内网ip');
INSERT INTO `visitor` VALUES ('179', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-02 19:02:56', '内网ip');
INSERT INTO `visitor` VALUES ('180', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-02 19:06:15', '内网ip');
INSERT INTO `visitor` VALUES ('181', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-02 19:06:21', '内网ip');
INSERT INTO `visitor` VALUES ('182', '游客', '127.0.0.1', '2019-12-02 19:41:05', '内网IP');
INSERT INTO `visitor` VALUES ('183', '游客', '0:0:0:0:0:0:0:1', '2019-12-02 19:41:06', '内网ip');
INSERT INTO `visitor` VALUES ('184', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-02 19:41:19', '内网ip');
INSERT INTO `visitor` VALUES ('185', '游客', '127.0.0.1', '2019-12-02 19:42:27', '内网IP');
INSERT INTO `visitor` VALUES ('186', '游客', '0:0:0:0:0:0:0:1', '2019-12-02 19:42:28', '内网ip');
INSERT INTO `visitor` VALUES ('187', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-02 19:42:39', '内网ip');
INSERT INTO `visitor` VALUES ('188', '游客', '127.0.0.1', '2019-12-02 19:43:54', '内网IP');
INSERT INTO `visitor` VALUES ('189', '游客', '0:0:0:0:0:0:0:1', '2019-12-02 19:43:55', '内网ip');
INSERT INTO `visitor` VALUES ('190', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-02 19:44:07', '内网ip');
INSERT INTO `visitor` VALUES ('191', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-02 19:48:49', '内网ip');
INSERT INTO `visitor` VALUES ('192', '游客', '127.0.0.1', '2019-12-02 19:52:44', '内网ip');
INSERT INTO `visitor` VALUES ('193', '游客', '0:0:0:0:0:0:0:1', '2019-12-02 19:52:45', '内网ip');
INSERT INTO `visitor` VALUES ('194', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-02 19:52:55', '内网ip');
INSERT INTO `visitor` VALUES ('195', '游客', '127.0.0.1', '2019-12-02 19:54:48', '内网ip');
INSERT INTO `visitor` VALUES ('196', '游客', '0:0:0:0:0:0:0:1', '2019-12-02 19:54:49', '内网ip');
INSERT INTO `visitor` VALUES ('197', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-02 19:54:58', '内网ip');
INSERT INTO `visitor` VALUES ('198', '游客', '127.0.0.1', '2019-12-02 19:55:35', '内网IP');
INSERT INTO `visitor` VALUES ('199', '游客', '0:0:0:0:0:0:0:1', '2019-12-02 19:55:36', '内网ip');
INSERT INTO `visitor` VALUES ('200', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-02 19:55:47', '内网ip');
INSERT INTO `visitor` VALUES ('201', '游客', '127.0.0.1', '2019-12-02 20:48:30', '内网IP');
INSERT INTO `visitor` VALUES ('202', '游客', '0:0:0:0:0:0:0:1', '2019-12-02 20:48:31', '内网ip');
INSERT INTO `visitor` VALUES ('203', '游客', '0:0:0:0:0:0:0:1', '2019-12-02 20:49:32', '内网ip');
INSERT INTO `visitor` VALUES ('204', '游客', '0:0:0:0:0:0:0:1', '2019-12-02 20:50:25', '内网ip');
INSERT INTO `visitor` VALUES ('205', '游客', '0:0:0:0:0:0:0:1', '2019-12-02 20:50:47', '内网ip');
INSERT INTO `visitor` VALUES ('206', '游客', '0:0:0:0:0:0:0:1', '2019-12-02 20:52:06', '内网ip');
INSERT INTO `visitor` VALUES ('207', '游客', '127.0.0.1', '2019-12-02 21:08:33', '内网IP');
INSERT INTO `visitor` VALUES ('208', '游客', '0:0:0:0:0:0:0:1', '2019-12-02 21:08:35', '内网ip');
INSERT INTO `visitor` VALUES ('209', '游客', '0:0:0:0:0:0:0:1', '2019-12-02 21:08:51', '内网ip');
INSERT INTO `visitor` VALUES ('210', '游客', '127.0.0.1', '2019-12-02 21:23:02', '内网IP');
INSERT INTO `visitor` VALUES ('211', '游客', '0:0:0:0:0:0:0:1', '2019-12-02 21:23:03', '内网ip');
INSERT INTO `visitor` VALUES ('212', '游客', '0:0:0:0:0:0:0:1', '2019-12-02 21:25:05', '内网ip');
INSERT INTO `visitor` VALUES ('213', '游客', '0:0:0:0:0:0:0:1', '2019-12-02 21:26:32', '内网ip');
INSERT INTO `visitor` VALUES ('214', '游客', '0:0:0:0:0:0:0:1', '2019-12-02 21:26:49', '内网ip');
INSERT INTO `visitor` VALUES ('215', '游客', '0:0:0:0:0:0:0:1', '2019-12-02 21:29:58', '内网ip');
INSERT INTO `visitor` VALUES ('216', '游客', '0:0:0:0:0:0:0:1', '2019-12-02 21:31:29', '内网ip');
INSERT INTO `visitor` VALUES ('217', '游客', '0:0:0:0:0:0:0:1', '2019-12-02 21:32:34', '内网ip');
INSERT INTO `visitor` VALUES ('218', '游客', '0:0:0:0:0:0:0:1', '2019-12-02 21:36:26', '内网ip');
INSERT INTO `visitor` VALUES ('219', '游客', '127.0.0.1', '2019-12-03 08:25:25', '内网IP');
INSERT INTO `visitor` VALUES ('220', '游客', '0:0:0:0:0:0:0:1', '2019-12-03 08:25:26', '内网ip');
INSERT INTO `visitor` VALUES ('221', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-03 08:25:36', '内网ip');
INSERT INTO `visitor` VALUES ('222', '游客', '127.0.0.1', '2019-12-03 08:32:02', '内网ip');
INSERT INTO `visitor` VALUES ('223', '游客', '0:0:0:0:0:0:0:1', '2019-12-03 08:32:04', '内网ip');
INSERT INTO `visitor` VALUES ('224', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-03 08:32:14', '内网ip');
INSERT INTO `visitor` VALUES ('225', '游客', '127.0.0.1', '2019-12-03 08:34:05', '内网ip');
INSERT INTO `visitor` VALUES ('226', '游客', '0:0:0:0:0:0:0:1', '2019-12-03 08:34:08', '内网ip');
INSERT INTO `visitor` VALUES ('227', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-03 08:34:17', '内网ip');
INSERT INTO `visitor` VALUES ('228', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-03 08:37:55', '内网ip');
INSERT INTO `visitor` VALUES ('229', '游客', '127.0.0.1', '2019-12-03 14:03:58', '内网ip');
INSERT INTO `visitor` VALUES ('230', '游客', '0:0:0:0:0:0:0:1', '2019-12-03 14:04:01', '内网ip');
INSERT INTO `visitor` VALUES ('231', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-03 14:04:10', '内网ip');
INSERT INTO `visitor` VALUES ('232', '游客', '127.0.0.1', '2019-12-03 14:37:48', '内网ip');
INSERT INTO `visitor` VALUES ('233', '游客', '0:0:0:0:0:0:0:1', '2019-12-03 14:37:51', '内网ip');
INSERT INTO `visitor` VALUES ('234', '游客', '0:0:0:0:0:0:0:1', '2019-12-03 14:38:04', '内网ip');
INSERT INTO `visitor` VALUES ('235', '游客', '0:0:0:0:0:0:0:1', '2019-12-03 14:39:55', '内网ip');
INSERT INTO `visitor` VALUES ('236', '游客', '0:0:0:0:0:0:0:1', '2019-12-03 14:41:21', '内网ip');
INSERT INTO `visitor` VALUES ('237', '游客', '0:0:0:0:0:0:0:1', '2019-12-03 14:41:37', '内网ip');
INSERT INTO `visitor` VALUES ('238', '游客', '0:0:0:0:0:0:0:1', '2019-12-03 14:43:56', '内网ip');
INSERT INTO `visitor` VALUES ('239', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-03 14:45:01', '内网ip');
INSERT INTO `visitor` VALUES ('240', '游客', '0:0:0:0:0:0:0:1', '2019-12-03 15:53:56', '内网ip');
INSERT INTO `visitor` VALUES ('241', '游客', '0:0:0:0:0:0:0:1', '2019-12-03 15:54:23', '内网ip');
INSERT INTO `visitor` VALUES ('242', '游客', '0:0:0:0:0:0:0:1', '2019-12-03 15:54:27', '内网ip');
INSERT INTO `visitor` VALUES ('243', '雯雯', '0:0:0:0:0:0:0:1', '2019-12-03 15:55:22', '内网ip');
