(()=>{
  $("#txtName").focus();
  //用户名验证
	$("#txtName").blur("on",function(){
		var $txt=$("#txtName").val();
		ajax("post","data/routes/checkName.php","uname="+$.trim($txt),"text").then(text=>{
      if(!$.trim($txt)==""){
        if(text=="false"){
          $(".user>.err").css("display","block");
          $(".user>span").html("用户名已存在");
        }else{
          var reg=/^[a-zA-Z0-9]{4,16}$/;
          if(reg.test($txt)){
            $(".user>.ok").css("display","block");
          }else{
            $(".user>.err").css("display","block");
            $(".user>span").html("用户名必须是6-20位的数字或字母组成");
          }
        } 
      }else{
        $(".user>.err").css("display","block");
        $(".user>span").html("用户名不能为空");
      }
		});
	});
	//失去焦点封装函数
	function vali(value,reg,err,ok,span,text,none){
    if(value!=""){
      if(reg.test(value)){
        ok.css("display","block");
				return true;
      }else{
        err.css("display","block")
        span.html(text);
				return false;
      }
    }else{
      err.css("display","block")
      span.html(none);
			return false;
    }
	}
	 //邮箱确认
  $("#txtEmail").blur("on",function(){
    var $email=$("#txtEmail").val();
    var reg=/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+$/;
    vali($email,reg,$(".email>.err"),$(".email>.ok"),$(".email>span"),"邮箱格式错误","邮箱不能为空");
  });
	//手机号确认
  $("#txtPhone").blur("on",function(){
    var $phone=$("#txtPhone").val();
    var reg=/^((\+86|0086)\s+)?1[34578]\d{9}$/;
		vali($phone,reg,$(".phone>.err"),$(".phone>.ok"),$(".phone>span"),"格式错误","手机号不能为空");
  });
 //密码验证
  var $pwd;
  $("#txtPwd").blur("on",function(){
    $pwd=$("#txtPwd").val();
    var reg=/^[A-Z]+[a-z]+\d{6,20}$/;
		vali($pwd,reg,$(".upwd>.err"),$(".upwd>.ok"),$(".upwd>span"),"密码必须由大小写字母和6-20位的数字组成","密码不能为空");
  });
	//密码确认
	$("#txtPwdVail").blur("on",function(){
		var $pwdVail=$("#txtPwdVail").val();
		var reg=/^[A-Z]+[a-z]+\d{6,20}$/;
		if($pwdVail!=""){
			if($pwdVail==$pwd){
				$(".upwd-vail>.ok").css("display","block");
			}else{
				$(".upwd-vail>.err").css("display","block")
				$(".upwd-vail>span").html("两次输入密码不一致");
			}
		}else{
			$(".upwd-vail>.err").css("display","block")
			$(".upwd-vail>span").html("密码不能为空");
		}
  });

	//获取焦点时
	function txtFocus(err,ok,span){
		err.css("display","none");
    ok.css("display","none");
    span.html("");
	}
	//用户名获取焦点
  $("#txtName").focus("on",function(){
		txtFocus($(".user>.err"),$(".user>.ok"),$(".user>span"));
  });
	//密码获取焦点
	$("#txtPwd").focus("on",function(){
		txtFocus($(".upwd>.err"),$(".upwd>.ok"),$(".upwd>span"));
  });
	 //确认密码框获取焦点
	$("#txtPwdVail").focus("on",function(){
		txtFocus($(".upwd-vail>.err"),$(".upwd-vail>.ok"),$(".upwd-vail>span"));
  });
	//邮箱获取焦点
	 $("#txtEmail").focus("on",function(){
		txtFocus($(".email>.err"),$(".email>.ok"),$(".email>span"));
  });
	//手机号获取焦点
	$("#txtPhone").focus("on",function(){
		txtFocus($(".phone>.err"),$(".phone>.ok"),$(".phone>span"));
  });

  
	//表单提交
	$("#btnReg").click("on",function(){
		if($("#form span").text()==""&&$("#txtName").val()!=""&&$("#txtPwd").val()!=""&&$("#txtPwdVail").val()!=""&&$("#txtEmail").val()!=""&&$("#txtPhone").val()!=""){
			$.post("data/routes/register.php",$("#form").serialize())
				.then(()=>{
				alert("注册成功，请登录！")
				location="login.html";
			});
		}else{
			if($("#txtName").val()==""){
				$(".user>span").html("用户名不能为空");
			}
			if($("#txtPwd").val()==""){
				$(".upwd>.err").css("display","block")
				$(".upwd>span").html("密码不能为空");
			}
			if($("#txtPwdVail").val()==""){
				$(".upwd-vail>.err").css("display","block");
				$(".upwd-vail>span").html("密码不能为空");
			}
			if($("#txtEmail").val()==""){
				$(".email>.err").css("display","block");
				$(".email>span").html("邮箱不能为空");
			}
			if($("#txtPhone").val()==""){
				$(".phone>.err").css("display","block");
				$(".phone>span").html("格式不正确");
			}
		}
	})
})();
