<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>首页</title>
    
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
    <body>
    <%String name = (String)session.getAttribute("user"); %>
  	<%if(name==null){%>
  	<p align = "right"><a href="jsp/login.jsp">你好，请登录</a>&nbsp&nbsp<a href="jsp/reg.jsp">注册</a></p>
  	<%}else{
  	out.println("<p align ="+"right"+">欢迎回来,"+name+"  <a href = "+"#"+">退出登陆</a></h3>"); 
	session.setAttribute("user",null);} %>
 	<h1 align = "center">购物系统</h1>
 	<form action = "index.html" method="post">
 	<p align = "center" ><input type = "text" name = "search"><input type = "submit" value = "搜索"><br>
 	</form>
  </body>
  </body>
</html>
