/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50638
 Source Host           : localhost:3306
 Source Schema         : o2oshop

 Target Server Type    : MySQL
 Target Server Version : 50638
 File Encoding         : 65001

 Date: 11/02/2018 21:35:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for o2o_area
-- ----------------------------
DROP TABLE IF EXISTS `o2o_area`;
CREATE TABLE `o2o_area`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `city_id` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(10) NOT NULL DEFAULT 0,
  `listorder` int(8) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `create_time` int(11) NOT NULL DEFAULT 0,
  `update_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `city_id`(`city_id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商圈表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for o2o_bis
-- ----------------------------
DROP TABLE IF EXISTS `o2o_bis`;
CREATE TABLE `o2o_bis`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `licence_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `city_id` int(11) NOT NULL DEFAULT 0,
  `city_path` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `bank_info` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `money` decimal(20, 2) NOT NULL DEFAULT 0.00,
  `bank_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `bank_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商户名',
  `faren` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '法人',
  `faren_tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `listorder` int(8) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `create_time` int(11) NOT NULL DEFAULT 0,
  `update_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `city_id`(`city_id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of o2o_bis
-- ----------------------------
INSERT INTO `o2o_bis` VALUES (7, 'test111', 'tuplelist@126.com', '/upload\\20171216\\e1555ad05ff776e44f764d0806e02aa9.gif', '/upload\\20171216\\87aa3fe6a706a2a252be1a47191d2e7c.gif', '<p>dd</p>', 8, '8', '123', 0.00, '中国工商银行', '王新华', '王新华', '18618158951', 0, -1, 1513419611, 1517216987);
INSERT INTO `o2o_bis` VALUES (8, '冯绍峰吧', 'tuplelist@126.com', '/upload\\20180108\\32282b09be161e49738497b42b645061.jpg', '/upload\\20180108\\73e14d5dd3b2227049204c5ce0dfd807.gif', '<p>而非更多人感到光荣反弹</p>', 3, '3,5', '3213123412412412', 0.00, '中国银行', '王', '王', '1547896542', 0, 1, 1515403813, 1515403840);
INSERT INTO `o2o_bis` VALUES (10, '&lt;script&gt;alert(1)&lt;/script&gt;', '1342961475@qq.com', '/upload\\20180202\\63fc7dcb774dd29d544085c97165ed98.gif', '/upload\\20180202\\6397e3fa1fb0a893f5d23da7373678fa.gif', '<p>&lt;script&gt;alert(1)&lt;/script&gt;</p>', 3, '3,5', '423423423412342', 0.00, 'dfgsg', '14fds', 'sfedf', '231234141', 0, 0, 1517536597, 1517536597);
INSERT INTO `o2o_bis` VALUES (11, '&lt;script&gt;alert(\'nihao\')&lt;/script&gt;', '1342961475@qq.com', '', '', '&lt;p&gt;fsdfsdg&lt;/p&gt;&lt;p&gt;&amp;lt;script&amp;gt;alert(&amp;#39;nihao&amp;#39;)&amp;lt;/script&amp;gt;&lt;/p&gt;&lt;p&gt;dasdfs&lt;/p&gt;', 3, '3,7', '423423423412342', 0.00, 'dfgsg', '14fds', 'sfedf', '231234141', 0, 0, 1517537268, 1517537268);
INSERT INTO `o2o_bis` VALUES (12, '&lt;script&gt;alert(1)&lt;/script&gt;', '1342961475@qq.com', '/upload\\20180202\\64a5f82f8faded1502ca86de96c6f758.gif', '/upload\\20180202\\7192feb05285744d1314011d78169899.gif', '&lt;p&gt;&amp;lt;script&amp;gt;alert(&amp;#39;nihao&amp;#39;)&amp;lt;/script&amp;gt;&lt;/p&gt;', 1, '1,2', '423423423412342', 0.00, 'dfgsg', '14fds', 'sfedf', '231234141', 0, 0, 1517537410, 1517537410);

-- ----------------------------
-- Table structure for o2o_bis_account
-- ----------------------------
DROP TABLE IF EXISTS `o2o_bis_account`;
CREATE TABLE `o2o_bis_account`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `bis_id` int(11) NOT NULL DEFAULT 0,
  `last_login_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `last_login_time` int(11) NOT NULL DEFAULT 0,
  `is_main` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否是总管理员',
  `listorder` int(8) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `create_time` int(11) NOT NULL DEFAULT 0,
  `update_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE,
  INDEX `bis_id`(`bis_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商户账号' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of o2o_bis_account
-- ----------------------------
INSERT INTO `o2o_bis_account` VALUES (2, 'o2o1', '123456', '93497', 7, '', 0, 1, 0, -1, 1513419611, 1517216987);
INSERT INTO `o2o_bis_account` VALUES (3, '123', '2b7dc83b52ab2eb4cafb1c26c2e4fe8d', '41928', 8, '', 1517538516, 1, 0, 1, 1515403814, 1517538516);
INSERT INTO `o2o_bis_account` VALUES (5, '123456', '33a9869db6a37b00e283f61c3d8e27c2', '45439', 10, '', 0, 1, 0, 0, 1517536597, 1517536597);
INSERT INTO `o2o_bis_account` VALUES (6, '123456789', 'eb90ea7f98f024d710a3353aa5f51a56', '93881', 11, '', 0, 1, 0, 0, 1517537269, 1517537269);
INSERT INTO `o2o_bis_account` VALUES (7, 'werwr', '89637fe8daa73dd248330e7ecc6f85ba', '82583', 12, '', 0, 1, 0, 0, 1517537410, 1517537410);

-- ----------------------------
-- Table structure for o2o_bis_location
-- ----------------------------
DROP TABLE IF EXISTS `o2o_bis_location`;
CREATE TABLE `o2o_bis_location`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `contact` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '联系人',
  `xpoint` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '经纬度',
  `ypoint` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '经纬度',
  `bis_id` int(11) NOT NULL DEFAULT 0,
  `open_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_main` tinyint(1) NOT NULL,
  `api_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `city_id` int(11) NOT NULL DEFAULT 0,
  `city_path` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `category_id` int(11) NOT NULL DEFAULT 0,
  `category_path` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `bank_info` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `listorder` int(8) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0待审核 1正常 2不通过 -1删除',
  `create_time` int(11) NOT NULL DEFAULT 0,
  `update_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `city_id`(`city_id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `bis_id`(`bis_id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商户门店' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of o2o_bis_location
-- ----------------------------
INSERT INTO `o2o_bis_location` VALUES (1, 'test111', '', '百花路38号院', '18618158951', '王新华', '113.63045505693', '34.7567844516', 7, '11', '<p>dd</p>', 1, '', 8, '8', 2, '2,', '', 0, -1, 1513419611, 1517216987);
INSERT INTO `o2o_bis_location` VALUES (2, '冯绍峰吧', '/upload\\20180108\\32282b09be161e49738497b42b645061.jpg', '', '1548796542', '王', '113.7611178145', '34.774646520162', 8, '12', '<p>不是都人工费但如果好吧</p>', 1, '郑州市金水区郑东新区农业东路100号', 3, '3,5', 2, '2,9', '', 0, 1, 1515403813, 1515403840);
INSERT INTO `o2o_bis_location` VALUES (3, '但是更多人废话', '/upload\\20180108\\dd1298d77f97d2e70867fd2f1b8bc6c7.jpeg', '', '1547896542', '富商大贾', '113.77684348608', '34.784436127584', 8, '12', '<p>sadfasdfcs&nbsp;</p>', 0, '郑州市金水区心怡路36号', 8, '8', 2, '2,4', '', 0, 1, 1515403966, 1516095786);
INSERT INTO `o2o_bis_location` VALUES (4, 'gfvdhrfgftgdb', '/upload\\20180116\\4efe203f1d37f081e44867983f2d68b2.jpg', '', '15787441525441', '讽德诵功', '113.7483690627', '34.763560190827', 8, '9:00-19:00', '<p>esgbdfhbdfgsfgdbdsfsd&nbsp;V东风公司地方时代风格的本地风光V的谁的风格V地方df</p>', 0, '郑州市金水区兴荣街17号', 3, '3', 7, '7,', '', 0, -1, 1516095772, 1517216827);
INSERT INTO `o2o_bis_location` VALUES (6, '&lt;script&gt;alert(1)&lt;/script&gt;', '/upload\\20180202\\63fc7dcb774dd29d544085c97165ed98.gif', '', '22342', 'dsfsdf', '113.67748959144', '34.793217565555', 10, '12:00-21:00', '<p>&lt;script&gt;alert(1)&lt;/script&gt;</p>', 1, '郑州市北部农业路8号', 3, '3,5', 2, '2,4', '', 0, 0, 1517536597, 1517536597);
INSERT INTO `o2o_bis_location` VALUES (7, '&lt;script&gt;alert(\'nihao\')&lt;/script&gt;', '', '', '22342', 'dsfsdf', '113.67748959144', '34.793217565555', 11, '12:00-21:00', '&lt;p&gt;adfs&lt;/p&gt;&lt;p&gt;&amp;lt;script&amp;gt;alert(&amp;#39;nihao&amp;#39;)&amp;lt;/script&amp;gt;&lt;/p&gt;', 1, '郑州市北部农业路8号', 3, '3,7', 2, '2,', '', 0, 0, 1517537269, 1517537269);
INSERT INTO `o2o_bis_location` VALUES (8, '&lt;script&gt;alert(1)&lt;/script&gt;', '/upload\\20180202\\64a5f82f8faded1502ca86de96c6f758.gif', '', '22342', 'dsfsdf', '113.67748959144', '34.793217565555', 12, '12:00-21:00', '&lt;p&gt;&amp;lt;script&amp;gt;alert(&amp;#39;nihao&amp;#39;)&amp;lt;/script&amp;gt;&lt;/p&gt;', 1, '郑州市北部农业路8号', 1, '1,2', 2, '2,9', '', 0, 0, 1517537410, 1517537410);

-- ----------------------------
-- Table structure for o2o_category
-- ----------------------------
DROP TABLE IF EXISTS `o2o_category`;
CREATE TABLE `o2o_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `parent_id` int(10) NOT NULL DEFAULT 0,
  `listorder` int(8) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `create_time` int(11) NOT NULL DEFAULT 0,
  `update_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '生活服务分类表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of o2o_category
-- ----------------------------
INSERT INTO `o2o_category` VALUES (1, '美食', 0, 10, 1, 1491992020, 1492652898);
INSERT INTO `o2o_category` VALUES (2, '旅游', 0, 12, 1, 1491992054, 1492652975);
INSERT INTO `o2o_category` VALUES (3, '飞机', 2, 0, 1, 1491992107, 0);
INSERT INTO `o2o_category` VALUES (5, '阅读', 0, 23, -1, 1491992493, 1492072867);
INSERT INTO `o2o_category` VALUES (6, '麻辣烫', 1, 0, 1, 1491995365, 1491995365);
INSERT INTO `o2o_category` VALUES (8, '拉面', 1, 0, 1, 1491995777, 1491995777);
INSERT INTO `o2o_category` VALUES (9, '电影', 0, 11, 1, 1492060639, 1492652917);
INSERT INTO `o2o_category` VALUES (10, '文艺电影', 9, 6, 1, 1492060659, 1492071287);
INSERT INTO `o2o_category` VALUES (11, '汽车', 0, 9, -1, 1492075333, 1493117146);
INSERT INTO `o2o_category` VALUES (12, '宝马', 11, 0, 1, 1492075357, 1492075357);
INSERT INTO `o2o_category` VALUES (13, '文学名著', 5, 0, 1, 1492078888, 1492078888);
INSERT INTO `o2o_category` VALUES (14, '哈利波特', 9, 0, 1, 1492079999, 1492079999);
INSERT INTO `o2o_category` VALUES (15, '休闲', 0, 0, 1, 1492777548, 1492777548);
INSERT INTO `o2o_category` VALUES (16, '娱乐', 0, 0, 1, 1492777558, 1492777558);
INSERT INTO `o2o_category` VALUES (17, '酒店', 0, 5, 1, 1492777621, 1492777633);
INSERT INTO `o2o_category` VALUES (18, '西餐', 1, 0, 1, 1492961252, 1492961252);
INSERT INTO `o2o_category` VALUES (19, '自助烤肉', 1, 0, 1, 1492961810, 1492961810);
INSERT INTO `o2o_category` VALUES (20, '火锅', 1, 0, 1, 1492962070, 1492962070);

-- ----------------------------
-- Table structure for o2o_city
-- ----------------------------
DROP TABLE IF EXISTS `o2o_city`;
CREATE TABLE `o2o_city`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `uname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `listorder` int(8) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uname`(`uname`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of o2o_city
-- ----------------------------
INSERT INTO `o2o_city` VALUES (1, '北京', 'beijing', 0, 0, 0, 1, 1474013959, 0);
INSERT INTO `o2o_city` VALUES (2, '朝阳', 'chaoyang', 1, 0, 0, 1, 1492132250, 0);
INSERT INTO `o2o_city` VALUES (3, '江西', 'jiangxi', 0, 0, 0, 1, 1492132287, 0);
INSERT INTO `o2o_city` VALUES (4, '南昌', 'nanchang', 3, 1, 0, 1, 1492132318, 0);
INSERT INTO `o2o_city` VALUES (5, '上饶', 'shangrao', 3, 0, 0, 1, 1492132347, 0);
INSERT INTO `o2o_city` VALUES (6, '抚州', 'fuzhou', 3, 0, 0, 1, 1492132369, 0);
INSERT INTO `o2o_city` VALUES (7, '景德镇', 'jingdezhen', 3, 0, 0, 1, 1492132394, 0);
INSERT INTO `o2o_city` VALUES (8, '河北', 'hebei', 0, 0, 0, 1, 1492132500, 0);
INSERT INTO `o2o_city` VALUES (9, '廊坊', 'langfang', 8, 0, 0, 1, 1492132600, 0);

-- ----------------------------
-- Table structure for o2o_deal
-- ----------------------------
DROP TABLE IF EXISTS `o2o_deal`;
CREATE TABLE `o2o_deal`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `category_id` int(11) NOT NULL DEFAULT 0,
  `se_category_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `bis_id` int(11) NOT NULL DEFAULT 0,
  `location_ids` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` int(11) NOT NULL DEFAULT 0,
  `end_time` int(11) NOT NULL DEFAULT 0,
  `origin_price` decimal(20, 2) NOT NULL DEFAULT 0.00,
  `current_price` decimal(20, 2) NOT NULL DEFAULT 0.00,
  `city_id` int(11) NOT NULL DEFAULT 0,
  `buy_count` int(11) NOT NULL DEFAULT 0,
  `total_count` int(11) NOT NULL DEFAULT 0,
  `coupons_begin_time` int(11) NOT NULL DEFAULT 0 COMMENT '团购券开始时间',
  `coupons_end_time` int(11) NOT NULL DEFAULT 0,
  `xpoint` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `ypoint` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bis_account_id` int(10) NOT NULL DEFAULT 0 COMMENT '商家id',
  `balance_price` decimal(20, 2) DEFAULT 0.00 COMMENT '结算价',
  `notes` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品提示',
  `listorder` int(8) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `create_time` int(11) NOT NULL DEFAULT 0,
  `update_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE,
  INDEX `se_category_id`(`se_category_id`) USING BTREE,
  INDEX `city_id`(`city_id`) USING BTREE,
  INDEX `start_time`(`start_time`) USING BTREE,
  INDEX `end_time`(`end_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of o2o_deal
-- ----------------------------
INSERT INTO `o2o_deal` VALUES (1, '测试团购商品', 2, '4', 8, '3', '/upload\\20180123\\d9eb452c8eb3739979d1f4d3a89cfa7c.gif', '<p>啊是粉色的分公司时代风格色吧</p>', 1515487680, 1521794880, 67.90, 43.90, 4, 0, 234, 1514882940, 1519375740, '113.77684348608', '34.784436127584', 3, 0.00, '<p>不是都分公司</p>', 0, 1, 1516697467, 1517476386);
INSERT INTO `o2o_deal` VALUES (2, '测试商品', 2, '9', 8, '3,2', '/upload\\20180125\\104c983655c8c11aef2cc82a5e946a43.gif', '<p>法国人打工的人富贵花是大哥大哥时代风格的不的风格还不的风格风格的风格反对过分的</p>', 1515481500, 1547708700, 42.90, 19.90, 2, 0, 456321, 1514790360, 1521702360, '113.77684348608', '34.784436127584', 3, 0.00, '<p>公司的风格大哥的风格的乳房的风格大方分公司的风格发的个地方对方公司的人</p>', 0, 0, 1516863986, 1517302531);
INSERT INTO `o2o_deal` VALUES (3, '测试的', 2, '9', 8, '3,2', '/upload\\20180125\\4b52cdd3cc0067c6ca243a7b26ef8fdf.gif', '<p>单位个人头不少地方</p>', 1516086480, 1518160080, 7851.00, 15.00, 4, 0, 4654, 1516691280, 1518160080, '113.77684348608', '34.784436127584', 3, 0.00, '<p>色鬼回复你</p>', 0, -1, 1516864124, 1517214716);
INSERT INTO `o2o_deal` VALUES (4, '测试', 2, '9,4', 8, '3,2', '/upload\\20180125\\83741e94ceec25958dd6e586b55f99ef.gif', '<p>十大股东合法的方式的风格</p>', 1515309180, 1518160380, 123.00, 12.00, 4, 0, 1234, 1516864380, 1518073980, '113.77684348608', '34.784436127584', 3, 0.00, '<p>富商大贾话费停机</p>', 0, 0, 1516864411, 1516864411);
INSERT INTO `o2o_deal` VALUES (5, '测试商品', 6, '', 8, '3', '/upload\\20180129\\aa02d14f72c27ae22b3d5586b1026389.gif', '<p>发热共和党人发货反<strong>弹的风格大方</strong><span style=\"color: rgb(255, 0, 0);\">不是都粉色的发生的发生的斯蒂芬森</span></p>', 1514859180, 1547691240, 1545.00, 15.00, 2, 0, 154, 1514772840, 1540952040, '113.77684348608', '34.784436127584', 3, 0.00, '<p>色蛋糕的人发生过的人</p>', 0, 1, 1517192106, 1517476644);

-- ----------------------------
-- Table structure for o2o_featured
-- ----------------------------
DROP TABLE IF EXISTS `o2o_featured`;
CREATE TABLE `o2o_featured`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '分类',
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `images` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `listorder` int(8) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `create_time` int(11) NOT NULL DEFAULT 0,
  `update_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '推荐位' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of o2o_featured
-- ----------------------------
INSERT INTO `o2o_featured` VALUES (1, 0, '新浪体育', '/upload\\20180203\\7deaaf2338cc2e0831540302fb89e4c6.jpg', 'www.baidu.com', 'dasdassd', 0, 1, 1517642362, 1517644397);
INSERT INTO `o2o_featured` VALUES (2, 1, 'sdcsazdf', '/upload\\20180203\\9cf509a68e98aa942279e4390109a4fc.gif', 'dasdas', 'dasd', 0, 0, 1517643976, 1517643976);
INSERT INTO `o2o_featured` VALUES (3, 0, 'dasfew', '/upload\\20180203\\f0066bfcf9e94b93a321fce2825abb4c.gif', 'efea', 'dfsaf', 0, 1, 1517643986, 1517646382);
INSERT INTO `o2o_featured` VALUES (4, 1, 'sedfgsdg', '/upload\\20180203\\a382f616a6fec45a3e5541e512ba682c.gif', 'fsdf', 'fsdf', 0, -1, 1517644417, 1517644483);

-- ----------------------------
-- Table structure for o2o_user
-- ----------------------------
DROP TABLE IF EXISTS `o2o_user`;
CREATE TABLE `o2o_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `last_login_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `last_login_time` int(11) NOT NULL DEFAULT 0,
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `listorder` int(8) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `create_time` int(11) NOT NULL DEFAULT 0,
  `update_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of o2o_user
-- ----------------------------
INSERT INTO `o2o_user` VALUES (1, '123', 'd80296986c55cd255d373863a2619872', '2892', '127.0.0.1', 1518277739, '123@qq.com', '', 0, 1, 1518256084, 1518277739);
INSERT INTO `o2o_user` VALUES (3, 'www', '067dc96211f1270a7345efd7ae9b1018', '903', '127.0.0.1', 1518260030, 'wwww@qq.com', '', 0, 1, 1518256311, 1518260030);

SET FOREIGN_KEY_CHECKS = 1;
