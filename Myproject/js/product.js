function pageLoad(pno=0){
	var kw=location.search.split("=")[1]||"";//读取url中的关键词?kw=xxxxxxx
	ajax("get","data/product/product.php?kw="+kw+"&pno="+pno,"")
	.then(output=>{
		var data=output.data;
		var html="";
		for(var p of data){
			html+=`<li>
                <a href="product-sale.html?lid=${p.lid}">
                <img src="${p.md}" alt="">
                <p>¥${p.price}</p>
                <p>${p.title}</p>
                </a>
              </li>`;
		}
		var ulShowList=document.getElementById("show-list");
		ulShowList.innerHTML=html;
		var pageCount=output.pageCount,pageNo=output.pageNo;
		var lis="";
		for(var i=0;i<pageCount;i++){
			lis+=(i!=pageNo?`<a href="javascript:void(0)">${i+1}</a>`:
					`<a href="javascript:void(0)" class="current">${i+1}</a>`);
		}
		var Lhtml=`<a href="javascript:void(0)" class="previous">上一页</a>
								${lis}
							 <a href="javascript:void(0)" class="next">下一页</a>`;
		var divPages=document.getElementById("pages");
		divPages.innerHTML=Lhtml;
		if(pageNo!=0&&pageNo!=pageCount-1){
			divPages.firstElementChild.className="previous";
			divPages.lastElementChild.className="next";
		}else{
			if(pageNo==0){
				divPages.firstElementChild.className="previous disabled";

			}
			if(pageNo==pageCount-1){
				divPages.lastElementChild.className="next disabled";
			}
		}
		//页码单击事件{每次单击分页加载页面时，dom单击事件一次触发1次，如果用jquery一次触发多次单击，解决：先移出监听事件}
		divPages.onclick=e=>{
			e.preventDefault();
			var tar=e.target;
			if(!isNaN(tar.innerHTML)){
				//筛选目标元素：内容为数字
        if(tar.className!="current")
				pageLoad(tar.innerHTML-1);
        window.scrollTo(0,0);
			}
		}
		//找到divPages的第一个子元素，绑定单击事件
		divPages.firstElementChild.onclick=
			divPages.lastElementChild.onclick=function(){
			if(this.className.indexOf("disabled")==-1){
				var curr=divPages.querySelector(".current");
				if(this==divPages.children[0]){
					pageLoad(curr.innerHTML-2)
				}else{
					pageLoad(curr.innerHTML);	
				}
        window.scrollTo(0,0);
			}
		}
	});
}
pageLoad();