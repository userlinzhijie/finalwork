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
    
    <title>订单</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="css/styles.css" rel="stylesheet" type="text/css" >
	<link href="css/info_selectlist.css" rel="stylesheet" type="text/css">
	<link href="css/shoporder.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script> 
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
	<script language="javascript" type="text/javascript">
	  	window.onload=function(){
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
			alert("请登录！");
			window.location = "jsp/login.jsp";
		}else{
			document.getElementById("p_title").innerHTML = '欢迎回来,'+title+'<a href="UserCtrl?action=logout">退出登陆</a>';
		}
	});
	</script>
 	<p align = "center" class = "ziti">店铺信息</p>
 	<ul id="ul1">
	    <li class="subme">
	          <a href="Shoporderctrl?user_id=<%=value%>">店铺订单</a>      
	    </li>
	    <li class="subme">
	          <a href="jsp/shopinfo.jsp">店铺中心</a>
	          <div class ="submenu"><a href="jsp/shopinfo.jsp">店铺信息</a><a href="jsp/putonsale.jsp">上架货物</a><a href="Pagectrl?userid=<%=value %>">下架货物</a></div>
	    </li>
	    <li class="subme">
	          <a href="jsp/cart.jsp">购物车</a>
	        
	    </li>
	    <li class="subme">
	          <a href="jsp/info.jsp">我的中心</a>
	        
	    </li>
	    <li class="subme">
	          <a href="">首页</a>
	    </li>
    </ul><br><br><br>
    	
    	
   <div class="div1" >
    	<table class="shopinfo">
    	<tr>	
    		<th colspan="8">订单信息</th>
    		</tr>
    	<tr>
    		<td>订单id</td><td>商品名</td><td>数量</td><td>共计</td><td>邮费</td><td>交易时间</td><td>状态</td><td>操作</td>
    	</tr>
    	<c:forEach var="order" items="${pageBean.data}" varStatus="vs">
    	<c:if test = "${order.status!=9&&order.status!=89}">
    	<tr>
    	<td class="short"><c:out value="${order.id}"/></td>
    	<td class="long"><c:out value="${order.goods}" /></td>
    	<td class="short"><c:out value="${order.number}" /></td>
    	<td>￥<c:out value="${order.total}" /></td>
    	<td>￥<c:out value="${order.transfee}" /></td>
    	<td class="long"><c:out value="${order.date}" /></td>
    	
    	<c:if test = "${order.status==1}">
    	<td>等待付款</td>
    	<td>等待付款</td></c:if>
    	
    	<c:if test = "${order.status==2||order.status==6}">
    	<td>提醒发货</td>
    	<td><a href="Delctrl?orderid=${order.id}&userid=<%=value%>&status=${order.status}">发货</a></td></c:if>
    	
    	<c:if test = "${order.status==3}">
    	<td>等待收货</td>
    	<td>等待收货</td></c:if>
    	  	
    	<c:if test = "${order.status==4}">
    	<td>等待评价</td>
    	<td>等待评价</td></c:if>
    	
    	<c:if test = "${order.status==5}">
    	<td>已退单</td>
    	<td><a href="Delctrl?orderid=${order.id}&userid=<%=value%>&status=${order.status}">删除订单</a></td></c:if>
    	
    	<c:if test = "${order.status==7}">
    	<td>交易成功</td>
    	<td><a href="Delctrl?orderid=${order.id}&userid=<%=value%>&status=${order.status}">删除订单</a></td></c:if>   
    	
    	<c:if test = "${order.status==8}">
    	<td>交易结束</td>
    	<td><a href="Delctrl?orderid=${order.id}&userid=<%=value%>&status=${order.status}">删除订单</a></td></c:if> 
    		
    	</tr>
    	</c:if>
    	
    	
    	</c:forEach>
    	</table>
    </div>
  </body>
</html>
