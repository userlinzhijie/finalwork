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
	<link href="css/detail.css" rel="stylesheet" type="text/css" >
	<%Cookie[] cookies = null;
		cookies = request.getCookies();
		String value="none";
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
	 <script language="javascript" type="text/javascript">
	 function arr_change(){
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
		            
					var arr_n="";
					var arr_v="";	
					var cc_total=0;
		         	for(var i=0;i< obj.length;i++)
		         	{
						var num = document.getElementById("num"+i).value;
		     	    	var total=obj[i].price*num;
		     	    	$("#price"+i).text("￥"+total);
		     	    	cc_total=cc_total+total;
		       	    	arr_n=arr_n.concat(num+"_");
						arr_v=arr_v.concat(total+"_");
		         	}
		         	arr_n=arr_n.slice(0, arr_n.length-1);
		         	arr_v=arr_v.slice(0, arr_v.length-1);
		         	document.getElementById("arr_n").value=arr_n;
		        	document.getElementById("arr_v").value=arr_v;
		        	$("#cc_total").text(cc_total);
		        },erro:function(){}
		    }); 
		};	
	 function numberadd(i){
			document.getElementById("num"+i).value++;
			arr_change();
		}
		
		function numberreduce(i){
			if(document.getElementById("num"+i).value>1)
			document.getElementById("num"+i).value--;
			arr_change();
		}
		function numberchange(i){
			if(document.getElementById("num"+i).value<0||document.getElementById("num"+i).value=="")
			document.getElementById("num"+i).value=1;
			arr_change();
		}
	</script>
		
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
            var cc_total=0;
            var str="";
            var str1="";
            var str2="";
            var str3="";
            var div=$("#tab");
            length=obj.length;
            var table=$("#cart_table");
  
            table.empty();
           //table.append('<tr><th>商品</th><th>单价</th><th>数量</th><th>小计</th><th>操作</th></tr>');
         	for(var i=0;i< obj.length;i++)
         	{
         	total=obj[i].price*obj[i].number;
         	cc_total=cc_total+total;
			str3=str3.concat(total+"_");
         	
            var part= '<table><tr><td rowspan="2">数量:</td><td rowspan="2"><input type="text" width="50px" id="num'+i+'" class="number"  value="'+obj[i].number+'" onchange="numberchange('+i+')" onkeyup="this.value=this.value.replace(/\D/g,'+')"></td><td><input type="button" value="+" class="btn" onclick="numberadd('+i+')"></td><td rowspan="2"></td><td rowspan="2"></td></tr><tr><td><input type="button" value="-" class="btn" onclick="numberreduce('+i+')"></td></tr></table>';
         	
            div.append('<div class=""><ul class="ul_cart"><li class="ul_cart_goods"><img class="ul_cart_goods_img" src="Showctrl?id='+obj[i].goods_id+'"><a href="Pagectrl?id='+obj[i].goods_id+'">'+obj[i].name+'</a></li><li class="ul_cart_price"><strong>￥'+obj[i].price+'</strong></li><li class="ul_cart_num">'+part+'</li><li class="ul_cart_total" id="price'+i+'">￥'+obj[i].price*obj[i].number+'</li><li class="ul_cart_do"><p><a href="UserCtrl?action=add_collect&user_id=<%=value%>&goods_id='+obj[i].goods_id+'">收藏</a></p><br><p><a href="UserCtrl?action=del_cart&id='+obj[i].id+'">删除</a></p></li></ul></div>');
            
         	str=str.concat(obj[i].goods_id+'_');
         	str1=str1.concat(obj[i].number+'_');
         	str2=str2.concat(obj[i].seller_id+'_');
         	}
         	str=str.slice(0, str.length-1);
         	str1=str1.slice(0, str1.length-1);
         	str2=str2.slice(0, str2.length-1);
         	str3=str3.slice(0, str3.length-1);
         	document.getElementById("arr_g").value=str;
         	document.getElementById("arr_n").value=str1;
         	document.getElementById("arr_s").value=str2;
        	document.getElementById("arr_v").value=str3;
         	if(obj.length==0){
         		table.append('<tr><th colspan="3">共计：￥<label id="cc_total">'+cc_total+'</label></th><th colspan="2">购物车空空如也。。。</th></tr>');
         	}else{
         		table.append('<tr><th colspan="3">共计：￥<label id="cc_total">'+cc_total+'</label></th><th colspan="2"><input type="submit" value="结算"></th></tr>');
         	}
        }
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
		if (title == "游客") {
			alert("请登录！");
			window.location = "jsp/login.jsp";
		}else{
			document.getElementById("p_title").innerHTML = '欢迎回来,'+title+'<a href="UserCtrl?action=logout">退出登陆</a>';
		};
	});
</script>
 	<p align = "center" class = "ziti">购物车</p>
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
    	
    	
    	<div class="Content">
     	
    <div class="div_cart">
		<table class="info_cart" id="order_table">
		<tr><th>商品</th><th>单价</th><th>数量</th><th>小计</th><th>操作</th></tr>
		</table>
		
    </div>
    
    <div class="div_cart" id="tab">
    </div>
    
      <div class="div_cart">
	<form action="jsp/pay.jsp" method="get">
		<input type="hidden" name="id" value="<%=value %>">
		<input type="hidden" name="arr_g" id="arr_g" value="">
		<input type="hidden" name="arr_n" id="arr_n" value="">
		<input type="hidden" name="arr_s" id="arr_s" value="">
		<input type="hidden" name="arr_v" id="arr_v" value="">
		<table class="info_cart" id="cart_table">
		</table>
	</form>
    </div>
    </div>
  </body>
</html>
