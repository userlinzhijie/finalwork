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
    
    <title>更改密码</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/info_selectlist.css" rel="stylesheet" type="text/css">
	<link href="css/styles.css" rel="stylesheet" type="text/css" >
	<link href="css/info.css" rel="stylesheet" type="text/css">
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
  	 <script type="text/javascript">
    function check(){
    	if($("#tag").val()!="")
    		document.getElementById("limit").disabled=false;
    	else
    		document.getElementById("limit").disabled=true;
    }
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
 	<p align = "center" class = "ziti">反馈意见</p>
 	<ul id="ul1">
    <li class="subme">
          <a href="Shoporderctrl?user_id=<%=value %>">店铺订单</a>     
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
          <a href="#">首页</a>
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
			<tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">  
			    <td><a href="jsp/address.jsp">地址管理</a></td>  
			</tr>
			<tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">  
			    <td><a href="jsp/card.jsp">快捷支付</a></td>  
			</tr>
			<tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">  
			    <td><a href="jsp/order.jsp">订单管理</a></td>  
			</tr>
			<tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">  
			    <td><a href="jsp/collect.jsp">收藏</a></td>  
			</tr>
			<tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">  
			    <td><a href="jsp/advice.jsp">意见反馈</a></td>  
			</tr>
		</table>
		
	<div class="div1">
	<form action="UserCtrl" method="post">
		<input type="hidden" name="action" value="add_advice">
	
    	<table class="info_advice">
    	
	    	<tr>	
	    		<th colspan="2">反馈建议</th>
	    	</tr>
	    	
	    	<tr><th><br></th></tr>
	    	
	    	<tr>
	    		<td>意见类型：</td><td><input type="text" id="tag" name="tag" onchange="check()" placeholder="请输入意见的类型"></td>
	    	</tr>
	    		
	    	<tr><th><br></th></tr>
	    		
	    	<tr>
	    		<td>意见内容：</td><td><textarea style="width:300px;height:300px;" id="details" name="details" placeholder="输入您的意见，协助我们提供您更好的服务"></textarea></td>
	    	</tr>
	    		
	    	<tr><th><br></th></tr>
	    	
	    	<tr>
	    		<th colspan="2"><input type="submit" value="反馈意见" id="limit" disabled></th>
	    	</tr>
    	</table>
    </form>
    </div>
   
  </body>
</html>
