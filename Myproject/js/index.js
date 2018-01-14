//获取楼层距离页面顶部距离
function getTotalTop(elem){
	var sum=0;
	do{
		sum+=elem.offsetTop;
		elem=elem.offsetParent;
	}while(elem);
	return sum;
}
$(()=>{
	$.ajax({
    type:"get",
    url:"data/index/banner.php"
  }).then((data)=>{
		//动态获取轮播广告
		const LIWIDTH=830;
		var htmlImgs="";
		data.push(data[0]);
		for(var p of data){
			htmlImgs+=`<li>
										<a href="${p.href}" title="${p.title}">
											<img src="${p.img}" alt="" class="ad">
										</a>
								</li>`;
		}
		var $bannerImg=$("#banner-img");
		$bannerImg.css("width",LIWIDTH*data.length);
		$bannerImg.html(htmlImgs);

		//获取轮播小圆点id
		var $Indicators=$("#indicators")
		$Indicators.html("<li></li>".repeat(data.length-1));
		$("#indicators>li:first").addClass("current");

		//加载广告轮播
		var i=0,wait=3000,INTERVAL=400,timer=null,canMove=true,moved=0;
		function autoMove(){
		  clearTimeout(timer);
		  timer=null;
		  if(canMove){
		    if(moved==data.length-1){
		      moved=0;
		      $bannerImg.css("left",0);
		      //最后一张图片时第一个小圆点亮
		      $Indicators.children(":eq(0)").addClass("current").siblings().removeClass("current");
        }
        timer=setTimeout(()=>{
		      moved++;
          $bannerImg.stop(true).animate({
            left:-LIWIDTH*moved,
          },INTERVAL,autoMove);
          $Indicators.children(":eq("+moved+")").addClass("current").siblings().removeClass("current");
        },wait);
      }
    }
    autoMove();
		//鼠标移入移出时间;
    var $bannerImage=$(".bannerImage");
    $bannerImage.hover(
      ()=>{
        canMove=false;
        clearTimeout(timer);
        timer=null;
      },
      ()=>{
        canMove=true;
        autoMove();
      }
    );
    //鼠标移入移出小圆点事件
    $Indicators.on("mouseenter","li",e=>{
      var $tar=$(e.target);
      var $n=$tar.index();
      moved=$n;
      $bannerImg.stop(true).animate({
        left:-LIWIDTH*moved
      },INTERVAL);
      $Indicators.children(":eq("+moved+")").addClass("current").siblings().removeClass("current");
    });
    //左按钮单击事件
    $bannerImage.on("click","a.ck-left",()=>{

      timer=null;
      clearTimeout(timer);
      timer=setTimeout(()=>{
      if(moved==0){
        moved=data.length-1;
        $bannerImg.css("left",-LIWIDTH*moved);
      }
      moved--;
      $bannerImg.stop(true).animate({
        left:-LIWIDTH*moved,
      },INTERVAL);
      $Indicators.children(":eq("+moved+")").addClass("current").siblings().removeClass("current");
      },30);
    })
    //右按钮单击事件
    .on("click","a.ck-right",()=>{
      timer=null;
      clearTimeout(timer);
      timer=setTimeout(()=>{
        if(moved==data.length-1){
          moved=0;
          $bannerImg.css("left",0);
          //最后一张图片时第一个小圆点亮
        }
        moved++;
        $bannerImg.stop(true).animate({
          left:-LIWIDTH*moved,
        },INTERVAL);
        if(moved<data.length-1) {
          $Indicators.children(":eq(" + moved + ")").addClass("current").siblings().removeClass("current");
        }else{
          $Indicators.children(":eq(0)").addClass("current").siblings().removeClass("current");
        }
      },30);
    });
	})
});

//动态加载楼层数据
(()=>{
  ajax("get","data/index/floor.php","").then((output)=>{
    //console.log(output);
    //根据规定的模板，动态生成f1的html代码片段
    var html="";
    var f1=output.f1;
    for(var i=0;i<f1.length;i++){
      var p=f1[i];
      i==0?html+=`<li class="fd-one"><a href="${p.href}"><img src="img/loading.gif" data-src="${p.pic}" alt=""></a></li>`:
         i<=4?html+=`<li class="fd-range">
              <a href="${p.href}" title="${p.details}">
                <img src="img/loading.gif" data-src="${p.pic}" alt="">
                <p>${p.title}</p>
                <p>¥${parseFloat(p.price).toFixed(2)}</p>
              </a>
            </li>`:
          i==5?html+=`<li class="fd-six"><a href="${p.href}"><img src="img/loading.gif" data-src="${p.pic}" alt=""></a></li>`:
          i<=9?html+=`<li class="fd-range2">
              <a href="${p.href}" title="${p.details}">
                <img src="img/loading.gif" data-src="${p.pic}" alt="">
                <p>${p.title}</p>
                <p>¥${parseFloat(p.price).toFixed(2)}</p>
              </a>
            </li>`:
                   html+=`<li class="fd-last"><a href="${p.href}"><img src="img/loading.gif" data-src="${p.pic}" alt=""></a></li>`;
    }
    document.getElementById("f1-content").innerHTML=html;
    //console.log(html);

    //根据规定的模板，动态生成f2的html代码片段
    html="";
    var f2=output.f2;
    for(var i=0;i<f1.length;i++){
      var p=f2[i];
      i==0?html+=`<li class="fd-two"><a href="${p.href}"><img src="img/loading.gif" data-src="${p.pic}" alt=""></a></li>`:
         i<=4?html+=`<li class="fd-range">
              <a href="${p.href}" title="${p.details}">
                <img src="img/loading.gif" data-src="${p.pic}" alt="">
                <p>${p.title}</p>
                <p>¥${parseFloat(p.price).toFixed(2)}</p>
              </a>
            </li>`:
          i==5?html+=`<li class="fd-six"><a href="${p.href}"><img src="img/loading.gif" data-src="${p.pic}" alt=""></a></li>`:
          i<=9?html+=`<li class="fd-range2">
              <a href="${p.href}" title="${p.details}">
                <img src="img/loading.gif" data-src="${p.pic}"" alt="">
                <p>${p.title}</p>
                <p>¥${parseFloat(p.price).toFixed(2)}</p>
              </a>
            </li>`:
                   html+=`<li class="fd-last"><a href="${p.href}"><img src="img/loading.gif" data-src="${p.pic}" alt=""></a></li>`;
    }
    document.getElementById("f2-content").innerHTML=html;


    //根据规定的模板，动态生成f3的html代码片段
    html="";
    var f3=output.f3;
    for(var i=0;i<f1.length;i++){
      var p=f3[i];
      i==0?html+=`<li class="fd-third"><a href="${p.href}"><img src="img/loading.gif" data-src="${p.pic}" alt=""></a></li>`:
         i<=4?html+=`<li class="fd-range">
              <a href="${p.href}" title="${p.details}">
                <img src="img/loading.gif" data-src="${p.pic}" alt="">
                <p>${p.title}</p>
                <p>¥${parseFloat(p.price).toFixed(2)}</p>
              </a>
            </li>`:
          i==5?html+=`<li class="fd-six"><a href="${p.href}"><img src="img/loading.gif" data-src="${p.pic}" alt=""></a></li>`:
          i<=9?html+=`<li class="fd-range2">
              <a href="${p.href}" title="${p.details}">
                <img src="img/loading.gif" data-src="${p.pic}" alt="">
                <p>${p.title}</p>
                <p>¥${parseFloat(p.price).toFixed(2)}</p>
              </a>
            </li>`:
                   html+=`<li class="fd-last"><a href="${p.href}"><img src="img/loading.gif" data-src="${p.pic}" alt=""></a></li>`;
    }
    document.getElementById("f3-content").innerHTML=html;

    //根据规定的模板，动态生成f4的html代码片段
    html="";
    var f4=output.f4;
    for(var i=0;i<f4.length;i++){
      var p=f4[i];
      i==0?html+=`<li class="fd-fourth"><a href="${p.href}"><img src="img/loading.gif" data-src="${p.pic}" alt=""></a></li>`:
         i<=4?html+=`<li class="fd-range">
              <a href="${p.href}" title="${p.details}">
                <img src="img/loading.gif" data-src="${p.pic}" alt="">
                <p>${p.title}</p>
                <p>¥${parseFloat(p.price).toFixed(2)}</p>
              </a>
            </li>`:
          i==5?html+=`<li class="fd-six"><a href="${p.href}"><img src="img/loading.gif" data-src="${p.pic}" alt=""></a></li>`:
          i<=9?html+=`<li class="fd-range2">
              <a href="${p.href}" title="${p.details}">
                <img src="img/loading.gif" data-src="${p.pic}" alt="">
                <p>${p.title}</p>
                <p>¥${parseFloat(p.price).toFixed(2)}</p>
              </a>
            </li>`:
                   html+=`<li class="fd-last"><a href="${p.href}"><img src="img/loading.gif" data-src="${p.pic}" alt=""></a></li>`;
    }
    document.getElementById("f4-content").innerHTML=html;

    //根据规定的模板，动态生成f5的html代码片段
    html="";
    var f5=output.f5;
    for(var i=0;i<f1.length;i++){
      var p=f5[i];
      i==0?html+=`<li class="fd-F5"><a href="${p.href}"><img src="img/loading.gif" data-src="${p.pic}" alt=""></a></li>`:
         i<=4?html+=`<li class="fd-range">
              <a href="${p.href}" title="${p.details}">
                <img src="img/loading.gif" data-src="${p.pic}" alt="">
                <p>${p.title}</p>
                <p>¥${parseFloat(p.price).toFixed(2)}</p>
              </a>
            </li>`:
          i==5?html+=`<li class="fd-six"><a href="${p.href}"><img src="img/loading.gif" data-src="${p.pic}" alt=""></a></li>`:
          i<=9?html+=`<li class="fd-range2">
              <a href="${p.href}" title="${p.details}">
                <img src="img/loading.gif" data-src="${p.pic}" alt="">
                <p>${p.title}</p>
                <p>¥${parseFloat(p.price).toFixed(2)}</p>
              </a>
            </li>`:
                   html+=`<li class="fd-last"><a href="${p.href}"><img src="img/loading.gif" data-src="${p.pic}" alt=""></a></li>`;
    }
    document.getElementById("f5-content").innerHTML=html;

    //根据规定的模板，动态生成f6的html代码片段
    html="";
    var f6=output.f6;
    for(var i=0;i<f1.length;i++){
      var p=f6[i];
      i==0?html+=`<li class="fd-F6"><a href="${p.href}"><img src="img/loading.gif" data-src="${p.pic}" alt=""></a></li>`:
         i<=4?html+=`<li class="fd-range">
              <a href="${p.href}" title="${p.details}">
                <img src="img/loading.gif" data-src="${p.pic}" alt="">
                <p>${p.title}</p>
                <p>¥${parseFloat(p.price).toFixed(2)}</p>
              </a>
            </li>`:
          i==5?html+=`<li class="fd-six"><a href="${p.href}"><img src="img/loading.gif" data-src="${p.pic}" alt=""></a></li>`:
          i<=9?html+=`<li class="fd-range2">
              <a href="${p.href}" title="${p.details}">
                <img src="img/loading.gif" data-src="${p.pic}" alt="">
                <p>${p.title}</p>
                <p>¥${parseFloat(p.price).toFixed(2)}</p>
              </a>
            </li>`:
                   html+=`<li class="fd-last"><a href="${p.href}"><img src="img/loading.gif" data-src="${p.pic}" alt=""></a></li>`;
    }
    document.getElementById("f6-content").innerHTML=html;

		//加载楼梯事件
		var f1TotalTop=getTotalTop(document.getElementById("f1"));
		var lift=document.getElementById("lift");
		window.addEventListener("scroll",()=>{
			var scrollTop=document.body.scrollTop||document.documentElement.scrollTop;
			//楼梯显示
			lift.style.display=
				f1TotalTop-scrollTop<=innerHeight/2?"block":"none";
			//坐电梯
			if(lift.style.display=="block"){
				var FHEIGHT=518;
				var fs=document.querySelectorAll(".food1")
				for(var i=0;i<fs.length-1;i++){
					var totalTop=getTotalTop(fs[i]);
					var start=totalTop-innerHeight/2;
					var end=start+FHEIGHT;
					if(scrollTop>=start&&scrollTop<end){break;}
				}
				var currLi= lift.querySelector(".lift_item_on");
				if(currLi){
					currLi.className="lift_item";
				}
				lift.querySelector(`li:nth-child(${i+1})`).className="lift_item_on";
			}
		});

		//在lift下找class为lift_list下的class为lift_item的所有a保存在as中
		var as=lift.querySelectorAll(".lift_list .lift_item");
		for(let i=0;i<as.length-1;i++){
			as[i].onclick=function(){
				var fi=document.getElementById("f"+(i+1));
				var totalTop=getTotalTop(fi);
				//window.scrollTo(0,totalTop-85);
				$("html,body").stop(true).animate({scrollTop:totalTop-85},500);
			}
		}
		as[as.length-1].onclick=function(){
			$("html,body").stop(true).animate({scrollTop:0},500);
		}

		//动态加载轮播左侧列表产品详情
		var L=output.L0,L1=output.L1,L2=output.L2,L3=output.L3,L4=output.L4,L5=output.L5,L6=output.L6;
		function change(key/*产品详情*/,elem/*产品种类名*/){
			html="";
			for(var i=0;i<key/*参数*/.length;i++){
				var p =key/*参数*/[i];
				html+=`<a href="product-sale.html?lid=${p.lid}">${p.lname}</a>`;
			}
			html=`<p class="pd-title">${elem/*参数*/.name}</p>`+html;
			return html;
		}
		document.getElementById("pd-dt1").innerHTML=change(L1,L[0]);
		document.getElementById("pd-dt2").innerHTML=change(L2,L[1]);
		document.getElementById("pd-dt3").innerHTML=change(L3,L[2]);
		document.getElementById("pd-dt4").innerHTML=change(L4,L[3]);
		document.getElementById("pd-dt5").innerHTML=change(L5,L[4]);
		document.getElementById("pd-dt6").innerHTML=change(L6,L[5]);

    //动态加载秒杀产品
    var M1=output.M1;
    var mHtml="";
    for(var m of M1){
      mHtml+=`<li>
                <a href="${m.href}">
                  <img src="img/loading.gif" data-src="${m.pic}" alt=""><p>${m.details}</p><p>¥${m.price}</p><span>¥29.90</span>
                </a>
              </li>`;
    }
    $(".sale-content ul").html(mHtml);
  })
})();

//轮播图左侧实现显示列表功能
$("#productList").on("mouseenter",function(){
	$(".productList-details").removeClass("none");
}).on("mouseleave",function(){
	$(".productList-details").addClass("none");
	var $this=$(this);
	$this.find("li").css("opacity","");
}).on("mouseenter",".productList li",function(){
	var $this=$(this);
	$this.css("opacity","0.5");
	$this.siblings().css("opacity","");
	$("#"+$this.data("id")).removeClass("none").siblings(".pd-dt").addClass("none");
});
(()=>{
  function task(){
  var end=new Date("2018/12/30 00:00:00");
  var now=new Date();
  //距离下一个假期还有: ?天?小时?分?秒
  var s=parseInt((end-now)/1000);
  if(s>0){
    var d=parseInt(s/3600/24);
    if(d<10) d="0"+d;
    //s/3600/24,再下取整
    var h=parseInt(s%(3600*24)/3600);
    if(h<10) h="0"+h;
    //s/(3600*24)的余数,再/3600,再下去整
    var m=parseInt(s%3600/60);
    if(m<10) m="0"+m;
    //s/3600的余数,再/60，再下取整
    s%=60;//s/60的余数
    if(s<10) s="0"+s;
   $(".sk_cd_hour span").html(h);
   $(".sk_cd_minute span").html(m);
   $(".sk_cd_second span").html(s);
  }else{
    clearInterval(timer);
    $(".sk_cd_main").hide();
  }
}
task();
var timer=setInterval(task,1000);
})();


  /*
 *懒加载大体思路：
 *1.对于所有的img标签，把真实的地址放入自定义属性data-img
 *2.当滚动页面时，检查页面所有的img标签，看看这个标签是否出现到我们的视野，再去判断它是否已经加载过，如果没有加载，就加载它，
 */

//如果打开网页就要显示图片，那么用户第一次打开页面，还未滚动窗口的时候需要执行一次lazyRender()函数
  if($("img").attr("src").endsWith("gif")){
    lazyRender($(".food1>.foodText img"));
    lazyRender($(".sale-content img"));
  }
  var timer;
  $(window).on("scroll",function(){
    var $img=$(".food1>.foodText img");
    var $mImg=$(".sale-content img");
    //用户鼠标滚轮滚动一次，有多次事件响应，下面的setTimeout主要是为性能考虑
    if(timer){
      clearTimeout(timer);
      timer=null;
    }
    timer=setTimeout(function(){
      lazyRender($img);
      lazyRender($mImg);
    },30)
  });
//判断图片出没出现在可视窗口
  function lazyRender($img){
    //获取浏览器窗口高度
    var windowHeight=$(window).height();
    //获取窗口滚动的高度
    var windowScrolltop=$(window).scrollTop();
    //判断条件
    for(var i=0;i<$img.length;i++) {
      //获取图片到页面顶部的距离$img.eq(i).offset().top;
      //获取图片元素自己的高度，包括内外边距 $img.eq(i).outerHeight(true);
      if (windowHeight + windowScrolltop > $img.eq(i).offset().top && $img.eq(i).offset().top + $img.eq(i).outerHeight(true) > windowScrolltop) {
        //判断图片有没有加载过
        if($img.eq(i).attr("src")!==$img.eq(i).attr("data-src")){
          //加载图片
          $img.eq(i).attr("src",$img.eq(i).attr("data-src"));
        }
      }
    }
  }