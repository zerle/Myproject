<?php
require_once("../../init.php");
//增加商品，有就update，没有就insert；
function addToCart(){
	session_start();
	@$uid=$_SESSION["uid"];
	@$product_id=$_REQUEST["lid"];
	@$count=$_REQUEST["count"];
	if($uid){
		$sql="select * from xz_shopping_cart where user_id=$uid and product_id=$product_id";
		sql_execute($sql);
		if(count(sql_execute($sql))){
			$sql="update xz_shopping_cart set count=count+$count where user_id=$uid and product_id=$product_id";
		}else{
			$sql="insert into xz_shopping_cart (user_id,product_id,count,is_checked) values ($uid,$product_id,$count,0)";
		}
		sql_execute($sql);
	}
}
//更新，删除产品
function updateCart(){
	@$cid=$_REQUEST["cid"];
	@$count=$_REQUEST["count"];
	if($count==0){
		$sql="delete from xz_shopping_cart where cid=$cid";
	}else{
		$sql="update xz_shopping_cart set count=$count where cid=$cid";
	}
	sql_execute($sql);
}
//查询购物车和产品信息，加载页面购物车内容
function getCart(){
	session_start();
	@$uid=$_SESSION["uid"];
	if($uid){
		$sql="select cid,title,price,count,is_checked,user_id from xz_shopping_cart inner join xz_laptop on product_id=lid where user_id=$uid";
		$output["cart"]=sql_execute($sql);
		$sql="select cid,product_id,(select sm from xz_laptop_pic where laptop_id=product_id limit 1) as sm from xz_shopping_cart where user_id=$uid";
		$output["pic"]=sql_execute($sql);
		echo json_encode($output);
	}else{
		echo json_encode([]);
	}
}

//清空购物车
function clearCart(){
	session_start();
	@$uid=$_SESSION["uid"];
	if($uid){
		$sql="delete from xz_shopping_cart where user_id=$uid";
		sql_execute($sql);
	}
}
//全部选中
function selectAll(){
	@$chkAll=$_REQUEST["chkAll"];
	session_start();
	@$uid=$_SESSION["uid"];
	$sql="update xz_shopping_cart set is_checked=$chkAll where user_id=$uid";
	sql_execute($sql);
}
//单选中
function selectOne(){
	@$chkOne=$_REQUEST["chkOne"];
	@$cid=$_REQUEST["cid"];
	$sql="update xz_shopping_cart set is_checked=$chkOne where cid=$cid";
	sql_execute($sql);
}