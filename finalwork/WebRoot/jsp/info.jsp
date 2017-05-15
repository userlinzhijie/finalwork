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
	  	 $.ajax({  
               type:"get",//请求方式  
               url:"getsession",//发送请求地址  
               timeout:30000,//超时时间：30秒  
               dataType:"json",//设置返回数据的格式  
               //请求成功后的回调函数 data为json格式  
               success:function(data){
               	var userid = data.userid;
               	$("#userInfo").value(userid);
               		alert(userid);
              },
              error:function(){  
                    alert("请求出错");
              }  
           });
           };  
  	</script>
	
  </head>

  
  <body>
    <div id="Header">
  	<div id="logo">
    <%String name = (String)session.getAttribute("user"); %>
  	<p align =right>欢迎回来,<%= name %>  <a href = "jsp/exit.jsp">退出登陆</a><p> 
	</div></div>
 	<p align = "center" class = "ziti">我的信息</p>
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
	          <a href="">我的信息</a>
	         <div class ="submenu"><a href="#">1</a><a href="#">2</a><a href="#">3</a></div>
	    </li>
	    <li class="subme">
	          <a href="">首页</a>
	    </li>
    </ul><br><br>  
    <div><br>
    	<table class="hovertable">
			<tr>  
			    <th>我的中心</th>  
			</tr>  
			<tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">  
			    <td><a href="jsp/info.jsp">我的信息</a></td>  
			</tr>  
			<tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">  
			    <td><a href="">更改密码</a></td>  
			</tr>  
			<tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">  
			    <td><a href="">我的收藏</a></td>  
			</tr>   
		</table>
    	
    	
    <div class="div1">
    	<table class="info">
    	<tr>	
    		<th colspan="2">我的信息</th>
    		</tr>
    	<tr>
    		<td>用户名:</td><td><input type="text" value="test" disabled class="userid" id="userid"></td>
    	</tr>
    	<tr><td>性别:</td><td><input type ="radio" name="sex" value="男" class="infoitem">男<input type ="radio" name="sex" value="女">女
    		<input type ="radio" name="sex" value="保密" checked>保密</td>
    		</tr>
    	<tr>
    		<td>生日:</td><td><input type="date" ></td>
    		</tr>
    	<tr>
    		<td>真实姓名:</td><td><input type="text" value="" ></td>
    		</tr>
    	</table>
    </div>
    </div>
  </body>
</html>
