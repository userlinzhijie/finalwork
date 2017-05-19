<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
 	<p align = "center" class = "ziti">上架商品</p>
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
			    <th>店铺中心</th>  
			</tr>  
			<tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">  
			    <td><a href="jsp/shopinfo.jsp">店铺信息</a></td>  
			</tr>  
			<tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">  
			    <td><a href="jsp/putonsale.jsp">上架商品</a></td>  
			</tr>  
			<tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">  
			    <td><a href="">下架商品</a></td>  
			</tr>   
		</table>
    	
    	
    <div class="div1">
	<form action="Upload" method="post">
    	<table class="info">
    	<tr>	
    		<th colspan="2">上架商品</th>
    		</tr>
    	<tr>
    		<td>品牌:</td><td><input type="text" class="brand" id="brand" name="brand"></td>
    	</tr>
    	<tr><td>型号:</td><td><input type="text" class="type" id="type" id="type" ></td>
    		</tr>
    	<tr>
    		<td>颜色:</td><td><input type="text" class="color" id="color" id="color" ></td>
    		</tr>
    	<tr>
    		<td>传输方式:</td><td><input type="text" name="trans" id="trans" class="trans"></td>
    		</tr>
    	<tr>
    		<td>商品图片:</td>
    		</tr>
    	<tr>
    		<td colspan="2"><input type="file" name="trans" id="trans" class="trans"></td>
    		</tr>
    	<tr>
    		<th colspan="2"><input type="submit" value="上传" class="infosub"></th>
    		</tr>
    	</table>
    </form>
    </div>
  </body>
</html>
