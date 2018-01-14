<?php
header("Content-Type:application/json");
require_once("../init.php");
$output=[];
@$lid=$_REQUEST["lid"];
if($lid){
	$sql="select * from xz_laptop where lid=$lid";
	$output["laptop"]=sql_execute($sql)[0];
	$sql="select * from xz_laptop_pic where laptop_id=$lid";
	$output["laptop"]["pics"]=sql_execute($sql);
	echo json_encode($output);
}else{
	echo "[]";
}