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
	String array_g = request.getParameter("arr_g");
	String array_n = request.getParameter("arr_n");
	String array_s = request.getParameter("arr_s");
	String array_v = request.getParameter("arr_v");
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
<script language="javascript" type="text/javascript">
	 function numberadd(){
			document.getElementById("num").value++;
			$("#number").val(document.getElementById("num").value);
			$("#tprice").text($("#sprice").text()*$("#number").val());
			$("#arr_v").val($("#tprice").text());
			$("#cc_total").text($("#tprice").text());
		}
		
		function numberreduce(){
			if(document.getElementById("num").value>1)
			document.getElementById("num").value--;
			$("#number").val(document.getElementById("num").value);
			$("#tprice").text($("#sprice").text()*$("#number").val());
			$("#arr_v").val($("#tprice").text());
			$("#cc_total").text($("#tprice").text());
		}
		function numberchange(){
			if(document.getElementById("num").value<0||document.getElementById("num").value=="")
			document.getElementById("num").value=1;
			$("#number").val(document.getElementById("num").value);
			$("#tprice").text($("#sprice").text()*$("#number").val());
			$("#arr_v").val($("#tprice").text());
			$("#cc_total").text($("#tprice").text());
		}
	</script>
<script language="javascript" type="text/javascript">
	function a1(i,max,id){
		for(var j=0;j<max;j++){
			$("#address"+j).removeClass("next_active");$("#address"+j).addClass("next");
			$("#ads"+j).hide();
			$("#setdf"+j).hide();
		}
		$("#address"+i).addClass("next_active");
		$("#ads"+i).show();
		$("#setdf"+i).show();
		$("#aid").val(id);
		document.getElementById("last").disabled=false;
	};
$.ajax({  
        type:"get",//请求方式  
        url:"UserCtrl?action=getaddress&user_id=<%=value%>",//发送请求地址  
				dataType : "json",
				data : {//发送给数据库的数据  
				},
				//请求成功后的回调函数有两个参数  
				success : function(data) {
					var objs = eval(data); //解析json对象  
					var obj = objs.address;

					var div = $("#tab2");

					for ( var i = 0; i < obj.length; i++) {
						var de_fault = "";
						if (obj[i].de_fault == 1)
							de_fault = "默认地址";
						else
							de_fault = "<a href='UserCtrl?action=setdefault_address&id="+obj[i].id+"'> 设为默认地址 </a> ";
						div.append('<div class="next_group" onclick="a1(' + i + ',' + obj.length + ',' + obj[i].id + ')" id="address' + i + '"><p class="address"><span id="ads' + i + '" style="display:none">√</span>  收货地址：:' + obj[i].province + ' ' + obj[i].city + ' ' + obj[i].dist + ' ' + obj[i].street + '( ' + obj[i].name + ' 收)   ' + obj[i].telephone + '  <span id="setdf' + i + '">' + de_fault + '</span></p><div>');
					}
				}
			});
			
			//获取物品信息
			$.ajax({  
        type:"get",//请求方式  
        url:"UserCtrl?action=getgoods&arr_n=<%=array_n%>&arr_g=<%=array_g%>",//发送请求地址  
				dataType : "json",
				data : {//发送给数据库的数据  
				},
				//请求成功后的回调函数有两个参数  
				success : function(data) {
					var objs = eval(data); //解析json对象  
					var obj = objs.goods;

					var div = $("#tab2");

					for ( var i = 0; i < obj.length; i++) {
						$("#name").text(obj[i].name);
						$("#sprice").text(obj[i].price);
						$("#tprice").text(obj[i].price*obj[i].number);
					}
				}
			});
			
			//获取银行卡
			function c1(i, max, id) {
			   	 for (var j = 0; j < max; j++) {
			        $("#card" + j).removeClass("next_active");
			        $("#card" + j).addClass("next");
			    }
			    $("#card" + i).addClass("next_active");
			    $("#cid").val(id);
			    //document.getElementById("step3").disabled = false;
			};
			$.ajax({
			    type: "get", //请求方式  
			    url: "UserCtrl?action=getcard&user_id=<%=value%>", //发送请求地址  
			    dataType: "json",
			    data: { //发送给数据库的数据  
			    },
			    //请求成功后的回调函数有两个参数  
			    success: function(data) {
			        var objs = eval(data); //解析json对象  
			        var obj = objs.card;
			        var div = $("#tab3");
			        for (var i = 0; i < obj.length; i++) {
			            var id = obj[i].id;
			            id=id.slice(id.length-4, id.length);
			            var idmax='"'+obj[i].id+'"';
			            var de_fault = "";
						if (obj[i].de_fault == 1)
							de_fault = "默认银行卡";
						else
							de_fault = "<a href='UserCtrl?action=setdefault_card&id="+obj[i].id+"'> 设为默认银行卡 </a> ";
							
			            div.append("<div onclick='c1(" + i + "," + (obj.length+1) + "," + idmax + ")' class='next_group' id='card" + i + "'><p class='card'><span id='cds" + i + "' style='display:none'>√</span> 持卡人:" + obj[i].name + "    尾号" + id + "   所属银行："+obj[i].bank+" 预留电话："+obj[i].phone+"<span id='setdf" + i +"'>" + de_fault + "</span></p><div>");
			        }
			        div.append("<div onclick='c1(" + obj.length + "," + obj.length+1 + "," + idmax + ")' class='next_group' id='card" + obj.length + "'><p class='card'><span id='cds" + obj.length + "' style='display:none'>√</span>支付宝/微信  扫码支付<span id='setdf" + obj.length +"'>(推荐方式)</span></p><div>");
			        
			    }
			});
</script>

</head>


<body background="img/background2.jpg">
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
	<p align="center" class="ziti">立即购买</p>
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
 	</ul>
	<br>
	<br>
	<br>


	<div class="Content">

	<div class="div_cart">
			<table class="info_cart" id="address_top_table">
				<tr>
					<td><strong>选择收货地址</strong></td>
					<td></td>
					<td align="right"><a href="jsp/address.jsp">管理收货地址</a></td>
				</tr>
			</table>
		</div>
		

		<div class="div_cart" id="tab2">
			<!-- 选择地址 -->

		</div>

	<div class="div_cart">
			<table class="info_cart" id="address_top_table">
				<tr>
					<td><strong>选择支付方式</strong></td>
					<td></td>
					<td align="right"><a href="jsp/card.jsp">管理银行卡</a></td>
				</tr>
			</table>
		</div>
		

		<div class="div_cart" id="tab3">
			<!-- 选择支付 -->

		</div>
		<div class="div_cart">
			<table class="info_cart" id="goods_top_table">
				<tr>
					<th>商品</th>
					<th>单价</th>
					<th>数量</th>
					<th>小计</th>
					<th>操作</th>
				</tr>
			</table>
		</div>
		
		<div class="div_cart">
			<form action="UserCtrl" method="post">
				<input type="hidden" name="action" value="add_order"> <input
					type="hidden" name="mode" id="mode" value="0"> <input
					type="hidden" name="address_id" id="aid" value="0"> <input
					type="hidden" name="card_id" id="cid" value="default"> <input
					type="hidden" name="user_id" id="uid" value="<%=value%>"> <input
					type="hidden" name="status" id="status" value="1"> <input
					type="hidden" name="arr_v" id="arr_v" value="<%=array_v%>">
				<input type="hidden" name="arr_n" id="number" value="<%=array_n%>">
				<input type="hidden" name="transfee" id="transfee" value="0">
				<input type="hidden" name="arr_g" id="arr_g" value="<%=array_g%>">
				<input type="hidden" name="arr_s" id="arr_s" value="<%=array_s%>">

				<div class="">
					<ul class="ul_cart">
						<li class="ul_cart_goods"><img class="ul_cart_goods_img">
							<a href="Pagectrl?id=<%=array_g%>"><label id="name">加载中。。。</label></a>
						</li>
						<li class="ul_cart_price"><strong id="sprice">单价</strong></li>
						<li class="ul_cart_num">
							<table>
								<tr>
									<td rowspan="2">数量:</td>
									<td rowspan="2"><input type="text" width="50px" id="num"
										class="number" value="1" onchange="numberchange()"
										onkeyup="this.value=this.value.replace(/\D/g,'+')">
									</td>
									<td><input type="button" value="+" class="btn"
										onclick="numberadd()">
									</td>
									<td rowspan="2"></td>
									<td rowspan="2"></td>
								</tr>
								<tr>
									<td><input type="button" value="-" class="btn"
										onclick="numberreduce()">
									</td>
								</tr>
							</table>
						</li>
						<li class="ul_cart_total" id="tprice">￥小计</li>
						<li class="ul_cart_do">
						<p>
						</p>
						</li>
					</ul>
				</div>
				<div class="next_bottom" align="right">
					<table>
					<tr><th>全程包邮  邮费：￥0<th></tr>
						<tr>
							<th colspan="3">共计：￥<label id="cc_total">总价</label>
							</th>
							<th colspan="2"><input type="submit" id="last" value="下单" disabled>
							</th>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
