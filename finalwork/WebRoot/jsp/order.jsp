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
	   <script>
	function h0(){
	$("#s0").addClass("blue");$("#s1").removeClass("blue");$("#s2").removeClass("blue");$("#s3").removeClass("blue");$("#s4").removeClass("blue");
	$("#tab1").show();$("#tab2").show();$("#tab3").show();$("#tab4").show();$("#tab0").show();
	};
	function h1(){
	$("#s1").addClass("blue");$("#s0").removeClass("blue");$("#s2").removeClass("blue");$("#s3").removeClass("blue");$("#s4").removeClass("blue");
	$("#tab1").show();$("#tab2").hide();$("#tab3").hide();$("#tab4").hide();$("#tab0").hide();
	};
	function h2(){
	$("#s2").addClass("blue");$("#s1").removeClass("blue");$("#s0").removeClass("blue");$("#s3").removeClass("blue");$("#s4").removeClass("blue");
	$("#tab2").show();$("#tab1").hide();$("#tab3").hide();$("#tab4").hide();$("#tab0").hide();
	};
	function h3(){
	$("#s3").addClass("blue");$("#s1").removeClass("blue");$("#s2").removeClass("blue");$("#s0").removeClass("blue");$("#s4").removeClass("blue");
	$("#tab3").show();$("#tab1").hide();$("#tab2").hide();$("#tab4").hide();$("#tab0").hide();
	};
	function h4(){
	$("#s4").addClass("blue");$("#s1").removeClass("blue");$("#s2").removeClass("blue");$("#s3").removeClass("blue");$("#s0").removeClass("blue");
	$("#tab4").show();$("#tab1").hide();$("#tab2").hide();$("#tab3").hide();$("#tab0").hide();
	};
  	</script>
  	<script language="javascript" type="text/javascript">
$.ajax({  
        type:"get",//请求方式  
        url:"UserCtrl?action=getorder&user_id=<%=value%>",//发送请求地址  
        dataType:"json",  
        data:{//发送给数据库的数据  
        },  
        //请求成功后的回调函数有两个参数  
        success:function(data){  
            var objs=eval(data); //解析json对象  
            var obj = objs.order;  
            
            var table = $("#order_table");  
 			table.append('<tr><th onclick="h0()" id="s0" class="blue">所有订单</th><th onclick="h1()" id="s1">待付款</th><th onclick="h2()" id="s2">待发货</th><th onclick="h3()" id="s3">待收货</th><th onclick="h4()" id="s4">待评价</th></tr>');
          
          	var div0 = $("#tab0");
            var div1 = $("#tab1");  
            var div2 = $("#tab2");  
            var div3 = $("#tab3");  
            var div4 = $("#tab4");  
            for(var i=0;i< obj.length;i++){
            	if(obj[i].status==1){	
            		div1.append('<div><table class="next" id="t'+i+'"><tr><th>订单id：</th><th>地址：</th><th>共计：</th><th>邮费：</th><th>交易时间：</th><th>操作</th></tr><tr><th>'+obj[i].id+'</th><th>'+obj[i].address_id+'</th><th>￥'+obj[i].total+'</th><th>￥'+obj[i].transfee+'</th><th>'+obj[i].date+'</th><th><a href="UserCtrl?action=oTo2&id='+obj[i].id+'">一键付款</a>/<a href="UserCtrl?action=oTo5&id='+obj[i].id+'">退单</a></th></tr></table></div>');
            		$("#t"+i).append('<tr><th>'+obj[i].name+'</th><th>'+obj[i].price+'</th><th>×'+obj[i].number+'</th><th><a href="jsp/orderinfo.jsp?id='+obj[i].id+'">订单详情</a></th></tr>');	
            	}else if(obj[i].status==2){
 					div2.append('<div><table class="next" id="t'+i+'"><tr><th>订单id：</th><th>地址：</th><th>共计：</th><th>邮费：</th><th>交易时间：</th><th>操作</th></tr><tr><th>'+obj[i].id+'</th><th>'+obj[i].address_id+'</th><th>￥'+obj[i].total+'</th><th>￥'+obj[i].transfee+'</th><th>'+obj[i].date+'</th><th><a href="UserCtrl?action=oTo6&id='+obj[i].id+'">提醒发货</a></th></tr></table></div>');
           			$("#t"+i).append('<tr><th>'+obj[i].name+'</th><th>'+obj[i].price+'</th><th>×'+obj[i].number+'</th><th><a href="jsp/orderinfo.jsp?id='+obj[i].id+'">订单详情</a></th></tr>');
           		}else if(obj[i].status==3){
 					div3.append('<div><table class="next" id="t'+i+'"><tr><th>订单id：</th><th>地址：</th><th>共计：</th><th>邮费：</th><th>交易时间：</th><th>操作</th></tr><tr><th>'+obj[i].id+'</th><th>'+obj[i].address_id+'</th><th>￥'+obj[i].total+'</th><th>￥'+obj[i].transfee+'</th><th>'+obj[i].date+'</th><th><a href="UserCtrl?action=oTo4&id='+obj[i].id+'">确认收货</a>/<a href="jsp/translog.jsp">查看物流</a></th></tr></table></div>');
            		$("#t"+i).append('<tr><th>'+obj[i].name+'</th><th>'+obj[i].price+'</th><th>×'+obj[i].number+'</th><th><a href="jsp/orderinfo.jsp?id='+obj[i].id+'">订单详情</a></th></tr>');
            	}else if(obj[i].status==4){
 					div4.append('<div><table class="next" id="t'+i+'"><tr><th>订单id：</th><th>地址：</th><th>共计：</th><th>邮费：</th><th>交易时间：</th><th>操作</th></tr><tr><th>'+obj[i].id+'</th><th>'+obj[i].address_id+'</th><th>￥'+obj[i].total+'</th><th>￥'+obj[i].transfee+'</th><th>'+obj[i].date+'</th><th><a href="UserCtrl?action=oTo7&id='+obj[i].id+'">评价商品</a></th></tr></table></div>');
           			$("#t"+i).append('<tr><th>'+obj[i].name+'</th><th>'+obj[i].price+'</th><th>×'+obj[i].number+'</th><th><a href="jsp/orderinfo.jsp?id='+obj[i].id+'">订单详情</a></th></tr>');
           		}else if(obj[i].status==5){
           			div0.append('<div><table class="next" id="t'+i+'"><tr><th>订单id：</th><th>地址：</th><th>共计：</th><th>邮费：</th><th>交易时间：</th><th>操作</th></tr><tr><th>'+obj[i].id+'</th><th>'+obj[i].address_id+'</th><th>￥'+obj[i].total+'</th><th>￥'+obj[i].transfee+'</th><th>'+obj[i].date+'</th><th><a href="UserCtrl?action=del_order&id='+obj[i].id+'">删除订单</a>（不可撤销）</th></tr></table></div>');
            		$("#t"+i).append('<tr><th>'+obj[i].name+'</th><th>'+obj[i].price+'</th><th>×'+obj[i].number+'</th><th><a href="jsp/orderinfo.jsp?id='+obj[i].id+'">订单详情</a></th></tr>');
           		}else if(obj[i].status==6){
           			div0.append('<div><table class="next" id="t'+i+'"><tr><th>订单id：</th><th>地址：</th><th>共计：</th><th>邮费：</th><th>交易时间：</th><th>操作</th></tr><tr><th>'+obj[i].id+'</th><th>'+obj[i].address_id+'</th><th>￥'+obj[i].total+'</th><th>￥'+obj[i].transfee+'</th><th>'+obj[i].date+'</th><th>已提醒（无法再次提醒）</th></tr></table></div>');
            		$("#t"+i).append('<tr><th>'+obj[i].name+'</th><th>'+obj[i].price+'</th><th>×'+obj[i].number+'</th><th><a href="jsp/orderinfo.jsp?id='+obj[i].id+'">订单详情</a></th></tr>');
           		}else if(obj[i].status==7){
           			div0.append('<div><table class="next" id="t'+i+'"><tr><th>订单id：</th><th>地址：</th><th>共计：</th><th>邮费：</th><th>交易时间：</th><th>操作</th></tr><tr><th>'+obj[i].id+'</th><th>'+obj[i].address_id+'</th><th>￥'+obj[i].total+'</th><th>￥'+obj[i].transfee+'</th><th>'+obj[i].date+'</th><th><a href="UserCtrl?action=del_order&id='+obj[i].id+'">删除订单</a>（不可撤销）</th></tr></table></div>');
            		$("#t"+i).append('<tr><th>'+obj[i].name+'</th><th>'+obj[i].price+'</th><th>×'+obj[i].number+'</th><th><a href="jsp/orderinfo.jsp?id='+obj[i].id+'">订单详情</a></th></tr>');
           		}else if(obj[i].status==8){//del	
           		}else if(obj[i].status==89){//del
           		}else if(obj[i].status==9){
           			div0.append('<div><table class="next" id="t'+i+'"><tr><th>订单id：</th><th>地址：</th><th>共计：</th><th>邮费：</th><th>交易时间：</th><th>操作</th></tr><tr><th>'+obj[i].id+'</th><th>'+obj[i].address_id+'</th><th>￥'+obj[i].total+'</th><th>￥'+obj[i].transfee+'</th><th>'+obj[i].date+'</th><th><a href="UserCtrl?action=del_order&id='+obj[i].id+'">删除订单</a>（不可撤销）</th></tr></table></div>');
            		$("#t"+i).append('<tr><th>'+obj[i].name+'</th><th>'+obj[i].price+'</th><th>×'+obj[i].number+'</th><th><a href="jsp/orderinfo.jsp?id='+obj[i].id+'">订单详情</a></th></tr>');
           		}
            }  
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
 	<p align = "center" class = "ziti">订单管理</p>
 	<ul id="ul1">
	    <li class="subme">
	          <a href="Shoporderctrl?user_id=<%=value%>">店铺订单</a> 
	          <div class ="submenu"><a href="#">01 </a><a href="#">02 </a><a href="#">03</a></div>        
	    </li>
	    <li class="subme">
	          <a href="jsp/shopinfo.jsp">店铺中心</a>
	          <div class ="submenu"><a href="jsp/shopinfo.jsp">店铺信息</a><a href="jsp/putonsale.jsp">上架货物</a><a href="Pagectrl?userid=<%=value %>">下架货物</a></div>
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
		<table class="next" id="order_table"></table>
		
    </div>
    <div class="div2" id="tab0">
    </div>
	<div class="div2" id="tab1">
    </div>
    
    <div class="div2" id="tab2">
    </div>
    
    <div class="div2" id="tab3">
    </div>
	
	<div class="div2" id="tab4">
    </div>
  </body>
</html>
