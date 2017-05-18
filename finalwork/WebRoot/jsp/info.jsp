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
	  	/* $("input[name=sex][value=保密]").attr("checked",true);
	  	 $("#truename").val("");*/
	  	 $.ajax({  
               type:"get",//请求方式  
               url:"getsession",//发送请求地址  
               timeout:30000,//超时时间：30秒  
               dataType:"json",//设置返回数据的格式  
               async:false,
               //请求成功后的回调函数 data为json格式  
               success:function(data){
               		var name = data.flag;
               		$("#userid").val(name);
               		$("#useridtop").val(name);
              },
              error:function(){  
                    alert("请求出错");
              }  
           });
           
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
 	<p align = "center" class = "ziti">我的信息</p>
 	<ul id="ul1">
	    <li class="subme">
	          <a href="jsp/login.jsp">店铺订单</a>
	          <div class ="submenu"><a href="#">01 </a><a href="#">02 </a><a href="#">03</a></div>        
	    </li>
	    <li class="subme">
	          <a href="">店铺中心</a>
	          <div class ="submenu"><a href="#">店铺信息</a><a href="#">上架货物</a><a href="#">下架货物</a></div>
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
	<form action="Infoctrl" method="post">
    	<table class="info">
    	<tr>	
    		<th colspan="2">我的信息</th>
    		</tr>
    	<tr>
    		<td>用户名:</td><td><input type="text"  disabled class="userid" id="userid" name="userid"></td>
    	</tr>
    	<tr><td>性别:</td><td><input type ="radio" name="sex" value="男" >男<input type ="radio" name="sex" value="女">女
    		<input type ="radio" name="sex" value="保密">保密</td>
    		</tr>
    	<tr>
    		<td>生日:</td><td><input type="date" name="birthday"></td>
    		</tr>
    	<tr>
    		<td>真实姓名:</td><td><input type="text" name="truename" id="truename" class="truename"></td>
    		</tr>
    	<tr>
    		<th colspan="2"><input type="submit" value="修改" class="infosub"></th>
    		</tr>
    	</table>
    </form>
    </div>
  </body>
</html>
