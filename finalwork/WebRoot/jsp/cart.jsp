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
	$.ajax({  
        type:"get",//请求方式  
        url:"UserCtrl?action=getcart&user_id=<%=value %>",//发送请求地址  
        dataType:"json",  
        data:{//发送给数据库的数据  
        },  
        //请求成功后的回调函数有两个参数  
        success:function(data){  
            var objs=eval(data); //解析json对象  
            var obj = objs.cartlog;  
            var total=0;
            var str="";
            var str1="";
            var div=$("#tab");
            length=obj.length;
            var table=$("#cart_table");
            table.empty();
            table.append('<tr><th>商品</th><th>单价</th><th>数量</th><th>小计</th><th>操作</th></tr>');
         	for(var i=0;i< obj.length;i++)
         	{
         	total=total+obj[i].price*obj[i].number;

         	table.append('<tr><th><a href="Pagectrl?id='+obj[i].goods_id+'">'+obj[i].name+'</a></th><th>￥'+obj[i].price+'</th><th>'+obj[i].number+'</th><th>￥'+obj[i].price*obj[i].number+'</th><th><a href="UserCtrl?action=add_collect&user_id=<%=value%>&goods_id='+obj[i].goods_id+'">收藏</a>/<a href="UserCtrl?action=del_cart&id='+obj[i].id+'">删除</a></th></tr>');

         	table.append('<tr><th>'+obj[i].name+'</th><th>￥'+obj[i].price+'</th><th>'+obj[i].number+'</th><th>￥'+obj[i].price*obj[i].number+'</th><th><a href="UserCtrl?action=add_collect&user_id=<%=value%>&goods_id='+obj[i].goods_id+'">收藏</a>/<a href="UserCtrl?action=del_cart&id='+obj[i].id+'">删除</a></th></tr>');
         	
         	div.append('<div class=""><ul class="ul_cart"><li class="ul_cart_goods"><img class="ul_cart_goods_img"><a>'+obj[i].name+'</a></li><li class="ul_cart_black"></li><li class="ul_cart_price">￥'+obj[i].price+'</li><li class="ul_cart_num">×'+obj[i].number+'</li><li class="ul_cart_total">￥'+obj[i].price*obj[i].number+'</li><li class="ul_cart_do"><p><a href="UserCtrl?action=add_collect&user_id=<%=value%>&goods_id='+obj[i].goods_id+'">收藏</a></p><p><a href="UserCtrl?action=del_cart&id='+obj[i].id+'">删除</a></p></li></ul></div>');
         	

         	str=str.concat(obj[i].goods_id+'_');
         	str1=str1.concat(obj[i].number+'_');
         	}
         	str=str.slice(0, str.length-1);
         	str1=str1.slice(0, str1.length-1);
         	document.getElementById("array_g").value=str;
         	document.getElementById("array_n").value=str1;
         	table.append('<tr><th colspan="3">共计：￥<label id="cc_total">'+total+'</label></th><th colspan="2"><input type="submit" value="结算"></th></tr>');
        }
       }); 
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
 	<p align = "center" class = "ziti">购物车</p>
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
    	
    	
    	<div class="Content">
    <div class="div_cart">
	<form action="jsp/pay.jsp" method="get">
		<input type="hidden" name="id" value="<%=value%>">
		<input type="hidden" name="array_g" id="array_g" value="">
		<input type="hidden" name="array_n" id="array_n" value="">
		<table class="info_cart" id="cart_table">
		</table>
	</form>
    </div>
     	
    <div class="div_cart">
		<table class="info_cart" id="order_table">
		<tr><th>商品</th><th>单价</th><th>数量</th><th>小计</th><th>操作</th></tr>
		</table>
		
    </div>
    <div class="div_cart" id="tab">
    </div>
    </div>
  </body>
</html>
