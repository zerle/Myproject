<?php
header("Content-Type:application/json;charset=uft8");
require_once("../init.php");
@$kw=$_REQUEST["term"];
$sql="select lid,lname,title,sold_count from xz_laptop";
if($kw){
  $kws=explode(" ",$kw);
  for($i=0;$i<count($kws);$i++){
    $kws[$i]=" lname like '%".$kws[$i]."%' ";
  }
  $sql.=" where ".implode(" and ",$kws);
}
$sql.=" order by sold_count DESC limit 10";
$result=sql_execute($sql);
echo json_encode($result);