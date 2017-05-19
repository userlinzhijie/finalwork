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
	    	
	    	//ajax读取数据库
	    	 $.ajax({  
               type:"get",//请求方式  
               url:"Getgoods",//发送请求地址  
               timeout:30000,//超时时间：30秒  
               dataType:"json",//设置返回数据的格式  
               async:false,
               //请求成功后的回调函数 data为json格式  
               success:function(data){  
               var objs=eval(data);
               var obj = objs.Keyboards;
               var name1=obj[1].name;
               var brand = ["brand1","brand2"]; 
               document.getElementById(brand[0]).innerHTML=name1;
      /*         	alert(name1);
               	alert(brand[1]);*/
              },  
              //请求出错的处理  
              error:function(){  
                        alert("请求出错");  
              }  
           }); 
           	var tomcat="/test/upload/";
			var test="ssr.jpg";
			document.getElementById("img1").src=tomcat+test;
			document.getElementById("img2").src="img/SSR.jpg";
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
				<td><a href=""><table class="shopdetail">
					<tr>
					<td><img id="img1" src="" width="30px" height="20px"></td></tr>
					<tr>
					<td>xx键盘<span id="brand1"></span></td></tr>
					<tr>
					<td>xx<span id="name1"></span></td></tr>
					<tr>
					<td>销量<span id="sales1"></span></td></tr>
					</table></a></td>
				<td><table class="shopdetail">
					<tr>
					<td><img id="img2" src="" width="30px" height="20px"></td></tr>
					<tr>
					<td>xx键盘<span id="brand1"></span></td></tr>
					<tr>
					<td>xx<span id="name1"></span></td></tr>
					<tr>
					<td>销量<span id="sales1"></span></td></tr>
					</table></td></tr>
				<tr>
				<td><table class="shopdetail">
					<tr>
					<td><img id="img2" src="" width="30px" height="20px"></td></tr>
					<tr>
					<td>xx键盘<span id="brand1"></span></td></tr>
					<tr>
					<td>xx<span id="name1"></span></td></tr>
					<tr>
					<td>销量<span id="sales1"></span></td></tr>
					</table></td></tr>
			</table>
	 		</div>
	 	</div>
  </body>
</html>
