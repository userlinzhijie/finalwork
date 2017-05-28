<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script> 
	<script language="javascript" type="text/javascript">
		function numberadd(){
			document.getElementById("number").value++;
		}
		
		function numberreduce(){
			if(document.getElementById("number").value>1)
			document.getElementById("number").value--;
		}
		function numberchange(){
			if(document.getElementById("number").value<0||document.getElementById("number").value=="")
			document.getElementById("number").value=1;
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
			document.getElementById("p_title").innerHTML = '<a href="jsp/login.jsp">你好，请登录</a>&nbsp;&nbsp;<a href="jsp/reg.jsp">注册</a>&nbsp;&nbsp;&nbsp;';
		}else{
			document.getElementById("p_title").innerHTML = '欢迎回来,'+title+'<a href="UserCtrl?action=logout">退出登陆</a>';
		}
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
	          <div class ="submenu"><a href="jsp/shopinfo.jsp">店铺信息</a><a href="jsp/putonsale.jsp">上架货物</a><a href="">下架货物</a></div>
    </li>
    <li class="subme">
          <a href="">我的订单</a>
         <div class ="submenu"><a href="#">1</a><a href="#">2</a><a href="#">3</a></div>
    </li>
    <li class="subme">
          <a href="jsp/info.jsp">我的中心</a>
	          <div class ="submenu"><a href="jsp/info.jsp">我的信息</a><a href="jsp/changepwd.jsp">更改密码</a><a href="jsp/apply.jsp">申请开铺</a></div>
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
 		<form action="" method="post">
 		<table>
 		<tr>
 			<td rowspan="2">数量:</td><td rowspan="2">
 			<input type="text" width="50px" id="number" class="number"  value="1" onchange="numberchange()" onkeyup="this.value=this.value.replace(/\D/g,'')"></td>
 			<td><input type="button" value="+" class="btn" onclick="numberadd()"></td>
 			<td rowspan="2"><input type="submit"  class="cart" value="加入购物车"></td>
 			<td rowspan="2"><input type="submit"  class="cart" value="一键购买"></td>
 			</tr>
 		<tr>
 			<td><input type="button" value="-" class="btn" onclick="numberreduce()"></td>
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