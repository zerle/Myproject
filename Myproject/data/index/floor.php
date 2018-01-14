<?php
header("Content-Type:application/json");
require_once("../init.php");
$output=[
	"f1"=>[],
	"f2"=>[],
	"f3"=>[],
	"f4"=>[],
	"f5"=>[],
	"f6"=>[],
	"L0"=>[],
	"L1"=>[],
	"L2"=>[],
	"L3"=>[],
	"L4"=>[],
	"L5"=>[],
	"L6"=>[],
	"M1"=>[]
];
//f1
$sql="SELECT * FROM xz_index_product where seq_recommended>0 order by seq_recommended limit 11";
$output["f1"]=sql_execute($sql);
//f2
$sql="SELECT * FROM xz_index_product where seq_new_arrival>0 order by seq_new_arrival limit 11";
$output["f2"]=sql_execute($sql);
//f3
$sql="SELECT * FROM xz_index_product where seq_top_sale>0 order by seq_top_sale limit 11";
$output["f3"]=sql_execute($sql);
//f4
$sql="SELECT * FROM xz_index_product where seq_recommended>11 order by seq_recommended limit 11";
$output["f4"]=sql_execute($sql);
//f5
$sql="SELECT * FROM xz_index_product where seq_new_arrival>11 order by seq_new_arrival limit 11";
$output["f5"]=sql_execute($sql);
//f6
$sql="SELECT * FROM xz_index_product where seq_top_sale>11 order by seq_top_sale limit 11";
$output["f6"]=sql_execute($sql);
//动态加载轮播广告左侧列表的产品信息
$sql="select lid,lname from xz_laptop where family_id=1";
$output["L1"]=sql_execute($sql);
$sql="select lid,lname from xz_laptop where family_id=2";
$output["L2"]=sql_execute($sql);
$sql="select lid,lname from xz_laptop where family_id=3";
$output["L3"]=sql_execute($sql);
$sql="select lid,lname from xz_laptop where family_id=4";
$output["L4"]=sql_execute($sql);
$sql="select lid,lname from xz_laptop where family_id=5";
$output["L5"]=sql_execute($sql);
$sql="select lid,lname from xz_laptop where family_id=6";
$output["L6"]=sql_execute($sql);
$sql="select name from xz_laptop_family";
$output["L0"]=sql_execute($sql);
$sql="SELECT * FROM xz_index_product where seq_recommended=0 and seq_top_sale=0 and seq_new_arrival=0";
$output["M1"]=sql_execute($sql);
echo json_encode($output);