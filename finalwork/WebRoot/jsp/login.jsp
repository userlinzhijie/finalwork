<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登陆</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
     <h1>欢迎登陆</h1>
     <p align = "right">没有帐号?<a href="jsp/reg.jsp">请注册</a></p><br>
     <form action = "Loginctrl" id = "reg-form" method ="post">
		用户名：<input type="text" name="lguserName" placeholder="你的帐户名和登录名"  required/>
		<div id="lginfo"></div><br>
		密     码:<input type="password" name="lgpwd" placeholder="建议使用最少两种字符组合" required /><br>
		<input type = "submit" value = "登陆">
    </form>
  </body>
</html>
