
/**休闲食品表**/
CREATE TABLE xz_laptop_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(32)
);

/**休闲食品**/
CREATE TABLE xz_laptop(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  family_id INT,              #所属型号家族编号
  title VARCHAR(128),         #主标题
  price DECIMAL(10,2),        #价格
  promise VARCHAR(64),        #服务承诺
  spec VARCHAR(64),           #规格/口味
  lname VARCHAR(64),          #产品名称
  classfiy VARCHAR(64),       #产品分类
  weight VARCHAR(64),	      #净含量
  details VARCHAR(1024),      #产品详情
  shelf_time BIGINT,          #上架时间
  sold_count INT,             #已售出的数量
  is_onsale BOOLEAN           #是否促销中
);

/**食品图片**/
CREATE TABLE xz_laptop_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  laptop_id INT,              #食品编号
  sm VARCHAR(128),            #小图片路径
  md VARCHAR(128),            #中图片路径
  lg VARCHAR(128)             #大图片路径
);

/**用户信息**/
CREATE TABLE xz_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(64),
  phone VARCHAR(16),
  avatar VARCHAR(128),        #头像图片路径
  user_name VARCHAR(32),      #用户名，如王小明
  gender INT                  #性别  0-女  1-男
);

/**收货地址信息**/
CREATE TABLE xz_receiver_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,                #用户编号
  receiver VARCHAR(16),       #接收人姓名
  province VARCHAR(16),       #省
  city VARCHAR(16),           #市
  county VARCHAR(16),         #县
  address VARCHAR(128),       #详细地址
  cellphone VARCHAR(16),      #手机
  fixedphone VARCHAR(16),     #固定电话
  postcode CHAR(6),           #邮编
  tag VARCHAR(16),            #标签名

  is_default BOOLEAN          #是否为当前用户的默认收货地址
);

/**购物车**/
CREATE TABLE xz_shopping_cart(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,      #用户编号
  product_id INT,   #商品编号
  count INT,         #购买数量
  is_checked BOOLEAN #是否已勾选，确定购买
);

/**用户订单**/
CREATE TABLE xz_order(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  address_id INT,
  status INT,             #订单状态  1-等待付款  2-等待发货  3-运输中  4-已签收  5-已取消
  order_time BIGINT,      #下单时间
  pay_time BIGINT,        #付款时间
  deliver_time BIGINT,    #发货时间
  received_time BIGINT    #签收时间
)AUTO_INCREMENT=10000000;

/**用户订单**/
CREATE TABLE xz_order_detail(
  did INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,           #订单编号
  product_id INT,         #产品编号
  count INT               #购买数量
);

/****首页轮播广告商品****/
CREATE TABLE xz_index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64),
  href VARCHAR(128)
);

/****首页商品****/
CREATE TABLE xz_index_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),
  details VARCHAR(128),
  pic VARCHAR(128),
  price DECIMAL(10,2),
  href VARCHAR(128),
  seq_recommended TINYINT,
  seq_new_arrival TINYINT,
  seq_top_sale TINYINT
);

/*******************/
/******数据导入******/
/*******************/
/**食品家族**/
INSERT INTO xz_laptop_family VALUES
(NULL,'坚果炒货'),
(NULL,'休闲零食'),
(NULL,'饼干蛋糕'),
(NULL,'肉干肉铺'),
(NULL,'蜜饯果干'),
(NULL,'糖果巧克力');

/**食品信息**/
INSERT INTO xz_laptop VALUES
(1,1,'坚果炒货 聚【三只松鼠_碧根果210gx20袋】零食坚果山核桃长寿果干奶油味','9.90','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','奶油口味','碧根果','坚果炒货','400g','<div class="product-intro"><img src="img/product-sale/bigengguo/bigengguo-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/bigengguo/bigengguo-intru(2).jpg" alt=""></div>',1508431864665,2268,true),
(2,3,'饼干蛋糕 回头客华夫饼1kg原味华夫饼干 早餐面包糕点','39.80','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','原味*1000g(2斤) (礼盒装)','护肤饼干','饼干蛋糕','1kg','<div class="product-intro"><img src="img/product-sale/binggan/binggan-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/binggan/binggan-intru(2).jpg" alt=""></div>',1508431864665,2368,true),
(3,3,'饼干蛋糕 建元堂红豆燕麦全麦饼干魔芋饼干','9.90','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','营养好吃 核桃芝麻黑豆饼','魔芋饼干','饼干蛋糕','500g','<div class="product-intro"><img src="img/product-sale/binggan2/binggan2-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/binggan2/binggan2-intru(2).jpg" alt=""></div>',1508431864665,2958,true),
(4,3,'饼干蛋糕 芭米手工软奶苏打夹心牛扎糖饼干180g','12.80','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','奶盐味','牛扎糖饼干','饼干蛋糕','180g','<div class="product-intro"><img src="img/product-sale/binggan3/binggan3-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/binggan3/binggan3-intru(2).jpg" alt=""></div>',1508431864665,3058,true),
(5,3,'饼干蛋糕 达利园瑞士卷香蕉味蛋糕3斤 糕点小面包','38.90','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','草莓味','瑞士卷蛋糕','饼干蛋糕','1.5kg','<div class="product-intro"><img src="img/product-sale/dangao/dangao-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/dangao/dangao-intru(2).jpg" alt=""></div>',1508431864665,3088,true),
(6,3,'饼干蛋糕 回头客千层蛋糕1000g礼盒西式糕点心','39.80','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','原味','千层蛋糕','饼干蛋糕','1000g','<div class="product-intro"><img src="img/product-sale/dangao2/dangao2-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/dangao2/dangao2-intru(2).jpg" alt=""></div>',1508431864665,2978,true),
(7,3,'饼干蛋糕 悠享家 芝士蛋糕生日蛋糕 甜品八位小块拼装蛋糕','125.00','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','6寸','芝士蛋糕','饼干蛋糕','300g','<div class="product-intro"><img src="img/product-sale/dangao5/dangao5-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/dangao5/dangao5-intru(2).jpg" alt=""></div>',1508431864665,1978,true),
(8,3,'饼干蛋糕 欧贝拉蒸蛋糕1kg手撕面包网红早餐糕点小吃','19.90','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','日式蒸蛋糕','蒸蛋糕','饼干蛋糕','1kg','<div class="product-intro"><img src="img/product-sale/gaodian/gaodian-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/gaodian/gaodian-intru(2).jpg" alt=""></div>',1508431864665,3978,true),
(9,5,'蜜饯果干 【香妃葡萄干】 新疆特产红提子500g ','10.99','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','单品装500g','葡萄干','蜜饯果干','500g','<div class="product-intro"><img src="img/product-sale/hongtizi/hongtizi-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/hongtizi/hongtizi-intru(2).jpg" alt=""></div>',1508431864665,2978,true),
(10,1,'坚果炒货【西域之尚新疆红枣500g】 新疆和田大枣子夹核桃','12.90','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','单品装500g','新疆红枣','坚果炒货','500g','<div class="product-intro"><img src="img/product-sale/hongzao/hongzao-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/hongzao/hongzao-intru(2).jpg" alt=""></div>',1508431864665,6978,true),
(11,1,'坚果炒货 好想你 红枣夹核桃夹心枣218gx2袋','39.90','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','大枣夹核桃（我比较大）','夹心枣','坚果炒货','436g','<div class="product-intro"><img src="img/product-sale/hongzao2/hongzao2-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/hongzao2/hongzao2-intru(2).jpg" alt=""></div>',1508431864665,6878,true),
(12,1,'坚果炒货 三只松鼠_夏威夷果265gx2袋','47.90','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','奶油味','夏威夷果','坚果炒货','520g','<div class="product-intro"><img src="img/product-sale/jianguo/jianguo-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/jianguo/jianguo-intru(2).jpg" alt=""></div>',1508431864665,2963,true),
(13,1,'坚果炒货 百草味夏威夷果200gx2袋','37.80','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','奶油口味','夏威夷果','坚果炒货','400g','<div class="product-intro"><img src="img/product-sale/jianguo2/jianguo2-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/jianguo2/jianguo2-intru(2).jpg" alt=""></div>',1508431864665,2958,true),
(14,1,'坚果炒货 沃隆每日坚果大礼包儿童款干果混装袋','39.80','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','B款儿童喜欢','坚果大礼包','坚果炒货','500g','<div class="product-intro"><img src="img/product-sale/jianguo3/jianguo3-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/jianguo3/jianguo3-intru(2).jpg" alt=""></div>',1508431864665,2978,true),
(15,1,'坚果炒货 美国自然开心果500g包邮','25.80','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','原味*1000g(2斤) (礼盒装)','开心果','坚果炒货','1kg','<div class="product-intro"><img src="img/product-sale/jianguo4/jianguo4-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/jianguo4/jianguo4-intru(2).jpg" alt=""></div>',1508431864665,2978,true),
(16,4,'肉干肉铺 正宗酱板鸭酱鸭 江苏南京特产下酒菜卤味熟食','39.80','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','新酱鸭900g酱板鸭','酱板鸭','肉干肉铺','900g','<div class="product-intro"><img src="img/product-sale/jiangya/jiangya-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/jiangya/jiangya-intru(2).jpg" alt=""></div>',1508431864665,7878,true),
(17,4,'肉干肉铺 三只松鼠_小贱泡脚凤爪280g','21.80','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','泡脚口味','凤爪','肉干肉铺','280g','<div class="product-intro"><img src="img/product-sale/jizhua/jizhua-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/jizhua/jizhua-intru(2).jpg" alt=""></div>',1508431864665,2978,true),
(18,4,'肉干肉铺 五花腊肉湖南特产','48.80','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','原味','腊肉','肉干肉铺','1kg','<div class="product-intro"><img src="img/product-sale/larou/larou-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/larou/larou-intru(2).jpg" alt=""></div>',1508431864665,2978,true),
(19,3,'饼干蛋糕 马卡龙甜点礼盒装12枚法式蛋糕 早餐面包糕点','29.90','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','12枚蓝色礼盒','马卡龙','饼干蛋糕','300g','<div class="product-intro"><img src="img/product-sale/makalong/makalong-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/makalong/makalong-intru(2).jpg" alt=""></div>',1508431864665,3978,true),
(20,1,'坚果炒货 三只松鼠_芒果干116gx2袋','25.80','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','原味','芒果干','蜜饯果干','232g','<div class="product-intro"><img src="img/product-sale/mangguogan/mangguogan-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/mangguogan/mangguogan-intru(2).jpg" alt=""></div>',1508431864665,2978,true),
(21,3,'饼干蛋糕 良品铺子奶香蒸蛋糕 手撕口袋小糕点 早餐面包糕点','39.90','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','奶香蒸蛋糕1000gx1','蒸蛋糕','饼干蛋糕','1000g','<div class="product-intro"><img src="img/product-sale/mianbao/mianbao-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/mianbao/mianbao-intru(2).jpg" alt=""></div>',1508431864665,6978,true),
(22,3,'饼干蛋糕 盼盼手撕面包糕点 千层小口袋面包点心','29.80','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','1000gx1','手撕面包','饼干蛋糕','1000g','<div class="product-intro"><img src="img/product-sale/mianbao2/mianbao2-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/mianbao2/mianbao2-intru(2).jpg" alt=""></div>',1508431864665,5678,true),
(23,4,'肉干肉铺 麻辣五香牛肉干四川特产牛肉类零食','41.80','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','麻辣味','牛肉干','肉干肉铺','500g','<div class="product-intro"><img src="img/product-sale/niurougan/niurougan-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/niurougan/niurougan-intru(2).jpg" alt=""></div>',1508431864665,2978,true),
(24,4,'肉干肉铺 百草味 五香牛肉条100g 牛肉干 肉类零食小吃','9.90','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','五香','牛肉干','肉干肉铺','100g','<div class="product-intro"><img src="img/product-sale/niurougan2/niurougan2-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/niurougan2/niurougan2-intru(2).jpg" alt=""></div>',1508431864665,2378,true),
(25,3,'饼干蛋糕 良品铺子夹心码数早餐食品糯米糍米糕点','33.80','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','麻薯1050gx1盒','糯米糕点','饼干蛋糕','1050g','<div class="product-intro"><img src="img/product-sale/nuomigao/nuomigao-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/nuomigao/nuomigao-intru(2).jpg" alt=""></div>',1508431864665,2178,true),
(26,5,'蜜饯果干 新疆特产 特级超大黑葡萄干免洗','9.90','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','250g*2','葡萄干','蜜饯果干','500g','<div class="product-intro"><img src="img/product-sale/putaogan/putaogan-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/putaogan/putaogan-intru(2).jpg" alt=""></div>',1508431864665,2978,true),
(27,5,'蜜饯果干 西域之尚四色葡萄干','34.80','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','25g*4','葡萄干','蜜饯果干','100g','<div class="product-intro"><img src="img/product-sale/putaogan2/putaogan2-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/putaogan2/putaogan2-intru(2).jpg" alt=""></div>',1508431864665,2978,true),
(28,4,'肉干肉铺 正宗酱板鸭 江苏南京特产下酒菜卤味熟食烤鸭','39.80','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','水晶酱鸭900g','烤鸭','肉干肉铺','900g','<div class="product-intro"><img src="img/product-sale/kaoya5/kaoya5-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/kaoya5/kaoya5-intru(2).jpg" alt=""></div>',1508431864665,2378,true),
(29,5,'蜜饯果干 福建特产然利薯干吃汤圆','25.80','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','芝麻味','汤圆','饼干蛋糕','500g','<div class="product-intro"><img src="img/product-sale/tangyuan/tangyuan-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/tangyuan/tangyuan-intru(2).jpg" alt=""></div>',1508431864665,2978,true),
(30,1,'坚果炒货 手剥杏仁坚果纸皮巴达木扁桃仁','13.80','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','奶油口味208g*1袋','手剥杏仁','坚果炒货','208g','<div class="product-intro"><img src="img/product-sale/xinren/xinren-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/xinren/xinren-intru(2).jpg" alt=""></div>',1508431864665,6378,true),
(31,1,'坚果炒货 手剥杏仁坚果纸皮巴达木扁桃仁','13.90','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','盐焗口味','手剥杏仁','坚果炒货','300g','<div class="product-intro"><img src="img/product-sale/xinren2/xinren2-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/xinren2/xinren2-intru(2).jpg" alt=""></div>',1508431864665,1278,true),
(32,1,'坚果炒货 良品铺子炭烧腰果仁238g','21.80','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','炭烧口味','腰果','坚果炒货','238g','<div class="product-intro"><img src="img/product-sale/yaoguo/yaoguo-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/yaoguo/yaoguo-intru(2).jpg" alt=""></div>',1508431864665,2978,true),
(33,3,'饼干蛋糕 港荣蒸蛋糕1kg手撕口袋早餐小面包','38.20','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','奶香味','蒸蛋糕','饼干蛋糕','1kg','<div class="product-intro"><img src="img/product-sale/zhengdangao/zhengdangao-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/zhengdangao/zhengdangao-intru(2).jpg" alt=""></div>',1508431864665,2578,true),
(34,4,'肉干肉铺 猪肉铺原味蜜汁想腊肉干','33.30','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','原味猪肉铺500g','腊肉干','肉干肉铺','500g','<div class="product-intro"><img src="img/product-sale/zhurou/zhurou-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/zhurou/zhurou-intru(2).jpg" alt=""></div>',1508431864665,4978,true),
(35,4,'肉干肉铺 良品铺子猪肉铺特产肉类 猪肉干','17.80','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','香辣味','猪肉干','肉干肉铺','480g','<div class="product-intro"><img src="img/product-sale/zhurougan/zhurougan-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/zhurougan/zhurougan-intru(2).jpg" alt=""></div>',1508431864665,2378,true),
(36,3,'饼干蛋糕 肉松饼友臣整箱包邮1.25kg 传统糕点闽台特产零食早餐','42.80','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','原味','肉松饼','饼干蛋糕','1.25kg','<div class="product-intro"><img src="img/product-sale/rousongbing/rousongbing-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/rousongbing/rousongbing-intru(2).jpg" alt=""></div>',1508431864665,2238,true),
(37,4,'肉干肉铺 味芝元香辣鱼排26g*30包湖南特产零食洞庭湖野生可混鱼尾','26.60','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','香辣鱼尾20包','鱼排','肉干肉铺','1.25kg','<div class="product-intro"><img src="img/product-sale/yupai/yupai-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/yupai/yupai-intru(2).jpg" alt=""></div>',1508431864665,2238,true),

(38,1,'坚果炒货【百草味-巴旦木180gx2袋】手剥纸皮扁桃仁','28.90','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','180gx2袋','巴旦木','坚果炒货','360g','<div class="product-intro"><img src="img/product-sale/badanmu/badanmu-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/badanmu/badanmu-intru(2).jpg" alt=""></div>',1508431864665,2538,true),
(39,3,'饼干蛋糕 曲奇饼干礼盒伴手礼铁盒装 悠享家','129.00','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','什锦礼盒','曲奇','饼干蛋糕','580kg','<div class="product-intro"><img src="img/product-sale/quqi/quqi-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/quqi/quqi-intru(2).jpg" alt=""></div>',1508431864665,2268,true),
(40,1,'坚果炒货 聚新货【百草味-手剥山核桃190g】小核桃临安特产','29.90','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','奶油味','山核桃','坚果炒货','190g','<div class="product-intro"><img src="img/product-sale/shanhetao/shanhetao-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/shanhetao/shanhetao-intru(2).jpg" alt=""></div>',1508431864665,1238,true),
(41,3,'饼干蛋糕 嘉华鲜花饼经典玫瑰饼10枚云南特产零食小吃传统糕点饼干','38.00','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','经典10枚','鲜花饼','饼干蛋糕','500kg','<div class="product-intro"><img src="img/product-sale/xianhuabing/xianhuabing-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/xianhuabing/xianhuabing-intru(2).jpg" alt=""></div>',1508431864665,2138,true),
(42,4,'肉干肉铺善味阁 鲜卤鸭架250g 鸭锁骨鸭肉 休闲零食 小吃','26.80','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','香辣味','鸭锁骨','肉干肉铺','250g','<div class="product-intro"><img src="img/product-sale/yasuogu/yasuogu-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/yasuogu/yasuogu-intru(2).jpg" alt=""></div>',1508431864665,5638,true),
(43,4,'肉干肉铺【百草味-鱿鱼组合240g】手撕风琴鱿鱼丝鱿鱼条 鱿鱼足片零食','29.90','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','香辣味','鱿鱼丝','肉干肉铺','240g','<div class="product-intro"><img src="img/product-sale/youyusi/youyusi-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/youyusi/youyusi-intru(2).jpg" alt=""></div>',1508431864665,2238,true),

(44,2,'休闲零食【三只松鼠_小贱爆米花150g】休闲零食膨化食品奶油/焦糖味','12.90','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','奶油味','爆米花','休闲零食','150g','<div class="product-intro"><img src="img/product-sale/baomihua/baomihua-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/baomihua/baomihua-intru(2).jpg" alt=""></div>',1508431864665,2283,true),
(45,2,'休闲零食 老襄阳手工锅巴麻辣味400g膨化食品散装特产休闲小吃零食','15.60','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','麻辣味','锅巴','休闲零食','400g','<div class="product-intro"><img src="img/product-sale/guoba/guoba-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/guoba/guoba-intru(2).jpg" alt=""></div>',1508431864665,1238,true),
(46,2,'休闲零食 亲亲果肉果冻520g小吃布丁儿童休闲零食糖果礼物','16.81','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','草莓味','果冻','休闲零食','520g','<div class="product-intro"><img src="img/product-sale/guodong/guodong-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/guodong/guodong-intru(2).jpg" alt=""></div>',1508431864665,3568,true),
(47,2,'休闲零食 泰国进口海苔卷小老板经典原味紫菜卷32.4g*2盒','26.90','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','原味','海苔','休闲零食','64.8g','<div class="product-intro"><img src="img/product-sale/haitai/haitai-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/haitai/haitai-intru(2).jpg" alt=""></div>',1508431864665,2618,true),
(48,2,'休闲零食 良品铺子豆皮辣片 经典怀旧食品小吃香辣味辣皮','14.90','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','原味','辣条','休闲零食','180g','<div class="product-intro"><img src="img/product-sale/lapian/lapian-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/lapian/lapian-intru(2).jpg" alt=""></div>',1508431864665,2238,true),
(49,2,'休闲零食 上好佳薯片鲜虾片50包批发整箱大礼包','18.80','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','精美零食礼盒56包','薯片','休闲零食','400g','<div class="product-intro"><img src="img/product-sale/shupian/shupian-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/shupian/shupian-intru(2).jpg" alt=""></div>',1508431864665,2238,true),

(50,6,'糖果巧克力 不二家果味棒棒糖60支375g/桶糖果礼包零食大礼包','27.90','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','综合口味','棒棒糖','糖果巧克力','375g','<div class="product-intro"><img src="img/product-sale/bangbangtang/bangbangtang-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/bangbangtang/bangbangtang-intru(2).jpg" alt=""></div>',1508431864665,1678,true),
(51,6,'糖果巧克力【百草味-花生牛轧糖180g】手工牛札糖年货糖果小包 ','9.90','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','花生口味','牛轧糖','糖果巧克力','180g','<div class="product-intro"><img src="img/product-sale/niuzhatang/niuzhatang-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/niuzhatang/niuzhatang-intru(2).jpg" alt=""></div>',1508431864665,5238,true),
(52,6,'糖果巧克力 好时KISSES巧克力500g*2好时之吻休闲零食','119.00','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','曲奇白巧','巧克力','糖果巧克力','1kg','<div class="product-intro"><img src="img/product-sale/qiaokeli/qiaokeli-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/qiaokeli/qiaokeli-intru(2).jpg" alt=""></div>',1508431864665,1456,true),
(53,6,'糖果巧克力 费列罗榛果威化巧克力48粒婚庆礼盒装','129.00','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','曲奇白巧','巧克力','糖果巧克力','600g','<div class="product-intro"><img src="img/product-sale/qiaokeli2/qiaokeli2-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/qiaokeli2/qiaokeli2-intru(2).jpg" alt=""></div>',1508431864665,2385,true),
(54,6,'糖果巧克力 依蒂安斯手工巧克力礼盒装400g纯可可脂黑松露形散装零食','9.90','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','8口味','松露','糖果巧克力','400g','<div class="product-intro"><img src="img/product-sale/songlu/songlu-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/songlu/songlu-intru(2).jpg" alt=""></div>',1508431864665,3258,true),
(55,6,'糖果巧克力 德芙巧克力丝滑4.5g喜糖果4斤结婚散装礼盒','196.90','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','喜糖四斤装','喜糖','糖果巧克力','400g','<div class="product-intro"><img src="img/product-sale/xitang/xitang-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/xitang/xitang-intru(2).jpg" alt=""></div>',1508431864665,1638,true),

(56,6,'糖果巧克力 kisses好时巧克力礼盒99粒装情人节万圣节生日礼物','88.00','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','金色盒520','巧克力','糖果巧克力','430g','<div class="product-intro"><img src="img/product-sale/defuqiaokeli2/defuqiaokeli-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/defuqiaokeli2/defuqiaokeli-intru(2).jpg" alt=""></div>',1508431864665,1638,true),
(57,6,'糖果巧克力 徐福记夹酱棉花糖混合水果夹心软糖婚庆喜糖散称批发236g','196.90','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','散装236g','棉花糖','糖果巧克力','236g','<div class="product-intro"><img src="img/product-sale/mianhuatao/mianhuatao-intru(1).jpg" alt=""></div><div class="product-intro"><img src="img/product-sale/mianhuatao/mianhuatao-intru(2).jpg" alt=""></div>',1508431864665,1638,true);



/**笔记本电脑图片**/
INSERT INTO xz_laptop_pic VALUES
(NULL, 1, 'img/product-sale/bigengguo/bigengguo-sm(1).jpg','img/product-sale/bigengguo/bigengguo-md(1).jpg','img/product-sale/bigengguo/bigengguo-bg1.jpg'),
(NULL, 1, 'img/product-sale/bigengguo/bigengguo-sm(2).jpg','img/product-sale/bigengguo/bigengguo-md(2).jpg','img/product-sale/bigengguo/bigengguo-bg2.jpg'),
(NULL, 1, 'img/product-sale/bigengguo/bigengguo-sm(3).jpg','img/product-sale/bigengguo/bigengguo-md(3).jpg','img/product-sale/bigengguo/bigengguo-bg3.jpg'),
(NULL, 1, 'img/product-sale/bigengguo/bigengguo-sm(4).jpg','img/product-sale/bigengguo/bigengguo-md(4).jpg','img/product-sale/bigengguo/bigengguo-bg4.jpg'),
(NULL, 1, 'img/product-sale/bigengguo/bigengguo-sm(5).jpg','img/product-sale/bigengguo/bigengguo-md(5).jpg','img/product-sale/bigengguo/bigengguo-bg5.jpg'),
(NULL, 1, 'img/product-sale/bigengguo/bigengguo-sm(1).jpg','img/product-sale/bigengguo/bigengguo-md(1).jpg','img/product-sale/bigengguo/bigengguo-bg1.jpg'),
(NULL, 1, 'img/product-sale/bigengguo/bigengguo-sm(2).jpg','img/product-sale/bigengguo/bigengguo-md(2).jpg','img/product-sale/bigengguo/bigengguo-bg2.jpg'),


(NULL, 2, 'img/product-sale/binggan/binggan-sm(1).jpg','img/product-sale/binggan/binggan-md(1).jpg','img/product-sale/binggan/binggan-bg1.jpg'),
(NULL, 2, 'img/product-sale/binggan/binggan-sm(2).jpg','img/product-sale/binggan/binggan-md(2).jpg','img/product-sale/binggan/binggan-bg2.jpg'),
(NULL, 2, 'img/product-sale/binggan/binggan-sm(3).jpg','img/product-sale/binggan/binggan-md(3).jpg','img/product-sale/binggan/binggan-bg3.jpg'),
(NULL, 2, 'img/product-sale/binggan/binggan-sm(4).jpg','img/product-sale/binggan/binggan-md(4).jpg','img/product-sale/binggan/binggan-bg4.jpg'),
(NULL, 2, 'img/product-sale/binggan/binggan-sm(5).jpg','img/product-sale/binggan/binggan-md(5).jpg','img/product-sale/binggan/binggan-bg5.jpg'),
(NULL, 2, 'img/product-sale/binggan/binggan-sm(6).jpg','img/product-sale/binggan/binggan-md(6).jpg','img/product-sale/binggan/binggan-bg6.jpg'),
(NULL, 2, 'img/product-sale/binggan/binggan-sm(7).jpg','img/product-sale/binggan/binggan-md(7).jpg','img/product-sale/binggan/binggan-bg7.jpg'),


(NULL, 3, 'img/product-sale/binggan2/dangao2-sm(1).jpg','img/product-sale/binggan2/dangao2-md(1).jpg','img/product-sale/binggan2/dangao2-bg1.jpg'),
(NULL, 3, 'img/product-sale/binggan2/dangao2-sm(2).jpg','img/product-sale/binggan2/dangao2-md(2).jpg','img/product-sale/binggan2/dangao2-bg2.jpg'),
(NULL, 3, 'img/product-sale/binggan2/dangao2-sm(3).jpg','img/product-sale/binggan2/dangao2-md(3).jpg','img/product-sale/binggan2/dangao2-bg3.jpg'),
(NULL, 3, 'img/product-sale/binggan2/dangao2-sm(4).jpg','img/product-sale/binggan2/dangao2-md(4).jpg','img/product-sale/binggan2/dangao2-bg4.jpg'),
(NULL, 3, 'img/product-sale/binggan2/dangao2-sm(5).jpg','img/product-sale/binggan2/dangao2-md(5).jpg','img/product-sale/binggan2/dangao2-bg5.jpg'),
(NULL, 3, 'img/product-sale/binggan2/dangao2-sm(1).jpg','img/product-sale/binggan2/dangao2-md(1).jpg','img/product-sale/binggan2/dangao2-bg1.jpg'),
(NULL, 3, 'img/product-sale/binggan2/dangao2-sm(2).jpg','img/product-sale/binggan2/dangao2-md(2).jpg','img/product-sale/binggan2/dangao2-bg2.jpg'),


(NULL, 4, 'img/product-sale/binggan3/binggan3-sm(1).jpg','img/product-sale/binggan3/binggan3-md(1).jpg','img/product-sale/binggan3/binggan3-bg1.jpg'),
(NULL, 4, 'img/product-sale/binggan3/binggan3-sm(2).jpg','img/product-sale/binggan3/binggan3-md(2).jpg','img/product-sale/binggan3/binggan3-bg2.jpg'),
(NULL, 4, 'img/product-sale/binggan3/binggan3-sm(3).jpg','img/product-sale/binggan3/binggan3-md(3).jpg','img/product-sale/binggan3/binggan3-bg3.jpg'),
(NULL, 4, 'img/product-sale/binggan3/binggan3-sm(4).jpg','img/product-sale/binggan3/binggan3-md(4).jpg','img/product-sale/binggan3/binggan3-bg4.jpg'),
(NULL, 4, 'img/product-sale/binggan3/binggan3-sm(5).jpg','img/product-sale/binggan3/binggan3-md(5).jpg','img/product-sale/binggan3/binggan3-bg5.jpg'),
(NULL, 4, 'img/product-sale/binggan3/binggan3-sm(1).jpg','img/product-sale/binggan3/binggan3-md(1).jpg','img/product-sale/binggan3/binggan3-bg1.jpg'),
(NULL, 4, 'img/product-sale/binggan3/binggan3-sm(2).jpg','img/product-sale/binggan3/binggan3-md(2).jpg','img/product-sale/binggan3/binggan3-bg2.jpg'),


(NULL, 5, 'img/product-sale/dangao/dangao-sm(1).jpg','img/product-sale/dangao/dangao-md(1).jpg','img/product-sale/dangao/dangao-bg1.jpg'),
(NULL, 5, 'img/product-sale/dangao/dangao-sm(2).jpg','img/product-sale/dangao/dangao-md(2).jpg','img/product-sale/dangao/dangao-bg2.jpg'),
(NULL, 5, 'img/product-sale/dangao/dangao-sm(3).jpg','img/product-sale/dangao/dangao-md(3).jpg','img/product-sale/dangao/dangao-bg3.jpg'),
(NULL, 5, 'img/product-sale/dangao/dangao-sm(4).jpg','img/product-sale/dangao/dangao-md(4).jpg','img/product-sale/dangao/dangao-bg4.jpg'),
(NULL, 5, 'img/product-sale/dangao/dangao-sm(5).jpg','img/product-sale/dangao/dangao-md(5).jpg','img/product-sale/dangao/dangao-bg5.jpg'),
(NULL, 5, 'img/product-sale/dangao/dangao-sm(1).jpg','img/product-sale/dangao/dangao-md(1).jpg','img/product-sale/dangao/dangao-bg1.jpg'),
(NULL, 5, 'img/product-sale/dangao/dangao-sm(2).jpg','img/product-sale/dangao/dangao-md(2).jpg','img/product-sale/dangao/dangao-bg2.jpg'),


(NULL, 6, 'img/product-sale/dangao2/dangao2-sm(1).jpg','img/product-sale/dangao2/dangao2-md(1).jpg','img/product-sale/dangao2/dangao2-bg1.jpg'),
(NULL, 6, 'img/product-sale/dangao2/dangao2-sm(2).jpg','img/product-sale/dangao2/dangao2-md(2).jpg','img/product-sale/dangao2/dangao2-bg2.jpg'),
(NULL, 6, 'img/product-sale/dangao2/dangao2-sm(3).jpg','img/product-sale/dangao2/dangao2-md(3).jpg','img/product-sale/dangao2/dangao2-bg3.jpg'),
(NULL, 6, 'img/product-sale/dangao2/dangao2-sm(4).jpg','img/product-sale/dangao2/dangao2-md(4).jpg','img/product-sale/dangao2/dangao2-bg4.jpg'),
(NULL, 6, 'img/product-sale/dangao2/dangao2-sm(5).jpg','img/product-sale/dangao2/dangao2-md(5).jpg','img/product-sale/dangao2/dangao2-bg5.jpg'),
(NULL, 6, 'img/product-sale/dangao2/dangao2-sm(1).jpg','img/product-sale/dangao2/dangao2-md(1).jpg','img/product-sale/dangao2/dangao2-bg1.jpg'),
(NULL, 6, 'img/product-sale/dangao2/dangao2-sm(2).jpg','img/product-sale/dangao2/dangao2-md(2).jpg','img/product-sale/dangao2/dangao2-bg2.jpg'),


(NULL, 7, 'img/product-sale/dangao5/dangao5-sm(1).jpg','img/product-sale/dangao5/dangao5-md(1).jpg','img/product-sale/dangao5/dangao5-bg1.jpg'),
(NULL, 7, 'img/product-sale/dangao5/dangao5-sm(2).jpg','img/product-sale/dangao5/dangao5-md(2).jpg','img/product-sale/dangao5/dangao5-bg2.jpg'),
(NULL, 7, 'img/product-sale/dangao5/dangao5-sm(3).jpg','img/product-sale/dangao5/dangao5-md(3).jpg','img/product-sale/dangao5/dangao5-bg3.jpg'),
(NULL, 7, 'img/product-sale/dangao5/dangao5-sm(4).jpg','img/product-sale/dangao5/dangao5-md(4).jpg','img/product-sale/dangao5/dangao5-bg4.jpg'),
(NULL, 7, 'img/product-sale/dangao5/dangao5-sm(5).jpg','img/product-sale/dangao5/dangao5-md(5).jpg','img/product-sale/dangao5/dangao5-bg5.jpg'),
(NULL, 7, 'img/product-sale/dangao5/dangao5-sm(1).jpg','img/product-sale/dangao5/dangao5-md(1).jpg','img/product-sale/dangao5/dangao5-bg1.jpg'),
(NULL, 7, 'img/product-sale/dangao5/dangao5-sm(2).jpg','img/product-sale/dangao5/dangao5-md(2).jpg','img/product-sale/dangao5/dangao5-bg2.jpg'),


(NULL, 8, 'img/product-sale/gaodian/gaodian-sm(1).jpg','img/product-sale/gaodian/gaodian-md(1).jpg','img/product-sale/gaodian/gaodian-bg1.jpg'),
(NULL, 8, 'img/product-sale/gaodian/gaodian-sm(2).jpg','img/product-sale/gaodian/gaodian-md(2).jpg','img/product-sale/gaodian/gaodian-bg2.jpg'),
(NULL, 8, 'img/product-sale/gaodian/gaodian-sm(3).jpg','img/product-sale/gaodian/gaodian-md(3).jpg','img/product-sale/gaodian/gaodian-bg3.jpg'),
(NULL, 8, 'img/product-sale/gaodian/gaodian-sm(4).jpg','img/product-sale/gaodian/gaodian-md(4).jpg','img/product-sale/gaodian/gaodian-bg4.jpg'),
(NULL, 8, 'img/product-sale/gaodian/gaodian-sm(5).jpg','img/product-sale/gaodian/gaodian-md(5).jpg','img/product-sale/gaodian/gaodian-bg5.jpg'),
(NULL, 8, 'img/product-sale/gaodian/gaodian-sm(1).jpg','img/product-sale/gaodian/gaodian-md(1).jpg','img/product-sale/gaodian/gaodian-bg1.jpg'),
(NULL, 8, 'img/product-sale/gaodian/gaodian-sm(2).jpg','img/product-sale/gaodian/gaodian-md(2).jpg','img/product-sale/gaodian/gaodian-bg2.jpg'),


(NULL, 9, 'img/product-sale/hongtizi/hongtizi-sm(1).jpg','img/product-sale/hongtizi/hongtizi-md(1).jpg','img/product-sale/hongtizi/hongtizi-bg1.jpg'),
(NULL, 9, 'img/product-sale/hongtizi/hongtizi-sm(2).jpg','img/product-sale/hongtizi/hongtizi-md(2).jpg','img/product-sale/hongtizi/hongtizi-bg2.jpg'),
(NULL, 9, 'img/product-sale/hongtizi/hongtizi-sm(3).jpg','img/product-sale/hongtizi/hongtizi-md(3).jpg','img/product-sale/hongtizi/hongtizi-bg3.jpg'),
(NULL, 9, 'img/product-sale/hongtizi/hongtizi-sm(4).jpg','img/product-sale/hongtizi/hongtizi-md(4).jpg','img/product-sale/hongtizi/hongtizi-bg4.jpg'),
(NULL, 9, 'img/product-sale/hongtizi/hongtizi-sm(5).jpg','img/product-sale/hongtizi/hongtizi-md(5).jpg','img/product-sale/hongtizi/hongtizi-bg5.jpg'),
(NULL, 9, 'img/product-sale/hongtizi/hongtizi-sm(1).jpg','img/product-sale/hongtizi/hongtizi-md(1).jpg','img/product-sale/hongtizi/hongtizi-bg1.jpg'),
(NULL, 9, 'img/product-sale/hongtizi/hongtizi-sm(2).jpg','img/product-sale/hongtizi/hongtizi-md(2).jpg','img/product-sale/hongtizi/hongtizi-bg2.jpg'),


(NULL, 10, 'img/product-sale/hongzao/hongzao-sm(1).jpg','img/product-sale/hongzao/hongzao-md(1).jpg','img/product-sale/hongzao/hongzao-bg1.jpg'),
(NULL, 10, 'img/product-sale/hongzao/hongzao-sm(2).jpg','img/product-sale/hongzao/hongzao-md(2).jpg','img/product-sale/hongzao/hongzao-bg2.jpg'),
(NULL, 10, 'img/product-sale/hongzao/hongzao-sm(3).jpg','img/product-sale/hongzao/hongzao-md(3).jpg','img/product-sale/hongzao/hongzao-bg3.jpg'),
(NULL, 10, 'img/product-sale/hongzao/hongzao-sm(4).jpg','img/product-sale/hongzao/hongzao-md(4).jpg','img/product-sale/hongzao/hongzao-bg4.jpg'),
(NULL, 10, 'img/product-sale/hongzao/hongzao-sm(5).jpg','img/product-sale/hongzao/hongzao-md(5).jpg','img/product-sale/hongzao/hongzao-bg5.jpg'),
(NULL, 10, 'img/product-sale/hongzao/hongzao-sm(1).jpg','img/product-sale/hongzao/hongzao-md(1).jpg','img/product-sale/hongzao/hongzao-bg1.jpg'),
(NULL, 10, 'img/product-sale/hongzao/hongzao-sm(2).jpg','img/product-sale/hongzao/hongzao-md(2).jpg','img/product-sale/hongzao/hongzao-bg2.jpg'),


(NULL, 11, 'img/product-sale/hongzao2/hongzao2-sm(1).jpg','img/product-sale/hongzao2/hongzao2-md(1).jpg','img/product-sale/hongzao2/hongzao2-bg1.jpg'),
(NULL, 11, 'img/product-sale/hongzao2/hongzao2-sm(2).jpg','img/product-sale/hongzao2/hongzao2-md(2).jpg','img/product-sale/hongzao2/hongzao2-bg2.jpg'),
(NULL, 11, 'img/product-sale/hongzao2/hongzao2-sm(3).jpg','img/product-sale/hongzao2/hongzao2-md(3).jpg','img/product-sale/hongzao2/hongzao2-bg3.jpg'),
(NULL, 11, 'img/product-sale/hongzao2/hongzao2-sm(4).jpg','img/product-sale/hongzao2/hongzao2-md(4).jpg','img/product-sale/hongzao2/hongzao2-bg4.jpg'),
(NULL, 11, 'img/product-sale/hongzao2/hongzao2-sm(5).jpg','img/product-sale/hongzao2/hongzao2-md(5).jpg','img/product-sale/hongzao2/hongzao2-bg5.jpg'),
(NULL, 11, 'img/product-sale/hongzao2/hongzao2-sm(1).jpg','img/product-sale/hongzao2/hongzao2-md(1).jpg','img/product-sale/hongzao2/hongzao2-bg1.jpg'),
(NULL, 11, 'img/product-sale/hongzao2/hongzao2-sm(2).jpg','img/product-sale/hongzao2/hongzao2-md(2).jpg','img/product-sale/hongzao2/hongzao2-bg2.jpg'),


(NULL, 12, 'img/product-sale/jianguo/jianguo-sm(1).jpg','img/product-sale/jianguo/jianguo-md(1).jpg','img/product-sale/jianguo/jianguo-bg1.jpg'),
(NULL, 12, 'img/product-sale/jianguo/jianguo-sm(2).jpg','img/product-sale/jianguo/jianguo-md(2).jpg','img/product-sale/jianguo/jianguo-bg2.jpg'),
(NULL, 12, 'img/product-sale/jianguo/jianguo-sm(3).jpg','img/product-sale/jianguo/jianguo-md(3).jpg','img/product-sale/jianguo/jianguo-bg3.jpg'),
(NULL, 12, 'img/product-sale/jianguo/jianguo-sm(4).jpg','img/product-sale/jianguo/jianguo-md(4).jpg','img/product-sale/jianguo/jianguo-bg4.jpg'),
(NULL, 12, 'img/product-sale/jianguo/jianguo-sm(5).jpg','img/product-sale/jianguo/jianguo-md(5).jpg','img/product-sale/jianguo/jianguo-bg5.jpg'),
(NULL, 12, 'img/product-sale/jianguo/jianguo-sm(1).jpg','img/product-sale/jianguo/jianguo-md(1).jpg','img/product-sale/jianguo/jianguo-bg1.jpg'),
(NULL, 12, 'img/product-sale/jianguo/jianguo-sm(2).jpg','img/product-sale/jianguo/jianguo-md(2).jpg','img/product-sale/jianguo/jianguo-bg2.jpg'),


(NULL, 13, 'img/product-sale/jianguo2/jianguo2-sm(1).jpg','img/product-sale/jianguo2/jianguo2-md(1).jpg','img/product-sale/jianguo2/jianguo2-bg1.jpg'),
(NULL, 13, 'img/product-sale/jianguo2/jianguo2-sm(2).jpg','img/product-sale/jianguo2/jianguo2-md(2).jpg','img/product-sale/jianguo2/jianguo2-bg2.jpg'),
(NULL, 13, 'img/product-sale/jianguo2/jianguo2-sm(3).jpg','img/product-sale/jianguo2/jianguo2-md(3).jpg','img/product-sale/jianguo2/jianguo2-bg3.jpg'),
(NULL, 13, 'img/product-sale/jianguo2/jianguo2-sm(4).jpg','img/product-sale/jianguo2/jianguo2-md(4).jpg','img/product-sale/jianguo2/jianguo2-bg4.jpg'),
(NULL, 13, 'img/product-sale/jianguo2/jianguo2-sm(5).jpg','img/product-sale/jianguo2/jianguo2-md(5).jpg','img/product-sale/jianguo2/jianguo2-bg5.jpg'),
(NULL, 13, 'img/product-sale/jianguo2/jianguo2-sm(1).jpg','img/product-sale/jianguo2/jianguo2-md(1).jpg','img/product-sale/jianguo2/jianguo2-bg1.jpg'),
(NULL, 13, 'img/product-sale/jianguo2/jianguo2-sm(2).jpg','img/product-sale/jianguo2/jianguo2-md(2).jpg','img/product-sale/jianguo2/jianguo2-bg2.jpg'),


(NULL, 14, 'img/product-sale/jianguo3/jianguo3-sm(1).jpg','img/product-sale/jianguo3/jianguo3-md(1).jpg','img/product-sale/jianguo3/jianguo3-bg1.jpg'),
(NULL, 14, 'img/product-sale/jianguo3/jianguo3-sm(2).jpg','img/product-sale/jianguo3/jianguo2-md(2).jpg','img/product-sale/jianguo3/jianguo3-bg2.jpg'),
(NULL, 14, 'img/product-sale/jianguo3/jianguo3-sm(3).jpg','img/product-sale/jianguo3/jianguo3-md(3).jpg','img/product-sale/jianguo3/jianguo3-bg3.jpg'),
(NULL, 14, 'img/product-sale/jianguo3/jianguo3-sm(4).jpg','img/product-sale/jianguo3/jianguo3-md(4).jpg','img/product-sale/jianguo3/jianguo2-bg4.jpg'),
(NULL, 14, 'img/product-sale/jianguo3/jianguo3-sm(5).jpg','img/product-sale/jianguo3/jianguo3-md(5).jpg','img/product-sale/jianguo3/jianguo3-bg5.jpg'),
(NULL, 14, 'img/product-sale/jianguo3/jianguo3-sm(1).jpg','img/product-sale/jianguo3/jianguo3-md(1).jpg','img/product-sale/jianguo3/jianguo3-bg1.jpg'),
(NULL, 14, 'img/product-sale/jianguo3/jianguo3-sm(2).jpg','img/product-sale/jianguo3/jianguo2-md(2).jpg','img/product-sale/jianguo3/jianguo3-bg2.jpg'),


(NULL, 15, 'img/product-sale/jianguo4/jianguo4-sm(1).jpg','img/product-sale/jianguo4/jianguo4-md(1).jpg','img/product-sale/jianguo4/jianguo4-bg1.jpg'),
(NULL, 15, 'img/product-sale/jianguo4/jianguo4-sm(2).jpg','img/product-sale/jianguo4/jianguo4-md(2).jpg','img/product-sale/jianguo4/jianguo4-bg2.jpg'),
(NULL, 15, 'img/product-sale/jianguo4/jianguo4-sm(3).jpg','img/product-sale/jianguo4/jianguo4-md(3).jpg','img/product-sale/jianguo4/jianguo4-bg3.jpg'),
(NULL, 15, 'img/product-sale/jianguo4/jianguo4-sm(4).jpg','img/product-sale/jianguo4/jianguo4-md(4).jpg','img/product-sale/jianguo4/jianguo4-bg4.jpg'),
(NULL, 15, 'img/product-sale/jianguo4/jianguo4-sm(5).jpg','img/product-sale/jianguo4/jianguo4-md(5).jpg','img/product-sale/jianguo4/jianguo4-bg5.jpg'),
(NULL, 15, 'img/product-sale/jianguo4/jianguo4-sm(1).jpg','img/product-sale/jianguo4/jianguo4-md(1).jpg','img/product-sale/jianguo4/jianguo4-bg1.jpg'),
(NULL, 15, 'img/product-sale/jianguo4/jianguo4-sm(2).jpg','img/product-sale/jianguo4/jianguo4-md(2).jpg','img/product-sale/jianguo4/jianguo4-bg2.jpg'),


(NULL, 16, 'img/product-sale/jiangya/jiangya-sm(1).jpg','img/product-sale/jiangya/jiangya-md(1).jpg','img/product-sale/jiangya/jiangya-bg1.jpg'),
(NULL, 16, 'img/product-sale/jiangya/jiangya-sm(2).jpg','img/product-sale/jiangya/jiangya-md(2).jpg','img/product-sale/jiangya/jiangya-bg2.jpg'),
(NULL, 16, 'img/product-sale/jiangya/jiangya-sm(3).jpg','img/product-sale/jiangya/jiangya-md(3).jpg','img/product-sale/jiangya/jiangya-bg3.jpg'),
(NULL, 16, 'img/product-sale/jiangya/jiangya-sm(4).jpg','img/product-sale/jiangya/jiangya-md(4).jpg','img/product-sale/jiangya/jiangya-bg4.jpg'),
(NULL, 16, 'img/product-sale/jiangya/jiangya-sm(5).jpg','img/product-sale/jiangya/jiangya-md(5).jpg','img/product-sale/jiangya/jiangya-bg5.jpg'),
(NULL, 16, 'img/product-sale/jiangya/jiangya-sm(1).jpg','img/product-sale/jiangya/jiangya-md(1).jpg','img/product-sale/jiangya/jiangya-bg1.jpg'),
(NULL, 16, 'img/product-sale/jiangya/jiangya-sm(2).jpg','img/product-sale/jiangya/jiangya-md(2).jpg','img/product-sale/jiangya/jiangya-bg2.jpg'),


(NULL, 17, 'img/product-sale/jizhua/jizhua-sm(1).jpg','img/product-sale/jizhua/jizhua-md(1).jpg','img/product-sale/jizhua/jizhua-bg1.jpg'),
(NULL, 17, 'img/product-sale/jizhua/jizhua-sm(2).jpg','img/product-sale/jizhua/jizhua-md(2).jpg','img/product-sale/jizhua/jizhua-bg2.jpg'),
(NULL, 17, 'img/product-sale/jizhua/jizhua-sm(3).jpg','img/product-sale/jizhua/jizhua-md(3).jpg','img/product-sale/jizhua/jizhua-bg3.jpg'),
(NULL, 17, 'img/product-sale/jizhua/jizhua-sm(4).jpg','img/product-sale/jizhua/jizhua-md(4).jpg','img/product-sale/jizhua/jizhua-bg4.jpg'),
(NULL, 17, 'img/product-sale/jizhua/jizhua-sm(5).jpg','img/product-sale/jizhua/jizhua-md(5).jpg','img/product-sale/jizhua/jizhua-bg5.jpg'),
(NULL, 17, 'img/product-sale/jizhua/jizhua-sm(1).jpg','img/product-sale/jizhua/jizhua-md(1).jpg','img/product-sale/jizhua/jizhua-bg1.jpg'),
(NULL, 17, 'img/product-sale/jizhua/jizhua-sm(2).jpg','img/product-sale/jizhua/jizhua-md(2).jpg','img/product-sale/jizhua/jizhua-bg2.jpg'),


(NULL, 18, 'img/product-sale/larou/larou-sm(1).jpg','img/product-sale/larou/larou-md(1).jpg','img/product-sale/larou/larou-bg1.jpg'),
(NULL, 18, 'img/product-sale/larou/larou-sm(2).jpg','img/product-sale/larou/larou-md(2).jpg','img/product-sale/larou/larou-bg2.jpg'),
(NULL, 18, 'img/product-sale/larou/larou-sm(3).jpg','img/product-sale/larou/larou-md(3).jpg','img/product-sale/larou/larou-bg3.jpg'),
(NULL, 18, 'img/product-sale/larou/larou-sm(4).jpg','img/product-sale/larou/larou-md(4).jpg','img/product-sale/larou/larou-bg4.jpg'),
(NULL, 18, 'img/product-sale/larou/larou-sm(5).jpg','img/product-sale/larou/larou-md(5).jpg','img/product-sale/larou/larou-bg5.jpg'),
(NULL, 18, 'img/product-sale/larou/larou-sm(1).jpg','img/product-sale/larou/larou-md(1).jpg','img/product-sale/larou/larou-bg1.jpg'),
(NULL, 18, 'img/product-sale/larou/larou-sm(2).jpg','img/product-sale/larou/larou-md(2).jpg','img/product-sale/larou/larou-bg2.jpg'),


(NULL, 19, 'img/product-sale/makalong/makalong-sm(1).jpg','img/product-sale/makalong/makalong-md(1).jpg','img/product-sale/makalong/makalong-bg1.jpg'),
(NULL, 19, 'img/product-sale/makalong/makalong-sm(2).jpg','img/product-sale/makalong/makalong-md(2).jpg','img/product-sale/makalong/makalong-bg2.jpg'),
(NULL, 19, 'img/product-sale/makalong/makalong-sm(3).jpg','img/product-sale/makalong/makalong-md(3).jpg','img/product-sale/makalong/makalong-bg3.jpg'),
(NULL, 19, 'img/product-sale/makalong/makalong-sm(4).jpg','img/product-sale/makalong/makalong-md(4).jpg','img/product-sale/makalong/makalong-bg4.jpg'),
(NULL, 19, 'img/product-sale/makalong/makalong-sm(5).jpg','img/product-sale/makalong/makalong-md(5).jpg','img/product-sale/makalong/makalong-bg5.jpg'),
(NULL, 19, 'img/product-sale/makalong/makalong-sm(1).jpg','img/product-sale/makalong/makalong-md(1).jpg','img/product-sale/makalong/makalong-bg1.jpg'),
(NULL, 19, 'img/product-sale/makalong/makalong-sm(2).jpg','img/product-sale/makalong/makalong-md(2).jpg','img/product-sale/makalong/makalong-bg2.jpg'),


(NULL, 20, 'img/product-sale/mangguogan/mangguogan-sm(1).jpg','img/product-sale/mangguogan/mangguogan-md(1).jpg','img/product-sale/mangguogan/mangguogan-bg1.jpg'),
(NULL, 20, 'img/product-sale/mangguogan/mangguogan-sm(2).jpg','img/product-sale/mangguogan/mangguogan-md(2).jpg','img/product-sale/mangguogan/mangguogan-bg2.jpg'),
(NULL, 20, 'img/product-sale/mangguogan/mangguogan-sm(3).jpg','img/product-sale/mangguogan/mangguogan-md(3).jpg','img/product-sale/mangguogan/mangguogan-bg3.jpg'),
(NULL, 20, 'img/product-sale/mangguogan/mangguogan-sm(4).jpg','img/product-sale/mangguogan/mangguogan-md(4).jpg','img/product-sale/mangguogan/mangguogan-bg4.jpg'),
(NULL, 20, 'img/product-sale/mangguogan/mangguogan-sm(5).jpg','img/product-sale/mangguogan/mangguogan-md(5).jpg','img/product-sale/mangguogan/mangguogan-bg5.jpg'),
(NULL, 20, 'img/product-sale/mangguogan/mangguogan-sm(1).jpg','img/product-sale/mangguogan/mangguogan-md(1).jpg','img/product-sale/mangguogan/mangguogan-bg1.jpg'),
(NULL, 20, 'img/product-sale/mangguogan/mangguogan-sm(2).jpg','img/product-sale/mangguogan/mangguogan-md(2).jpg','img/product-sale/mangguogan/mangguogan-bg2.jpg'),


(NULL, 21, 'img/product-sale/mianbao/mianbao-sm(1).jpg','img/product-sale/mianbao/mianbao-md(1).jpg','img/product-sale/mianbao/mianbao-bg1.jpg'),
(NULL, 21, 'img/product-sale/mianbao/mianbao-sm(2).jpg','img/product-sale/mianbao/mianbao-md(2).jpg','img/product-sale/mianbao/mianbao-bg2.jpg'),
(NULL, 21, 'img/product-sale/mianbao/mianbao-sm(3).jpg','img/product-sale/mianbao/mianbao-md(3).jpg','img/product-sale/mianbao/mianbao-bg3.jpg'),
(NULL, 21, 'img/product-sale/mianbao/mianbao-sm(4).jpg','img/product-sale/mianbao/mianbao-md(4).jpg','img/product-sale/mianbao/mianbao-bg4.jpg'),
(NULL, 21, 'img/product-sale/mianbao/mianbao-sm(5).jpg','img/product-sale/mianbao/mianbao-md(5).jpg','img/product-sale/mianbao/mianbao-bg5.jpg'),
(NULL, 21, 'img/product-sale/mianbao/mianbao-sm(1).jpg','img/product-sale/mianbao/mianbao-md(1).jpg','img/product-sale/mianbao/mianbao-bg1.jpg'),
(NULL, 21, 'img/product-sale/mianbao/mianbao-sm(2).jpg','img/product-sale/mianbao/mianbao-md(2).jpg','img/product-sale/mianbao/mianbao-bg2.jpg'),


(NULL, 22, 'img/product-sale/mianbao2/mianbao2-sm(1).jpg','img/product-sale/mianbao2/mianbao2-md(1).jpg','img/product-sale/mianbao2/mianbao2-bg1.jpg'),
(NULL, 22, 'img/product-sale/mianbao2/mianbao2-sm(2).jpg','img/product-sale/mianbao2/mianbao2-md(2).jpg','img/product-sale/mianbao2/mianbao2-bg2.jpg'),
(NULL, 22, 'img/product-sale/mianbao2/mianbao2-sm(3).jpg','img/product-sale/mianbao2/mianbao2-md(3).jpg','img/product-sale/mianbao2/mianbao2-bg3.jpg'),
(NULL, 22, 'img/product-sale/mianbao2/mianbao2-sm(4).jpg','img/product-sale/mianbao2/mianbao2-md(4).jpg','img/product-sale/mianbao2/mianbao2-bg4.jpg'),
(NULL, 22, 'img/product-sale/mianbao2/mianbao2-sm(5).jpg','img/product-sale/mianbao2/mianbao2-md(5).jpg','img/product-sale/mianbao2/mianbao2-bg5.jpg'),
(NULL, 22, 'img/product-sale/mianbao2/mianbao2-sm(1).jpg','img/product-sale/mianbao2/mianbao2-md(1).jpg','img/product-sale/mianbao2/mianbao2-bg1.jpg'),
(NULL, 22, 'img/product-sale/mianbao2/mianbao2-sm(2).jpg','img/product-sale/mianbao2/mianbao2-md(2).jpg','img/product-sale/mianbao2/mianbao2-bg2.jpg'),


(NULL, 23, 'img/product-sale/niurougan/niurougan-sm(1).jpg','img/product-sale/niurougan/niurougan-md(1).jpg','img/product-sale/niurougan/niurougan-bg1.jpg'),
(NULL, 23, 'img/product-sale/niurougan/niurougan-sm(2).jpg','img/product-sale/niurougan/niurougan-md(2).jpg','img/product-sale/niurougan/niurougan-bg2.jpg'),
(NULL, 23, 'img/product-sale/niurougan/niurougan-sm(3).jpg','img/product-sale/niurougan/niurougan-md(3).jpg','img/product-sale/niurougan/niurougan-bg3.jpg'),
(NULL, 23, 'img/product-sale/niurougan/niurougan-sm(4).jpg','img/product-sale/niurougan/niurougan-md(4).jpg','img/product-sale/niurougan/niurougan-bg4.jpg'),
(NULL, 23, 'img/product-sale/niurougan/niurougan-sm(5).jpg','img/product-sale/niurougan/niurougan-md(5).jpg','img/product-sale/niurougan/niurougan-bg5.jpg'),
(NULL, 23, 'img/product-sale/niurougan/niurougan-sm(1).jpg','img/product-sale/niurougan/niurougan-md(1).jpg','img/product-sale/niurougan/niurougan-bg1.jpg'),
(NULL, 23, 'img/product-sale/niurougan/niurougan-sm(2).jpg','img/product-sale/niurougan/niurougan-md(2).jpg','img/product-sale/niurougan/niurougan-bg2.jpg'),


(NULL, 24, 'img/product-sale/niurougan2/niurougan2-sm(1).jpg','img/product-sale/niurougan2/niurougan2-md(1).jpg','img/product-sale/niurougan2/niurougan2-bg1.jpg'),
(NULL, 24, 'img/product-sale/niurougan2/niurougan2-sm(2).jpg','img/product-sale/niurougan2/niurougan2-md(2).jpg','img/product-sale/niurougan2/niurougan2-bg2.png'),
(NULL, 24, 'img/product-sale/niurougan2/niurougan2-sm(3).jpg','img/product-sale/niurougan2/niurougan2-md(3).jpg','img/product-sale/niurougan2/niurougan2-bg3.jpg'),
(NULL, 24, 'img/product-sale/niurougan2/niurougan2-sm(4).jpg','img/product-sale/niurougan2/niurougan2-md(4).jpg','img/product-sale/niurougan2/niurougan2-bg4.png'),
(NULL, 24, 'img/product-sale/niurougan2/niurougan2-sm(5).jpg','img/product-sale/niurougan2/niurougan2-md(5).jpg','img/product-sale/niurougan2/niurougan2-bg5.jpg'),
(NULL, 24, 'img/product-sale/niurougan2/niurougan2-sm(1).jpg','img/product-sale/niurougan2/niurougan2-md(1).jpg','img/product-sale/niurougan2/niurougan2-bg1.jpg'),
(NULL, 24, 'img/product-sale/niurougan2/niurougan2-sm(2).jpg','img/product-sale/niurougan2/niurougan2-md(2).jpg','img/product-sale/niurougan2/niurougan2-bg2.png'),


(NULL, 25, 'img/product-sale/nuomigao/nuomigao-sm(1).jpg','img/product-sale/nuomigao/nuomigao-md(1).jpg','img/product-sale/nuomigao/nuomigao-bg1.jpg'),
(NULL, 25, 'img/product-sale/nuomigao/nuomigao-sm(2).jpg','img/product-sale/nuomigao/nuomigao-md(2).jpg','img/product-sale/nuomigao/nuomigao-bg2.jpg'),
(NULL, 25, 'img/product-sale/nuomigao/nuomigao-sm(3).jpg','img/product-sale/nuomigao/nuomigao-md(3).jpg','img/product-sale/nuomigao/nuomigao-bg3.jpg'),
(NULL, 25, 'img/product-sale/nuomigao/nuomigao-sm(4).jpg','img/product-sale/nuomigao/nuomigao-md(4).jpg','img/product-sale/nuomigao/nuomigao-bg4.jpg'),
(NULL, 25, 'img/product-sale/nuomigao/nuomigao-sm(5).jpg','img/product-sale/nuomigao/nuomigao-md(5).jpg','img/product-sale/nuomigao/nuomigao-bg5.jpg'),
(NULL, 25, 'img/product-sale/nuomigao/nuomigao-sm(1).jpg','img/product-sale/nuomigao/nuomigao-md(1).jpg','img/product-sale/nuomigao/nuomigao-bg1.jpg'),
(NULL, 25, 'img/product-sale/nuomigao/nuomigao-sm(2).jpg','img/product-sale/nuomigao/nuomigao-md(2).jpg','img/product-sale/nuomigao/nuomigao-bg2.jpg'),


(NULL, 26, 'img/product-sale/putaogan/putaogan-sm(1).jpg','img/product-sale/putaogan/putaogan-md(1).jpg','img/product-sale/putaogan/putaogan-bg1.jpg'),
(NULL, 26, 'img/product-sale/putaogan/putaogan-sm(2).jpg','img/product-sale/putaogan/putaogan-md(2).jpg','img/product-sale/putaogan/putaogan-bg2.jpg'),
(NULL, 26, 'img/product-sale/putaogan/putaogan-sm(3).jpg','img/product-sale/putaogan/putaogan-md(3).jpg','img/product-sale/putaogan/putaogan-bg3.jpg'),
(NULL, 26, 'img/product-sale/putaogan/putaogan-sm(4).jpg','img/product-sale/putaogan/putaogan-md(4).jpg','img/product-sale/putaogan/putaogan-bg4.jpg'),
(NULL, 26, 'img/product-sale/putaogan/putaogan-sm(5).jpg','img/product-sale/putaogan/putaogan-md(5).jpg','img/product-sale/putaogan/putaogan-bg5.jpg'),
(NULL, 26, 'img/product-sale/putaogan/putaogan-sm(1).jpg','img/product-sale/putaogan/putaogan-md(1).jpg','img/product-sale/putaogan/putaogan-bg1.jpg'),
(NULL, 26, 'img/product-sale/putaogan/putaogan-sm(2).jpg','img/product-sale/putaogan/putaogan-md(2).jpg','img/product-sale/putaogan/putaogan-bg2.jpg'),


(NULL, 27, 'img/product-sale/putaogan2/putaogan2-sm(1).jpg','img/product-sale/putaogan2/putaogan2-md(1).jpg','img/product-sale/putaogan2/putaogan2-bg1.jpg'),
(NULL, 27, 'img/product-sale/putaogan2/putaogan2-sm(2).jpg','img/product-sale/putaogan2/putaogan2-md(2).jpg','img/product-sale/putaogan2/putaogan2-bg2.jpg'),
(NULL, 27, 'img/product-sale/putaogan2/putaogan2-sm(3).jpg','img/product-sale/putaogan2/putaogan2-md(3).jpg','img/product-sale/putaogan2/putaogan2-bg3.jpg'),
(NULL, 27, 'img/product-sale/putaogan2/putaogan2-sm(4).jpg','img/product-sale/putaogan2/putaogan2-md(4).jpg','img/product-sale/putaogan2/putaogan2-bg4.jpg'),
(NULL, 27, 'img/product-sale/putaogan2/putaogan2-sm(5).jpg','img/product-sale/putaogan2/putaogan2-md(5).jpg','img/product-sale/putaogan2/putaogan2-bg5.jpg'),
(NULL, 27, 'img/product-sale/putaogan2/putaogan2-sm(1).jpg','img/product-sale/putaogan2/putaogan2-md(1).jpg','img/product-sale/putaogan2/putaogan2-bg1.jpg'),
(NULL, 27, 'img/product-sale/putaogan2/putaogan2-sm(2).jpg','img/product-sale/putaogan2/putaogan2-md(2).jpg','img/product-sale/putaogan2/putaogan2-bg2.jpg'),


(NULL, 28, 'img/product-sale/kaoya5/kaoya5-sm(1).jpg','img/product-sale/kaoya5/kaoya5-md(1).jpg','img/product-sale/kaoya5/kaoya5-bg1.jpg'),
(NULL, 28, 'img/product-sale/kaoya5/kaoya5-sm(2).jpg','img/product-sale/kaoya5/kaoya5-md(2).jpg','img/product-sale/kaoya5/kaoya5-bg2.jpg'),
(NULL, 28, 'img/product-sale/kaoya5/kaoya5-sm(3).jpg','img/product-sale/kaoya5/kaoya5-md(3).jpg','img/product-sale/kaoya5/kaoya5-bg3.jpg'),
(NULL, 28, 'img/product-sale/kaoya5/kaoya5-sm(4).jpg','img/product-sale/kaoya5/kaoya5-md(4).jpg','img/product-sale/kaoya5/kaoya5-bg4.jpg'),
(NULL, 28, 'img/product-sale/kaoya5/kaoya5-sm(5).jpg','img/product-sale/kaoya5/kaoya5-md(5).jpg','img/product-sale/kaoya5/kaoya5-bg5.jpg'),
(NULL, 28, 'img/product-sale/kaoya5/kaoya5-sm(1).jpg','img/product-sale/kaoya5/kaoya5-md(1).jpg','img/product-sale/kaoya5/kaoya5-bg1.jpg'),
(NULL, 28, 'img/product-sale/kaoya5/kaoya5-sm(2).jpg','img/product-sale/kaoya5/kaoya5-md(2).jpg','img/product-sale/kaoya5/kaoya5-bg2.jpg'),


(NULL, 29, 'img/product-sale/tangyuan/tangyuan-sm(1).jpg','img/product-sale/tangyuan/tangyuan-md(1).jpg','img/product-sale/tangyuan/tangyuan-bg1.jpg'),
(NULL, 29, 'img/product-sale/tangyuan/tangyuan-sm(2).jpg','img/product-sale/tangyuan/tangyuan-md(2).jpg','img/product-sale/tangyuan/tangyuan-bg2.jpg'),
(NULL, 29, 'img/product-sale/tangyuan/tangyuan-sm(3).jpg','img/product-sale/tangyuan/tangyuan-md(3).jpg','img/product-sale/tangyuan/tangyuan-bg3.jpg'),
(NULL, 29, 'img/product-sale/tangyuan/tangyuan-sm(4).jpg','img/product-sale/tangyuan/tangyuan-md(4).jpg','img/product-sale/tangyuan/tangyuan-bg4.jpg'),
(NULL, 29, 'img/product-sale/tangyuan/tangyuan-sm(5).jpg','img/product-sale/tangyuan/tangyuan-md(5).jpg','img/product-sale/tangyuan/tangyuan-bg5.jpg'),
(NULL, 29, 'img/product-sale/tangyuan/tangyuan-sm(1).jpg','img/product-sale/tangyuan/tangyuan-md(1).jpg','img/product-sale/tangyuan/tangyuan-bg1.jpg'),
(NULL, 29, 'img/product-sale/tangyuan/tangyuan-sm(2).jpg','img/product-sale/tangyuan/tangyuan-md(2).jpg','img/product-sale/tangyuan/tangyuan-bg2.jpg'),


(NULL, 30, 'img/product-sale/xinren/xinren-sm(1).jpg','img/product-sale/xinren/xinren-md(1).jpg','img/product-sale/xinren/xinren-bg1.jpg'),
(NULL, 30, 'img/product-sale/xinren/xinren-sm(2).jpg','img/product-sale/xinren/xinren-md(2).jpg','img/product-sale/xinren/xinren-bg2.jpg'),
(NULL, 30, 'img/product-sale/xinren/xinren-sm(3).jpg','img/product-sale/xinren/xinren-md(3).jpg','img/product-sale/xinren/xinren-bg3.jpg'),
(NULL, 30, 'img/product-sale/xinren/xinren-sm(4).jpg','img/product-sale/xinren/xinren-md(4).jpg','img/product-sale/xinren/xinren-bg4.jpg'),
(NULL, 30, 'img/product-sale/xinren/xinren-sm(5).jpg','img/product-sale/xinren/xinren-md(5).jpg','img/product-sale/xinren/xinren-bg5.jpg'),
(NULL, 30, 'img/product-sale/xinren/xinren-sm(1).jpg','img/product-sale/xinren/xinren-md(1).jpg','img/product-sale/xinren/xinren-bg1.jpg'),
(NULL, 30, 'img/product-sale/xinren/xinren-sm(2).jpg','img/product-sale/xinren/xinren-md(2).jpg','img/product-sale/xinren/xinren-bg2.jpg'),


(NULL, 31, 'img/product-sale/xinren2/xinren2-sm(1).jpg','img/product-sale/xinren2/xinren2-md(1).jpg','img/product-sale/xinren2/xinren2-bg1.jpg'),
(NULL, 31, 'img/product-sale/xinren2/xinren2-sm(2).jpg','img/product-sale/xinren2/xinren2-md(2).jpg','img/product-sale/xinren2/xinren2-bg2.png'),
(NULL, 31, 'img/product-sale/xinren2/xinren2-sm(3).jpg','img/product-sale/xinren2/xinren2-md(3).jpg','img/product-sale/xinren2/xinren2-bg3.jpg'),
(NULL, 31, 'img/product-sale/xinren2/xinren2-sm(4).jpg','img/product-sale/xinren2/xinren2-md(4).jpg','img/product-sale/xinren2/xinren2-bg4.jpg'),
(NULL, 31, 'img/product-sale/xinren2/xinren2-sm(5).jpg','img/product-sale/xinren2/xinren2-md(5).jpg','img/product-sale/xinren2/xinren2-bg5.jpg'),
(NULL, 31, 'img/product-sale/xinren2/xinren2-sm(1).jpg','img/product-sale/xinren2/xinren2-md(1).jpg','img/product-sale/xinren2/xinren2-bg1.jpg'),
(NULL, 31, 'img/product-sale/xinren2/xinren2-sm(2).jpg','img/product-sale/xinren2/xinren2-md(2).jpg','img/product-sale/xinren2/xinren2-bg2.png'),


(NULL, 32, 'img/product-sale/yaoguo/yaoguo-sm(1).jpg','img/product-sale/yaoguo/yaoguo-md(1).jpg','img/product-sale/yaoguo/yaoguo-bg1.png'),
(NULL, 32, 'img/product-sale/yaoguo/yaoguo-sm(2).jpg','img/product-sale/yaoguo/yaoguo-md(2).jpg','img/product-sale/yaoguo/yaoguo-bg2.png'),
(NULL, 32, 'img/product-sale/yaoguo/yaoguo-sm(3).jpg','img/product-sale/yaoguo/yaoguo-md(3).jpg','img/product-sale/yaoguo/yaoguo-bg3.jpg'),
(NULL, 32, 'img/product-sale/yaoguo/yaoguo-sm(4).jpg','img/product-sale/yaoguo/yaoguo-md(4).jpg','img/product-sale/yaoguo/yaoguo-bg4.jpg'),
(NULL, 32, 'img/product-sale/yaoguo/yaoguo-sm(5).jpg','img/product-sale/yaoguo/yaoguo-md(5).jpg','img/product-sale/yaoguo/yaoguo-bg5.png'),
(NULL, 32, 'img/product-sale/yaoguo/yaoguo-sm(1).jpg','img/product-sale/yaoguo/yaoguo-md(1).jpg','img/product-sale/yaoguo/yaoguo-bg1.png'),
(NULL, 32, 'img/product-sale/yaoguo/yaoguo-sm(2).jpg','img/product-sale/yaoguo/yaoguo-md(2).jpg','img/product-sale/yaoguo/yaoguo-bg2.png'),


(NULL, 33, 'img/product-sale/zhengdangao/zhengdangao-sm(1).jpg','img/product-sale/zhengdangao/zhengdangao-md(1).jpg','img/product-sale/zhengdangao/zhengdangao-bg1.jpg'),
(NULL, 33, 'img/product-sale/zhengdangao/zhengdangao-sm(2).jpg','img/product-sale/zhengdangao/zhengdangao-md(2).jpg','img/product-sale/zhengdangao/zhengdangao-bg2.jpg'),
(NULL, 33, 'img/product-sale/zhengdangao/zhengdangao-sm(3).jpg','img/product-sale/zhengdangao/zhengdangao-md(3).jpg','img/product-sale/zhengdangao/zhengdangao-bg3.jpg'),
(NULL, 33, 'img/product-sale/zhengdangao/zhengdangao-sm(4).jpg','img/product-sale/zhengdangao/zhengdangao-md(4).jpg','img/product-sale/zhengdangao/zhengdangao-bg4.jpg'),
(NULL, 33, 'img/product-sale/zhengdangao/zhengdangao-sm(5).jpg','img/product-sale/zhengdangao/zhengdangao-md(5).jpg','img/product-sale/zhengdangao/zhengdangao-bg5.jpg'),
(NULL, 33, 'img/product-sale/zhengdangao/zhengdangao-sm(1).jpg','img/product-sale/zhengdangao/zhengdangao-md(1).jpg','img/product-sale/zhengdangao/zhengdangao-bg1.jpg'),
(NULL, 33, 'img/product-sale/zhengdangao/zhengdangao-sm(2).jpg','img/product-sale/zhengdangao/zhengdangao-md(2).jpg','img/product-sale/zhengdangao/zhengdangao-bg2.jpg'),


(NULL, 34, 'img/product-sale/zhurou/zhurou-sm(1).jpg','img/product-sale/zhurou/zhurou-md(1).jpg','img/product-sale/zhurou/zhurou-bg1.png'),
(NULL, 34, 'img/product-sale/zhurou/zhurou-sm(2).jpg','img/product-sale/zhurou/zhurou-md(2).jpg','img/product-sale/zhurou/zhurou-bg2.jpg'),
(NULL, 34, 'img/product-sale/zhurou/zhurou-sm(3).jpg','img/product-sale/zhurou/zhurou-md(3).jpg','img/product-sale/zhurou/zhurou-bg3.jpg'),
(NULL, 34, 'img/product-sale/zhurou/zhurou-sm(4).jpg','img/product-sale/zhurou/zhurou-md(4).jpg','img/product-sale/zhurou/zhurou-bg4.jpg'),
(NULL, 34, 'img/product-sale/zhurou/zhurou-sm(5).jpg','img/product-sale/zhurou/zhurou-md(5).jpg','img/product-sale/zhurou/zhurou-bg5.jpg'),
(NULL, 34, 'img/product-sale/zhurou/zhurou-sm(1).jpg','img/product-sale/zhurou/zhurou-md(1).jpg','img/product-sale/zhurou/zhurou-bg1.png'),
(NULL, 34, 'img/product-sale/zhurou/zhurou-sm(2).jpg','img/product-sale/zhurou/zhurou-md(2).jpg','img/product-sale/zhurou/zhurou-bg2.jpg'),


(NULL, 35, 'img/product-sale/zhurougan/zhurougan-sm(1).jpg','img/product-sale/zhurougan/zhurougan-md(1).jpg','img/product-sale/zhurougan/zhurougan-bg1.jpg'),
(NULL, 35, 'img/product-sale/zhurougan/zhurougan-sm(2).jpg','img/product-sale/zhurougan/zhurougan-md(2).jpg','img/product-sale/zhurougan/zhurougan-bg2.jpg'),
(NULL, 35, 'img/product-sale/zhurougan/zhurougan-sm(3).jpg','img/product-sale/zhurougan/zhurougan-md(3).jpg','img/product-sale/zhurougan/zhurougan-bg3.jpg'),
(NULL, 35, 'img/product-sale/zhurougan/zhurougan-sm(4).jpg','img/product-sale/zhurougan/zhurougan-md(4).jpg','img/product-sale/zhurougan/zhurougan-bg4.jpg'),
(NULL, 35, 'img/product-sale/zhurougan/zhurougan-sm(5).jpg','img/product-sale/zhurougan/zhurougan-md(5).jpg','img/product-sale/zhurougan/zhurougan-bg5.jpg'),
(NULL, 35, 'img/product-sale/zhurougan/zhurougan-sm(1).jpg','img/product-sale/zhurougan/zhurougan-md(1).jpg','img/product-sale/zhurougan/zhurougan-bg1.jpg'),
(NULL, 35, 'img/product-sale/zhurougan/zhurougan-sm(2).jpg','img/product-sale/zhurougan/zhurougan-md(2).jpg','img/product-sale/zhurougan/zhurougan-bg2.jpg'),


(NULL, 36, 'img/product-sale/rousongbing/rousongbing-sm(1).jpg','img/product-sale/rousongbing/rousongbing-md(1).jpg','img/product-sale/rousongbing/rousongbing-bg1.jpg'),
(NULL, 36, 'img/product-sale/rousongbing/rousongbing-sm(2).jpg','img/product-sale/rousongbing/rousongbing-md(2).jpg','img/product-sale/rousongbing/rousongbing-bg2.jpg'),
(NULL, 36, 'img/product-sale/rousongbing/rousongbing-sm(3).jpg','img/product-sale/rousongbing/rousongbing-md(3).jpg','img/product-sale/rousongbing/rousongbing-bg3.jpg'),
(NULL, 36, 'img/product-sale/rousongbing/rousongbing-sm(4).jpg','img/product-sale/rousongbing/rousongbing-md(4).jpg','img/product-sale/rousongbing/rousongbing-bg4.jpg'),
(NULL, 36, 'img/product-sale/rousongbing/rousongbing-sm(5).jpg','img/product-sale/rousongbing/rousongbing-md(5).jpg','img/product-sale/rousongbing/rousongbing-bg5.jpg'),
(NULL, 36, 'img/product-sale/rousongbing/rousongbing-sm(1).jpg','img/product-sale/rousongbing/rousongbing-md(1).jpg','img/product-sale/rousongbing/rousongbing-bg1.jpg'),
(NULL, 36, 'img/product-sale/rousongbing/rousongbing-sm(2).jpg','img/product-sale/rousongbing/rousongbing-md(2).jpg','img/product-sale/rousongbing/rousongbing-bg2.jpg'),


(NULL, 37, 'img/product-sale/yupai/yupai-sm(1).jpg','img/product-sale/yupai/yupai-md(1).jpg','img/product-sale/yupai/yupai-bg1.jpg'),
(NULL, 37, 'img/product-sale/yupai/yupai-sm(2).jpg','img/product-sale/yupai/yupai-md(2).jpg','img/product-sale/yupai/yupai-bg2.jpg'),
(NULL, 37, 'img/product-sale/yupai/yupai-sm(3).jpg','img/product-sale/yupai/yupai-md(3).jpg','img/product-sale/yupai/yupai-bg3.jpg'),
(NULL, 37, 'img/product-sale/yupai/yupai-sm(4).jpg','img/product-sale/yupai/yupai-md(4).jpg','img/product-sale/yupai/yupai-bg4.jpg'),
(NULL, 37, 'img/product-sale/yupai/yupai-sm(5).jpg','img/product-sale/yupai/yupai-md(5).jpg','img/product-sale/yupai/yupai-bg5.jpg'),
(NULL, 37, 'img/product-sale/yupai/yupai-sm(1).jpg','img/product-sale/yupai/yupai-md(1).jpg','img/product-sale/yupai/yupai-bg1.jpg'),
(NULL, 37, 'img/product-sale/yupai/yupai-sm(2).jpg','img/product-sale/yupai/yupai-md(2).jpg','img/product-sale/yupai/yupai-bg2.jpg'),


(NULL, 38, 'img/product-sale/badanmu/badanmu-sm(1).jpg','img/product-sale/badanmu/badanmu-md(1).jpg','img/product-sale/badanmu/badanmu-bg1.jpg'),
(NULL, 38, 'img/product-sale/badanmu/badanmu-sm(2).jpg','img/product-sale/badanmu/badanmu-md(2).jpg','img/product-sale/badanmu/badanmu-bg2.jpg'),
(NULL, 38, 'img/product-sale/badanmu/badanmu-sm(3).jpg','img/product-sale/badanmu/badanmu-md(3).jpg','img/product-sale/badanmu/badanmu-bg3.jpg'),
(NULL, 38, 'img/product-sale/badanmu/badanmu-sm(4).jpg','img/product-sale/badanmu/badanmu-md(4).jpg','img/product-sale/badanmu/badanmu-bg4.jpg'),
(NULL, 38, 'img/product-sale/badanmu/badanmu-sm(5).jpg','img/product-sale/badanmu/badanmu-md(5).jpg','img/product-sale/badanmu/badanmu-bg5.jpg'),
(NULL, 38, 'img/product-sale/badanmu/badanmu-sm(1).jpg','img/product-sale/badanmu/badanmu-md(1).jpg','img/product-sale/badanmu/badanmu-bg1.jpg'),
(NULL, 38, 'img/product-sale/badanmu/badanmu-sm(2).jpg','img/product-sale/badanmu/badanmu-md(2).jpg','img/product-sale/badanmu/badanmu-bg2.jpg'),


(NULL, 39, 'img/product-sale/quqi/quqi-sm(1).jpg','img/product-sale/quqi/quqi-md(1).jpg','img/product-sale/quqi/quqi-bg1.jpg'),
(NULL, 39, 'img/product-sale/quqi/quqi-sm(2).jpg','img/product-sale/quqi/quqi-md(2).jpg','img/product-sale/quqi/quqi-bg2.jpg'),
(NULL, 39, 'img/product-sale/quqi/quqi-sm(3).jpg','img/product-sale/quqi/quqi-md(3).jpg','img/product-sale/quqi/quqi-bg3.jpg'),
(NULL, 39, 'img/product-sale/quqi/quqi-sm(4).jpg','img/product-sale/quqi/quqi-md(4).jpg','img/product-sale/quqi/quqi-bg4.jpg'),
(NULL, 39, 'img/product-sale/quqi/quqi-sm(5).jpg','img/product-sale/quqi/quqi-md(5).jpg','img/product-sale/quqi/quqi-bg5.jpg'),
(NULL, 39, 'img/product-sale/quqi/quqi-sm(1).jpg','img/product-sale/quqi/quqi-md(1).jpg','img/product-sale/quqi/quqi-bg1.jpg'),
(NULL, 39, 'img/product-sale/quqi/quqi-sm(2).jpg','img/product-sale/quqi/quqi-md(2).jpg','img/product-sale/quqi/quqi-bg2.jpg'),


(NULL, 40, 'img/product-sale/shanhetao/shanhetao-sm(1).jpg','img/product-sale/shanhetao/shanhetao-md(1).jpg','img/product-sale/shanhetao/shanhetao-bg1.jpg'),
(NULL, 40, 'img/product-sale/shanhetao/shanhetao-sm(2).jpg','img/product-sale/shanhetao/shanhetao-md(2).jpg','img/product-sale/shanhetao/shanhetao-bg2.jpg'),
(NULL, 40, 'img/product-sale/shanhetao/shanhetao-sm(3).jpg','img/product-sale/shanhetao/shanhetao-md(3).jpg','img/product-sale/shanhetao/shanhetao-bg3.jpg'),
(NULL, 40, 'img/product-sale/shanhetao/shanhetao-sm(4).jpg','img/product-sale/shanhetao/shanhetao-md(4).jpg','img/product-sale/shanhetao/shanhetao-bg4.jpg'),
(NULL, 40, 'img/product-sale/shanhetao/shanhetao-sm(5).jpg','img/product-sale/shanhetao/shanhetao-md(5).jpg','img/product-sale/shanhetao/shanhetao-bg5.jpg'),
(NULL, 40, 'img/product-sale/shanhetao/shanhetao-sm(1).jpg','img/product-sale/shanhetao/shanhetao-md(1).jpg','img/product-sale/shanhetao/shanhetao-bg1.jpg'),
(NULL, 40, 'img/product-sale/shanhetao/shanhetao-sm(2).jpg','img/product-sale/shanhetao/shanhetao-md(2).jpg','img/product-sale/shanhetao/shanhetao-bg2.jpg'),


(NULL, 41, 'img/product-sale/xianhuabing/xianhuabing-sm(1).jpg','img/product-sale/xianhuabing/xianhuabing-md(1).jpg','img/product-sale/xianhuabing/xianhuabing-bg1.jpg'),
(NULL, 41, 'img/product-sale/xianhuabing/xianhuabing-sm(2).jpg','img/product-sale/xianhuabing/xianhuabing-md(2).jpg','img/product-sale/xianhuabing/xianhuabing-bg2.jpg'),
(NULL, 41, 'img/product-sale/xianhuabing/xianhuabing-sm(3).jpg','img/product-sale/xianhuabing/xianhuabing-md(3).jpg','img/product-sale/xianhuabing/xianhuabing-bg3.jpg'),
(NULL, 41, 'img/product-sale/xianhuabing/xianhuabing-sm(4).jpg','img/product-sale/xianhuabing/xianhuabing-md(4).jpg','img/product-sale/xianhuabing/xianhuabing-bg4.jpg'),
(NULL, 41, 'img/product-sale/xianhuabing/xianhuabing-sm(5).jpg','img/product-sale/xianhuabing/xianhuabing-md(5).jpg','img/product-sale/xianhuabing/xianhuabing-bg5.jpg'),
(NULL, 41, 'img/product-sale/xianhuabing/xianhuabing-sm(1).jpg','img/product-sale/xianhuabing/xianhuabing-md(1).jpg','img/product-sale/xianhuabing/xianhuabing-bg1.jpg'),
(NULL, 41, 'img/product-sale/xianhuabing/xianhuabing-sm(2).jpg','img/product-sale/xianhuabing/xianhuabing-md(2).jpg','img/product-sale/xianhuabing/xianhuabing-bg2.jpg'),


(NULL, 42, 'img/product-sale/yasuogu/yasuogu-sm(1).jpg','img/product-sale/yasuogu/yasuogu-md(1).jpg','img/product-sale/yasuogu/yasuogu-bg1.jpg'),
(NULL, 42, 'img/product-sale/yasuogu/yasuogu-sm(2).jpg','img/product-sale/yasuogu/yasuogu-md(2).jpg','img/product-sale/yasuogu/yasuogu-bg2.jpg'),
(NULL, 42, 'img/product-sale/yasuogu/yasuogu-sm(3).jpg','img/product-sale/yasuogu/yasuogu-md(3).jpg','img/product-sale/yasuogu/yasuogu-bg3.jpg'),
(NULL, 42, 'img/product-sale/yasuogu/yasuogu-sm(4).jpg','img/product-sale/yasuogu/yasuogu-md(4).jpg','img/product-sale/yasuogu/yasuogu-bg4.jpg'),
(NULL, 42, 'img/product-sale/yasuogu/yasuogu-sm(5).jpg','img/product-sale/yasuogu/yasuogu-md(5).jpg','img/product-sale/yasuogu/yasuogu-bg5.png'),
(NULL, 42, 'img/product-sale/yasuogu/yasuogu-sm(1).jpg','img/product-sale/yasuogu/yasuogu-md(1).jpg','img/product-sale/yasuogu/yasuogu-bg1.jpg'),
(NULL, 42, 'img/product-sale/yasuogu/yasuogu-sm(2).jpg','img/product-sale/yasuogu/yasuogu-md(2).jpg','img/product-sale/yasuogu/yasuogu-bg2.jpg'),


(NULL, 43, 'img/product-sale/youyusi/youyusi-sm(1).jpg','img/product-sale/youyusi/youyusi-md(1).jpg','img/product-sale/youyusi/youyusi-bg1.jpg'),
(NULL, 43, 'img/product-sale/youyusi/youyusi-sm(2).jpg','img/product-sale/youyusi/youyusi-md(2).jpg','img/product-sale/youyusi/youyusi-bg2.jpg'),
(NULL, 43, 'img/product-sale/youyusi/youyusi-sm(3).jpg','img/product-sale/youyusi/youyusi-md(3).jpg','img/product-sale/youyusi/youyusi-bg3.png'),
(NULL, 43, 'img/product-sale/youyusi/youyusi-sm(4).jpg','img/product-sale/youyusi/youyusi-md(4).jpg','img/product-sale/youyusi/youyusi-bg4.jpg'),
(NULL, 43, 'img/product-sale/youyusi/youyusi-sm(5).jpg','img/product-sale/youyusi/youyusi-md(5).jpg','img/product-sale/youyusi/youyusi-bg5.jpg'),
(NULL, 43, 'img/product-sale/youyusi/youyusi-sm(1).jpg','img/product-sale/youyusi/youyusi-md(1).jpg','img/product-sale/youyusi/youyusi-bg1.jpg'),
(NULL, 43, 'img/product-sale/youyusi/youyusi-sm(2).jpg','img/product-sale/youyusi/youyusi-md(2).jpg','img/product-sale/youyusi/youyusi-bg2.jpg'),


(NULL, 44, 'img/product-sale/baomihua/baomihua-sm(1).jpg','img/product-sale/baomihua/baomihua-md(1).jpg','img/product-sale/baomihua/baomihua-bg1.jpg'),
(NULL, 44, 'img/product-sale/baomihua/baomihua-sm(2).jpg','img/product-sale/baomihua/baomihua-md(2).jpg','img/product-sale/baomihua/baomihua-bg2.jpg'),
(NULL, 44, 'img/product-sale/baomihua/baomihua-sm(3).jpg','img/product-sale/baomihua/baomihua-md(3).jpg','img/product-sale/baomihua/baomihua-bg3.jpg'),
(NULL, 44, 'img/product-sale/baomihua/baomihua-sm(4).jpg','img/product-sale/baomihua/baomihua-md(4).jpg','img/product-sale/baomihua/baomihua-bg4.jpg'),
(NULL, 44, 'img/product-sale/baomihua/baomihua-sm(5).jpg','img/product-sale/baomihua/baomihua-md(5).jpg','img/product-sale/baomihua/baomihua-bg5.jpg'),
(NULL, 44, 'img/product-sale/baomihua/baomihua-sm(1).jpg','img/product-sale/baomihua/baomihua-md(1).jpg','img/product-sale/baomihua/baomihua-bg1.jpg'),
(NULL, 44, 'img/product-sale/baomihua/baomihua-sm(2).jpg','img/product-sale/baomihua/baomihua-md(2).jpg','img/product-sale/baomihua/baomihua-bg2.jpg'),


(NULL, 45, 'img/product-sale/guoba/guoba-sm(1).jpg','img/product-sale/guoba/guoba-md(1).jpg','img/product-sale/guoba/guoba-bg1.jpg'),
(NULL, 45, 'img/product-sale/guoba/guoba-sm(2).jpg','img/product-sale/guoba/guoba-md(2).jpg','img/product-sale/guoba/guoba-bg2.jpg'),
(NULL, 45, 'img/product-sale/guoba/guoba-sm(3).jpg','img/product-sale/guoba/guoba-md(3).jpg','img/product-sale/guoba/guoba-bg3.jpg'),
(NULL, 45, 'img/product-sale/guoba/guoba-sm(4).jpg','img/product-sale/guoba/guoba-md(4).jpg','img/product-sale/guoba/guoba-bg4.jpg'),
(NULL, 45, 'img/product-sale/guoba/guoba-sm(5).jpg','img/product-sale/guoba/guoba-md(5).jpg','img/product-sale/guoba/guoba-bg5.jpg'),
(NULL, 45, 'img/product-sale/guoba/guoba-sm(1).jpg','img/product-sale/guoba/guoba-md(1).jpg','img/product-sale/guoba/guoba-bg1.jpg'),
(NULL, 45, 'img/product-sale/guoba/guoba-sm(2).jpg','img/product-sale/guoba/guoba-md(2).jpg','img/product-sale/guoba/guoba-bg2.jpg'),


(NULL, 46, 'img/product-sale/guodong/guodong-sm(1).jpg','img/product-sale/guodong/guodong-md(1).jpg','img/product-sale/guodong/guodong-bg1.jpg'),
(NULL, 46, 'img/product-sale/guodong/guodong-sm(2).jpg','img/product-sale/guodong/guodong-md(2).jpg','img/product-sale/guodong/guodong-bg2.jpg'),
(NULL, 46, 'img/product-sale/guodong/guodong-sm(3).jpg','img/product-sale/guodong/guodong-md(3).jpg','img/product-sale/guodong/guodong-bg3.jpg'),
(NULL, 46, 'img/product-sale/guodong/guodong-sm(4).jpg','img/product-sale/guodong/guodong-md(4).jpg','img/product-sale/guodong/guodong-bg4.jpg'),
(NULL, 46, 'img/product-sale/guodong/guodong-sm(5).jpg','img/product-sale/guodong/guodong-md(5).jpg','img/product-sale/guodong/guodong-bg5.jpg'),
(NULL, 46, 'img/product-sale/guodong/guodong-sm(1).jpg','img/product-sale/guodong/guodong-md(1).jpg','img/product-sale/guodong/guodong-bg1.jpg'),
(NULL, 46, 'img/product-sale/guodong/guodong-sm(2).jpg','img/product-sale/guodong/guodong-md(2).jpg','img/product-sale/guodong/guodong-bg2.jpg'),


(NULL, 47, 'img/product-sale/haitai/haitai-sm(1).jpg','img/product-sale/haitai/haitai-md(1).jpg','img/product-sale/haitai/haitai-bg1.jpg'),
(NULL, 47, 'img/product-sale/haitai/haitai-sm(2).jpg','img/product-sale/haitai/haitai-md(2).jpg','img/product-sale/haitai/haitai-bg2.jpg'),
(NULL, 47, 'img/product-sale/haitai/haitai-sm(3).jpg','img/product-sale/haitai/haitai-md(3).jpg','img/product-sale/haitai/haitai-bg3.jpg'),
(NULL, 47, 'img/product-sale/haitai/haitai-sm(4).jpg','img/product-sale/haitai/haitai-md(4).jpg','img/product-sale/haitai/haitai-bg4.jpg'),
(NULL, 47, 'img/product-sale/haitai/haitai-sm(5).jpg','img/product-sale/haitai/haitai-md(5).jpg','img/product-sale/haitai/haitai-bg5.jpg'),
(NULL, 47, 'img/product-sale/haitai/haitai-sm(1).jpg','img/product-sale/haitai/haitai-md(1).jpg','img/product-sale/haitai/haitai-bg1.jpg'),
(NULL, 47, 'img/product-sale/haitai/haitai-sm(2).jpg','img/product-sale/haitai/haitai-md(2).jpg','img/product-sale/haitai/haitai-bg2.jpg'),


(NULL, 48, 'img/product-sale/lapian/lapian-sm(1).jpg','img/product-sale/lapian/lapian-md(1).jpg','img/product-sale/lapian/lapian-bg1.jpg'),
(NULL, 48, 'img/product-sale/lapian/lapian-sm(2).jpg','img/product-sale/lapian/lapian-md(2).jpg','img/product-sale/lapian/lapian-bg2.jpg'),
(NULL, 48, 'img/product-sale/lapian/lapian-sm(3).jpg','img/product-sale/lapian/lapian-md(3).jpg','img/product-sale/lapian/lapian-bg3.jpg'),
(NULL, 48, 'img/product-sale/lapian/lapian-sm(4).jpg','img/product-sale/lapian/lapian-md(4).jpg','img/product-sale/lapian/lapian-bg4.jpg'),
(NULL, 48, 'img/product-sale/lapian/lapian-sm(5).jpg','img/product-sale/lapian/lapian-md(5).jpg','img/product-sale/lapian/lapian-bg5.jpg'),
(NULL, 48, 'img/product-sale/lapian/lapian-sm(1).jpg','img/product-sale/lapian/lapian-md(1).jpg','img/product-sale/lapian/lapian-bg1.jpg'),
(NULL, 48, 'img/product-sale/lapian/lapian-sm(2).jpg','img/product-sale/lapian/lapian-md(2).jpg','img/product-sale/lapian/lapian-bg2.jpg'),


(NULL, 49, 'img/product-sale/shupian/shupian-sm(1).jpg','img/product-sale/shupian/shupian-md(1).jpg','img/product-sale/shupian/shupian-bg1.jpg'),
(NULL, 49, 'img/product-sale/shupian/shupian-sm(2).jpg','img/product-sale/shupian/shupian-md(2).jpg','img/product-sale/shupian/shupian-bg2.jpg'),
(NULL, 49, 'img/product-sale/shupian/shupian-sm(3).jpg','img/product-sale/shupian/shupian-md(3).jpg','img/product-sale/shupian/shupian-bg3.jpg'),
(NULL, 49, 'img/product-sale/shupian/shupian-sm(4).jpg','img/product-sale/shupian/shupian-md(4).jpg','img/product-sale/shupian/shupian-bg4.jpg'),
(NULL, 49, 'img/product-sale/shupian/shupian-sm(5).jpg','img/product-sale/shupian/shupian-md(5).jpg','img/product-sale/shupian/shupian-bg5.jpg'),
(NULL, 49, 'img/product-sale/shupian/shupian-sm(1).jpg','img/product-sale/shupian/shupian-md(1).jpg','img/product-sale/shupian/shupian-bg1.jpg'),
(NULL, 49, 'img/product-sale/shupian/shupian-sm(2).jpg','img/product-sale/shupian/shupian-md(2).jpg','img/product-sale/shupian/shupian-bg2.jpg'),


(NULL, 50, 'img/product-sale/bangbangtang/bangbangtang-sm(1).jpg','img/product-sale/bangbangtang/bangbangtang-md(1).jpg','img/product-sale/bangbangtang/bangbangtang-bg1.jpg'),
(NULL, 50, 'img/product-sale/bangbangtang/bangbangtang-sm(2).jpg','img/product-sale/bangbangtang/bangbangtang-md(2).jpg','img/product-sale/bangbangtang/bangbangtang-bg2.jpg'),
(NULL, 50, 'img/product-sale/bangbangtang/bangbangtang-sm(3).jpg','img/product-sale/bangbangtang/bangbangtang-md(3).jpg','img/product-sale/bangbangtang/bangbangtang-bg3.jpg'),
(NULL, 50, 'img/product-sale/bangbangtang/bangbangtang-sm(4).jpg','img/product-sale/bangbangtang/bangbangtang-md(4).jpg','img/product-sale/bangbangtang/bangbangtang-bg4.jpg'),
(NULL, 50, 'img/product-sale/bangbangtang/bangbangtang-sm(5).jpg','img/product-sale/bangbangtang/bangbangtang-md(5).jpg','img/product-sale/bangbangtang/bangbangtang-bg5.jpg'),
(NULL, 50, 'img/product-sale/bangbangtang/bangbangtang-sm(1).jpg','img/product-sale/bangbangtang/bangbangtang-md(1).jpg','img/product-sale/bangbangtang/bangbangtang-bg1.jpg'),
(NULL, 50, 'img/product-sale/bangbangtang/bangbangtang-sm(2).jpg','img/product-sale/bangbangtang/bangbangtang-md(2).jpg','img/product-sale/bangbangtang/bangbangtang-bg2.jpg'),


(NULL, 51, 'img/product-sale/niuzhatang/niuzhatang-sm(1).jpg','img/product-sale/niuzhatang/niuzhatang-md(1).jpg','img/product-sale/niuzhatang/niuzhatang-bg1.jpg'),
(NULL, 51, 'img/product-sale/niuzhatang/niuzhatang-sm(2).jpg','img/product-sale/niuzhatang/niuzhatang-md(2).jpg','img/product-sale/niuzhatang/niuzhatang-bg2.jpg'),
(NULL, 51, 'img/product-sale/niuzhatang/niuzhatang-sm(3).jpg','img/product-sale/niuzhatang/niuzhatang-md(3).jpg','img/product-sale/niuzhatang/niuzhatang-bg3.jpg'),
(NULL, 51, 'img/product-sale/niuzhatang/niuzhatang-sm(4).jpg','img/product-sale/niuzhatang/niuzhatang-md(4).jpg','img/product-sale/niuzhatang/niuzhatang-bg4.jpg'),
(NULL, 51, 'img/product-sale/niuzhatang/niuzhatang-sm(5).jpg','img/product-sale/niuzhatang/niuzhatang-md(5).jpg','img/product-sale/niuzhatang/niuzhatang-bg5.jpg'),
(NULL, 51, 'img/product-sale/niuzhatang/niuzhatang-sm(1).jpg','img/product-sale/niuzhatang/niuzhatang-md(1).jpg','img/product-sale/niuzhatang/niuzhatang-bg1.jpg'),
(NULL, 51, 'img/product-sale/niuzhatang/niuzhatang-sm(2).jpg','img/product-sale/niuzhatang/niuzhatang-md(2).jpg','img/product-sale/niuzhatang/niuzhatang-bg2.jpg'),


(NULL, 52, 'img/product-sale/qiaokeli/qiaokeli-sm(1).jpg','img/product-sale/qiaokeli/qiaokeli-md(1).jpg','img/product-sale/qiaokeli/qiaokeli-bg1.jpg'),
(NULL, 52, 'img/product-sale/qiaokeli/qiaokeli-sm(2).jpg','img/product-sale/qiaokeli/qiaokeli-md(2).jpg','img/product-sale/qiaokeli/qiaokeli-bg2.jpg'),
(NULL, 52, 'img/product-sale/qiaokeli/qiaokeli-sm(3).jpg','img/product-sale/qiaokeli/qiaokeli-md(3).jpg','img/product-sale/qiaokeli/qiaokeli-bg3.jpg'),
(NULL, 52, 'img/product-sale/qiaokeli/qiaokeli-sm(4).jpg','img/product-sale/qiaokeli/qiaokeli-md(4).jpg','img/product-sale/qiaokeli/qiaokeli-bg4.jpg'),
(NULL, 52, 'img/product-sale/qiaokeli/qiaokeli-sm(5).jpg','img/product-sale/qiaokeli/qiaokeli-md(5).jpg','img/product-sale/qiaokeli/qiaokeli-bg5.jpg'),
(NULL, 52, 'img/product-sale/qiaokeli/qiaokeli-sm(1).jpg','img/product-sale/qiaokeli/qiaokeli-md(1).jpg','img/product-sale/qiaokeli/qiaokeli-bg1.jpg'),
(NULL, 52, 'img/product-sale/qiaokeli/qiaokeli-sm(2).jpg','img/product-sale/qiaokeli/qiaokeli-md(2).jpg','img/product-sale/qiaokeli/qiaokeli-bg2.jpg'),


(NULL, 53, 'img/product-sale/qiaokeli2/qiaokeli2-sm(1).jpg','img/product-sale/qiaokeli2/qiaokeli2-md(1).jpg','img/product-sale/qiaokeli2/qiaokeli2-bg1.jpg'),
(NULL, 53, 'img/product-sale/qiaokeli2/qiaokeli2-sm(2).jpg','img/product-sale/qiaokeli2/qiaokeli2-md(2).jpg','img/product-sale/qiaokeli2/qiaokeli2-bg2.jpg'),
(NULL, 53, 'img/product-sale/qiaokeli2/qiaokeli2-sm(3).jpg','img/product-sale/qiaokeli2/qiaokeli2-md(3).jpg','img/product-sale/qiaokeli2/qiaokeli2-bg3.jpg'),
(NULL, 53, 'img/product-sale/qiaokeli2/qiaokeli2-sm(4).jpg','img/product-sale/qiaokeli2/qiaokeli2-md(4).jpg','img/product-sale/qiaokeli2/qiaokeli2-bg4.jpg'),
(NULL, 53, 'img/product-sale/qiaokeli2/qiaokeli2-sm(5).jpg','img/product-sale/qiaokeli2/qiaokeli2-md(5).jpg','img/product-sale/qiaokeli2/qiaokeli2-bg5.jpg'),
(NULL, 53, 'img/product-sale/qiaokeli2/qiaokeli2-sm(1).jpg','img/product-sale/qiaokeli2/qiaokeli2-md(1).jpg','img/product-sale/qiaokeli2/qiaokeli2-bg1.jpg'),
(NULL, 53, 'img/product-sale/qiaokeli2/qiaokeli2-sm(2).jpg','img/product-sale/qiaokeli2/qiaokeli2-md(2).jpg','img/product-sale/qiaokeli2/qiaokeli2-bg2.jpg'),


(NULL, 54, 'img/product-sale/songlu/songlu-sm(1).jpg','img/product-sale/songlu/songlu-md(1).jpg','img/product-sale/songlu/songlu-bg1.jpg'),
(NULL, 54, 'img/product-sale/songlu/songlu-sm(2).jpg','img/product-sale/songlu/songlu-md(2).jpg','img/product-sale/songlu/songlu-bg2.jpg'),
(NULL, 54, 'img/product-sale/songlu/songlu-sm(3).jpg','img/product-sale/songlu/songlu-md(3).jpg','img/product-sale/songlu/songlu-bg3.jpg'),
(NULL, 54, 'img/product-sale/songlu/songlu-sm(4).jpg','img/product-sale/songlu/songlu-md(4).jpg','img/product-sale/songlu/songlu-bg4.jpg'),
(NULL, 54, 'img/product-sale/songlu/songlu-sm(5).jpg','img/product-sale/songlu/songlu-md(5).jpg','img/product-sale/songlu/songlu-bg5.jpg'),
(NULL, 54, 'img/product-sale/songlu/songlu-sm(1).jpg','img/product-sale/songlu/songlu-md(1).jpg','img/product-sale/songlu/songlu-bg1.jpg'),
(NULL, 54, 'img/product-sale/songlu/songlu-sm(2).jpg','img/product-sale/songlu/songlu-md(2).jpg','img/product-sale/songlu/songlu-bg2.jpg'),


(NULL, 55, 'img/product-sale/xitang/xitang-sm(1).jpg','img/product-sale/xitang/xitang-md(1).jpg','img/product-sale/xitang/xitang-bg1.jpg'),
(NULL, 55, 'img/product-sale/xitang/xitang-sm(2).jpg','img/product-sale/xitang/xitang-md(2).jpg','img/product-sale/xitang/xitang-bg2.jpg'),
(NULL, 55, 'img/product-sale/xitang/xitang-sm(3).jpg','img/product-sale/xitang/xitang-md(3).jpg','img/product-sale/xitang/xitang-bg3.jpg'),
(NULL, 55, 'img/product-sale/xitang/xitang-sm(4).jpg','img/product-sale/xitang/xitang-md(4).jpg','img/product-sale/xitang/xitang-bg4.jpg'),
(NULL, 55, 'img/product-sale/xitang/xitang-sm(5).jpg','img/product-sale/xitang/xitang-md(5).jpg','img/product-sale/xitang/xitang-bg5.jpg'),
(NULL, 55, 'img/product-sale/xitang/xitang-sm(1).jpg','img/product-sale/xitang/xitang-md(1).jpg','img/product-sale/xitang/xitang-bg1.jpg'),
(NULL, 55, 'img/product-sale/xitang/xitang-sm(2).jpg','img/product-sale/xitang/xitang-md(2).jpg','img/product-sale/xitang/xitang-bg2.jpg'),

(NULL, 56, 'img/product-sale/defuqiaokeli2/defuqiaokeli2-sm(1).jpg','img/product-sale/defuqiaokeli2/defuqiaokeli2-md(1).jpg','img/product-sale/defuqiaokeli2/defuqiaokeli2-bg1.jpg'),
(NULL, 56, 'img/product-sale/defuqiaokeli2/defuqiaokeli2-sm(2).jpg','img/product-sale/defuqiaokeli2/defuqiaokeli2-md(2).jpg','img/product-sale/defuqiaokeli2/defuqiaokeli2-bg2.jpg'),
(NULL, 56, 'img/product-sale/defuqiaokeli2/defuqiaokeli2-sm(3).jpg','img/product-sale/defuqiaokeli2/defuqiaokeli2-md(3).jpg','img/product-sale/defuqiaokeli2/defuqiaokeli2-bg3.jpg'),
(NULL, 56, 'img/product-sale/defuqiaokeli2/defuqiaokeli2-sm(4).jpg','img/product-sale/defuqiaokeli2/defuqiaokeli2-md(4).jpg','img/product-sale/defuqiaokeli2/defuqiaokeli2-bg4.jpg'),
(NULL, 56, 'img/product-sale/defuqiaokeli2/defuqiaokeli2-sm(5).jpg','img/product-sale/defuqiaokeli2/defuqiaokeli2-md(5).jpg','img/product-sale/defuqiaokeli2/defuqiaokeli2-bg5.jpg'),
(NULL, 56, 'img/product-sale/defuqiaokeli2/defuqiaokeli2-sm(1).jpg','img/product-sale/defuqiaokeli2/defuqiaokeli2-md(1).jpg','img/product-sale/defuqiaokeli2/defuqiaokeli2-bg1.jpg'),

(NULL, 57, 'img/product-sale/mianhuatao/mianhuatao-sm(1).jpg','img/product-sale/mianhuatao/mianhuatao-md(1).jpg','img/product-sale/mianhuatao/mianhuatao-bg1.jpg'),
(NULL, 57, 'img/product-sale/mianhuatao/mianhuatao-sm(2).jpg','img/product-sale/mianhuatao/mianhuatao-md(2).jpg','img/product-sale/mianhuatao/mianhuatao-bg2.jpg'),
(NULL, 57, 'img/product-sale/mianhuatao/mianhuatao-sm(3).jpg','img/product-sale/mianhuatao/mianhuatao-md(3).jpg','img/product-sale/mianhuatao/mianhuatao-bg3.jpg'),
(NULL, 57, 'img/product-sale/mianhuatao/mianhuatao-sm(4).jpg','img/product-sale/mianhuatao/mianhuatao-md(4).jpg','img/product-sale/mianhuatao/mianhuatao-bg4.jpg'),
(NULL, 57, 'img/product-sale/mianhuatao/mianhuatao-sm(5).jpg','img/product-sale/mianhuatao/mianhuatao-md(5).jpg','img/product-sale/mianhuatao/mianhuatao-bg5.jpg'),
(NULL, 57, 'img/product-sale/mianhuatao/mianhuatao-sm(1).jpg','img/product-sale/mianhuatao/mianhuatao-md(1).jpg','img/product-sale/mianhuatao/mianhuatao-bg1.jpg');



/**用户信息**/
INSERT INTO xz_user VALUES
(1, 'dingding', '123456', 'ding@qq.com', '13511011000', 'img/avatar/default.png', '丁春秋', 0),
(2, 'dangdang', '123456', 'dang@qq.com', '13501234568', 'img/avatar/default.png', '当当喵', 1),
(3, 'doudou', '123456', 'dou@qq.com', '13501234569', 'img/avatar/default.png', '窦志强', 1),
(4, 'yaya', '123456', 'ya@qq.com', '13501234560', 'img/avatar/default.png', '秦小雅', 0),
(5, '1111', '111111', '441977193@qq.com', '18357100796', NULL, NULL, NULL),
(6, 'ABCD', '123456', '123@qq.com', '13538894495', NULL, NULL, NULL),
(7, 'mohk', '123456', '11@qq.com', '13512312312', NULL, NULL, NULL),
(8, '121123', 'w13945128995', '491000888@qq.com', '13213389258', NULL, NULL, NULL),
(9, '555555', '5555555', '55555555@163.com', '13400000000', NULL, NULL, NULL),
(10, 'xuyong', '123456', '123456789@qq.com', '15525623622', NULL, NULL, NULL),
(11, 'admin', 'cxy930123', 'mail@xingyu1993.cn', '13580510164', NULL, NULL, NULL),
(12, 'siyongbo', '900427', '616188545@qq.com', '18447103998', NULL, NULL, NULL),
(13, 'qwerty', '123456', '1091256014@qq.com', '15617152367', NULL, NULL, NULL),
(14, 'dingziqiang', '456456', '996534706@qq.com', '15567502520', NULL, NULL, NULL),
(15, 'hdb2264068', 'huang123', '471062503@qq.com', '18898405759', NULL, NULL, NULL),
(16, 'wenhua', '654321', 'liwenhua@tedu.cn', '15012345678', NULL, NULL, NULL),
(21, 'Jessy', 'ac210921', '123456@qq.com', '13523456789', NULL, NULL, NULL),
(22, 'yuanxf', '123456', 'yuanxf@tedu.cn', '13537763301', NULL, NULL, NULL),
(23, '查安军', '025520', '27514172112@qq.com', '18158899905', NULL, NULL, NULL),
(25, '1234', '111111', '734713428@qq.com', '18061920422', NULL, NULL, NULL),
(26, 'qwe12345', '123123', '1191769510@qq.com', '15234010643', NULL, NULL, NULL),
(27, '海贼王', '5124457', 'hxxcrocky@qq.com', '18826450879', NULL, NULL, NULL),
(28, 'hanrufuyun00', 'hanrufuyun11', '458205630@qq.com', '13853114827', NULL, NULL, NULL),
(29, 'li999999', 'li999999', 'limingdir@163.com', '18557512341', NULL, NULL, NULL),
(30, '111111111111', '123456', '1057631733@qq.com', '15275106677', NULL, NULL, NULL),
(31, 'tom', '123456', 'tom@tedu.cn', '13801234568', NULL, NULL, NULL),
(32, 'zhouzhi', '123456', '2206344145@qq.com', '17600587478', NULL, NULL, NULL),
(33, 'juleck', '123456', 'wuhaofushan@sina.com', '12345678901', NULL, NULL, NULL),
(34, 'yangtao', '123456', '250737026@qq.com', '18256953222', NULL, NULL, NULL),
(35, 'tarena', '123456', '783664829@qq.com', '17711625897', NULL, NULL, NULL),
(36, 'xiaobai', 'xx527603', '1196465493@qq.com', '13980312111', NULL, 'lulu', 0),
(37, '璐璐lu', '546521ll', '1273447080@qq.com', '15892761793', NULL, NULL, NULL),
(38, '胖王二二', 'woaidoubi1.', '1179524522@qq.com', '13269195181', NULL, '', 0),
(39, 'Yeye ', '123456', '1610608370@qq.com', '15062394551', NULL, NULL, NULL),
(40, 'lsj', '123456', '11324564879@qq.com', '13156467891', NULL, NULL, NULL),
(41, 'lsj', '123456', '11324564879@qq.com', '13156467891', NULL, NULL, NULL),
(42, 'lsj', '123456', '11324564879@qq.com', '13156467891', NULL, NULL, NULL),
(43, 'lsj', '123456', '11324564879@qq.com', '13156467891', NULL, NULL, NULL),
(44, 'lsj', '123456', '11324564879@qq.com', '13156467891', NULL, NULL, NULL),
(45, 'hjh', '958030', 'hjh@126.com', '17812344567', NULL, NULL, NULL),
(46, 'ewq', '123456', '1234567890@qq.com', '12345678909', NULL, NULL, NULL),
(47, 'pipi', '123456', '78@qq.com', '12367889993', NULL, NULL, NULL),
(48, 'Lovica', '309418727', '1684707021@qq.com', '18435130456', NULL, NULL, NULL),
(49, 'htt0908', '19920908', '418720482@qq.com', '15244691033', NULL, NULL, NULL),
(50, 'SUXUEMEI', '123456', 'SUXUEMEI@qq.com', '15817338974', NULL, NULL, NULL),
(51, 'zhong', '123456', '123456789@126.com', '13120211111', NULL, NULL, NULL),
(52, '金豆豆', '123456789', '1170363143@qq.com', '15738619097', NULL, NULL, NULL),
(53, 'wangjunfei', '123456', '396225880@qq.com', '13205935797', NULL, NULL, NULL),
(54, 'gijhglkhglkh', '123456', 'sjksfj@fjdh.com', '15698765423', NULL, NULL, NULL),
(55, 'zuiyd1314', 'zuiyh1994', '528396697@qq.com', '15927843908', NULL, NULL, NULL),
(56, 'xiaoming123', '123456', '54646@qq.com', '13553688534', NULL, NULL, NULL),
(57, 'yuanzhi', '123456', '270096123@qq.com', '15962573639', NULL, NULL, NULL),
(58, 'fengkuang11', 'fengkuang113', '1135779768@qq.com', '18559132247', NULL, NULL, NULL),
(59, 'fengkuang', '123456', '113577976@qq.com', '18559132248', NULL, NULL, NULL),
(60, 'yxzaaa', '123456', '2280517552@qq.com', '13716225357', NULL, NULL, NULL),
(61, 'linlei0001', '58874439', '876056078@qq.com', '13390922939', NULL, NULL, NULL),
(62, 'superman', '1314520', '904202099@qq.com', '12345678910', NULL, NULL, NULL),
(63, 'tom222', '123456', '1@163.com', '13456789012', NULL, NULL, NULL),
(64, 'tom1234', '123456', '2@163.com', '13423456789', NULL, NULL, NULL),
(65, 'Liyu123', 'asd8520', '812544715@qq.com', '18911743412', NULL, '左天', 1),
(66, 'Liyu123', 'asd8520', '812544715@qq.com', '18911743412', NULL, NULL, NULL),
(67, '李白李白', '123456', '125365@163.com', '13986273022', NULL, NULL, NULL),
(68, 'dingdong', '123456', '15194898156@qq.com', '15112316516', NULL, NULL, NULL),
(69, 'wenjinhua', '236239', '461677613@qq.com', '13516574786', NULL, NULL, NULL),
(70, 'thebigleg', '1a4b2c8d5e7f', '1352951609@qq.com', '13572508752', NULL, NULL, NULL),
(71, 'zhangsan', 'add123456', 'add@qq.com', '12234324223', NULL, NULL, NULL),
(72, '高渐离', '123456', '935263676@qq.com', '18352501250', NULL, NULL, NULL),
(73, 'lifan', '123456', '18092034652@163.com', '18092933456', NULL, NULL, NULL),
(74, 'zhangsan99', '123456zs', '876987366@qq.com', '13934721892', NULL, NULL, NULL),
(75, 'tingDING', '123456', '12345678@qq.com', '13548525468', NULL, NULL, NULL),
(76, 'dongdong', '123456', 'wenhua@taqobao.com', '13946585968', NULL, NULL, NULL),
(77, 'weiyiwei', '123456', '598475405@qq.com', '15923741956', NULL, '韦祎伟', 1),
(79, 'xiaoming1234', '123456', '4564564564@qq.com', '15269188535', NULL, NULL, NULL),
(80, 'loonchao', '123456', '850248873@qq.com', '13548729051', NULL, NULL, NULL),
(81, 'hushuang', '123456', '850248813@qq.com', '15802507525', NULL, NULL, NULL),
(82, 'test713', '2017713', '12458148@qq.com', '13596542654', NULL, NULL, NULL),
(83, 'fhr9588', '000009588', '111111111@qq.com', '12345666666', NULL, NULL, NULL),
(84, 'baibaidexue', '13809024377', '408130701@qq.com', '18301973827', NULL, NULL, NULL),
(86, '12121', '121212', '516898@qq.com', '15163222922', NULL, NULL, NULL),
(87, 'qwer', 'qwer123', '519808982@qq.com', '15163222923', NULL, NULL, NULL),
(89, 'smm123456', '963852741', '974255093@qq.com', '15098807312', NULL, NULL, NULL),
(90, 'Wenhua.Li', 'libenka', 'wenhua.li@tedu.cn', '13912345678', NULL, NULL, NULL),
(NULL, 'dingding', '123456', 'ding@qq.com', '13501234567', 'img/avatar/default.png', '丁伟', '1'),
(NULL, 'dangdang', '123456', 'dang@qq.com', '13501234568', 'img/avatar/default.png', '林当', '1'),
(NULL, 'doudou', '123456', 'dou@qq.com', '13501234569', 'img/avatar/default.png', '窦志强', '1'),
(NULL, 'yaya', '123456', 'ya@qq.com', '13501234560', 'img/avatar/default.png', '秦小雅', '0');

/****首页轮播广告商品****/
INSERT INTO xz_index_carousel VALUES
(NULL, 'img/ad/ad1.jpg','轮播广告商品1','product.html'),
(NULL, 'img/ad/ad2.png','轮播广告商品2','product.html'),
(NULL, 'img/ad/ad3.png','轮播广告商品3','product.html'),
(NULL, 'img/ad/ad4.jpg','轮播广告商品4','product.html');

/****首页商品****/
INSERT INTO xz_index_product VALUES
(NULL, '', '', 'img/index/floor_1_1.png', '', 'product.html', 1, 0, 0),
(NULL, '芭米手工软奶苏打夹心饼干', '芭米手工软奶苏打夹心牛轧糖饼干180g海苔奶盐香葱休闲零食品', 'img/index/floor_1_2.png', 12.80, 'product-sale.html?lid=4', 2, 0, 0),
(NULL, '闽台特产零食早餐肉松饼', '友臣旗舰店 肉松饼友臣整箱包邮1.25kg 闽台特产零食早餐', 'img/index/floor_1_3.png', 42.80, 'product-sale.html?lid=36', 3, 0, 0),
(NULL, '手撕口袋小糕点', '良品铺子奶香蒸蛋糕 手撕口袋小糕点 早餐面包糕点', 'img/index/floor_1_4.png', 48.00, 'product-sale.html?lid=21', 4, 0, 0),
(NULL, '早餐三明治蛋糕500g', '手撕小糕点蛋糕面包 早餐三明治蛋糕500g', 'img/index/floor_1_5.png', 17.90, 'product-sale.html?lid=6', 5, 0, 0),
(NULL, '', '', 'img/index/floor_1_6.png', '', 'product.html', 6, 0, 0),
(NULL, '达利园瑞士卷夹心蛋糕', '达利园瑞士卷夹心蛋糕早餐面包糕点 香蕉味', 'img/index/floor_1_7.png', 32.90, 'product-sale.html?lid=5', 7, 0, 0),
(NULL, '芝士蛋糕生日蛋糕', '悠享家 芝士蛋糕生日蛋糕 甜品八位小块拼装蛋糕', 'img/index/floor_1_8.png', 31.90, 'product-sale.html?lid=7', 8, 0, 0),
(NULL, '休闲零食华美华夫饼', '华美华夫饼 休闲零食饼干蛋糕 华夫软饼1200g（原味）', 'img/index/floor_1_9.png', 49.00, 'product-sale.html?lid=2', 9, 0, 0),
(NULL, '华夫手撕小软面包', '华夫面包牛奶味1000g手撕小软面包早餐 糕点零食', 'img/index/floor_1_10.png', 30.90, 'product-sale.html?lid=22', 10, 0, 0),
(NULL, '', '', 'img/index/floor_1_11.png', '', 'product.html', 11, 0, 0),

(NULL, '', '', 'img/index/mjgg1-zs.png', '', 'product.html', 0, 1, 0),
(NULL, '无核白葡萄干', '无核白葡萄干 新疆特产 蜜饯果干 250g', 'img/index/mjgg2-zs.png', 22.90, 'product-sale.html?lid=28', 0, 2, 0),
(NULL, '三只松鼠_夏威夷果', '三只松鼠_夏威夷果265gx2袋', 'img/index/mjgg3-zs.png', 47.90, 'product-sale.html?lid=12', 0, 3, 0),
(NULL, '如水鱼皮花生', '如水 坚果炒货 鱼皮花生小时候的味道500g', 'img/index/mjgg4-zs.png', 24.90, 'product-sale.html?lid=12', 0, 4, 0),
(NULL, '新疆红枣和田大枣', '新疆红枣 和田大枣 一等五星和田大红枣500g/袋*2', 'img/index/mjgg5-zs.png', 43.90, 'product-sale.html?lid=10', 0, 5, 0),
(NULL, '', '', 'img/index/mjgg6-zs.png', '', 'product.html', 0, 6, 0),
(NULL, '坚果炒货烘焙腰果', '坚果炒货 休闲食品 紫皮腰果 烘焙腰果300g/罐', 'img/index/mjgg7-zs.png', 68.00, 'product-sale.html?lid=2', 0, 7, 0),
(NULL, '三只松鼠_芒果干', '三只松鼠 蜜饯果干 休闲零食 芒果干116g/袋', 'img/index/mjgg8-zs.png', 9.90, 'product-sale.html?lid=21', 0, 8, 0),
(NULL, '和田红枣夹核桃', '大枣夹核桃 和田红枣夹核桃仁量贩装818g/盒', 'img/index/mjgg9-zs.png', 79.00, 'product-sale.html?lid=11', 0, 9, 0),
(NULL, '和田红枣夹核桃仁', '百草味 和田红枣夹核桃仁 干果零食特产 抱抱果260g/袋', 'img/index/mjgg10-zs.png', 25.90, 'product-sale.html?lid=11', 0, 10, 0),
(NULL, '', '', 'img/index/mjgg11-zs.png', '', 'product.html', 0, 11, 0),

(NULL, '', '', 'img/index/floor_3_1.png', '', 'product-sale.html', 0, 0, 1),
(NULL, '手撕猪肉脯200g', '手撕猪肉脯200g 古法炭烤无腥味 猪肉干', 'img/index/floor_3_2.png', 19.90, 'product-sale.html?lid=35',0, 0, 2),
(NULL, '皇上皇 招牌腊肠', '皇上皇 招牌腊肠(7分瘦)500g', 'img/index/floor_3_3.png', 52.90, 'product-sale.html?lid=19', 0, 0, 3),
(NULL, '洽洽 肉干肉脯凤爪', '洽洽 肉干肉脯 休闲零食 霍无甲虎皮凤爪200g/袋', 'img/index/floor_3_4.png', 20.90, 'product-sale.html?lid=17',0, 0, 4),
(NULL, '全聚德烤鸭', '全聚德烤鸭 北京烤鸭烤鸭套装组合送鸭饼鸭酱共1380g', 'img/index/floor_3_5.png', 128.00, 'product-sale.html?lid=18', 0, 0, 5),
(NULL, '', '', 'img/index/floor_3_6.png', '', 'product.html', 0, 0, 6),
(NULL, '麻辣五香牛肉干', '麻辣五香牛肉干四川特产牛肉类零食', 'img/index/floor_3_7.png', 41.80, 'product-sale.html?lid=23',0, 0, 7),
(NULL, '洽洽 一品牛太湿卤牛肉', '洽洽 一品牛太湿卤牛肉200g', 'img/index/floor_3_8.png', 29.90, 'product-sale.html?lid=25',0, 0, 8),
(NULL, '来伊份 手撕肉条', '来伊份 肉干肉脯 休闲食品 手撕肉条108g', 'img/index/floor_3_9.png', 20.90, 'product-sale.html?lid=35', 0, 0, 9),
(NULL, '味芝元香辣鱼排', '味芝元香辣鱼排26g*30包湖南特产零食洞庭湖野生可混鱼尾', 'img/index/floor_3_10.png', 26.60, 'product-sale.html?lid=37', 0, 0, 10),
(NULL, '', '', 'img/index/floor_3_11.png', '', 'product.html', 0, 0, 11),

(NULL, '', '', 'img/index/floor_4_(1).jpg', '', 'product.html', 12, 0, 0),
(NULL, '良品铺子炭烧腰果仁', '良品铺子炭烧腰果仁238g', 'img/index/floor_4_(2).jpg', 21.80, 'product-sale.html?lid=32',13, 0, 0),
(NULL, '手剥纸皮扁桃仁', '【百草味-巴旦木180gx2袋】手剥纸皮扁桃仁', 'img/index/floor_4_(3).jpg', 28.90, 'product-sale.html?lid=38', 14, 0, 0),
(NULL, '百草味-手剥山核桃190g', '聚新货【百草味-手剥山核桃190g】小核桃临安特产', 'img/index/floor_4_(4).jpg', 20.90, 'product-sale.html?lid=40',15, 0, 0),
(NULL, '三只松鼠_夏威夷果265gx2袋', '三只松鼠_夏威夷果265gx2袋', 'img/index/floor_4_(5).jpg', 47.90, 'product-sale.html?lid=12', 16, 0, 0),
(NULL, '', '', 'img/index/floor_4_(6).jpg', '', 'product.html', 17, 0, 0),
(NULL, '三只松鼠_碧根果210gx2袋', '聚【三只松鼠_碧根果210gx20袋】零食坚果山核桃长寿果干奶油味', 'img/index/floor_4_(7).jpg', 9.90, 'product-sale.html?lid=1',18, 0, 0),
(NULL, '百草味夏威夷果200gx2袋', '百草味夏威夷果200gx2袋', 'img/index/floor_4_(8).jpg', 37.80, 'product-sale.html?lid=13',19, 0, 0),
(NULL, '沃隆每日坚果大礼包', '沃隆每日坚果大礼包儿童款干果混装袋', 'img/index/floor_4_(9).jpg', 39.80, 'product-sale.html?lid=14', 20, 0, 0),
(NULL, '美国自然开心果500g', '美国自然开心果500g包邮', 'img/index/floor_4_(10).jpg', 25.80, 'product-sale.html?lid=15', 21, 0, 0),
(NULL, '', '', 'img/index/floor_4_(11).jpg', '', 'product.html', 22, 0, 0),

(NULL, '', '', 'img/index/floor_5_(1).jpg', '', 'product.html', 0, 12, 0),
(NULL, '马卡龙甜点礼盒装', '马卡龙甜点礼盒装12枚法式蛋糕 早餐面包糕点', 'img/index/floor_5_(2).jpg', 29.90, 'product-sale.html?lid=19',0, 13, 0),
(NULL, '三只松鼠_小贱爆米花150g', '【三只松鼠_小贱爆米花150g】休闲零食膨化食品奶油/焦糖味', 'img/index/floor_5_(3).jpg', 12.90, 'product-sale.html?lid=44', 0, 14, 0),
(NULL, '老襄阳手工锅巴麻辣味', '老襄阳手工锅巴麻辣味400g膨化食品散装特产休闲小吃零食', 'img/index/floor_5_(4).jpg', 15.60, 'product-sale.html?lid=45',0, 15, 0),
(NULL, '亲亲果肉果冻520g', '亲亲果肉果冻520g小吃布丁儿童休闲零食糖果礼物', 'img/index/floor_5_(5).jpg', 16.81, 'product-sale.html?lid=46', 0, 16, 0),
(NULL, '', '', 'img/index/floor_5_(6).jpg', '', 'product.html', 0, 17, 0),
(NULL, '良品铺子豆皮辣片', '良品铺子豆皮辣片 经典怀旧食品小吃香辣味辣皮', 'img/index/floor_5_(7).jpg', 14.90, 'product-sale.html?lid=48',0, 18, 0),
(NULL, '泰国进口海苔卷', '泰国进口海苔卷小老板经典原味紫菜卷32.4g*2盒', 'img/index/floor_5_(8).jpg', 26.90, 'product-sale.html?lid=47',0, 19, 0),
(NULL, '上好佳薯片鲜虾片', '上好佳薯片鲜虾片50包批发整箱大礼包', 'img/index/floor_5_(9).jpg', 18.80, 'product-sale.html?lid=49', 0, 20, 0),
(NULL, '福建特产然利薯干吃汤圆', '福建特产然利薯干吃汤圆', 'img/index/floor_5_(10).jpg', 25.80, 'product-sale.html?lid=29', 0, 21, 0),
(NULL, '', '', 'img/index/floor_5_(11).jpg', '', 'product.html', 0, 22, 0),

(NULL, '', '', 'img/index/floor_6_(1).jpg', '', 'product.html', 0, 0, 12),
(NULL, '徐福记夹酱棉花糖', '徐福记夹酱棉花糖混合水果夹心软糖婚庆喜糖散称批发236g', 'img/index/floor_6_(2).jpg', 196.90, 'product-sale.html?lid=57',0, 0, 13),
(NULL, '不二家果味棒棒糖', '不二家果味棒棒糖60支375g/桶糖果礼包零食大礼包', 'img/index/floor_6_(3).jpg', 27.90, 'product-sale.html?lid=50', 0, 0, 14),
(NULL, 'kisses好时巧克力礼盒', 'kisses好时巧克力礼盒99粒装情人节万圣节生日礼物', 'img/index/floor_6_(4).jpg', 88.00, 'product-sale.html?lid=56',0, 0, 15),
(NULL, '马卡龙甜点礼盒装', '马卡龙甜点礼盒装12枚法式蛋糕 早餐面包糕点', 'img/index/floor_6_(5).jpg', 29.90, 'product-sale.html?lid=19', 0, 0, 16),
(NULL, '', '', 'img/index/floor_6_(6).jpg', '', 'product.html', 0, 0, 17),
(NULL, '费列罗榛果威化巧克力', '费列罗榛果威化巧克力48粒婚庆礼盒装', 'img/index/floor_6_(7).jpg', 129.90, 'product-sale.html?lid=53',0, 0, 18),
(NULL, '好时KISSES巧克力', '好时KISSES巧克力500g*2好时之吻休闲零食', 'img/index/floor_6_(8).jpg', 119.90, 'product-sale.html?lid=52',0, 0, 19),
(NULL, '曲奇饼干礼盒', '曲奇饼干礼盒伴手礼铁盒装 悠享家', 'img/index/floor_6_(9).jpg', 129.00, 'product-sale.html?lid=39', 0, 0, 20),
(NULL, '德芙喜糖果', '德芙巧克力丝滑4.5g喜糖果4斤结婚散装礼盒', 'img/index/floor_6_(10).jpg', 196.90, 'product-sale.html?lid=55', 0, 0, 21),
(NULL, '', '', 'img/index/floor_6_(11).jpg', '', 'product.html', 0, 0, 22),

(NULL, '碧根果', '三只松鼠_碧根果210gx2袋', 'img/ad/ms1.jpg', '9.90', 'product-sale.html?lid=1', 0, 0, 0),
(NULL, '牛轧糖', '百草味-花生牛轧糖180g', 'img/ad/ms2.jpg', '9.90', 'product-sale.html?lid=51', 0, 0, 0),
(NULL, '葡萄干', '新疆特产 特级超大黑葡萄干免洗', 'img/ad/ms3.jpg', '9.90', 'product-sale.html?lid=26', 0, 0, 0),
(NULL, '饼干', '建元堂红豆燕麦全麦饼干魔芋饼干', 'img/ad/ms4.jpg', '9.90', 'product-sale.html?lid=3', 0, 0, 0),
(NULL, '牛肉干', '麻辣五香牛肉干四川特产牛肉类零食', 'img/ad/ms5.jpg', '9.90', 'product-sale.html?lid=24', 0, 0, 0),
(NULL, '松露', '纯可可脂黑松露形散装零食', 'img/ad/ms6.jpg', '9.90', 'product-sale.html?lid=54', 0, 0, 0);

CREATE TABLE xz_role(
  id INT PRIMARY KEY AUTO_INCREMENT,
  rname  VARCHAR(128),
  pid    INT COMMENT '父id',
  level  INT COMMENT '级别',
  sn     VARCHAR(128) COMMENT '级别标识符'
);
INSERT INTO xz_role VALUES(NULL, '系统管理员', 0, 1, '1');
INSERT INTO xz_role VALUES(NULL, '用户管理员', 1, 2, '1_2');
INSERT INTO xz_role VALUES(NULL, '订单管理员', 1, 2, '1_3');
INSERT INTO xz_role VALUES(NULL, '权限管理员', 1, 2, '1_4');

CREATE TABLE xz_users_roles(
  id INT PRIMARY KEY AUTO_INCREMENT,
  rid    INT COMMENT '角色id',
  uid    INT COMMENT '用户id'
);
INSERT INTO xz_users_roles VALUES(NULL, 2,1);
INSERT INTO xz_users_roles VALUES(NULL, 3,1);

CREATE TABLE xz_module(
  id INT PRIMARY KEY AUTO_INCREMENT,
  mname    INT COMMENT '模块名称',
  url      INT COMMENT '模块访问地址'
);
INSERT INTO xz_module VALUES(NULL, '产品管理','product_list.html');
INSERT INTO xz_module VALUES(NULL, '订单管理','order_list.html');

CREATE TABLE xz_acl(
  id INT PRIMARY KEY AUTO_INCREMENT,
  mid      INT COMMENT '模块名称',
  rid      INT COMMENT '模块访问地址',
  c        ENUM('1','0'),
  r        ENUM('1','0'), 
  u        ENUM('1','0'),
  d        ENUM('1','0')
);
INSERT INTO xz_acl VALUES(NULL,1,1,'1','0','0','0');

CREATE TABLE xz_creditcard(
  id  INT PRIMARY KEY AUTO_INCREMENT,
  cid  VARCHAR(128)
);

CREATE TABLE xz_user_history(
  id  INT PRIMARY KEY AUTO_INCREMENT,
  del_uid    VARCHAR(128),
  del_uname  VARCHAR(32),
  del_time DATETIME,
  uid  INT,
  uname VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(64),
  phone VARCHAR(16),
  avatar VARCHAR(128),        #头像图片路径
  user_name VARCHAR(32),      #用户名，如王小明
  gender INT                  #性别  0-女  1-男
);
CREATE TABLE xz_relationship(
  id  INT PRIMARY KEY AUTO_INCREMENT,
  pk_table_name  VARCHAR(128),
  pk_column_name  VARCHAR(128),
  fk_table_name  VARCHAR(128),
  fk_column_name  VARCHAR(128)
);

CREATE TABLE xz_redundancy(
  id  INT PRIMARY KEY AUTO_INCREMENT,
  pk_table_name  VARCHAR(128),
  pk_column_name  VARCHAR(128),
  fk_table_name  VARCHAR(128),
  fk_column_name  VARCHAR(128)  
);

alter table xz_laptop add expire enum('1','0') default '0';
alter table xz_user add expire enum('1','0') default '0';
alter table xz_order add expire enum('1','0') default '0';
alter table xz_index_product add expire enum('1','0') default '0';



INSERT INTO xz_order VALUES(NULL,1,1,1,UNIX_TIMESTAMP(),UNIX_TIMESTAMP(),UNIX_TIMESTAMP(),UNIX_TIMESTAMP(),'0');
INSERT INTO xz_order VALUES(NULL,1,2,1,UNIX_TIMESTAMP(),UNIX_TIMESTAMP(),UNIX_TIMESTAMP(),UNIX_TIMESTAMP(),'0');

INSERT INTO xz_order_detail VALUES(NULL,10000001,1,2);
INSERT INTO xz_order_detail VALUES(NULL,10000001,2,1);
INSERT INTO xz_order_detail VALUES(NULL,10000002,3,1);
INSERT INTO xz_receiver_address VALUES(NULL,1,'dongdong',
'sx','datong','zuoyun','xi da jie','1399999','10000','030020','',true);




--SELECT o.aid,u.uname,a.receiver,o.status,o.order_time,
--p.name 
--FROM  xz_laptop p,xz_order o,xz_order_detail d,
--xz_receiver_address a,xz_user u
--WHERE 
--d.product_id =  p.lid AND 
--o.address_id = a.aid AND 
--u.uid = o.user_id AND 
--o.aid = d.order_id;









#| xz_index_carousel   |首页图片轮播
#| xz_index_product    |首页产品表
#| xz_laptop           |产品表
#| xz_laptop_family    |产品类别表
#| xz_laptop_pic       |产品图表
#| xz_order            |订单表
#| xz_order_detail     |订单详细表
#| xz_receiver_address |收货地址表
#| xz_shopping_cart    |购物车表
#| xz_user             |用户表
#| xz_role             |角色表
#| xz_users_roles      |用户和角色关系表
#| xz_module           |模块表表
#| xz_acl              |权限表
#| xz_creditcard       |诱饵表
#| xz_user_history     |用户历史表 n*
#| xz_relationship     |关联关系表 user:id  order:uid
#                                user:id  cart:uid
#                                user:id  laptop:uid
#| xz_redundancy       |商城列冗余表
#                                user:uname     cart:uname
#                                user:uname     laptop:uname


