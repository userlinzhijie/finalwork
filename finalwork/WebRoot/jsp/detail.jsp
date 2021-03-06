<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商品详情</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/styles.css" rel="stylesheet" type="text/css" >
	<link href="css/detail.css" rel="stylesheet" type="text/css" >
	<link href="css/selectlist.css" rel="stylesheet" type="text/css">
	<%Cookie[] cookies = null;
		cookies = request.getCookies();
		String value="";
		for (int i = 0; i < cookies.length; i++) {
			String name = URLDecoder.decode(cookies[i].getName(), "utf-8");
			if (name.equals("user_id")) {
				value = URLDecoder.decode(cookies[i].getValue(), "utf-8");
			}
		}
			
	 %>
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script> 
	<script language="javascript" type="text/javascript">
		function numberadd(price){
			document.getElementById("number").value++;
			document.getElementById("arr_n").value=document.getElementById("number").value;
			document.getElementById("arr_v").value=document.getElementById("number").value*price;
		}
		
		function numberreduce(price){
			if(document.getElementById("number").value>1)
			document.getElementById("number").value--;
			document.getElementById("arr_n").value=document.getElementById("number").value;
			document.getElementById("arr_v").value=document.getElementById("number").value*price;
		}
		function numberchange(price){
			if(document.getElementById("number").value<0||document.getElementById("number").value=="")
			document.getElementById("number").value=1;
			document.getElementById("arr_n").value=document.getElementById("number").value;
			document.getElementById("arr_v").value=document.getElementById("number").value*price;
		}
	
	</script>
		
	<script language="javascript" type="text/javascript">
	  	window.onload=function(){
	  	//折叠菜单函数
        var lis = document.getElementsByClassName("subme");
	    for(var i=0; i<lis.length; i++){
		        lis[i].onmouseover = function(){
		            this.getElementsByClassName("submenu")[0].style.display = "block";
		        };
		        lis[i].onmouseout = function(){
		            this.getElementsByClassName("submenu")[0].style.display = "none";
		        };
	    	}
          };  
  	</script>
  

	<script language="javascript" type="text/javascript">
		function addcart(){
		var goods_id=document.getElementById("goods_id").value;
		var num=document.getElementById("number").value;
		document.getElementById("ac_add").href="UserCtrl?action=add_cart&goods_id="+goods_id+"&user_id=<%=value %>&num="+num;};
	</script>
	
  </head>
  
  <body background="img/background2.jpg">
    <div id="Header">
  	<div id="logo">
    <p align ="right" >&nbsp;<p> 
  	<p align ="right" id="p_title">loading...<p> 
	</div></div>
	<script>
	$("#p_title").load("UserCtrl?action=getusercookie",
	function() {
		var title = document.getElementById("p_title").innerHTML;
		if (title == "游客") {
			alert("请登录！");
			window.location = "jsp/login.jsp";
		}else{
			document.getElementById("p_title").innerHTML = '欢迎回来,'+title+'<a href="UserCtrl?action=logout">退出登陆</a>';
		};
	});
</script>
 	<p align = "center" class = "ziti">商品详情</p>
	<!-- 上层分割线 -->
	<ul id="ul1">
    <li class="subme">
          <a href="">店铺订单</a>
          <div class ="submenu"><a href="#">01 </a><a href="#">02 </a><a href="#">03</a></div>        
    </li>
    <li class="subme">
          <a href="">店铺中心</a>
	          <div class ="submenu"><a href="jsp/shopinfo.jsp">店铺信息</a><a href="jsp/putonsale.jsp">上架货物</a><a href="Underctrl?userid=<%=value %>">下架货物</a></div>
    </li>
    <li class="subme">
          <a href="jsp/cart.jsp">购物车</a>
    </li>
    <li class="subme">
          <a href="jsp/info.jsp">我的中心</a>
    </li>
    <li class="subme">
          <a href="#">首页</a>
    </li>
 	</ul><br>
 	<div class="picture">
 		<c:forEach var="shop" items="${pageBean.data}" varStatus="vs">
 		<img alt="test" src="Showctrl?id=${shop.id}" class="showimg" id="pic">
 		</c:forEach>
 	</div>
 	
 	<div class="info">
 		<c:forEach var="shop" items="${pageBean.data}" varStatus="vs">
 		 ${shop.name}<br>
 		价格：￥${shop.price}<br>
 		<form action="jsp/onekeypay.jsp" method="post">
 		<input type="hidden" id="goods_id" value="${shop.id}" >
 		 <input type="hidden" name="action" value="add_order">
	    <input type="hidden" name="address_id" id="aid" value="0">
	    <input type="hidden" name="mode" id="mode" value="0">
	    <input type="hidden" name="card_id" id="cid" value="default">
	    <input type="hidden" name="user_id" id="uid" value="<%=value%>">
    	<input type="hidden" name="status" id="status" value="1">
    	<input type="hidden" name="arr_v" id="arr_v" value="0">    
    	<input type="hidden" name="arr_n" id="arr_n" value="1">    
    	<input type="hidden" name="transfee" id="transfee" value="0">
   		<input type="hidden" name="arr_g" id="array_g" value="${shop.id}">
   		<input type="hidden" name="arr_s" id="array_s" value="${shop.user }">
 		<table>
 		<tr>
 			<td rowspan="2">数量:</td><td rowspan="2">
 			<input type="text" width="50px" id="number" class="number"  value="1" onchange="numberchange(${shop.price })" onkeyup="this.value=this.value.replace(/\D/g,'')"></td>
 			<td><input type="button" value="+" class="btn" onclick="numberadd(${shop.price })"></td>
 			<td rowspan="2"><a id="ac_add" href="" onclick="addcart()"><input type="button" class="cart" value="加入购物车"></a></td>
 			<td rowspan="2"><input type="submit" class="cart" value="一键购买"></td>
 			</tr>
 		<tr>
 			<td><input type="button" value="-" class="btn" onclick="numberreduce(${shop.price })"></td>
 		</tr>
 		</table>
 		</form>
 		<div>
 		<h1>商品介绍</h1>
 		<table class="shopinfo">
 		<tr>
 		<td>类型:${shop.type}</td><td>品牌:${shop.brand}</td><td>版本:${shop.version}</td><td>颜色:${shop.color}</td>
 		</tr>
 		<tr>
 		<td>标准:${shop.standard}</td><td>接口:${shop.inter}</td><td>背光:${shop.backlight}</td><td>人体工学:${shop.ergo}</td>
 		</tr>
 		<tr>
 		<td>尺寸:${shop.size}</td><td>重量:${shop.weight}</td><td>材质:${shop.material}</td>
 		</tr>
 		<tr>
 			<th colspan="4" align="left">细节:${shop.details}</th>
 		</tr>
 		</table>
 		</div>	
 		</c:forEach>
 	</div>
 	</body>
</html>