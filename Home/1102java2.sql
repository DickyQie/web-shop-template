/*
MySQL Backup
Source Server Version: 5.0.51
Source Database: 1102javab
Date: 2012-10-8 09:30:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `sw_admin`
-- ----------------------------
DROP TABLE IF EXISTS `sw_admin`;
CREATE TABLE `sw_admin` (
  `admin_id` int(11) NOT NULL auto_increment COMMENT '管理员ID',
  `admin_user` varchar(32) default NULL,
  `admin_psd` varchar(64) default NULL,
  PRIMARY KEY  (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
--  Table structure for `sw_admin_power`
-- ----------------------------
DROP TABLE IF EXISTS `sw_admin_power`;
CREATE TABLE `sw_admin_power` (
  `power_id` int(11) NOT NULL auto_increment COMMENT '权限ID',
  `power_pid` int(11) NOT NULL COMMENT '所属上级ID',
  `power_name` varchar(64) NOT NULL COMMENT '权限名称',
  `power_code` varchar(64) NOT NULL COMMENT '权限代码user_add',
  PRIMARY KEY  (`power_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
--  Table structure for `sw_article`
-- ----------------------------
DROP TABLE IF EXISTS `sw_article`;
CREATE TABLE `sw_article` (
  `article_id` int(11) NOT NULL auto_increment COMMENT '自增id',
  `article_title` varchar(32) NOT NULL COMMENT '文章名称',
  `article_content` text NOT NULL COMMENT '文章内容',
  `article_category_id` int(11) NOT NULL COMMENT '分类id',
  `article_create_time` datetime NOT NULL COMMENT '创建时间',
  `article_update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY  (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
--  Table structure for `sw_brand`
-- ----------------------------
DROP TABLE IF EXISTS `sw_brand`;
CREATE TABLE `sw_brand` (
  `brand_id` smallint(5) unsigned NOT NULL auto_increment,
  `brand_name` varchar(60) NOT NULL default '' COMMENT '品牌名称',
  `brand_big_logo` varchar(80) NOT NULL default '' COMMENT '品牌大标志',
  `brand_small_logo` varchar(80) NOT NULL default '' COMMENT '品牌小标志',
  `brand_desc` text NOT NULL COMMENT '品牌描述',
  `brand_url` varchar(255) NOT NULL default '' COMMENT '品牌网址',
  PRIMARY KEY  (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品品牌表';

insert into sw_brand values (null,'诺基亚','','','诺基亚品牌好，老品牌','http://www.nokia.com');

-- ----------------------------
--  Table structure for `sw_cat`
-- ----------------------------
DROP TABLE IF EXISTS `sw_cat`;
CREATE TABLE `sw_cat` (
  `c_id` int(11) NOT NULL auto_increment COMMENT '自增id',
  `c_name` varchar(32) NOT NULL COMMENT '分类名称',
  `c_path` varchar(32) NOT NULL COMMENT '分类全路径',
  `c_parentid` int(11) default NULL,
  PRIMARY KEY  (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
--  Table structure for `sw_category`
-- ----------------------------
DROP TABLE IF EXISTS `sw_category`;
CREATE TABLE `sw_category` (
  `category_id` int(11) NOT NULL auto_increment COMMENT '自增id',
  `category_name` varchar(128) collate utf8_unicode_ci NOT NULL COMMENT '分类名称',
  `category_parent_id` int(11) NOT NULL COMMENT '分类父id',
  PRIMARY KEY  (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='商品分类表';

-- ----------------------------
--  Table structure for `sw_goods`
-- ----------------------------
DROP TABLE IF EXISTS `sw_goods`;
CREATE TABLE `sw_goods` (
  `goods_id` int(11) NOT NULL auto_increment COMMENT '自增id',
  `goods_name` varchar(128) collate utf8_unicode_ci NOT NULL COMMENT '名字',
  `goods_weight` int(11) NOT NULL COMMENT '重量',
  `goods_price` float NOT NULL COMMENT '价格',
  `goods_number` int(11) NOT NULL COMMENT '商品库存数量',
  `goods_category_id` int(11) NOT NULL COMMENT '商品分类',
  `goods_brand_id` int(11) NOT NULL COMMENT '商品品牌',
  `goods_introduce` text collate utf8_unicode_ci NOT NULL COMMENT '介绍',
  `goods_big_img` varchar(128) collate utf8_unicode_ci NOT NULL COMMENT '图片',
  `goods_small_img` varchar(128) collate utf8_unicode_ci NOT NULL COMMENT '缩略图',
  `goods_mark` int(11) NOT NULL COMMENT '标志',
  `goods_create_time` datetime NOT NULL COMMENT '上线时间',
  PRIMARY KEY  (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='商品表';

-- ----------------------------
--  Table structure for `sw_goods_lack`
-- ----------------------------
DROP TABLE IF EXISTS `sw_goods_lack`;
CREATE TABLE `sw_goods_lack` (
  `lack_id` int(11) NOT NULL auto_increment COMMENT '自增id',
  `lack_goods_id` varchar(128) character set utf8 collate utf8_unicode_ci NOT NULL COMMENT '名字',
  `lack_goods_name` varchar(128) character set utf8 collate utf8_unicode_ci NOT NULL COMMENT '名字',
  `lack_goods_price` float NOT NULL COMMENT '价格',
  `lack_goods_time` datetime NOT NULL COMMENT '登记时间',
  PRIMARY KEY  (`lack_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品缺货登记表';

-- ----------------------------
--  Table structure for `sw_order`
-- ----------------------------
DROP TABLE IF EXISTS `sw_order`;
CREATE TABLE `sw_order` (
  `order_id` int(11) NOT NULL auto_increment COMMENT '自增id',
  `order_sn` varchar(32) NOT NULL COMMENT '订单编号',
  `order_u_id` int(11) NOT NULL COMMENT '下单用户id',
  `order_u_name` varchar(32) NOT NULL COMMENT '收货人邮箱',
  `order_status` int(11) NOT NULL COMMENT '订单状态(0:取消 1:未确认 2:已确认 3:已发货 4:已付款 5:已完成)',
  `order_ship_name` varchar(12) NOT NULL COMMENT '配送方式名称',
  `order_pay_name` varchar(12) NOT NULL COMMENT '支付方式名称',
  `order_remarks` varchar(128) NOT NULL COMMENT '订单备注',
  `order_amount` float NOT NULL COMMENT '订单总金额',
  `order_create_time` datetime NOT NULL COMMENT '订单创建时间',
  `order_confirm_time` datetime NOT NULL COMMENT '订单确认时间',
  `order_send_time` datetime NOT NULL COMMENT '订单发货时间',
  `order_pay_time` datetime NOT NULL COMMENT '订单支付时间',
  `order_consignee_id` int(11) NOT NULL COMMENT '收货人地址id',
  PRIMARY KEY  (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
--  Table structure for `sw_order_deal`
-- ----------------------------
DROP TABLE IF EXISTS `sw_order_deal`;
CREATE TABLE `sw_order_deal` (
  `deal_id` int(11) NOT NULL auto_increment COMMENT '自增id',
  `deal_order_sn` varchar(32) NOT NULL COMMENT '订单编号',
  `deal_status` int(11) NOT NULL COMMENT '订单修改后状态标志',
  `deal_time` datetime NOT NULL COMMENT '修改时间',
  `deal_info` varchar(255) NOT NULL COMMENT '修改信息',
  `deal_admin_name` varchar(32) NOT NULL COMMENT '操作人',
  PRIMARY KEY  (`deal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单处理表';

-- ----------------------------
--  Table structure for `sw_order_sub`
-- ----------------------------
DROP TABLE IF EXISTS `sw_order_sub`;
CREATE TABLE `sw_order_sub` (
  `sub_id` int(11) NOT NULL auto_increment COMMENT '自增id',
  `sub_order_sn` varchar(32) NOT NULL COMMENT '订单编号',
  `sub_goods_id` varchar(64) NOT NULL COMMENT '订单对应商品id',
  `sub_goods_name` varchar(64) NOT NULL COMMENT '订单对应商品名称',
  `sub_goods_price` varchar(32) NOT NULL COMMENT '下单时该商品单价',
  `sub_goods_buy_number` varchar(32) NOT NULL COMMENT '商品数量',
  `sub_goods_buy_sum` varchar(32) NOT NULL COMMENT '商品价格小计',
  PRIMARY KEY  (`sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单对应商品表';

-- ----------------------------
--  Table structure for `sw_user_consignee`
-- ----------------------------
DROP TABLE IF EXISTS `sw_user_consignee`;
CREATE TABLE `sw_user_consignee` (
  `consignee_id` int(11) NOT NULL auto_increment COMMENT '自增id',
  `consignee_u_id` int(11) NOT NULL COMMENT '收货人所属会员id',
  `consignee_name` varchar(64) NOT NULL COMMENT '收货人真实姓名',
  `consignee_email` varchar(64) NOT NULL COMMENT '收货人邮箱',
  `consignee_province` varchar(32) NOT NULL COMMENT '收货人省份',
  `consignee_city` varchar(32) NOT NULL COMMENT '收货人城市',
  `consignee_district` varchar(32) NOT NULL COMMENT '收货人地区',
  `consignee_address` varchar(128) NOT NULL COMMENT '收货人详细地址',
  `consignee_zipcode` int(11) NOT NULL COMMENT '收货人邮编',
  `consignee_tel` varchar(16) NOT NULL COMMENT '收货人电话',
  `consignee_mobile` varchar(16) NOT NULL COMMENT '收货人手机',
  `consignee_best_time` varchar(32) NOT NULL COMMENT '最佳收获时间',
  PRIMARY KEY  (`consignee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收货人信息表';

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `sw_admin` VALUES ('1','admin','96e79218965eb72c92a549dd5a330112');
INSERT INTO `sw_cat` VALUES ('1','php','1','0'), ('2','html','2','0'), ('3','apache','3','0'), ('4','变量','1-4','1'), ('5','段落标签','2-5','2'), ('6','流程控制','1-6','1'), ('7','顺序控制','1-6-7','6'), ('8','分支选择','1-6-8','6');
