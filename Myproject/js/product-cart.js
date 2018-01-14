$(()=>{
  function loadCarts() {
    ajax("get", "data/routes/cart/getCart.php").then(output => {
      //加载购物车产品信息
      let html = "", cart = output.cart, pic = output.pic;
      for (let i = 0;i < cart.length;i++) {
        html += `<div class="imfor" data-cid="${cart[i].cid}" data-id="${cart[i].user_id}">`
        //如果商品被选中，就加载被选中，否则就加载不被选中
        parseInt(cart[i].is_checked) == 1 ?
          html += `<div class="check"><img src="img/cart/product_true.png" alt=""></div>` :
          html += `<div class="check"><img src="img/cart/product_normal.png" alt=""></div>`
        html += `<div class="pic"><img src="${pic[i].sm}" alt="" data-lid="${pic[i].product_id}"></div>
							<div class="title"><a href="">${cart[i].title}</a></div>
							<div class="price"><p>悦桔专享价<p><b>¥</b><span>${cart[i].price}</span></div>
							<div class="count">
								<a href="javascript:;" class="reduce">-</a>
								<input type="text" value="${cart[i].count}">  
								<a href="javascript:;" class="add">+</a>
							</div>
							<div class="total"><b>¥</b><span>${((cart[i].price *100* cart[i].count)/100).toFixed(2)}</span></div>
							<div class="del"><span>删&nbsp;除</span></div>
						</div>
			`;
      }
      $(".imfor-cart").html(html);
      //加载后获取产品总数、总金额和选中；
        getTotal();
        chkAll()
      //单击全选事件;
      function selectAll() {
        if ($(".imfor-top img").attr("src").endsWith("normal.png")) {
          $(".imfor-top img").attr("src", "img/cart/product_true.png");
          $(".cart-total img").attr("src", "img/cart/product_true.png");
          $.post(
            "data/routes/cart/selectAll.php",
            "chkAll=1"
          ).then(() => {
            loadCarts();
          });
        } else {
          $(".imfor-top img").attr("src", "img/cart/product_normal.png");
          $(".cart-total img").attr("src", "img/cart/product_normal.png");
          $.post(
            "data/routes/cart/selectAll.php",
            "chkAll=0"
          ).then(() => {
            loadCarts();
          });
        }
      };
      $(".imfor-top").off("click").on("click", "img", selectAll);
      $(".cart-total").off("click").on("click", "img", selectAll);
      //单击单个产品被选中事件
      $(".imfor-cart>.imfor>.check").off("click").on("click", "img", e => {
        $tar = $(e.target);
        if ($tar.attr("src").endsWith("true.png")) {
          $(".imfor-top img").attr("src", "img/cart/product_normal.png");
          $(".cart-total img").attr("src", "img/cart/product_normal.png");
          $.get(
            "data/routes/cart/selectOne.php",
            "chkOne=0&cid=" + $tar.parent().parent().data("cid")
          ).then(() => {
            loadCarts();
          })
        } else {
          $tar.attr("src", "img/cart/product_true.png");
          $.get(
            "data/routes/cart/selectOne.php",
            "chkOne=1&cid=" + $tar.parent().parent().data("cid")
          ).then(() => {
            loadCarts();
          })
        }
      });
    });
    //购物车产品数量增减；
    $(".imfor-cart").off("click").on("click","a",e=>{
      var $tar=$(e.target);
      var $n=parseInt($tar.parent().parent().find("input").val());
      if($tar.is(".add")){
        $n++;
      }
      if($tar.is(".reduce")){
        $n--;
      }
      var $cid=$tar.parent().parent().data().cid;
      if($n==0){//如果没有被选中的商品就清空总价、数量、全选；
        if(confirm("是否继续删除?")){
          $.post("data/routes/cart/updateCart.php","cid="+$cid+"&count="+$n,"text").then(()=>{
            loadCarts();
          });
        }
      }else{
        $.post("data/routes/cart/updateCart.php","cid="+$cid+"&count="+$n,"text").then(loadCarts);
      }
    }).on("click","span",e=>{ //单击删除产品
      var $tar=$(e.target);
      if(isNaN($tar.html())){
        var $cid=parseInt($tar.parent().parent().data().cid);
        if(confirm("您确认要删除吗"))
          $.post("data/routes/cart/updateCart.php","cid="+$cid+"&count=0","text").then(()=>{
            loadCarts();
          });
      }
    });
    //单击删除全部产品
    $(".box").off("click").on("click","span",e=>{
      $tar=$(e.target);
      var $imfor=$tar.parent().siblings(".imfor-cart").children();
      if($tar.index()==2&&$tar.parent().is(".cart-total")){
        if($(".imfor-top img").attr("src").endsWith("true.png")){
          if(confirm("您确认要删除商品吗？")){
            $.post("data/routes/cart/clearCart.php", "uid=" + $imfor.first().data("id")).then(() => {
              loadCarts();
            })
          }
        }
      }
    });
    //全选判定条件
    function chkAll(){
      if($(".imfor-cart").find(".imfor").length==0){
        $(".imfor-top img").attr("src","img/cart/product_normal.png");
        $(".cart-total img").attr("src","img/cart/product_normal.png");
      }else {
        $(".imfor-top img").attr("src",
          $(".imfor-cart").find(
            ".check>img[src$='normal.png']"
          ).length == 0 ?
            "img/cart/product_true.png" :
            "img/cart/product_normal.png"
        );
        $(".cart-total img").attr("src", $(".imfor-top img").attr("src"));
      }
    }
    //获取产品总数和总金额
    var $totals=$(".totalPrice");
    var $counts=$(".cart-total .total");
    function getTotal(){
      var $rows=
        $(".imfor:has(.check>img[src$='true.png'])");
      var $inputs=$rows.find(".count>input");
      var $subs=
        $rows.find(".total>span");
      var count=0,total=0;
      for(var input of $inputs){
        count+=parseInt($(input).val());
      }
      for(var sub of $subs){
        total+=parseInt($(sub).html()*100);
      }
      $counts.html(count);
      $totals.html((total/100).toFixed(2));
    }

  }
  $.get("data/routes/isLogin.php").then(data=>{
    if(data.ok==0){
      location="login.html?back="+encodeURIComponent(location.href);
    }
    loadCarts();
  })
});



