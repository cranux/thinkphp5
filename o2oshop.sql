/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50637
 Source Host           : localhost:3306
 Source Schema         : o2oshop

 Target Server Type    : MySQL
 Target Server Version : 50637
 File Encoding         : 65001

 Date: 19/02/2018 17:34:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for o2o_admin
-- ----------------------------
DROP TABLE IF EXISTS `o2o_admin`;
CREATE TABLE `o2o_admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` int(11) NOT NULL DEFAULT 0,
  `update_time` int(11) NOT NULL DEFAULT 0,
  `last_login_time` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of o2o_admin
-- ----------------------------
INSERT INTO `o2o_admin` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 0, 1495108805, 1495108805, 1);

-- ----------------------------
-- Table structure for o2o_area
-- ----------------------------
DROP TABLE IF EXISTS `o2o_area`;
CREATE TABLE `o2o_area`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `city_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `listorder` int(8) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE,
  INDEX `city_id`(`city_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for o2o_bis
-- ----------------------------
DROP TABLE IF EXISTS `o2o_bis`;
CREATE TABLE `o2o_bis`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `licence_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `city_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `city_path` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `bank_info` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `money` decimal(20, 2) NOT NULL DEFAULT 0.00,
  `bank_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `bank_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `faren` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `faren_tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `listorder` int(8) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `city_id`(`city_id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of o2o_bis
-- ----------------------------
INSERT INTO `o2o_bis` VALUES (13, '小明商户', '578464694@qq.com', '\\upload\\20170415\\35177232adce03e47b5ae49771541d8f.jpg', '\\upload\\20170415\\c0e3fd9844a26c029d13b20b4fb8724a.jpg', '这里是商铺介绍', 0, '0,0', '88885555', 0.00, '农业银行', '小明', '小明', '15075652703', 0, 1, 1492243992, 1492515313);
INSERT INTO `o2o_bis` VALUES (14, '小小明商户', '578464694@qq.com', '\\upload\\20170415\\68609fe5e22d8dbcfafe72f4cb7f7329.jpg', '\\upload\\20170415\\0661b02442501e57de81b54231b5284b.jpg', '这里是商铺介绍', 1, '1,2', '7676655', 0.00, '农业银行', '小小明', '小小明', '15075652703', 0, 1, 1492248598, 1492515248);
INSERT INTO `o2o_bis` VALUES (15, '小红商户', '578464694@qq.com', '\\upload\\20170415\\3d219b9a50fd2cb98ee301fd96a4bf26.jpg', '\\upload\\20170415\\51fc7807e7c00c1b161223ecbbdf8ec9.jpg', '<p>店铺介绍</p>', 8, '8,9', '8888888', 0.00, '农业银行', '小红', '小红', '13931644281', 0, 1, 1492266832, 1492515216);
INSERT INTO `o2o_bis` VALUES (19, '柯南商户', '578464694@qq.com', '\\upload\\20170415\\aefec9b158b10e2e92a4274863b59a7e.jpg', '\\upload\\20170415\\5477609d1236acef16120f6e8c2ea55d.jpg', '店铺介绍', 8, '8,9', '8888', 0.00, '农业', '柯南', '柯南', '15075652703', 0, 1, 1492268752, 1492318901);
INSERT INTO `o2o_bis` VALUES (20, '柯北商户', '578464694@qq.com', '\\upload\\20170415\\fc075f60c4c92233ada22cd10426830f.jpg', '\\upload\\20170415\\d437f9eecc2b470c5912e2b9a07896ce.jpg', '店铺介绍', 3, '3,7', '8888', 0.00, '农业', '柯北', '柯北', '15075652703', 0, 2, 1492268859, 1492515529);
INSERT INTO `o2o_bis` VALUES (21, '柯西商户', '578464694@qq.com', '\\upload\\20170416\\fd728f8aaf8759b2141bac428601b400.jpg', '\\upload\\20170416\\8c32a1e588dfa06afc0643891f14c058.jpg', '<p>dddfd</p>', 8, '8,9', '344444', 0.00, '农业', '柯西', '柯西', '15075652703', 0, 2, 1492310543, 1492515505);
INSERT INTO `o2o_bis` VALUES (22, '在下坂本，有何贵干', '578464694@qq.com', '\\upload\\20170416\\4e77f4385ef2cc205e3e30418ac1efd4.jpg', '\\upload\\20170416\\41ce37aa038387fd955cf091ef72afa9.jpg', '<p>我是王宇&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>', 8, '8,9', '6228481006486106160', 0.00, '中国农业银行', '坂本', '坂本', '15075652703', 0, 2, 1492328612, 1492515482);
INSERT INTO `o2o_bis` VALUES (23, '王小明', '578464694@qq.com', '\\upload\\20170422\\b112890b0df2e5fc4abc8f59e23007dd.jpg', '\\upload\\20170422\\87b952f1b3d01e675577e2d9f7eec2b2.jpg', '&lt;p&gt;介绍&lt;/p&gt;', 8, '8,9', '6228481006486106160', 0.00, '中国农业银行', '王宇', '王宇', '15075652703', 0, 1, 1492862012, 1492862065);
INSERT INTO `o2o_bis` VALUES (24, '好伦哥团购', '578464694@qq.com', '\\upload\\20170423\\f88080c3dfe0829b3ff3b6c5dc8d214b.jpg', '\\upload\\20170423\\8d6753f94a42d933b052f8bb5eef04e3.jpg', '&lt;p&gt;好伦哥西餐&lt;br/&gt;&lt;/p&gt;', 8, '8,9', '6228481006486106160', 0.00, '中国农业银行', '王宇', '王宇', '15075652703', 0, 1, 1492961325, 1492961400);
INSERT INTO `o2o_bis` VALUES (25, '柏尔森烤肉自助餐厅', '1259865838@qq.com', '\\upload\\20170423\\56ef8c3c9118617fc171f9f821d55917.jpg', '\\upload\\20170423\\fbbe63a3e69b661508f44cca3bb0926f.jpg', '&lt;p&gt;烤肉自助餐厅&lt;br/&gt;&lt;/p&gt;', 8, '8,9', '6228481006486106160', 0.00, '中国农业银行', '王宇', '王宇', '15075652703', 0, 1, 1492961881, 1492961908);
INSERT INTO `o2o_bis` VALUES (26, '丁丁洋回转自助火锅', '578464694@qq.com', '\\upload\\20170423\\af2aa997eb31f30a8d2c61bb863bca7e.jpg', '\\upload\\20170423\\c498a8c005f2fde65f098f0c353f2fbb.jpg', '&lt;p&gt;自助火锅&lt;/p&gt;', 8, '8,9', '6228481006486106160', 0.00, '中国农业银行', '王宇', '王宇', '15075652703', 0, 1, 1492962196, 1492962992);
INSERT INTO `o2o_bis` VALUES (27, '春园烤肉', '578464694@qq.com', '\\upload\\20170423\\b13f0862a1bc077b56a23eba56fdabfe.jpg', '\\upload\\20170423\\a151f7481fb15ff0be06bf8113365730.jpg', '&lt;p&gt;春园烤肉&lt;/p&gt;', 8, '8,9', '6228481006486106160', 0.00, '中国农业银行', '王宇', '王宇', '15075652703', 0, 1, 1492962467, 1492962822);
INSERT INTO `o2o_bis` VALUES (28, '布拉丝卡南美烤肉', '578464694@qq.com', '\\upload\\20170423\\c59f29555ade5aa91212786aeed41abc.jpg', '\\upload\\20170423\\b92fad767b81463fd6b66c1de523c5b6.jpg', '&lt;p&gt;布拉丝卡南美烤肉&lt;/p&gt;', 8, '8,9', '6228481006486106160', 0.00, '中国农业银行', '王宇', '王宇', '15075652703', 0, 1, 1492962770, 1492962800);
INSERT INTO `o2o_bis` VALUES (29, '伊尔曼都烤肉', '1259865838@qq.com', '\\upload\\20170423\\505d2e1eda7d4dfcc0688c0f89abeb0c.jpg', '\\upload\\20170423\\83643ff55a012c13d9c4b21640101135.jpg', '&lt;h2 style=&quot;font-size: 24px; margin: 8px 0px 2px; padding: 0px; border: 0px; outline: 0px; font-weight: 500; font-family: &amp;#39;Microsoft Yahei&amp;#39;; vertical-align: baseline; line-height: 36px; color: rgb(51, 51, 51); white-space: normal;&quot;&gt;伊尔曼都烤肉&lt;/h2&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 8, '8,9', '6228481006486106160', 0.00, '中国农业银行', '王宇', '王宇', '15075652703', 0, 1, 1492963188, 1492963637);
INSERT INTO `o2o_bis` VALUES (30, '虾吃虾涮', '578464694@qq.com', '\\upload\\20170424\\76166986c7a6444d9667b8d44e410e2d.jpg', '\\upload\\20170424\\5e1a984fe16a240d63c59e815e6206c2.jpg', '&lt;h2 style=&quot;font-size: 24px; margin: 8px 0px 2px; padding: 0px; border: 0px; outline: 0px; font-weight: 500; font-family: &amp;#39;Microsoft Yahei&amp;#39;; vertical-align: baseline; line-height: 36px; color: rgb(51, 51, 51); white-space: normal;&quot;&gt;虾吃虾涮(二大街店)&lt;/h2&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 8, '8,9', '6228481006486106160', 0.00, '中国农业银行', '王宇', '王宇', '15075652703', 0, 1, 1492963617, 1492963630);
INSERT INTO `o2o_bis` VALUES (31, 'testqueue', '578464694@qq.com', '\\upload\\20170506\\a5016c1d83145aced1c4003cc5981115.jpg', '\\upload\\20170506\\3aa075f4b6e39835835e7cec5619ae81.jpg', '&lt;p&gt;测试邮件队列&lt;/p&gt;', 8, '8,9', '6228481006486106160', 0.00, '中国农业银行', '王宇', '王宇', '15075652703', 0, 0, 1494065718, 1494065718);
INSERT INTO `o2o_bis` VALUES (32, 'fewwfse', '3123@qq.com', '/upload\\20180216\\85efa247e795c2781ce48f820637a428.jpg', '/upload\\20180216\\92c580a1d5f2eefda19cb657ec72ee49.jpg', '&lt;h1&gt;gdfgbd不放&lt;span style=&quot;font-family: 隶书, SimLi; font-size: 14px; color: rgb(149, 55, 52); background-color: rgb(242, 242, 242);&quot;&gt;过护肤代购护肤的合法&lt;/span&gt;的合并发的规划&lt;/h1&gt;', 8, '8,9', '2131232', 0.00, 'fdsf', 'fdsf', 'fds', '3231321', 0, 0, 1518788200, 1518788200);

-- ----------------------------
-- Table structure for o2o_bis_account
-- ----------------------------
DROP TABLE IF EXISTS `o2o_bis_account`;
CREATE TABLE `o2o_bis_account`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `bis_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `last_login_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `last_login_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `is_main` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `listorder` int(8) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0待审1通过2失败 -1删除',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bis_id`(`bis_id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of o2o_bis_account
-- ----------------------------
INSERT INTO `o2o_bis_account` VALUES (1, 'wangyu', 'e10adc3949ba59abbe56e057f20f883e', '', 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `o2o_bis_account` VALUES (2, 'wy7452525', '5eba2a9c10ab1cf899946717e139f7d3', '2486', 13, '', 0, 1, 0, 2, 1492243992, 1492515313);
INSERT INTO `o2o_bis_account` VALUES (3, 'admin2', '2cbb4ae726888bd081442304a2e366ae', '9944', 14, '', 0, 1, 0, 2, 1492248598, 1492515248);
INSERT INTO `o2o_bis_account` VALUES (4, 'wang7452525', 'c0f540daa097f7c766b019f0dceedb6c', '4305', 15, '', 0, 1, 0, 2, 1492266832, 1492515216);
INSERT INTO `o2o_bis_account` VALUES (5, 'aaaaaa', 'afeb437d3b602f8b981d86de763887c3', '8391', 19, '', 0, 1, 0, 2, 1492268752, 1492318901);
INSERT INTO `o2o_bis_account` VALUES (6, 'eeeeeee', '75bfac0cefc60edea83b1983445781db', '3340', 20, '', 0, 1, 0, 2, 1492268859, 1492515529);
INSERT INTO `o2o_bis_account` VALUES (7, 'jjuuuuuu', 'f01e6ae830cd01f700d78681d6395e77', '502', 21, '', 0, 1, 0, 2, 1492310543, 1492515505);
INSERT INTO `o2o_bis_account` VALUES (8, '7452525', 'b3dc802324c8dd624becf6aa4460f215', '8946', 21, '', 1492440526, 1, 0, 2, 1492328612, 1492515505);
INSERT INTO `o2o_bis_account` VALUES (9, 'wangwang', '39aed30d0d49cc25d5af97ce00589a6e', '1122', 23, '', 1492862082, 1, 0, 1, 1492862012, 1492862082);
INSERT INTO `o2o_bis_account` VALUES (10, 'haolunge', '2b4bbefd712932b49f5f33ccc7ac441b', '9203', 24, '', 1518863295, 1, 0, 1, 1492961325, 1518863295);
INSERT INTO `o2o_bis_account` VALUES (11, 'boersen', 'd8234d3af8b55022c6a2f727e7ef042b', '583', 25, '', 1518532402, 1, 0, 1, 1492961881, 1518532402);
INSERT INTO `o2o_bis_account` VALUES (12, 'dingdingyang', '90ba8e065e77d747ee2d6ca2da1c8510', '9352', 26, '', 1494850249, 1, 0, 1, 1492962196, 1494850249);
INSERT INTO `o2o_bis_account` VALUES (13, 'chunyuan', '60b8c2b9643f0da78a06454cb0fee56a', '1333', 27, '', 1494730790, 1, 0, 1, 1492962467, 1494730790);
INSERT INTO `o2o_bis_account` VALUES (14, 'bulasika', 'ecd7c7e1a54a2ffbd488c70401d9d80b', '6569', 28, '', 0, 1, 0, 1, 1492962770, 1492962800);
INSERT INTO `o2o_bis_account` VALUES (15, 'yiermandu', '5706fde616d093e1b9a068d729878e1d', '2989', 29, '', 1493995181, 1, 0, 1, 1492963188, 1493995181);
INSERT INTO `o2o_bis_account` VALUES (16, 'xiachi', 'efcac8f80d7190757f719ce297ceded1', '882', 30, '', 1492964088, 1, 0, 1, 1492963617, 1492964088);
INSERT INTO `o2o_bis_account` VALUES (17, 'testqueue', 'df15f1c9a81cdf7a14ca90f5df248c79', '8543', 31, '', 0, 1, 0, 0, 1494065718, 1494065718);
INSERT INTO `o2o_bis_account` VALUES (18, '123456789', '5d211390f865228172ffd1247080dda2', '24839', 32, '', 0, 1, 0, 0, 1518788200, 1518788200);

-- ----------------------------
-- Table structure for o2o_bis_location
-- ----------------------------
DROP TABLE IF EXISTS `o2o_bis_location`;
CREATE TABLE `o2o_bis_location`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `contact` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `xpoint` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `ypoint` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `bis_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `open_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_main` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `api_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `city_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `city_path` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `category_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `category_path` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `bank_info` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `listorder` int(8) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `city_id`(`city_id`) USING BTREE,
  INDEX `bis_id`(`bis_id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 846 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of o2o_bis_location
-- ----------------------------
INSERT INTO `o2o_bis_location` VALUES (3, '柯南的分店', '\\upload\\20170415\\cea5f9408699fed2814d4598bc4d0e9d.jpg', '河北省霸州市信安镇', '15075652703', '王宇', '116.65313694621', '39.158729930098', 19, '', '这里是店铺介绍', 1, '', 8, '8,9', 2, '2,3', '', 0, 1, 1492240685, 1492471905);
INSERT INTO `o2o_bis_location` VALUES (4, '坂本的分店', '\\upload\\20170415\\059924dc3f4e4c800cd9d403d0a5f252.jpg', '河北省廊坊市广阳区新华路199号', '15075652703', '王宇', '116.71203300041', '39.551346099335', 22, '7:00-8:00', '这里是店铺介绍', 1, '', 8, '8,9', 11, '11,12', '', 0, 2, 1492243718, 1492515482);
INSERT INTO `o2o_bis_location` VALUES (6, '有家客栈', '\\upload\\20170415\\234a5e4500a8b9f48ca0f37286d986a2.jpg', '河北省廊坊市广阳区新华路199号', '15075652703', '王宇', '116.71203300041', '39.551346099335', 12, '7:00-8:00', '这里是店铺介绍', 1, '', 3, '3,7', 11, '11,', '', 0, -1, 1492243935, 1494509522);
INSERT INTO `o2o_bis_location` VALUES (9, '大米店铺', '\\upload\\20170415\\3d219b9a50fd2cb98ee301fd96a4bf26.jpg', '河北省霸州市信安镇爱国街', '15075652703', '王宇', '116.65313694621', '39.158729930098', 15, '08:00-22:00', '<p>扛把子</p>', 1, '河北省霸州市信安镇爱国街', 8, '8,9', 9, '9,', '', 0, 2, 1492266832, 1492515216);
INSERT INTO `o2o_bis_location` VALUES (10, 'bilibili', '\\upload\\20170415\\aefec9b158b10e2e92a4274863b59a7e.jpg', '河北省廊坊市广阳区新华路199号', '15075652703', '王宇', '116.71203300041', '39.551346099335', 19, '09:00-22:00', '门店介绍', 1, '河北省廊坊市广阳区新华路199号', 8, '8,9', 9, '9,14|10', '', 0, 1, 1492268752, 1492318901);
INSERT INTO `o2o_bis_location` VALUES (11, '智能姬', '\\upload\\20170415\\fc075f60c4c92233ada22cd10426830f.jpg', '河北省廊坊市广阳区新华路199号', '15075652703', '王宇', '116.71203300041', '39.551346099335', 20, '09:00-22:00', '门店介绍', 1, '河北省廊坊市广阳区新华路199号', 3, '3,7', 9, '9,14|10', '', 0, 2, 1492268859, 1492515529);
INSERT INTO `o2o_bis_location` VALUES (12, 'bilibili的修改分店', '\\upload\\20170416\\fd728f8aaf8759b2141bac428601b400.jpg', '河北省霸州市信安镇爱国街', '15075652703', '王宇', '116.65313694621', '39.158729930098', 21, '08:00-09:00', '<p>水电费</p>', 0, '河北省霸州市信安镇爱国街', 8, '8,0', 9, '9,on', '', 0, -1, 1492310543, 1492444383);
INSERT INTO `o2o_bis_location` VALUES (13, '小明店铺3', '\\upload\\20170416\\96aae8af9ffdad4e5d562b0d5d54e5b4.jpg', '河北省廊坊市广阳区新华路199号', '15075652703', '王宇', '116.71203300041', '39.551346099335', 22, '08:00-22:00', '<p>王宇的店铺&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>', 0, '河北省廊坊市广阳区新华路199号', 8, '8,0', 1, '1,on', '', 0, 1, 1492328612, 1492350787);
INSERT INTO `o2o_bis_location` VALUES (14, '小明的店铺', '\\upload\\20170416\\d258d7d2271fe30a5da68dfa4150e949.jpg', '河北省霸州市信安镇爱国街', '15075652703', '王宇', '116.65313694621', '39.158729930098', 22, '08:00-22:00', '<p>王小明的门店介绍</p>', 0, '河北省霸州市信安镇爱国街', 8, '8,9', 1, '1,6', '', 0, 1, 1492342526, 1492437190);
INSERT INTO `o2o_bis_location` VALUES (16, '小明的分店', '\\upload\\20170417\\2fc496aacc8c8342fb2019607b78ecd2.gif', '河北省霸州市信安镇爱国街', '15075652703', '王宇', '116.65313694621', '39.158729930098', 21, '08:00-22:00', '<p>王小明分店介绍</p>', 0, '河北省霸州市信安镇爱国街', 8, '8,9', 2, '2,3', '', 0, -1, 1492435204, 1492438420);
INSERT INTO `o2o_bis_location` VALUES (17, '我的门店', '\\upload\\20170417\\a2fdd2eca1ef5e5dc182faba7cf0fe8f.jpg', '河北省廊坊市新华路199号', '18855522445', '小明', '116.71203300041', '39.551346099335', 21, '08:00-22:00', '<p>这是门店介绍</p>', 0, '河北省廊坊市新华路199号', 8, '8,9', 1, '1,6', '', 0, -1, 1492440405, 1492445041);
INSERT INTO `o2o_bis_location` VALUES (18, 'bilibili的另一个门店', '\\upload\\20170417\\425149654da4dab16695c504fc82c75a.gif', '河北省廊坊市广阳区新华路199号', '15075652703', '王宇', '116.71203300041', '39.551346099335', 21, '06:00-22:00', '<p>bilibili的另一个门店介绍</p>', 0, '河北省廊坊市广阳区新华路199号', 3, '3,7', 2, '2,3', '', 0, 1, 1492444317, 1492471896);
INSERT INTO `o2o_bis_location` VALUES (19, 'bilibili的另一个门店', '\\upload\\20170418\\7cda152b0845cf3e8071b1cccccaf253.jpg', '河北省霸州市信安镇爱国街', '15075652703', '王宇', '116.65313694621', '39.158729930098', 21, '08:00-22:00', '<p>bilibili的另一个门店</p>', 0, '河北省霸州市信安镇爱国街', 8, '8,9', 2, '2,3', '', 0, 1, 1492472197, 1492472207);
INSERT INTO `o2o_bis_location` VALUES (20, 'bilibili的新加门店', '\\upload\\20170418\\c66ca528b6efee7bde8b4bfb966cb5f4.jpg', '河北省廊坊市安次区爱民东道14号', '15075652703', '王宇', '116.70194823648', '39.532415835593', 21, '07:00-23:00', '<p>bilibili的新加门店</p>', 0, '河北省廊坊市安次区爱民东道14号', 3, '3,7', 2, '2,3', '', 0, 1, 1492472323, 1492472370);
INSERT INTO `o2o_bis_location` VALUES (21, '王小明', '\\upload\\20170422\\b112890b0df2e5fc4abc8f59e23007dd.jpg', '河北省廊坊市广阳区新华路199号', '15075652703', '王宇', '116.71203300041', '39.551346099335', 23, '09:00-22:00', '&lt;p&gt;门店&lt;/p&gt;', 1, '河北省廊坊市广阳区新华路199号', 8, '8,9', 1, '1,', '', 0, 1, 1492862012, 1492862065);
INSERT INTO `o2o_bis_location` VALUES (22, 'wangwang的门店', '\\upload\\20170422\\90e69f82caed9b9797964df32121afea.jpg', '河北省廊坊市广阳区新华路199号', '15075652703', '王宇', '116.71203300041', '39.551346099335', 23, '08:00-22:00', '&lt;p&gt;介绍&lt;/p&gt;', 0, '河北省廊坊市广阳区新华路199号', 8, '8,9', 1, '1,8|6', '', 0, 1, 1492862163, 1492862181);
INSERT INTO `o2o_bis_location` VALUES (23, '好伦哥团购', '\\upload\\20170423\\f88080c3dfe0829b3ff3b6c5dc8d214b.jpg', '廊坊市燕郊天洋广场A馆1层F1A-04号', '15075652703', '王宇', '116.82766516915', '39.971231993239', 24, '11:00-21:00', '&lt;p&gt;提供免费停车位，提供免费WiFi&lt;/p&gt;', 1, '廊坊市燕郊天洋广场A馆1层F1A-04号', 8, '8,9', 1, '1,18', '', 0, 1, 1492961325, 1492961400);
INSERT INTO `o2o_bis_location` VALUES (24, '柏尔森烤肉自助餐厅', '\\upload\\20170423\\56ef8c3c9118617fc171f9f821d55917.jpg', '廊坊市广阳区银河北路119号乐都新天地6楼', '15075652703', '王宇', '116.70498264872', '39.538246682078', 25, '18:00-21:30', '&lt;p&gt;&lt;span class=&quot;text-main&quot;&gt;免费停车，免费WiFi！&lt;/span&gt;&lt;/p&gt;', 1, '廊坊市广阳区银河北路119号乐都新天地6楼', 8, '8,9', 1, '1,19', '', 0, 1, 1492961881, 1492961908);
INSERT INTO `o2o_bis_location` VALUES (25, '丁丁洋回转自助火锅', '\\upload\\20170423\\af2aa997eb31f30a8d2c61bb863bca7e.jpg', '廊坊市广阳区万达广场F座家乐福超市地下一层', '15075652703', '王宇', '116.71410446597', '39.528431526829', 26, '11:00-21:00', '&lt;p&gt;&lt;span class=&quot;text-main&quot;&gt;万达店单人自助火锅&lt;/span&gt;&lt;/p&gt;', 1, '廊坊市广阳区万达广场F座家乐福超市地下一层', 8, '8,9', 1, '1,20', '', 0, 1, 1492962196, 1492962992);
INSERT INTO `o2o_bis_location` VALUES (26, '春园烤肉', '\\upload\\20170423\\b13f0862a1bc077b56a23eba56fdabfe.jpg', '廊坊市广阳区第四大街肯德基4楼', '15075652703', '王宇', '116.73145463413', '39.534755473004', 27, '10:30-21:30', '&lt;h2&gt;春园烤肉(四大街店)&lt;/h2&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1, '廊坊市广阳区第四大街肯德基4楼', 8, '8,9', 1, '1,', '', 0, 1, 1492962467, 1492962822);
INSERT INTO `o2o_bis_location` VALUES (27, '布拉丝卡南美烤肉', '\\upload\\20170423\\c59f29555ade5aa91212786aeed41abc.jpg', '廊坊市广阳区新华路57号月色广场3楼东侧', '15075652703', '王宇', '116.71504276045', '39.527328713462', 28, '11:00-14:00', '&lt;p&gt;提供免费停车位，提供免费WiFi&lt;/p&gt;', 1, '廊坊市广阳区新华路57号月色广场3楼东侧', 8, '8,9', 1, '1,19', '', 0, 1, 1492962770, 1492962800);
INSERT INTO `o2o_bis_location` VALUES (28, '伊尔曼都烤肉', '\\upload\\20170423\\505d2e1eda7d4dfcc0688c0f89abeb0c.jpg', '廊坊市广阳区新华路50号万达广场六楼', '15075652703', '王宇', '116.71281826585', '39.526693586707', 29, '11:00-21:00', '&lt;p&gt;提供免费停车位，提供免费WiFi&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1, '廊坊市广阳区新华路50号万达广场六楼', 8, '8,9', 1, '1,19', '', 0, 1, 1492963188, 1492963637);
INSERT INTO `o2o_bis_location` VALUES (29, '虾吃虾涮', '\\upload\\20170424\\76166986c7a6444d9667b8d44e410e2d.jpg', '廊坊市广阳区二大街北外街中段', '15075652703', '王宇', '116.72938960942', '39.540571622006', 30, '11:00-21:30', '&lt;p&gt;&lt;span style=&quot;color: rgb(88, 88, 88); font-family: &amp;#39;Hiragino Sans GB&amp;#39;, arial, Verdana, tahoma, 宋体, sans-serif; font-size: 14px; line-height: 25px;&quot;&gt;店内免费提供应季新鲜水果，另店内提供南瓜粥自助、小凉菜自助&lt;/span&gt;&lt;/p&gt;', 1, '廊坊市广阳区二大街北外街中段', 8, '8,9', 1, '1,20', '', 0, 1, 1492963617, 1492963630);
INSERT INTO `o2o_bis_location` VALUES (30, 'testqueue', '\\upload\\20170506\\a5016c1d83145aced1c4003cc5981115.jpg', '河北省廊坊市广阳区新华路199号', '15075652703', '王宇', '116.71203300041', '39.551346099335', 31, '08:00-22:00', '&lt;p&gt;测试邮件队列的介绍&lt;/p&gt;', 1, '河北省廊坊市广阳区新华路199号', 8, '8,9', 1, '1,20', '', 0, 0, 1494065718, 1494065718);
INSERT INTO `o2o_bis_location` VALUES (843, '小米店铺', '\\upload\\20170415\\68609fe5e22d8dbcfafe72f4cb7f7329.jpg', '河北省廊坊市广阳区新华路199号', '15075652703', '王宇', '116.71203300041', '39.551346099335', 14, '09:00-22:00', '这里是店铺介绍', 1, '河北省廊坊市广阳区新华路199号', 1, '1,2', 9, '9,', '', 0, 2, 1492248598, 1492515248);
INSERT INTO `o2o_bis_location` VALUES (844, '新加的丁丁洋自助火锅', '\\upload\\20170511\\1f371b331b59d32e2b8e6f8c8f1fbdc7.jpg', '景德镇市珠山区浙江路与广场南路交汇处东20米路南', '15075652703', '王宇', '117.22107434143', '29.29152538553', 26, '08:00-21:00', '&lt;p&gt;一个新加的丁丁洋自助火锅&lt;/p&gt;', 0, '景德镇市珠山区浙江路与广场南路交汇处东20米路南', 3, '3,7', 1, '1,20', '', 0, 1, 1494508960, 1494509491);
INSERT INTO `o2o_bis_location` VALUES (845, 'fewwfse', '/upload\\20180216\\85efa247e795c2781ce48f820637a428.jpg', '', '3213', 'sdf', '116.71203300041', '39.551346099335', 32, '21', '&lt;p&gt;河北省廊坊市广阳区新华路199号&lt;/p&gt;', 1, '河北省廊坊市广阳区新华路199号', 8, '8,9', 15, '15,', '', 0, 0, 1518788200, 1518788200);

-- ----------------------------
-- Table structure for o2o_category
-- ----------------------------
DROP TABLE IF EXISTS `o2o_category`;
CREATE TABLE `o2o_category`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `listorder` int(8) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of o2o_category
-- ----------------------------
INSERT INTO `o2o_category` VALUES (1, '美食', 0, 10, 1, 1491992020, 1492652898);
INSERT INTO `o2o_category` VALUES (2, '旅游', 0, 12, 1, 1491992054, 1518593506);
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
-- Table structure for o2o_comment
-- ----------------------------
DROP TABLE IF EXISTS `o2o_comment`;
CREATE TABLE `o2o_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `deal_id` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0为删除，1 为正常 ',
  `create_time` int(11) NOT NULL DEFAULT 0,
  `comment_class` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0为好评，1为中评，2为差评',
  `update_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of o2o_comment
-- ----------------------------
INSERT INTO `o2o_comment` VALUES (27, 'wangyu', 16, '第四次评论', 19, 1, 1494329205, 1, 1494329205);
INSERT INTO `o2o_comment` VALUES (26, 'wangyu', 16, '第三次评论', 19, 1, 1494329190, 2, 1494329190);
INSERT INTO `o2o_comment` VALUES (25, 'wangyu', 16, '第二次评论', 19, 1, 1494329179, 1, 1494329179);
INSERT INTO `o2o_comment` VALUES (24, 'wangyu', 16, '我在测试我的评论', 19, 1, 1494329147, 0, 1494329147);
INSERT INTO `o2o_comment` VALUES (28, 'wangyu', 16, '我在测试铁木真的评论', 15, 1, 1494684824, 2, 1494684824);

-- ----------------------------
-- Table structure for o2o_coupons
-- ----------------------------
DROP TABLE IF EXISTS `o2o_coupons`;
CREATE TABLE `o2o_coupons`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `deal_id` int(11) NOT NULL DEFAULT 0,
  `order_id` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0:生成未发送给用户 \r\n		1:已经发送给用户 2：用户已经使用 3 禁用',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `deal_count` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sn`(`sn`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `deal_id`(`deal_id`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of o2o_coupons
-- ----------------------------
INSERT INTO `o2o_coupons` VALUES (102, '1494127003133162325', '50207', 16, 19, 94, 2, 1494127003, 1494127003, 1);
INSERT INTO `o2o_coupons` VALUES (103, '1494129026908310540', '62209', 16, 19, 95, 2, 1494129026, 1494129026, 1);
INSERT INTO `o2o_coupons` VALUES (104, '1494129132231921359', '88367', 16, 19, 96, 2, 1494129132, 1494129132, 1);
INSERT INTO `o2o_coupons` VALUES (105, '1494129315884357750', '64259', 16, 19, 97, 2, 1494129315, 1494129315, 1);
INSERT INTO `o2o_coupons` VALUES (106, '1494129415712112751', '81903', 18, 19, 98, 0, 1494129415, 1494129415, 1);
INSERT INTO `o2o_coupons` VALUES (107, '1494129596451540987', '74237', 18, 19, 99, 0, 1494129596, 1494129596, 1);
INSERT INTO `o2o_coupons` VALUES (108, '1494129612923431988', '55073', 18, 19, 100, 1, 1494129613, 1494129613, 1);
INSERT INTO `o2o_coupons` VALUES (109, '1494406228693463802', '84587', 18, 24, 107, 1, 1494406228, 1494406228, 10);
INSERT INTO `o2o_coupons` VALUES (110, '1494406434695196656', '47025', 17, 24, 108, 1, 1494406434, 1494406434, 99);
INSERT INTO `o2o_coupons` VALUES (111, '1494410232238701100', '12949', 17, 24, 115, 1, 1494410232, 1494410232, 15);
INSERT INTO `o2o_coupons` VALUES (112, '1494638511962430779', '10821', 16, 15, 116, 1, 1494638512, 1494638512, 10);

-- ----------------------------
-- Table structure for o2o_deal
-- ----------------------------
DROP TABLE IF EXISTS `o2o_deal`;
CREATE TABLE `o2o_deal`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `category_id` int(11) NOT NULL DEFAULT 0,
  `se_category_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_path` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
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
  `coupons_begin_time` int(11) NOT NULL DEFAULT 0,
  `coupons_end_time` int(11) NOT NULL DEFAULT 0,
  `bis_account_id` int(10) NOT NULL DEFAULT 0,
  `xpoint` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `ypoint` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `balance_price` decimal(20, 2) NOT NULL DEFAULT 0.00,
  `notes` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `listorder` int(8) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `city_path` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `se_city_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE,
  INDEX `se_category_id`(`category_path`) USING BTREE,
  INDEX `city_id`(`city_id`) USING BTREE,
  INDEX `start_time`(`start_time`) USING BTREE,
  INDEX `end_time`(`end_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of o2o_deal
-- ----------------------------
INSERT INTO `o2o_deal` VALUES (15, '铁木真', 1, '', '8', 23, '22,21', '/upload\\20180214\\68f4110f49ac60dfb153fd923eed0306.jpg', '&lt;p&gt;vfdsfgds我法大使馆的&lt;span style=&quot;font-family: 楷体, 楷体_GB2312, SimKai; color: rgb(84, 141, 212);&quot;&gt;深V谁说的&lt;/span&gt;&lt;/p&gt;', 1518882600, 1644763800, 88.00, 77.00, 4, 11, 99, 0, 0, 9, '116.71203300041', '39.551346099335', 0.00, '&lt;p&gt;vfdsfgds我法大使馆的&lt;span style=&quot;font-family: 楷体, 楷体_GB2312, SimKai; color: rgb(84, 141, 212);&quot;&gt;深V谁说的&lt;/span&gt;&lt;/p&gt;', 0, 1, 1492920604, 1518783072, '8,9', 9);
INSERT INTO `o2o_deal` VALUES (16, '柏尔森烤肉自助餐厅团购', 1, '19', '19', 25, '24', '/upload\\20180214\\091a06f0be6ed8d6de1e934f9266ecb0.jpg', '&lt;p&gt;vfdsfgds我法大使馆的&lt;span style=&quot;font-family: 楷体, 楷体_GB2312, SimKai; color: rgb(84, 141, 212);&quot;&gt;深V谁说的&lt;/span&gt;&lt;/p&gt;', 1492963860, 1644763800, 42.90, 29.90, 4, 10, 989, 1518777480, 1519814280, 11, '116.70498264872', '39.538246682078', 0.00, '&lt;p&gt;vfdsfgds我法大使馆的&lt;span style=&quot;font-family: 楷体, 楷体_GB2312, SimKai; color: rgb(84, 141, 212);&quot;&gt;深V谁说的&lt;/span&gt;&lt;/p&gt;', 0, 1, 1492964009, 1518603529, '8,9', 9);
INSERT INTO `o2o_deal` VALUES (17, '虾吃虾涮团购', 1, '20', '20', 30, '29', '/upload\\20180214\\642840968bccaf5d6de1cf33bd03a5cb.jpg', '&lt;p&gt;vfdsfgds我法大使馆的&lt;span style=&quot;font-family: 楷体, 楷体_GB2312, SimKai; color: rgb(84, 141, 212);&quot;&gt;深V谁说的&lt;/span&gt;&lt;/p&gt;', 1492964100, 1644763800, 138.00, 66.00, 4, 0, 99, 1518777480, 1519814280, 16, '116.72938960942', '39.540571622006', 0.00, '&lt;p&gt;vfdsfgds我法大使馆的&lt;span style=&quot;font-family: 楷体, 楷体_GB2312, SimKai; color: rgb(84, 141, 212);&quot;&gt;深V谁说的&lt;/span&gt;&lt;/p&gt;', 0, 1, 1492964201, 1518603517, '8,9', 9);
INSERT INTO `o2o_deal` VALUES (18, '春园烤肉团购', 1, '19', '19', 27, '26', '/upload\\20180214\\d80c3cd580445ffc21466915ad66f898.jpg', '&lt;p&gt;vfdsfgds我法大使馆的&lt;span style=&quot;font-family: 楷体, 楷体_GB2312, SimKai; color: rgb(84, 141, 212);&quot;&gt;深V谁说的&lt;/span&gt;&lt;/p&gt;', 1492964280, 1644763800, 55.00, 25.00, 4, 0, 99, 1518777480, 1519814280, 13, '116.73145463413', '39.534755473004', 0.00, '&lt;p&gt;vfdsfgds我法大使馆的&lt;span style=&quot;font-family: 楷体, 楷体_GB2312, SimKai; color: rgb(84, 141, 212);&quot;&gt;深V谁说的&lt;/span&gt;&lt;/p&gt;', 0, 1, 1492964362, 1518603508, '8,9', 9);
INSERT INTO `o2o_deal` VALUES (19, '丁丁洋回转自助火锅团购', 1, '20', '20', 26, '25', '/upload\\20180214\\9ac1cf9cc9cd59a0076112fd36d3fec8.jpg', '&lt;p&gt;vfdsfgds我法大使馆的&lt;span style=&quot;font-family: 楷体, 楷体_GB2312, SimKai; color: rgb(84, 141, 212);&quot;&gt;深V谁说的&lt;/span&gt;&lt;/p&gt;', 1492964580, 1644763800, 36.90, 26.90, 4, 28, 99, 1518777480, 1519814280, 12, '116.71410446597', '39.528431526829', 0.00, '&lt;p&gt;vfdsfgds我法大使馆的&lt;span style=&quot;font-family: 楷体, 楷体_GB2312, SimKai; color: rgb(84, 141, 212);&quot;&gt;深V谁说的&lt;/span&gt;&lt;/p&gt;', 0, 1, 1492964675, 1518603491, '8,9', 9);
INSERT INTO `o2o_deal` VALUES (20, '伊尔曼都烤肉团购', 1, '', '1,on', 29, '28', '/upload\\20180214\\74b55b456eeab7c198cdea1f822c2c2e.jpg', '&lt;p&gt;vfdsfgds我法大使馆的&lt;span style=&quot;font-family: 楷体, 楷体_GB2312, SimKai; color: rgb(84, 141, 212);&quot;&gt;深V谁说的&lt;/span&gt;&lt;/p&gt;', 1492964760, 1644763800, 52.00, 26.90, 4, 0, 99, 1518777480, 1519814280, 15, '116.71281826585', '39.526693586707', 0.00, '&lt;p&gt;vfdsfgds我法大使馆的&lt;span style=&quot;font-family: 楷体, 楷体_GB2312, SimKai; color: rgb(84, 141, 212);&quot;&gt;深V谁说的&lt;/span&gt;&lt;/p&gt;', 0, 1, 1492964869, 1518603469, '8,9', 9);
INSERT INTO `o2o_deal` VALUES (22, '好伦哥的团购', 1, '19,18,20', '1,20,19,18', 24, '23', '/upload\\20180214\\7855f88f567ae6513692311a64ac8592.jpg', '&lt;p&gt;vfdsfgds我法大使馆的&lt;span style=&quot;font-family: 楷体, 楷体_GB2312, SimKai; color: rgb(84, 141, 212);&quot;&gt;深V谁说的&lt;/span&gt;&lt;/p&gt;', 1492964760, 1644763800, 88.00, 77.00, 4, 0, 99, 1518777480, 1519814280, 10, '116.82766516915', '39.971231993239', 0.00, '&lt;p&gt;vfdsfgds我法大使馆的&lt;span style=&quot;font-family: 楷体, 楷体_GB2312, SimKai; color: rgb(84, 141, 212);&quot;&gt;深V谁说的&lt;/span&gt;&lt;/p&gt;', 0, 1, 1493116582, 1518603456, '8,9', 9);
INSERT INTO `o2o_deal` VALUES (23, '好伦哥的另一个团购', 1, '', '1,19,18,6', 24, '23', '/upload\\20180214\\2df96101d903621e19f1622d166ca9e7.jpg', '&lt;p&gt;vfdsfgds我法大使馆的&lt;span style=&quot;font-family: 楷体, 楷体_GB2312, SimKai; color: rgb(84, 141, 212);&quot;&gt;深V谁说的&lt;/span&gt;&lt;/p&gt;', 1526400000, 1644763800, 78.00, 77.00, 4, 0, 99, 0, 0, 10, '116.82766516915', '39.971231993239', 0.00, '&lt;p&gt;vfdsfgds我法大使馆的&lt;span style=&quot;font-family: 楷体, 楷体_GB2312, SimKai; color: rgb(84, 141, 212);&quot;&gt;深V谁说的&lt;/span&gt;&lt;/p&gt;', 0, 1, 1493117348, 1518783207, '8,9', 9);
INSERT INTO `o2o_deal` VALUES (24, '测试团购', 1, '', '1,20,19,18,8,6', 24, '23', '/upload\\20180214\\8154506039f1d76cb01d44539b28eccf.jpg', '&lt;h1 style=&quot;text-align: left;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family: 宋体, SimSun; text-decoration: underline;&quot;&gt;描述 才是打发第三&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;color: rgb(255, 0, 0); background-color: rgb(127, 127, 127);&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color: rgb(255, 0, 0); background-color: rgb(127, 127, 127); font-family: 宋体, SimSun; text-decoration: underline;&quot;&gt;方对方&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/h1&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun; text-decoration: none;&quot;&gt;&amp;lt;script&amp;gt;alert(1)&amp;lt;/script&amp;gt;&lt;/span&gt;&lt;span style=&quot;color: rgb(255, 0, 0); background-color: rgb(127, 127, 127);&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color: rgb(255, 0, 0); background-color: rgb(127, 127, 127); font-family: 宋体, SimSun; text-decoration: underline;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;', 1554308760, 1644763800, 88.00, 77.00, 4, 35, 99, 0, 0, 10, '116.82766516915', '39.971231993239', 0.00, '&lt;h1 style=&quot;white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family: 宋体, SimSun; text-decoration-line: underline;&quot;&gt;须知 才是打发第三&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;color: rgb(255, 0, 0); background-color: rgb(127, 127, 127);&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family: 宋体, SimSun; text-decoration-line: underline;&quot;&gt;方对方&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/h1&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun;&quot;&gt;&amp;lt;script&amp;gt;alert(1)&amp;lt;/script&amp;gt;&lt;/span&gt;&lt;/p&gt;', 0, 1, 1493119069, 1518788968, '8,9', 9);
INSERT INTO `o2o_deal` VALUES (25, '一分钱测试购买', 1, '', '1,on,on,on,on,on', 24, '23', '/upload\\20180214\\a16a068d4af9f778bbe6ef445efac619.jpg', '&lt;p&gt;vfdsfgds我法大使馆的&lt;span style=&quot;font-family: 楷体, 楷体_GB2312, SimKai; color: rgb(84, 141, 212);&quot;&gt;深V谁说的&lt;/span&gt;&lt;/p&gt;', 1518750000, 1613227800, 0.01, 0.01, 4, 0, 99, 0, 0, 10, '116.82766516915', '39.971231993239', 0.00, '&lt;p&gt;vfdsfgds我法大使馆的&lt;span style=&quot;font-family: 楷体, 楷体_GB2312, SimKai; color: rgb(84, 141, 212);&quot;&gt;深V谁说的&lt;/span&gt;&lt;/p&gt;', 0, 1, 1493125413, 1518783150, '8,9', 9);
INSERT INTO `o2o_deal` VALUES (26, '酸菜鱼', 1, '', '0', 25, '24', '/upload\\20180214\\0ae8f3bd62daa592103975dcad979a44.jpg', '&lt;p&gt;vfdsfgds我法大使馆的&lt;span style=&quot;font-family: 楷体, 楷体_GB2312, SimKai; color: rgb(84, 141, 212);&quot;&gt;深V谁说的&lt;/span&gt;&lt;/p&gt;', 1518533400, 1644763800, 212.00, 21.00, 5, 0, 3213, 0, 0, 11, '116.70498264872', '39.538246682078', 0.00, '&lt;p&gt;vfdsfgds我法大使馆的&lt;span style=&quot;font-family: 楷体, 楷体_GB2312, SimKai; color: rgb(84, 141, 212);&quot;&gt;深V谁说的&lt;/span&gt;&lt;/p&gt;', 0, 1, 1518533457, 1518788326, '', 0);

-- ----------------------------
-- Table structure for o2o_featured
-- ----------------------------
DROP TABLE IF EXISTS `o2o_featured`;
CREATE TABLE `o2o_featured`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `listorder` int(8) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of o2o_featured
-- ----------------------------
INSERT INTO `o2o_featured` VALUES (7, 0, '新春', '/upload\\20180214\\9bf273988e3daf0177ef5f3cd3af4776.jpg', 'http://o2oshop.shop', '恭贺新春', 0, 1, 1518591786, 1518591846);
INSERT INTO `o2o_featured` VALUES (8, 0, '美食', '/upload\\20180214\\1a511065e384c4b33de96a01a292253c.jpg', 'http://o2oshop.shop', '美食', 0, 1, 1518591810, 1518591844);
INSERT INTO `o2o_featured` VALUES (9, 1, '免费', '/upload\\20180214\\a824cfed428c1c45cdbbddea2f7554e6.jpg', 'http://o2oshop.shop', '免费', 0, 1, 1518591825, 1518594287);
INSERT INTO `o2o_featured` VALUES (10, 0, '美食', '/upload\\20180214\\c5e6208aba826f4d7096301af43b59e7.jpg', 'http://o2oshop.shop', '美食', 0, 1, 1518593473, 1518594304);

-- ----------------------------
-- Table structure for o2o_order
-- ----------------------------
DROP TABLE IF EXISTS `o2o_order`;
CREATE TABLE `o2o_order`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `out_trade_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单编号',
  `transaction_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '微信支付编号',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `pay_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '支付时间',
  `payment_id` tinyint(1) NOT NULL DEFAULT 1 COMMENT '支付方式1微信支付',
  `deal_id` int(11) NOT NULL DEFAULT 0,
  `deal_count` int(11) NOT NULL DEFAULT 0,
  `pay_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '支付状态0未支付1支付成功2支付失败 3其他',
  `total_price` decimal(20, 2) NOT NULL DEFAULT 0.00,
  `pay_amount` decimal(20, 2) NOT NULL DEFAULT 0.00,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `referer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单来自路',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `use_type` tinyint(1) NOT NULL DEFAULT 0,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `send_status` tinyint(1) DEFAULT 0,
  `bis_id` int(11) NOT NULL DEFAULT 0,
  `is_comment` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0为未评价，1为已评价',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `out_trade_no`(`out_trade_no`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of o2o_order
-- ----------------------------
INSERT INTO `o2o_order` VALUES (1, '1518960668473697462', '', 16, 'wangyu', '', 1, 25, 3, 0, 0.00, 0.00, 1, 'http://o2oshop.shop/index/order/confirm.html?id=25&count=1', 1518960668, 1518960668, 0, '', 0, 0, 0);

-- ----------------------------
-- Table structure for o2o_test
-- ----------------------------
DROP TABLE IF EXISTS `o2o_test`;
CREATE TABLE `o2o_test`  (
  `update_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `nimei` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of o2o_test
-- ----------------------------
INSERT INTO `o2o_test` VALUES (1492678673, 1492678673, 'dfd', 'dddd', 1);
INSERT INTO `o2o_test` VALUES (1492678860, 1492678860, NULL, '', 2);

-- ----------------------------
-- Table structure for o2o_user
-- ----------------------------
DROP TABLE IF EXISTS `o2o_user`;
CREATE TABLE `o2o_user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `last_login_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `last_login_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `listorder` int(8) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of o2o_user
-- ----------------------------
INSERT INTO `o2o_user` VALUES (2, 'wangyu2', '09d03004b3964d2bef78920148b44373', '3128', '', 0, '13429ads75@qq.com', '15075652703', 0, 1, 1492676268, 1492676268);
INSERT INTO `o2o_user` VALUES (3, 'wangyu3', '3001c9168bb9978b59ff55f5143875e8', '9211', '', 0, '1342475@qq.com', '15075652702', 0, 1, 1492676374, 1492676374);
INSERT INTO `o2o_user` VALUES (5, 'wangyu4', 'ca88f4dd12757a7ac290ca8cf8f48840', '4578', '', 0, '9699587@qq.com', '15075652701', 0, 1, 1492676462, 1492676462);
INSERT INTO `o2o_user` VALUES (10, 'wangyudd', 'a35a7a3dd7617f2cd768fe1e9da71a07', '5097', '', 0, '585888@qq.com', '15075652700', 0, 1, 1492683421, 1492683421);
INSERT INTO `o2o_user` VALUES (11, 'wangyudee', 'ffe91021eec873f960f3d8d9294f0fc3', '7587', '', 0, '5871e@qq.com', '15075652710', 0, 1, 1492684773, 1492684773);
INSERT INTO `o2o_user` VALUES (14, 'sdfser', '92bf9de72a4d8d5b171393c1cd237ffd', '1265', '', 0, '5fgf8e@qq.com', '15075652705', 0, 1, 1492684997, 1494518525);
INSERT INTO `o2o_user` VALUES (15, 'deee', 'eed524c7c6e341d0a852d75cdf0a20ce', '6212', '', 0, 'efgd@qq.com', '15075652711', 0, -1, 1492685112, 1494517510);
INSERT INTO `o2o_user` VALUES (16, 'wangyu', 'eb5eaf39e9481454ffd4de6f1d7e5f4e', '6463', '127.0.0.1', 1519030791, '1342961475@qq.com', '15075652788', 0, 1, 1492758321, 1519030791);
INSERT INTO `o2o_user` VALUES (17, 'qianxukang', '916855df0848e795a578a7361e5942b9', '8976', '127.0.0.1', 1494406277, '565238711@qq.com', '15075652799', 0, 1, 1494079875, 1494406276);
INSERT INTO `o2o_user` VALUES (18, 'qianxukang2', '9b65f0b3752c0c7d2a536257ec0e43a0', '2144', '127.0.0.1', 1494406172, '1229594507@qq.com', '15175652703', 0, 1, 1494080377, 1494406172);

SET FOREIGN_KEY_CHECKS = 1;
