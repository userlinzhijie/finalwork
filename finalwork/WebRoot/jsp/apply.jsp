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
    
    <title>申请开铺</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/info_selectlist.css" rel="stylesheet" type="text/css">
	<link href="css/styles.css" rel="stylesheet" type="text/css" >
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
        };  
        
        $.ajax({  
        type:"get",//请求方式  
        url:"UserCtrl?action=getshop&user_id=<%=value%>",//发送请求地址  
        dataType:"json",    
        //请求成功后的回调函数有两个参数  
        success:function(data){  
			var s=data.shop;
            if(s=="one"){
	            var table = $("#shop_table");  
	 			table.empty();
	 			var status;
	 			if(data.status==0)status="审核中。。。";
	 			if(data.status==1)status="营业中。。。";
	 			if(data.status==2)status="打烊中。。。";
	          	table.append('<tr><th>店铺id：'+data.shop_id+'</th></tr><tr><th>店铺名：'+data.name+'</th></tr><tr><th>店铺状态:'+status+'</th></tr>');
            }
        }  
       });
  	</script>
  	
  	<script type="text/javascript">
	function s() {
		alert("法律协议如下..");
	}
	function c() {
		if (document.getElementById("checktosubmit").checked)
			document.getElementById("csubmit").disabled=false;
		else{
			document.getElementById("csubmit").disabled=true;
			}
	}
	</script>

  </head>
  
  <body>
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
 	<p align = "center" class = "ziti">申请开铺</p>
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
	
	<div class="div2">
	<form action="UserCtrl" method="post">
	<input type="hidden" name="action" value="shopapply"> 
	<input type="hidden" name="user_id" value="<%=value%>">
	<input type="hidden" name="status" value="0">
    	<table class="info" id="shop_table">
    	<tr>	
    		<th colspan="2">申请开铺</th>
    	</tr>
    	<tr>	
    		<th colspan="2"><input type="text" name="name" placeholder="输入店铺名"></th>
    	</tr>
    	<tr>
    		<td>请阅读以下法律协议，同意后才能开铺</td>
    		</tr>
    	<tr>
    		<td><label><input type="checkbox" onclick="c()" id="checktosubmit">我同意</label>
    		<a  onclick="s()" >法律协议</a> 
    	<tr>
    		<th colspan="2"><input type="submit" value="申请" class="infosub" disabled id="csubmit"></th>
    		</tr>
    	</table>
    </form>
    </div>
  </body>
</html>
