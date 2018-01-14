<?php
header("Content-Type:application/json");
require_once("../init.php");
$output=[
	"count"=>0,//总产品数
	"pageSize"=>15,//当前页面产品数量
	"pageCount"=>0,//页码数
	"pageNo"=>0,//当前页面
	"data"=>[] //需查询的产品数据
];
@$kw=$_REQUEST["kw"];//搜索关键字
@$pno=$_REQUEST["pno"];//当前页码
if(!$pno){$pno=0;}
$sql="SELECT lid,title,price,(select md from xz_laptop_pic where laptop_id=lid limit 1) as md FROM xz_laptop";
if($kw){
	$kws=explode(" ",$kw);//js:split 以空格切开
	for($i=0;$i<count($kws);$i++){
		$kws[$i]=" title like '%".$kws[$i]."%'";
	}
	$where=" where ".implode(" and ",$kws);//js:join以and连接
	$sql=$sql.$where;
}
$output["count"]=count(sql_execute($sql));
//echo json_encode($output);
$sql=$sql." limit ".($pno*$output["pageSize"]).",".$output["pageSize"];//limit 0,15
$result=sql_execute($sql);
$output["pageCount"]=ceil($output["count"]/$output["pageSize"]);
$output["pageNo"]=$pno;
$output["data"]=$result;
echo json_encode($output);





















