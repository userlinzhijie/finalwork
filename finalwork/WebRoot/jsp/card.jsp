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
function c1(i,max,id){
		for(var j=0;j<max;j++){$("#card"+j).removeClass("next_active");$("#card"+j).addClass("next");}
		$("#card"+i).addClass("next_active");
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
							
			            div.append("<div onclick='c1(" + i + "," + (obj.length+1) + "," + idmax + ")' class='next' id='card" + i + "'><p class='card'><span id='cds" + i + "' style='display:none'>√</span> 持卡人:" + obj[i].name + "    尾号" + id + "   所属银行："+obj[i].bank+" 预留电话："+obj[i].phone+"&nbsp;&nbsp;&nbsp;<span id='setdf" + i +"'>" + de_fault + "</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span><a href='UserCtrl?action=del_card&id="+obj[i].id+"'>×删除</a></span></p><div>");
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
		}
	});
</script>
 	<p align = "center" class = "ziti">快捷支付</p>
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
		<input type="hidden" name="action" value="add_card">
		<input type="hidden" name="user_id" value="<%=value%>">
		<input type="hidden" name="bank" value="XX银行">
		<table class="info" id="card_table">
		<tr><th colspan="2">新增银行卡</th></tr>
				<tr>
					<th><label>持卡人姓名：</label>
					</th>
					<th><input type="text" name="name" placeholder="真实姓名">
					</th>
				</tr>
					<tr>
					<th><label>银行卡号：</label>
					</th>
					<th><input name="id" placeholder="银行卡号">
					</th>
				</tr>
									
				<tr>
					<th><label>身份证号：</label>
					</th>
					<th><input type="text" name="id_number"  placeholder="身份证号">
					</th>
				</tr>

				<tr>
					<th><label>预留手机号：</label>
					</th>
					<th><input type="text" name="phone" placeholder="银行卡绑定手机号">
					</th>
				</tr>
				
				<tr>
					<th colspan="2"><input type="submit" value="保存修改"></th>
				</tr>
</table>
							</form>
    </div>
    <div class="div2_down" id="tab3" ><!-- card -->
    
    </div>

  </body>
</html>
