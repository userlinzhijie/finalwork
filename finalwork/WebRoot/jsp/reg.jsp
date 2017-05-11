<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<script type="application/x-javascript"> 
					addEventListener("load", function() { 
						setTimeout(hideURLbar, 0); }, false);
					function hideURLbar(){ window.scrollTo(0,1); } 
	</script>
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script> 
	<script type="text/javascript">
		 function checkname(){  
		    var value = $("#userName").val();
             $.ajax({  
               type:"get",//请求方式  
               url:"CheckUserNameServlet?userName=" + value,//发送请求地址  
               timeout:30000,//超时时间：30秒  
               dataType:"json",//设置返回数据的格式  
               //请求成功后的回调函数 data为json格式  
               success:function(data){  
                  var flag = data.flag;
                  if(flag == "true"){
                     $("#userInfo").html( value + "已经被使用了,请换一个用户名！");
                  }
              },
              error:function(){  
                        alert("请求出错");  
              }  
           });  
          } 
	</script>

  </head>
  
  <body>
    <h1>欢迎注册</h1>
    <p align = "right">已有帐号?<a href=index.jsp>请登录</a></p><br>
    <form action = "Regctrl" id = "reg-form" method ="post">
		用户名：<input type="text" id="userName"  name="userName" placeholder="你的帐户名和登录名" onchange="checkname()"  required/>
		<div id="userInfo"></div><br>
		密     码:<input type="password" name="pwd" placeholder="建议使用最少两种字符组合" required /><br><br>
    	手机号码：<input type="text" name="phone" placeholder="建议输入常用手机号码" required /><br><br>
    	<input type = "submit" value = "注册">
    </form>
  </body>
</html> 
