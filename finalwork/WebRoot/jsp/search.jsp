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
 	<p align = "center" class = "ziti">购物系统</p>
	<!-- 上层分割线 -->
	<ul id="ul1">
	    <li class="subme">
	          <a href="Shoporderctrl?user_id=<%=value%>">店铺订单</a>       
	    </li>
	    <li class="subme">
	          <a href="jsp/shopinfo.jsp">店铺中心</a>
	          <div class ="submenu"><a href="jsp/shopinfo.jsp">店铺信息</a><a href="jsp/putonsale.jsp">上架货物</a><a href="Underctrl?userid=<%=value %>">下架货物</a></div>
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
    </ul><br>
	<!-- 下层分割线 -->
 	<form action = "Pagectrl?page=1" method="post">
 	<p align = "center" >
 	<input type = "text" name = "search"><input type = "submit" value = "搜索"></p><br></form>
 	<p align = "center"><a href="Pagectrl?order=desc&type=${type}&search=${search}"><input type = "submit" value="价格↓" ></a>
 	<a href="Pagectrl?order=asc&type=${type}&search=${search}"><input type = "submit" value="价格↑" ></a>
 	</p>
 	<br><br>
 	<div>
	 	<div class="div0"><br>
		<table class="hovertable">
			<tr>  
			    <th>可选分类</th>  
			</tr>  
			<tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">  
			    <td><a href="Pagectrl?page=1&type=键盘">键盘</a></td>  
			</tr>  
			<tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">  
			    <td><a href="Pagectrl?page=1&type=鼠标">鼠标</a></td>  
			</tr>     
		</table>
	 	</div>
	 		<div class="div1">
	 		<table class="shoplist">
	 			<tr>
	 			<c:forEach var="shop" items="${pageBean.data}" varStatus="vs">	
	 			<c:if test = "${vs.count>=4}"><c:if test = "${(vs.count % 4)==1}">
	 				<tr>
	 			</c:if></c:if>	
				<td>
				<a href="Pagectrl?id=${shop.id}">
				<table class="shopdetail">
					<tr>
					<td class="pic"><img id="img1" src="Showctrl?id=${shop.id}" width="170px" height="160px"></td></tr>
					<tr>
					<td style="text-align:left">¥<c:out value="${shop.price}" /></td></tr>
					<tr>
					<td title="${shop.name}"><c:out value="${shop.name}" /></td></tr>
					</table></a>
				</td>
				</c:forEach>
				<c:if test = "${result==0}">
				<script>alert("你所搜索的结果为空");</script>
				</c:if>
			</table>
		<p align="center">
    	页数${pageBean.curPage}/${pageBean.totalPages}
    	<c:choose>
    		<c:when test = "${pageBean.curPage==1}">首页 上一页</c:when>
    		<c:otherwise>
    			<a href="Pagectrl?page=1&order=${order}&search=${search}&type=${type}">首页</a>
    			<a href="Pagectrl?page=${pageBean.curPage-1}&order=${order}&search=${search}&type=${type}">上一页</a>
    		</c:otherwise>
    	</c:choose>
    	<c:choose>
    		<c:when test="${pageBean.curPage==pageBean.totalPages}">下一页 尾页</c:when>
    		<c:otherwise>
    			<a href="Pagectrl?page=${pageBean.curPage+1}&search=${search}&order=${order}&type=${type}">下一页</a>
    			<a href="Pagectrl?page=${pageBean.totalPages}&order=${order}&search=${search}&type=${type}">尾页</a>
    		</c:otherwise>
    	</c:choose>
	 		</div>
	 	</div>	 	
  </body>
</html>
