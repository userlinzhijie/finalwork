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
		
		//传来的goods字符串
		String array_g = request.getParameter("array_g");	
		String array_n = request.getParameter("array_n");
	 %>
  	
    <script>
	
	function h1(){
	$("#s0").addClass("blue");$("#s1").removeClass("blue");$("#s2").removeClass("blue");$("#s3").removeClass("blue");$("#s4").removeClass("blue");
	$("#tab1").show();$("#tab2").hide();$("#tab3").hide();$("#tab4").hide();$("#tab5").hide();
	};
	function h2(){
	$("#s1").addClass("blue");$("#s0").removeClass("blue");$("#s2").removeClass("blue");$("#s3").removeClass("blue");$("#s4").removeClass("blue");
	$("#tab2").show();$("#tab1").hide();$("#tab3").hide();$("#tab4").hide();$("#tab5").hide();
	};
	function h3(){
	$("#s2").addClass("blue");$("#s1").removeClass("blue");$("#s0").removeClass("blue");$("#s3").removeClass("blue");$("#s4").removeClass("blue");
	$("#tab3").show();$("#tab1").hide();$("#tab2").hide();$("#tab4").hide();$("#tab5").hide();
	};
	function h4(){
	$("#s3").addClass("blue");$("#s1").removeClass("blue");$("#s2").removeClass("blue");$("#s0").removeClass("blue");$("#s4").removeClass("blue");
	$("#tab4").show();$("#tab1").hide();$("#tab2").hide();$("#tab3").hide();$("#tab5").hide();
	};
	function h5(){
	$("#s4").addClass("blue");$("#s1").removeClass("blue");$("#s2").removeClass("blue");$("#s3").removeClass("blue");$("#s0").removeClass("blue");
	$("#tab5").show();$("#tab1").hide();$("#tab2").hide();$("#tab3").hide();$("#tab4").hide();
	retab5();
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
            
            var table = $("#pay_table");  
 			table.append('<tr><th id="s0" class="blue">选择物品</th><th id="s1">收货地址</th><th id="s2">支付方式</th><th id="s3">物流方式</th><th id="s4">提交订单</th></tr>');
         	
            var div1 = $("#tab1");  div1.append('<div class=next"><button onclick="h2()">→</button></div>');
            var div2 = $("#tab2");  div2.append('<div class=next"><button onclick="h1()">←</button><button id="step2" onclick="h3()" disabled>→</button></div>');
            var div3 = $("#tab3");  div3.append('<div class=next"><button onclick="h2()">←</button><button id="step3" onclick="h4()" disabled>→</button></div>');
            var div4 = $("#tab4");  div4.append('<div class=next"><button onclick="h3()">←</button><button id="step4" onclick="h5()" disabled>→</button></div>');
            var div5 = $("#tab5");  div5.append('<div class=next"><button onclick="h4()">←</button></div>');
            $("#tab1").show();$("#tab2").hide();$("#tab3").hide();$("#tab4").hide();$("#tab5").hide();
           /* for(var i=0;i< obj.length;i++){
            	if(obj[i].status==1){	
            		div1.append('<div><table class="next" id="t'+i+'"><tr><th>订单id：</th><th>地址：</th><th>共计：</th><th>邮费：</th><th>交易时间：</th><th>操作</th></tr><tr><th>'+obj[i].id+'</th><th>'+obj[i].address_id+'</th><th>￥'+obj[i].total+'</th><th>￥'+obj[i].transfee+'</th><th>'+obj[i].date+'</th><th><a href="">一键付款</a>/<a href="">退单</a></th></tr></table></div>');
            		for(var j=0;j<obj[i].goods.length;j++)
            			$("#t"+i).append('<tr><th>'+obj[i].goods[j].name+'</th><th>'+obj[i].goods[j].price+'</th><th>×'+obj[i].goods[j].number+'</th></tr>');
            		
            	}else if(obj[i].status==2){
 					div2.append('<div><table class="next" id="t'+i+'"><tr><th>订单id：</th><th>地址：</th><th>共计：</th><th>邮费：</th><th>交易时间：</th><th>操作</th></tr><tr><th>'+obj[i].id+'</th><th>'+obj[i].address_id+'</th><th>￥'+obj[i].total+'</th><th>￥'+obj[i].transfee+'</th><th>'+obj[i].date+'</th><th><a href="">提醒发货</a></th></tr></table></div>');
           			for(var j=0;j<obj[i].goods.length;j++)
            			$("#t"+i).append('<tr><th>'+obj[i].goods[j].name+'</th><th>'+obj[i].goods[j].price+'</th><th>×'+obj[i].goods[j].number+'</th></tr>');
            		
           		}else if(obj[i].status==3){
 					div3.append('<div><table class="next" id="t'+i+'"><tr><th>订单id：</th><th>地址：</th><th>共计：</th><th>邮费：</th><th>交易时间：</th><th>操作</th></tr><tr><th>'+obj[i].id+'</th><th>'+obj[i].address_id+'</th><th>￥'+obj[i].total+'</th><th>￥'+obj[i].transfee+'</th><th>'+obj[i].date+'</th><th><a href="">确认收货</a>/<a href="">查看物流</a></th></tr></table></div>');
            		for(var j=0;j<obj[i].goods.length;j++)
            			$("#t"+i).append('<tr><th>'+obj[i].goods[j].name+'</th><th>'+obj[i].goods[j].price+'</th><th>×'+obj[i].goods[j].number+'</th></tr>');
            		
            	}else if(obj[i].status==4){
 					div4.append('<div><table class="next" id="t'+i+'"><tr><th>订单id：</th><th>地址：</th><th>共计：</th><th>邮费：</th><th>交易时间：</th><th>操作</th></tr><tr><th>'+obj[i].id+'</th><th>'+obj[i].address_id+'</th><th>￥'+obj[i].total+'</th><th>￥'+obj[i].transfee+'</th><th>'+obj[i].date+'</th><th><a href="">评价商品</a></th></tr></table></div>');
           			for(var j=0;j<obj[i].goods.length;j++)
            			$("#t"+i).append('<tr><th>'+obj[i].goods[j].name+'</th><th>'+obj[i].goods[j].price+'</th><th>×'+obj[i].goods[j].number+'</th></tr>');
            		
           		}
            }  */
        }  
       });
       </script>
       	<script language="javascript" type="text/javascript">
	$.ajax({  
        type:"get",//请求方式  
        url:"UserCtrl?action=getgoods&arr_g=<%=array_g %>&arr_n=<%=array_n%>",//发送请求地址  
        dataType:"json",  
        data:{//发送给数据库的数据  
        },  
        //请求成功后的回调函数有两个参数  
        success:function(data){  
            var objs=eval(data); //解析json对象  
            var obj = objs.goods;  
            var total=0;
            var str="";
            length=obj.length;
            var div=$("#good_table");
            div.append('<tr><th>商品</th><th>单价</th><th>数量</th><th>小计</th></tr>');
         	for(var i=0;i< obj.length;i++)
         	{
         	total=total+obj[i].price*obj[i].number;
         	div.append('<tr><th>'+obj[i].name+'</th><th>￥'+obj[i].price+'</th><th>'+obj[i].number+'</th><th>￥'+obj[i].price*obj[i].number+'</th></tr>');
         	}
         	div.append('<tr><th colspan="3">共计：￥<label id="cc_total">'+total+'</label></th></tr>');
         	$("#total").val(total);
        }
       }); 
  	</script>
       	<script language="javascript" type="text/javascript">
	function a1(i,max,id){
	for(var j=0;j<max;j++){$("#address"+j).removeClass("next_active");$("#address"+j).addClass("next");}
		$("#address"+i).addClass("next_active");
		$("#aid").val(id);
		document.getElementById("step2").disabled=false;
	};
$.ajax({  
        type:"get",//请求方式  
        url:"UserCtrl?action=getaddress&user_id=<%=value%>",//发送请求地址  
        dataType:"json",  
        data:{//发送给数据库的数据  
        },  
        //请求成功后的回调函数有两个参数  
        success:function(data){  
            var objs=eval(data); //解析json对象  
            var obj = objs.address;  
              
            var div = $("#tab2");  
 
            for(var i=0;i< obj.length;i++){  
       		     div.append('<div onclick="a1('+i+','+obj.length+','+obj[i].id+')" class="next" id="address'+i+'"><p>name:'+obj[i].name+'<br>place:'+obj[i].province+obj[i].city+obj[i].dist+obj[i].street+'</p><div>');
            }  
        }  
       });

  	</script>
  	<script language="javascript" type="text/javascript">
function c1(i,max,id){
		for(var j=0;j<max;j++){$("#card"+j).removeClass("next_active");$("#card"+j).addClass("next");}
		$("#card"+i).addClass("next_active");
		$("#cid").val(id);
		document.getElementById("step3").disabled=false;
	};
$.ajax({  
	        type:"get",//请求方式  
	        url:"UserCtrl?action=getcard&user_id=<%=value%>",//发送请求地址  
	        dataType:"json",  
	        data:{//发送给数据库的数据  
	        },  
	        //请求成功后的回调函数有两个参数  
	        success:function(data){  
	            var objs=eval(data); //解析json对象  
	            var obj = objs.card;  
	              
	            var div = $("#tab3");  
	 
	            for(var i=0;i< obj.length;i++){  
	            	var id='"'+obj[i].id+'"';
	       		     div.append("<div onclick='c1("+i+","+obj.length+","+id+")' class='next' id='card"+i+"'><p>name:"+obj[i].name+"<br>id:"+obj[i].id+"</p><div>");
	            };  
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
	      
	    </li>
	    <li class="subme">
	          <a href="jsp/info.jsp">我的中心</a>
	       
	    </li>
	    <li class="subme">
	          <a href="">首页</a>
	    </li>
    </ul><br><br><br>
    	
    	
     <div class="div2">
		<table class="next" id="pay_table"></table>
		
    </div>
	<div class="div2" id="tab1"><!-- goods -->
		<table class="next" id="good_table"></table>
    </div>
    
    <div class="div2" id="tab2"><!-- address -->
   	
    </div>
    
    <div class="div2" id="tab3"><!-- card -->
    
    </div>
	
	<div class="div2" id="tab4"><!-- trans -->
	<div class="next" id="trans1" onclick="trans(1)">全包办</div>
	<div class="next" id="trans2" onclick="trans(2)">自己解决</div>
    </div>
    <script type="text/javascript">
    function trans(i){
		$("#trans1").removeClass("next_active");$("#trans2").removeClass("next_active");$("#trans"+i).addClass("next_active");$("#tid").val(i);document.getElementById("step4").disabled=false;};
	</script>

    
    <div class="div2" id="tab5"><!-- submit -->
    <form action="UserCtrl" method="post">
    <input type="hidden" name="action" value="add_order">
    <input type="hidden" name="address_id" id="aid" value="">
    <input type="hidden" name="card_id" id="cid" value="">
    <input type="hidden" name="trans_id" id="tid" value="">
    <input type="hidden" name="user_id" id="uid" value="<%=value%>">
    <input type="hidden" name="status" id="status" value="1">
    <input type="hidden" name="total" id="total" value="">    
    <input type="hidden" name="number" id="number" value="<%=array_n%>">    
    <input type="hidden" name="transfee" id="transfee" value="0">
    <input type="hidden" name="array_g" id="array_g" value="<%=array_g%>">
    <div class="next" id="tab5_g">goods</div>
    <div class="next" id="tab5_a">address</div>
    <div class="next" id="tab5_c">card</div>
	<div class="next" id="tab5_t">trans</div>
	<div class="next"><input type="submit" value="下单"></div>
	</form>
    </div>
     <script language="javascript" type="text/javascript">
	function retab5(){
	var a=$("#cid").val();
	var b=$("#aid").val();
	var c=$("#tid").val();
	var d=$("#total").val();
	$("#tab5_a").text(b);
	$("#tab5_c").text(a);
	$("#tab5_t").text(c);
	$("#tab5_g").text("total:"+d);
	};
	</script>
  </body>
</html>
