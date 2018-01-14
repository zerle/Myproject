<?php
header("Content-Type:application/json;charset=utf8");
require_once("../init.php");
$sql="SELECT * FROM xz_index_carousel";
echo json_encode(sql_execute($sql));