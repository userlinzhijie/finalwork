<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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

<link href="css/styles.css" rel="stylesheet" type="text/css">
<link href="css/info_selectlist.css" rel="stylesheet" type="text/css">
<link href="css/info.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<link href="css/detail.css" rel="stylesheet" type="text/css">
<%
	Cookie[] cookies = null;
	cookies = request.getCookies();
	String value = "none";
	for (int i = 0; i < cookies.length; i++) {
		String name = URLDecoder.decode(cookies[i].getName(), "utf-8");
		if (name.equals("user_id")) {
			value = URLDecoder.decode(cookies[i].getValue(), "utf-8");
		}
	}
	//传来的goods字符串
	int order_id = Integer.parseInt(request.getParameter("id"));
%>

<script type="text/javascript">
$.ajax({
			    type: "get", //请求方式  
			    url: "UserCtrl?action=getorderbyid&order_id=<%=order_id%>", //发送请求地址  
			    dataType: "json",
			    data: { //发送给数据库的数据  
			    },
			    //请求成功后的回调函数有两个参数  
			    success: function(data) {
			        var obj = eval(data); //解析json对象 
			 
			        //银行卡
			         $("#cn").text(obj.c_name);$("#ci").text(obj.c_id);
			         $("#cb").text(obj.c_bank);$("#ct").text(obj.c_phone);
			        //地址
			       	$("#ap").text(obj.a_province);$("#ac").text(obj.a_city);$("#ad").text(obj.a_dist);
			       	$("#as").text(obj.a_street);$("#an").text(obj.a_name);$("#at").text(obj.a_telephone);
			      	//商品信息
					$("#name").text(obj.g_name);$("#sprice").text(obj.g_price);$("#tprice").text(obj.total);
					$("#cc_total").text(obj.total);$("#ot").text(obj.transfee);
					if(obj.status==1){$("#status").text("未付款");}
					else if(obj.status==2){$("#status").text("待发货");}
					else if(obj.status==3){$("#status").text("待收货");}
					else if(obj.status==4){$("#status").text("待评价");}
					else if(obj.status==5){$("#status").text("已退单");}
					else if(obj.status==6){$("#status").text("已提醒发货");}
					else if(obj.status==7){$("#status").text("交易结束");}		
			    }
			});
</script>
</head>


<body>
	<div id="Header">
		<div id="logo">
			<p align="right">&nbsp;
			<p>
			<p align="right" id="p_title">loading...
			<p>
		</div>
	</div>
	<script>
		$("#p_title").load(
				"UserCtrl?action=getusercookie",
				function() {
					var title = document.getElementById("p_title").innerHTML;
					if (title == "游客") {
						alert("请登录！");
						window.location = "jsp/login.jsp";
					} else {
						document.getElementById("p_title").innerHTML = '欢迎回来,'
								+ title
								+ '<a href="UserCtrl?action=logout">退出登陆</a>';
					}
					;
				});
	</script>
	<p align="center" class="ziti">订单详情</p>
	<ul id="ul1">
		<li class="subme"><a href="jsp/login.jsp">店铺订单</a>
			<div class="submenu">
				<a href="#">01 </a><a href="#">02 </a><a href="#">03</a>
			</div>
		</li>
		<li class="subme"><a href="">店铺中心</a>
			<div class="submenu">
				<a href="jsp/shopinfo.jsp">店铺信息</a><a href="jsp/putonsale.jsp">上架货物</a><a
					href="">下架货物</a>
			</div>
		</li>
		<li class="subme"><a href="jsp/cart.jsp">购物车</a>
		</li>
		<li class="subme"><a href="jsp/info.jsp">我的中心</a>
		</li>
		<li class="subme"><a href="">首页</a>
		</li>
	</ul>
	<br>
	<br>
	<br>


	<div class="Content">

	<div class="div_cart">
			<table class="info_cart" id="address_top_table">
				<tr>
					<td><strong>收货地址</strong></td>
					<td></td>
					<td align="right"><a href="jsp/address.jsp">管理收货地址</a></td>
				</tr>
			</table>
		</div>
		

		<div class="div_cart" id="tab2">
			<!-- 选择地址 -->
			<div class="next_group" id="card" >
			<p class="address"> 收货地址：:<span id="ap"> obj[i].province</span> <span id="ac">obj[i].city</span> <span id="ad">obj[i].dist</span><span id="as">obj[i].street</span> (<span id="an"> obj[i].name </span> 收) <span id="at"> obj[i].telephone </span> </p></div>
		</div>

	<div class="div_cart">
			<table class="info_cart" id="address_top_table">
				<tr>
					<td><strong>支付方式</strong></td>
					<td></td>
					<td align="right"><a href="jsp/card.jsp">管理银行卡</a></td>
				</tr>
			</table>
		</div>
		

		<div class="div_cart" id="tab3">
			<!-- 选择支付 -->
			<div class="next_group" id="card" >
			<p class="card" id="card_p">持卡人:<span id="cn">obj[i].name</span>     尾号<span id="ci">obj[i].id(4位)</span>   所属银行：<span id="cb">obj[i].bank</span> 预留电话：<span id="ct">obj[i].telephone</span></p></div>
		</div>
		
		<div class="div_cart">
			<table class="info_cart" id="goods_top_table">
				<tr>
					<th>商品</th>
					<th>单价</th>
					<th>数量</th>
					<th>小计</th>
					<th>状态</th>
				</tr>
			</table>
		</div>
		
		<div class="div_cart">
			
				<div class="">
					<ul class="ul_cart">
						<li class="ul_cart_goods"><img class="ul_cart_goods_img">
							<a href="Pagectrl?id=1"><label id="name">加载中。。。</label></a>
						</li>
						<li class="ul_cart_price"><strong id="sprice">单价</strong></li>
						<li class="ul_cart_num">
							&nbsp;&nbsp;&nbsp;&nbsp;<label id="num"	class="number" >11</label>
						</li>
						<li class="ul_cart_total" id="tprice">￥小计</li>
						<li class="ul_cart_do">
						<p>
						&nbsp;
						</p>
						<p>
						<strong id="status">代付款。。。</strong>
						</p>
						</li>
					</ul>
				</div>
				<div class="next_bottom" align="right">
					<table>
					<tr><th>全程包邮  邮费：￥<label id="ot">0</label><th></tr>
						<tr>
							<th colspan="3">共计：￥<label id="cc_total">总价</label>
						</tr>
						<tr>
							<th colspan="3"><a href="jsp/order.jsp"><button>返回</button></a></label>
						</tr>
					</table>
				</div>
		</div>
	</div>
</body>
</html>
