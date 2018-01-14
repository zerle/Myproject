<?php
header("Content-Type:application");
require_once("../init.php");
@$lid=$_REQUEST["lid"];
if($lid){
	$sql="select lname from xz_laptop where lid=$lid";
	$result=sql_execute($sql);
	echo json_encode($result);
}