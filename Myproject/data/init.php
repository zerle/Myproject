<?php
$db_host='qdm1096667.my3w.com';
$db_user='qdm1096667';
$db_password='Zl312918';
$db_database='qdm1096667_db';
$db_port='3306';
$db_charset='UTF8';
$conn = mysqli_connect(
  $db_host, $db_user, $db_password, $db_database, $db_port);
  mysqli_query($conn, "SET NAMES $db_charset");
function sql_execute($sql){
	global $conn;
	$posts=array();
	$result=mysqli_query($conn,$sql);
	if(stripos($sql,"select")===0){
		if(!$result){
			return "查询执行失败！请检查SQL语法：$sql";
		}else{
			while($row=mysqli_fetch_array($result,MYSQLI_ASSOC)){
				$posts[]=$row;
			}
			return $posts;
		}
	}else{
		return $result;
	}
}