<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商品信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="css/styles.css" rel="stylesheet" type="text/css" >
	<link href="css/info_selectlist.css" rel="stylesheet" type="text/css">
	<link href="css/undershop.css" rel="stylesheet" type="text/css">
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
 	<p align = "center" class = "ziti">店铺信息</p>
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
    	<table class="shopinfo">
    	<tr>	
    		<th colspan="4">商品信息</th>
    		</tr>
    	<tr>
    		<td>商品</td><td>图片</td><td>价格</td><td>操作</td>
    	</tr>
    	<tr><td>s：</td><td>p</td><td>p</td><td>cz</td>
    		</tr>
    	</table>
    </div>
  </body>
</html>

