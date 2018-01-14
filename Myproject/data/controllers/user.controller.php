<?php
require("../init.php");
//注册
function register(){
	@$uname=$_REQUEST["uname"];
	@$upwd=$_REQUEST["upwd"];
	@$email=$_REQUEST["email"];
	@$phone=$_REQUEST["phone"];
	if($uname&&$upwd){
		$sql="insert into xz_user (uid,uname,upwd,email,phone) values (null,'$uname','$upwd','$email','$phone')";
		sql_execute($sql);
	}
}
//register();
//验证
function checkName(){
	@$uname=$_REQUEST["uname"];
	if($uname){
		$sql="select * from xz_user where uname='$uname'";
		$users=sql_execute($sql);
		if(count($users)!=0) return false;//不能使用
		else return true;//可以使用
	}
}
//if(checkName()){
//	echo "true";
//}else{
//echo "false";
//}

//登录
function login(){
	@$uname=$_REQUEST["uname"];
	@$upwd=$_REQUEST["upwd"];
	if($uname&&$upwd){
		$sql="select * from xz_user where uname='$uname' and binary upwd='$upwd'";
		$user=sql_execute($sql);
		if(count($user)!=0){
			session_start();//打开session
			$_SESSION["uid"]=$user[0]["uid"];
			return true;//登录成功
		}else{
			return false;//登录失败
		}
	}
}
//注销
function logout(){
	session_start();
	$_SESSION["uid"]=null;
}
//登录状态
function isLogin(){
	session_start();
	@$uid=$_SESSION["uid"];
	if($uid){
		$sql="select uname from xz_user where uid='$uid'";
		$user=sql_execute($sql);
		return ["ok"=>1,"uname"=>$user[0]["uname"]];
	}else{
		return ["ok"=>0];
	}
}