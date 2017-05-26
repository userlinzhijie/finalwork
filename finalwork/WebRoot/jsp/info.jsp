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
        url:"UserCtrl?action=getone&id=<%=value %>",//发送请求地址  
        dataType:"json",  
        data:{//发送给数据库的数据  
        },  
        //请求成功后的回调函数有两个参数  
        success:function(data){  
            var objs=eval(data); //解析json对象  
            var obj = objs.users;  
            
            var name = obj[0].name;
            var nickname=obj[0].nickname;
            var sex=obj[0].sex;
            var birth=obj[0].birth;
            var telephone=obj[0].telephone;
            var email=obj[0].email;
            
            document.getElementById("name").value = name;
            document.getElementById("nickname").value = nickname;
            document.getElementById("telephone").value = telephone;
            document.getElementById("email").value = email;
            if(sex==0)
            	document.getElementById("s").checked=true;
            else if(sex==1)
            	document.getElementById("m").checked=true;
            else if(sex==2)
            	document.getElementById("f").checked=true;
            document.getElementById("birth").value=birth;
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
 	<p align = "center" class = "ziti">我的信息</p>
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
    	
    	
    <div class="div1">
	<form action="UserCtrl" method="post">
		<input type="hidden" name="action" value="edit">
		<input type="hidden" name="id" value="<%=Integer.parseInt(value) %>">
		<table class="info">
				<tr>
					<td><label for="user-name" class="am-form-label">账号</label>
					</td>
					<td><input type="text" id="name" name="name" placeholder="name">
					</td>
				</tr>
					
					<tr>
					<td><label for="user-name2" class="am-form-label">昵称</label>
					</td>
					<td><input type="text" id="nickname" name="nickname" placeholder="nickname">
					</td>
				</tr>
									
				<tr>
					<td><label class="am-form-label">性别</label>
					</td>
					<td><label class="am-radio-inline">
							<input type="radio" name="sex" id="m" value="1" data-am-ucheck> 男
						</label>
						<label class="am-radio-inline">
							<input type="radio" name="sex" id="f" value="2" data-am-ucheck> 女
						</label>
						<label class="am-radio-inline">
							<input type="radio" name="sex" id="s" value="0" data-am-ucheck> 保密
						</label>
					</td>
				</tr>

				<tr>
					<td><label for="user-birth" class="am-form-label">电话</label>
					</td>
					<td><input id="birth" name="birth" placeholder="birth" type="date">
					</td>
				</tr>
							
				<tr>
					<td><label for="user-phone" class="am-form-label">电话</label>
					</td>
					<td><input id="telephone" name="telephone" placeholder="telephonenumber" type="tel">
					<td>
				</tr>
				<tr>
					<td><label for="user-email" class="am-form-label">电子邮件</label>
					</td><td>
						<input id="email" name="email" placeholder="Email" type="email">
					</td>
				</tr>
							
				<tr>
					<th colspan="2"><input type="submit" value="保存修改"></th>
				</tr>
</table>
							</form>
    </div>
  </body>
</html>
