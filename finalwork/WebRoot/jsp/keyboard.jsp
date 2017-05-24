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
    
    <title>键盘售卖页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/styles.css" rel="stylesheet" type="text/css" >
	<link href="css/keyboard.css" rel="stylesheet" type="text/css" >
	<link href="./css/selectlist.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script> 
	
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
  	
  	<script type="text/javascript">
	
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
	 		<table class="shoplist">
	 			<tr>
	 			<c:forEach var="shop" items="${pageBean.data}" varStatus="vs">	
	 			<c:if test = "${vs.count>=2}"><c:if test = "${(vs.count % 2)==1}">
	 				<tr>
	 			</c:if></c:if>		
				<td>
				<a href="Pagectrl?page=${shop.id}"><table class="shopdetail">
					<tr>
					<td><img id="img1" src="" width="30px" height="20px"></td></tr>
					<tr>
					<td>名字：<c:out value="${shop.name}" /></td></tr>
					</table></a>
				</td>
				</c:forEach>
			</table>
		<p align="center">
    	页数${pageBean.curPage}/${pageBean.totalPages}
    	<c:choose>
    		<c:when test = "${pageBean.curPage==1}">首页 上一页</c:when>
    		<c:otherwise>
    			<a href="Pagectrl?page=1">首页</a>
    			<a href="Pagectrl?page=${pageBean.curPage-1}">上一页</a>
    		</c:otherwise>
    	</c:choose>
    	<c:choose>
    		<c:when test="${pageBean.curPage==pageBean.totalPages}">下一页 尾页</c:when>
    		<c:otherwise>
    			<a href="Pagectrl?page=${pageBean.curPage+1}">下一页</a>
    			<a href="Pagectrl?page=${pageBean.totalPages}">尾页</a>
    		</c:otherwise>
    	</c:choose>
    	<form method="post" action="Pagectrl">
    	<p align="center"><input type="text" name="page"><input type="submit" name="Submit" value="跳转"></p>
    	</form>
	 		</div>
	 	</div>	 	
  </body>
</html>
