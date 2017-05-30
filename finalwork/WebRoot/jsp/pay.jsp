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
		String array_g = request.getParameter("arr_g");	
		String array_n = request.getParameter("arr_n");
		String array_s = request.getParameter("arr_s");
		String array_v = request.getParameter("arr_v");
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
	$("#tab5").hide();$("#tab1").show();$("#tab2").show();$("#tab3").show();$("#tab4").show();
	$(".next").hide();$(".next_active").show();$(".pay_btn").hide();$("#tab5").show();
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
         	
            var div1 = $("#tab1"); 
             div1.append('<div class=next"><button class="pay_btn" onclick="h2()">→</button></div>');
            var div2 = $("#tab2");  
             div2.append('<div class=next"><button class="pay_btn" onclick="h1()">←</button><button class="pay_btn" id="step2" onclick="h3()" disabled>→</button></div>');
            var div3 = $("#tab3"); 
             div3.append('<div class=next"><button class="pay_btn" onclick="h2()">←</button><button class="pay_btn" id="step3" onclick="h4()" disabled>→</button></div>');
            var div4 = $("#tab4"); 
             div4.append('<div class=next"><button class="pay_btn" onclick="h3()">←</button><button class="pay_btn" id="step4" onclick="h5()" disabled>→</button></div>');
            var div5 = $("#tab5"); 
             div5.append('<div class=next"><button class="pay_btn" onclick="h4()">←</button></div>');
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
            length=obj.length;
            var div=$("#good_table");
            div.append('<tr><th>商品</th><th>单价</th><th>数量</th><th>小计</th></tr>');
         	for(var i=0;i< obj.length;i++)
         	{
         	total=total+obj[i].price*obj[i].number;
         	div.append('<tr><th>'+obj[i].name+'</th><th>￥'+obj[i].price+'</th><th>'+obj[i].number+'</th><th>￥'+obj[i].price*obj[i].number+'</th></tr>');
         	}
         	div.append('<tr><th colspan="3">共计：￥<label id="cc_total">'+total+'</label></th></tr>');
        }
       }); 
  	</script>
       	<script language="javascript" type="text/javascript">
	function a1(i,max,id){
		for(var j=0;j<max;j++){
			$("#address"+j).removeClass("next_active");$("#address"+j).addClass("next");$("#ads"+j).hide();$("#setdf"+j).hide();
		}
		$("#address"+i).addClass("next_active");
		$("#ads"+i).show();
		$("#setdf"+i).show();
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
       		    // div.append('<div onclick="a1('+i+','+obj.length+','+obj[i].id+')" class="next" id="address'+i+'"><p>name:'+obj[i].name+'<br>place:'+obj[i].province+obj[i].city+obj[i].dist+obj[i].street+'</p><div>');
	           var de_fault = "";
	            if (obj[i].de_fault == 1) de_fault = "默认地址";
	            else de_fault = "<a href=''> 设为默认地址 </a> ";
	            div.append('<div class="next"onclick="a1(' + i + ',' + obj.length + ',' + obj[i].id + ')" id="address' + i + '"><p class="address"><span id="ads' + i + '" style="display:none">√</span>  收货地址：:' + obj[i].province + ' ' + obj[i].city + ' ' + obj[i].dist + ' ' + obj[i].street + '( ' + obj[i].name + ' 收)   ' + obj[i].telephone + '  <span id="setdf' + i + '">' + de_fault + '</span></p><div>');
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
	         	  	 var id = obj[i].id;
	         		 id=id.slice(id.length-4, id.length);
	          		 var idmax='"'+obj[i].id+'"';
	         		 var de_fault = "";
					 if (obj[i].de_fault == 1)
						de_fault = "默认银行卡";
					 else
						de_fault = "<a href='UserCtrl?action=setdefault_card&id="+obj[i].id+"'> 设为默认银行卡 </a> ";
							
			            div.append("<div onclick='c1(" + i + "," + (obj.length+1) + "," + idmax + ")' class='next' id='card" + i + "'><p class='card'><span id='cds" + i + "' style='display:none'>√</span> 持卡人:" + obj[i].name + "    尾号" + id + "   所属银行："+obj[i].bank+" 预留电话："+obj[i].phone+"<span id='setdf" + i +"'>" + de_fault + "</span></p><div>");
			        }
			        div.append("<div onclick='c1(" + obj.length + "," + obj.length+1 + "," + idmax + ")' class='next' id='card" + obj.length + "'><p class='card'><span id='cds" + obj.length + "' style='display:none'>√</span>支付宝/微信  扫码支付<span id='setdf" + obj.length +"'>(推荐方式)</span></p><div>");
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
    	
    	
     <div class="div2" style="display: block;">
		<table class="next" id="pay_table"></table>
		
    </div>
	<div class="div2" id="tab1" style="display: block;"><!-- goods -->
		<table class="next_active" id="good_table" ></table>
    </div>
    
    <div class="div2" id="tab2" style="display: none;"><!-- address -->
   	
    </div>
    
    <div class="div2" id="tab3" style="display: none;"><!-- card -->
    
    </div>
	
	<div class="div2" id="tab4" style="display: none;"><!-- trans -->
	<div class="next" id="trans1" onclick="trans(1)">锤子网全包办，邮费全免</div>
	<div class="next" id="trans2" onclick="trans(2)">线下协商解决，邮费自算</div>
    </div>
    <script type="text/javascript">
    function trans(i){
		$("#trans1").removeClass("next_active");$("#trans2").removeClass("next_active");$("#trans"+i).addClass("next_active");$("#tid").val(i);document.getElementById("step4").disabled=false;};
	</script>

    
    <div class="div2" id="tab5" style="display: none;"><!-- submit -->
    <form action="UserCtrl" method="post">
    <input type="hidden" name="action" value="add_order">
    <input type="hidden" name="mode" id="mode" value="1">
    <input type="hidden" name="address_id" id="aid" value="">
    <input type="hidden" name="card_id" id="cid" value="">
    <input type="hidden" name="trans_id" id="tid" value="">
    <input type="hidden" name="user_id" id="uid" value="<%=value%>">
    <input type="hidden" name="status" id="status" value="1">
    <input type="hidden" name="arr_v" id="arr_v" value="<%=array_v%>">    
    <input type="hidden" name="arr_n" id="number" value="<%=array_n%>">    
    <input type="hidden" name="transfee" id="transfee" value="0">
    <input type="hidden" name="arr_g" id="array_g" value="<%=array_g%>">
    <input type="hidden" name="arr_s" id="array_s" value="<%=array_s%>">

	<div class="next_active" align="right"><input class="card" type="submit" value="下单"></div>
	</form>
    </div>
     <script language="javascript" type="text/javascript">
	function retab5(){
	var a=$("#cid").val();
	var b=$("#aid").val();
	var c=$("#tid").val();
	var d=$("#arr_v").val();
	$("#tab5_a").text(b);
	$("#tab5_c").text(a);
	$("#tab5_t").text(c);
	$("#tab5_g").text("total:"+d);
	};
	</script>
  </body>
</html>
