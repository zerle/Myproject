(()=>{
	ajax("get","header.html","","html").then(html=>{
		document.getElementById("header").innerHTML=html;
		//搜索框跳转商品详情页;
		var headerTop=document.getElementById("header-top");
		var search=headerTop.querySelector(".search");
		search.onclick=function(){
			var kw=document.getElementById("txtSearch").value;
			if(kw.trim().length!=0){
				var url="product.html?kw="+kw;
				location=url;
			}
      
		}
		/*如果url中有kw参数，就读取kw参数到txtSearch文本框中*/
    if(location.search){
			var kword=decodeURI(location.search.split("=")[1]);
			if(isNaN(parseInt(kword))){
				document.getElementById("txtSearch").value=kword;
			}else{//否则是数字就读取对应的产品名称
				ajax("get","data/header/header.php?lid="+kword,"").then(data=>{
					document.getElementById("txtSearch").value=data[0].lname;
				});
			}
    }
		//设置登录状态
		ajax("post","data/routes/isLogin.php","").then((data)=>{
			if(data.ok){
				$("#listLogin").css("display","none");
				$("#listWelcome").css("display","block");
				$("#listWelcome>li>#uname").html(data.uname);
			}
		});
		$("#listWelcome>li>a").on("click",()=>{
			ajax("post","data/routes/logout.php","","text").then(()=>{
				$("#listLogin").css("display","block");
				$("#listWelcome").css("display","none");	
			});	
		});

		//搜索帮助
    var $txtSearch=$("#txtSearch"),$shelper=$("#shelper");
    $txtSearch.keyup(e=>{
      if(e.keyCode!=13){//当前的按键不是回车键，13为回车键的编码，keyCode为键盘按键
        if(e.keyCode==40){//箭头↓按键
					if($shelper.css("display")=="block"){
						if(!$shelper.is(":has(.focus)")){
							$shelper.children().first().addClass("focus");
						}else{
							if($shelper.children().last().is(".focus")){
								$shelper.children(".focus").removeClass("focus");
								$shelper.children().first().addClass("focus");
							}else{
								$shelper.children(".focus").removeClass("focus").next().addClass("focus");
							}
						}
						$txtSearch.val($shelper.children(".focus").attr("title"));
					}
        }else if(e.keyCode==38){
					if($shelper.css("display")=="block"){
						if(!$shelper.is(":has(.focus)")){
							$shelper.children().last().addClass("focus");
						}else{
							if($shelper.children().first().is(".focus")){
								$shelper.children(".focus").removeClass("focus");
								$shelper.children().last().addClass("focus");
							}else{
								$shelper.children(".focus").removeClass("focus").prev().addClass("focus");
							}
						}
						$txtSearch.val($shelper.children(".focus").attr("title"));
					}
        }else{
          var $tar=$(e.target);
          $.get("data/header/searchHelper.php","term="+$tar.val()).then(data=>{
            var html="";
            for(var p of data){
              html+=`<li title="${p.lname}">
                   <div class="search-item" title="${p.title}" data-url="product-sale.html?lid=${p.lid}">${p.lname}</div>
                  </li>
              `;
            }
            $shelper.show().html(html);

          });
        }
      }else{
        $("[data-trigger=search]").click();
      }
    });
		$shelper.on("mouseenter","li",function(){
		  $tar=$(this);
		  $tar.addClass("hover").siblings().removeClass("hover");
		  $tar.siblings("focus").removeClass("focus");
    })
    $("#header-top").mouseleave(()=>{
		  $shelper.hide();

		});
    $shelper.off("click").on("click","li",function(){
      $tar=$(this);
      $txtSearch.val($tar.attr("title"));
      var $url=$tar.children().data("url");
      location=$url;
    }).mousemove(e=>{
      $tar=$(e.target);
      $tar.siblings().removeClass("focus");
    });
	});
})();

//为当前窗口添加滚动事件监听
window.addEventListener("scroll",Scroll
);
function Scroll(){
  var scrollTop=document.body.scrollTop||document.documentElement.scrollTop;
  if(scrollTop>=300){
    $("#headerAll").addClass("fixed_nav");
  }else{
    $("#headerAll").removeClass("fixed_nav");
  }
}