<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="css/styles.css" rel="stylesheet" type="text/css" >
	<link href="css/info_selectlist.css" rel="stylesheet" type="text/css">
	<link href="css/info.css" rel="stylesheet" type="text/css">
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
 
  </head>

  
  <body>
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
 	<p align = "center" class = "ziti">购物车</p>
 	<ul id="ul1">
	    <li class="subme">
	          <a href="jsp/login.jsp">店铺订单</a>
	          <div class ="submenu"><a href="#">01 </a><a href="#">02 </a><a href="#">03</a></div>        
	    </li>
	    <li class="subme">
	          <a href="">店铺中心</a>
	          <div class ="submenu"><a href="jsp/shopinfo.jsp">店铺信息</a><a href="jsp/putonsale.jsp">上架货物</a><a href="">下架货物</a></div>
	    </li>
	    <li class="subme">
	          <a href="jsp/cart.jsp">购物车</a>
	         <div class ="submenu"><a href="#">1</a><a href="#">2</a><a href="#">3</a></div>
	    </li>
	    <li class="subme">
	          <a href="jsp/info.jsp">我的中心</a>
	          <div class ="submenu"><a href="jsp/info.jsp">我的信息</a><a href="jsp/changepwd.jsp">更改密码</a><a href="jsp/apply.jsp">申请开铺</a></div>
	    </li>
	    <li class="subme">
	          <a href="">首页</a>
	    </li>
    </ul><br><br><br>
    	
    	
    	
    <div class="div1">
		<table class="info" id="cart_table">
		<tr><th colspan="2">物流跟踪</th></tr>
		<tr><td>物流状态:</td><td>已签收</td></tr>
<tr><td>承运公司：</td><td>天天物流</td></tr>
<tr><td>快递单号：</td><td>373269427868<td></tr>
<tr><td>官方电话：</td><td>4001-888-888</td></tr>
<tr><th>2015-12-19周六15:35:42</th><th>【武汉市】已签收,签收人是青年城签收，感谢使用天天快递，期待再次为您服务 </th></tr>
<tr><td> 14:27:28</td><td>【武汉市】光谷关山分部派件员正在为您派件</td></tr>
<tr><td>09:25:51</td><td>【武汉市】快件已到达 光谷关山分部 </td></tr>
<tr><td>06:56:03</td><td>【武汉市】武汉 已发出 </td></tr>
<tr><th>2015-12-17周四22:15:23</th><th>【杭州市】杭州集散陆运 已发出</th></tr>
<tr><td>18:55:25</td><td>【绍兴市】诸暨 已发出 </td></tr>
<tr><td>18:54:25</td><td>【绍兴市】天天快递 诸暨收件员 已揽件</td> </tr>
<tr><td>15:49:40</td><td>商家正通知快递公司揽件 </td></tr>
<tr><td>15:49:40</td><td>您的包裹已出库</td> </tr>
<tr><td>15:18:15</td><td>您的订单待配货 </td></tr>
<tr><td>14:27:50</td><td>您的订单开始处理</td> </tr>
		</table>
    </div>
  </body>
</html>
