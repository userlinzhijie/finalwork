<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.*" %>
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
	<link href="css/putonsale.css" rel="stylesheet" type="text/css">
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
           
       function judge(){	
       		var count=0;			
			for(var i=0;i<23;i++)
			{
				if(document.getElementsByTagName("input")[i].value!="")
				{
					count++;
				}
			}
			if(count==23)
				document.getElementById("sub").disabled=false;		
			else
				document.getElementById("sub").disabled=true;
		};
		
		$(document).ready(function(){
		  $(".keyboard").click(function(){
		    $(".standard1").show();
		    $(".standard2").hide();
		    $(".standard").hide();
		  });
		  $(".mouse").click(function(){
		    $(".standard2").show();
		    $(".standard1").hide();
		    $(".standard").hide();
		    $("input[name=standard][value=光电]").attr("checked",true)
		  });
		});
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
		 $("#user_id").val(<%=value%>);
		if (title == "游客") {
			alert("请登录！");
			window.location = "jsp/login.jsp";
		}else{
			document.getElementById("p_title").innerHTML = '欢迎回来,'+title+'<a href="UserCtrl?action=logout">退出登陆</a>';
		}
	});
</script>
 	<p align = "center" class = "ziti">上架商品</p>
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
	<form action="Uploadctrl" method="post" enctype="multipart/form-data">
	<input type = "hidden" name="user_id" id="user_id" value="">
    	<table class="info">
    	<tr>	
    		<th colspan="2">上架商品</th>
    		</tr>
    	<tr>
    		<td>名字:</td><td><input type="text" name="name" onchange="judge()"></td>
    	</tr>
    	<tr>
    		<td>价格(￥):</td><td><input type="text" name="price" onchange="judge()" onkeyup="value=value.replace(/[^\d.]/g,'')" ></td>
    	</tr>
    	<tr>
    		<td>种类:</td><td>
    		<input type="radio" name="type" value = "键盘" onchange="judge()" class="keyboard" checked>键盘
    		<input type="radio" name="type" value = "鼠标" onchange="judge()" class="mouse">鼠标
    		</td>
    		</tr>
    	<tr>
    		<td>品牌:</td><td><input type="text" name="brand" onchange="judge()"></td>
    	</tr>
    	<tr>
    		<td>版本:</td><td><input type="text" name="version" onchange="judge()"></td>
    	</tr>
    	<tr>
    		<td>标准:</td><td>
    		<p class="standard1" ><input type="radio" name="standard" value = "104键" onchange="judge()" checked>104键
    		<input type="radio" name="standard" value = "87键" onchange="judge()" >87键</p>
    		<p class="standard2" hidden><input type="radio" name="standard" value = "光电" onchange="judge()"  >光电
    		<input type="radio" name="standard" value = "激光" onchange="judge()" >激光</p>
    		</td>
    	</tr>
    	<tr>
    		<td>接口方式:</td><td>
    		<input type="radio" name="inter" value = "USB" onchange="judge()"  checked>USB
    		<input type="radio" name="inter" value = "无线" onchange="judge()" >无线
    		</td>
    	</tr>
    	<tr>
    		<td>颜色:</td><td><input type="text" name="color" onchange="judge()"></td>
    		</tr>
    	<tr>
    		<td>背光:</td><td><input type="text" name="backlight" onchange="judge()"></td>
    	</tr>
    	
    	<tr>
    		<td>人体学工程:</td><td>
    		<input type="radio" name="ergo" value = "支持" onchange="judge()"  checked>支持
    		<input type="radio" name="ergo" value = "不支持" onchange="judge()" >不支持
    		</td>
    	</tr>
    	<tr>
    		<td>尺寸:</td><td><input type="text" name="size" onchange="judge()"></td>
    	</tr>
    	<tr>
    		<td>重量:</td><td><input type="text" name="weight" onchange="judge()"></td>
    	</tr>
    	<tr>
    		<td>材质:</td><td><input type="text" name="material" onchange="judge()"></td>
    	</tr>
    	<tr>
    		<td>细节描述:</td><td><textarea name="details" onchange="judge()" rows="5" cols="19"></textarea></td>
    	</tr>
    	<tr>
    		<td>商品图片名:</td><td><input type="text" name="picture" onchange="judge()"></td>
    		</tr>
    	<tr>
    		<td colspan="2"><input type="file" name="file" id="upfile" onchange="judge()"></td>
    		</tr>
    	<tr>
    		<th colspan="2"><input type="submit" value="上传"  id ="sub" class="infosub"  disabled="true"></th>
    		</tr>
    	</table>
    </form>
    </div>
    	<c:if test = "${MSG!=null}">
    			<script>alert("${MSG}");</script>
    			<% session.setAttribute("MSG", null);%>
    	</c:if>
  </body>
</html>
