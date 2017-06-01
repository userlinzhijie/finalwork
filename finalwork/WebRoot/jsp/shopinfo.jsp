<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>店铺信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="css/styles.css" rel="stylesheet" type="text/css" >
	<link href="css/info_selectlist.css" rel="stylesheet" type="text/css">
	<link href="css/info.css" rel="stylesheet" type="text/css">
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
        var lis = document.getElementsByClassName("subme");
	    for(var i=0; i<lis.length; i++){
	        lis[i].onmouseover = function(){
	            this.getElementsByClassName("submenu")[0].style.display = "block";
	        };
	        lis[i].onmouseout = function(){
	            this.getElementsByClassName("submenu")[0].style.display = "none";
	        };
	    	}
	   	//获得信息
	   	$.ajax({  
               type:"get",//请求方式  
               url:"Shopinfoctrl?id=1",//发送请求地址  
               timeout:30000,//超时时间：30秒  
               dataType:"json",//设置返回数据的格式  
               //请求成功后的回调函数 data为json格式  
               success:function(data){  
                  var shopname=data.shopname;
                  var username=data.username;
                  var truename=data.truename;
                 $("#userid").val(username);
                 $("#shopid").val(shopname);
                 $("#truename").val(truename);
              },  
              //请求出错的处理  
              error:function(){  
                        alert("请求出错");  
              }  
           });  
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
			alert("请登录！");
			window.location = "jsp/login.jsp";
		}else{
			document.getElementById("p_title").innerHTML = '欢迎回来,'+title+'<a href="UserCtrl?action=logout">退出登陆</a>';
		}
	});
</script>
 	<p align = "center" class = "ziti">店铺信息</p>
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
			    <td><a href="Underctrl?userid=<%=value %>">下架商品</a></td>  
			</tr>   
		</table>
    	
    	
    <div class="div1">
    	<table class="info">
    	<tr>	
    		<th colspan="2">店铺信息</th>
    		</tr>
    	<tr>
    		<td>店铺名字:</td><td><input type="text"  disabled class="shopid" id="shopid" name="shopid"></td>
    	</tr>
    	<tr><td>开户人：</td><td><input type="text"  disabled class="userid" id="userid" name="userid"></td>
    		</tr>
    	<tr>
    		<td>真实姓名:</td><td><input type="text" disabled name="truename" id="truename" class="truename"></td>
    		</tr>
    	</table>
    </div>
  </body>
</html>
