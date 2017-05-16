<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>更改密码</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/info_selectlist.css" rel="stylesheet" type="text/css">
	<link href="css/styles.css" rel="stylesheet" type="text/css" >
	<link href="css/info.css" rel="stylesheet" type="text/css">
	
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
  	<p align =right>欢迎回来,<input type="text" class="useridtop" id="useridtop" disabled>&nbsp;&nbsp;
  	<a href = "jsp/exit.jsp">退出登陆</a><p> 
	</div></div>
 	<p align = "center" class = "ziti">更改密码</p>
 	<ul id="ul1">
	    <li class="subme">
	          <a href="jsp/login.jsp">店铺订单</a>
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
	          <a href="">首页</a>
	    </li>
    </ul><br><br><br>
    	<table class="hovertable">
			<tr>  
			    <th>我的中心</th>  
			</tr>  
			<tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">  
			    <td><a href="jsp/info.jsp">我的信息</a></td>  
			</tr>  
			<tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">  
			    <td><a href="jsp/changepwd.jsp">更改密码</a></td>  
			</tr>  
			<tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">  
			    <td><a href="jsp/apply.jsp">申请开铺</a></td>  
			</tr>   
		</table>
		
	<div class="div1">
	<form action="Pwdctrl" method="post">
    	<table class="info">
    	<tr>	
    		<th colspan="2">更改密码</th>
    		</tr>
    	<tr>
    		<td>原本密码</td><td><input type="text"></td>
    		</tr>
    	<tr>
    		<td>新的密码</td><td><input type="password"></td>
    		</tr>
    	<tr>
    		<td>确认密码</td><td><input type="password"></td>
    		</tr>
    	<tr>
    		<th colspan="2"><input type="submit" value="修改" class="infosub"></th>
    		</tr>
    	</table>
    </form>
    </div>
  </body>
</html>
