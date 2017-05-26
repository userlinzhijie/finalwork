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
            var table=$("#cart_table");
            table.empty();
             table.append('<tr><th colspan="3">选择收货地址</th><th colspan="3"><input type="radio" name="address">1<input type="radio" name="address">2</th></tr>');
             table.append('<tr><th colspan="3">选择付款方式</th><th colspan="3"><input type="checkbox">银行卡<input type="checkbox">支付宝</th></tr>');
             table.append('<tr><th colspan="3">选择物流方式</th><th colspan="3"><input type="checkbox">顺丰<input type="checkbox">圆通</th></tr>');
            table.append('<tr><th>选择</th><th>商品</th><th>单价</th><th>数量</th><th>小计</th><th>操作</th></tr>');
         	for(var i=0;i< obj.length;i++)
         	{
         	total=total+obj[i].price*obj[i].number;
         	table.append('<tr><th><input type="checkbox" id="c'+i+'" name="cartlog_id" value="'+obj[i].id+'"></th><th>'+obj[i].name+'</th><th>￥'+obj[i].price+'</th><th>'+obj[i].number+'</th><th>￥'+obj[i].price*obj[i].number+'</th><th>收藏/删除</th></tr>');
         	}
         	table.append('<tr><th><input type="checkbox" name="cartlog_id">全选</th><th colspan="3">共计：￥'+total+'</th><th colspan="2"><input type="submit" value="确认下单"></th></tr>');
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
			document.getElementById("p_title").innerHTML = '<a href="jsp/login.jsp">你好，请登录</a>&nbsp;&nbsp;<a href="jsp/reg.jsp">注册</a>&nbsp;&nbsp;&nbsp;';
		}else{
			document.getElementById("p_title").innerHTML = '欢迎回来,'+title+'<a href="UserCtrl?action=logout">退出登陆</a>';
		}
	});
</script>
 	<p align = "center" class = "ziti">下单</p>
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
    	
    	
    	
    <div class="div1">
	<form action="jsp/pay.jsp" method="post">
		<input type="hidden" name="action" value="order_add">
		<input type="hidden" name="id" value="<%=value%>">
		<table class="info" id="cart_table">
			<tr><th>checkbox</th><th>商品</th><th>单价</th><th>数量</th><th>小计</th><th>操作</th></tr>
			<tr><th><input type="checkbox"></th><th>例子键盘鼠标</th><th>￥111</th><th>2</th><th>￥222</th><th>收藏/删除</th></tr>
			<tr><th><input type="checkbox"></th><th>例子键盘鼠标</th><th>￥111</th><th>2</th><th>￥222</th><th>收藏/删除</th></tr>
			<tr><th><input type="checkbox">全选</th><th colspan="3">共计：￥444</th><th colspan="2"><input type="submit" value="结算"></th></tr>
		</table>
	</form>
    </div>
  </body>
</html>
