(()=>{
	var lid=location.search.split("=")[1];
	if(lid!=undefined)
	ajax(
		"get",
		"data/product-sale/product-sale.php?lid="+lid,
		""
	).then(data=>{
		//console.log(data);
		var laptop=data.laptop;
		/*加载左上角图片:*/
		var mImg=document.getElementById("mImg"),
				largeDiv=
        document.getElementById("largeDiv"),
				icon_list=
        document.getElementById("icon_list");
		mImg.src=laptop.pics[0].md;
		largeDiv.style.backgroundImage=
    `url(${laptop.pics[0].lg})`;
		var html="";
		for(var pic of laptop.pics){
			html+=`<li><img src="${pic.sm}" 
		  data-md="${pic.md}" 
			data-lg="${pic.lg}" alt="" class="Img-move"></li>`;
		}
		icon_list.innerHTML=html;

		//加载右上角商品基本信息
		var title=document.querySelector
			(".product-sale-details>p"),
				price=document.querySelector
			(".product-sale-details .product-sale-price>p>span"),
				promise=document.querySelector
			(".product-sale-price>.promise"),
				spec=document.querySelector
			(".product-spec");
		title.innerHTML=laptop.title;
		price.innerHTML="¥"+laptop.price;
		promise.innerHTML+=laptop.promise;
    spec=document.querySelector(".product-spec");
    //商品规格
    var html=`<li><a class="active" href="product-sale.html?lib=${laptop.lid}" >${laptop.spec}</a></li>`;
    spec.innerHTML=html;

    //移动小图片
    var aForward=document.querySelector(".product-sale-sm>.forward");
    var aBackward=document.querySelector(".product-sale-sm>.backward");
    var moved=0,LIWIDTH=62;//54+8
    aForward.onclick=function(){
      if(this.className.indexOf("disabled")==-1){
        moved++;move();
      }
    };
    aBackward.onclick=function(){
      if(this.className.indexOf("disabled")==-1){
        moved--;move();
      }
    };
    function move(){
      icon_list.style.left=-moved*LIWIDTH+17+"px";
      checkA();
    }
    function checkA(){
      if(laptop.pics.length-moved==5){
        aForward.className="forward disabled";
      }else if(moved==0){
        aBackward.className="backward disabled";
      }else{
        aForward.className="forward";
        aBackward.className="backward";
      }
    }
    //如果当前商品的图片张数<=5
    if(laptop.pics.length<=5)
    //设置aForward的class为"forward disabled"
    aForward.className="forward disabled";

    /*****鼠标进入小图片切换中图片和大图片*****/
    icon_list.onmouseover=function(e){
      var tar=e.target;
      if(tar.nodeName=="IMG"){
        mImg.src=tar.dataset.md;
        largeDiv.style.backgroundImage=`url(${tar.dataset.lg})`;
      }
    }
    
    /*****鼠标进入中图片启动放大镜*****/
    var superMask=document.getElementById("superMask");
    var mask=document.getElementById("mask");
    superMask.onmouseover=function(){
      mask.style.display="block";
      largeDiv.style.display="block";
    }
    superMask.onmouseout=function(){
      mask.style.display="none";
      largeDiv.style.display="none";
    }

    //放大镜效果
    var MSIZE=175;
    var SMSIZE=350;
    superMask.onmousemove=function(e){
      //获得相对于当前元素的x,y
      var x=e.offsetX,y=e.offsetY;
      var top=y-MSIZE/2;
      var left=x-MSIZE/2;

      if(top<0) top=0;
      else if(top>SMSIZE-MSIZE) top=SMSIZE-MSIZE;
      if(left<0) left=0;
      else if(left>SMSIZE-MSIZE) left=SMSIZE-MSIZE;
      //设置mask的top为top,left为left
      mask.style.top=top+"px";
      mask.style.left=left+"px";
      largeDiv.style.backgroundPosition=
        -left*16/7+"px "+-top*16/7+"px";
    }
		
		
    //动态获取产品详情介绍
    var param=document.getElementById("param-details");
    var details=` <li>
                    <a>商品名称：${laptop.lname}</a>
                  </li>
                  <li>
                    <a>分类：${laptop.classfiy}</a>
                  </li>
                  <li>
                    <a>净含量：${laptop.weight}</a>
                  </li>
                  <li>
                    <a>商品编号：12570031973</a>
                  </li>
                  <li>
                    <a>存储条件：低温冷藏</a>
                  </li> `;
    param.innerHTML=details;
    var pdIntro=document.getElementById("product-intro");
    pdIntro.innerHTML=laptop.details;

		//产品数量增减
		$("#count").on("click","button",function(e){
			var $tar=$(e.target);
			if($tar.hasClass("add")||$tar.hasClass("reduce")){
				var $input=$tar.siblings(".Text");
				var $n=parseInt($input.val());
				if($tar.hasClass("add")) $n++;
				else if($n>1) $n--;
				$input.val($n);
			}
		});
    //单击事件，给购物车添加信息
		$(".cart-url").on("click","li",function(){
			var $this=$(this);
			if($this.find("a.addCart")){
				ajax("get","data/routes/isLogin.php","").then(data=>{
					if(data.ok==0){
						modalLogin();
					}else{
            var $count=$this.parent().prev("#count").children(".Text").val();
            var $lid=$this.parent().siblings(".pd-lib").find("a.active").attr("href").split("=")[1];
            ajax("get","data/routes/cart/addToCart.php?lid="+$lid+"&count="+$count,"","text").then(()=>{
              $this.parent().prev("#count").children(".Text").val(1);
              alert("添加成功");
              loadCart();
            });
          }
				});
			}
		});
    //动态加载购物车信息
    function loadCart(){
      ajax("get","data/routes/cart/getCart.php").then(output=>{
        var html="",total=0,data=output.cart;
        for(var p of data){
          total+=p.price*p.count;
          html+=`
          <div class="item" data-cid="${p.cid}">
            <span>${p.title}</span>
            <div>
              <span class="reduce">-</span>
              <input type="text" value="${p.count}">
              <span class="add">+</span>
            </div>
            <p><span>¥${(p.price*p.count).toFixed(2)}</span></p>
          </div>`;
        }
        $("#cart>.cart_content").html(html);
        $("#total").html(total.toFixed(2));
      });  
    }
    //单击购物车事件更新产品信息
    $("#cart>.cart_content").on("click","span",function(e){
      var $tar=$(e.target);
			
      var $n=parseInt($tar.parent().children("input").val());
      if($tar.hasClass("add")) $n++;
      else $n--;
      var $cid=$tar.parent().parent().data().cid;
      ajax("get","data/routes/cart/updateCart.php?cid="+$cid+"&count="+$n,"","text").then(loadCart);
    });

    //单击事件清空购物车
    $("#cart>.title>a").on("click",e=>{
      e.preventDefault();
      ajax("get","data/routes/cart/clearCart.php","","text").then(()=>{
        $("#cart>.cart_content").html("");
        $("#total").html("0.00");
      })
	  });

		//悬浮购物车 “结算” 绑定单击事件
		$(".cart-result").on("click","a",e=>{
      $tar=$(e.target);
		  ajax("get","data/routes/isLogin.php","").then(data=>{
					if(data.ok==0){
						modalLogin();
					}else{ 
						if(confirm("您要去结算吗？")){
							location="product-cart.html";
						}
          }
				});
		});
    //取消按钮被选中变蓝
      //document.onselectstart=function(){return false;}
    //登录模态框函数封装!!!
    function modalLogin(){
      var url=location.href;
      //将back参数值中的: /等保留字转为单字节
      $modal=$(".modal");
      $close=$(".modal-close");
      $btn=$(".modal-btn");
      $modal.fadeIn("fast");
      $btn.click(()=>{
        url=encodeURIComponent(url);
        location="login.html?back="+url;
      });
      $close.click(()=>{
        $modal.fadeOut("fast");
      });
      $("htm,body").keyup(e=>{
        if(e.keyCode==27){//esc 按键码值27;
          $modal.fadeOut("fast");
        }
      })
    }
  })
})();

	//推荐轮播广告
(()=>{
	ajax("get","data/index/floor.php","").then(data=>{
		var M1=data.M1;
		var mHtml="";
		for(var  m of M1){
			mHtml+=`<div class="details_1">
              <div class="detail_img1">
                <a href="${m.href}"><img src="${m.pic}"></a>
              </div>
              <p>${m.details}</p>
            </div>`;
		}
		$("#demo1").html(mHtml+mHtml);
		
		//加载轮播
		var timer=null,$i=0; const LIWIDTH=200;
		$("#demo1").css("width",LIWIDTH*M1.length+LIWIDTH*M1.length);
    function move(){
      $i+=2;
      if($i==1200){
        $i=0;
      }else {
        $("#demo1").css("left", -$i);
      }
    }
		timer=setInterval(move,30);
    $("#demo1").hover(
        e=>clearInterval(timer),
        e=>timer=setInterval(move,30)
    );

	});
})();
//商品详细介绍部分 设置固定栏
window.onload=function(){
  $("#headerAll").removeClass("fixed_nav");
  window.removeEventListener("scroll",Scroll);
 };
//var $Rtop = $("#details>.tab").offset().top;
const UHEIGHT=923;
//var $Ctop = $("#addCart").offset().top;
const CHEIGHT=950;
//var $Ptop1=$("#param p:first-child").offset().top;
const PHEIGHT=1000;
//var $Ptop2=$("#sale-protection>p").offset().top;
const PHEIGHT2=1900;
$(window).scroll(function(){
  var $RscrollTop = $(document).scrollTop();
  if($RscrollTop>=UHEIGHT){
    $("#details>ul.tab").addClass("fixed_tab");
  }else{
    $("#details>ul.tab").removeClass("fixed_tab");
  }
  if($RscrollTop>=CHEIGHT){
    $("#addCart").addClass("fixed_add");
  }else{
    $("#addCart").removeClass("fixed_add");
  }

	//商品详情-坐电梯
	if($RscrollTop>=PHEIGHT){
		$("#addCart>li:nth-child(2)").addClass("Lactive").siblings().removeClass("Lactive");
	}else{
		$("#addCart>li:nth-child(2)").removeClass("Lactive");
		$("#addCart>li:first-child").addClass("Lactive")
	}
	if($RscrollTop>=PHEIGHT2){
		$("#addCart>li:nth-child(3)").addClass("Lactive").siblings().removeClass("Lactive");
	}
});
//商品详情单击事件
$("#addCart").on("click","li",function(){
	$tar=$(this);
	if($tar.is($("#addCart>li:first-child"))){
		$("html,body").stop(true).animate({scrollTop:910},500);
	}
	if($tar.is($("#addCart>li:nth-child(2)"))){
		$("html,body").stop(true).animate({scrollTop:1000},500);
	}
	if($tar.is($("#addCart>li:nth-child(3)"))){
		$("html,body").stop(true).animate({scrollTop:2800},500);
	}
	if($tar.is($("#addCart>li:last-child"))){
		$("html,body").stop(true).animate({scrollTop:0},500);
	}
});
$("#addCart>li:last-child").hover(
	()=>$("#addCart>li:last-child").addClass("Lactive"),
	()=>$("#addCart>li:last-child").removeClass("Lactive")
);


























