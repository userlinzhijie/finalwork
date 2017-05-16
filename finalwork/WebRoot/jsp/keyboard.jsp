<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>键盘售卖页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/styles.css" rel="stylesheet" type="text/css" >
	<link href="./css/selectlist.css" rel="stylesheet" type="text/css">
	
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
  
  <body>
    <div id="Header">
  	<div id="logo">
    <%String name = (String)session.getAttribute("user"); %>
  	<%if(name==null){%>	
  	<p align = "right"><a href="jsp/login.jsp">你好，请登录</a>&nbsp;&nbsp;<a href="jsp/reg.jsp">注册</a>&nbsp;&nbsp;&nbsp;</p>
  	<%}else{%>
  	<p align =right>欢迎回来,<%= name %>  <a href = "jsp/exit.jsp">退出登陆</a><p> 
	<% } %>
	</div></div>
 	<p align = "center" class = "ziti">购物系统</p>
	<!-- 上层分割线 -->
	<ul id="ul1">
    <li class="subme">
          <a href="">店铺订单</a>
          <div class ="submenu"><a href="#">01 </a><a href="#">02 </a><a href="#">03</a></div>        
    </li>
    <li class="subme">
          <a href="">店铺信息</a>
          <div class ="submenu"><a href="#">1</a><a href="#">2</a><a href="#">3</a></div>
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
	<!-- 下层分割线 -->
 	<form action = "index.jsp" method="post">
 	<p align = "center" >
 	<select size ="1" name="mysite" >
 		<option value="" selected></option>
		<option value="键盘">键盘</option>
		<option value="鼠标">鼠标</option>
		<option value="耳机">耳机</option>
		<option value="音响">音响</option>
 	</select>
 	<input type = "text" name = "search"><input type = "submit" value = "搜索"><br>
 	</form><br><br>
 	<div>
	 	<div class="div0"><br>
		<table class="hovertable">
			<tr>  
			    <th>可选分类</th>  
			</tr>  
			<tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">  
			    <td><a href="jsp/keyboard.jsp">键盘</a></td>  
			</tr>  
			<tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">  
			    <td><a href="">鼠标</a></td>  
			</tr>  
			<tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">  
			    <td><a href="">耳机</a></td>  
			</tr>  
			<tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">  
			    <td><a href="">音响</a></td>  
			</tr>    
		</table>
	 	</div>
	 		<div class="div1">
	 			 <input type="image" alt="test" src="Showimg" name="test1" value="1">
	 			 <input type="image" alt="test" src="Showimg" name="test1" value="2">
	 		</div>
	 	</div>
  </body>
</html>
