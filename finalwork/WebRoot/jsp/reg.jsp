<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="./css/styles.css">
	<link href="./css/reg.css" rel="stylesheet" type="text/css">	
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<script type="application/x-javascript"> 
					addEventListener("load", function() { 
						setTimeout(hideURLbar, 0); }, false);
					function hideURLbar(){ window.scrollTo(0,1); } 
	</script>
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script> 
	<script type="text/javascript">
		 function checkname(){  
		    var value = $("#userName").val();
             $.ajax({  
               type:"get",//请求方式  
               url:"CheckUserNameServlet?userName=" + value,//发送请求地址  
               timeout:30000,//超时时间：30秒  
               dataType:"json",//设置返回数据的格式  
               //请求成功后的回调函数 data为json格式  
               success:function(data){  
                  var flag = data.flag;
                  if(flag == "true"){
                     $("#userInfo").html( value + "已经被使用了,请换一个用户名！");
                  }
                  else{
                  	$("#userInfo").html("");
                  }
              },
              error:function(){  
                        alert("请求出错");  
              }  
           });  
          } 
	</script>
	
	<script type="text/javascript">
	function s() {
		alert("服务协议如下..");
	}
	function c() {
		if (document.getElementById("checktosubmit").checked)
			document.getElementById("csubmit").disabled=false;
	}
</script>

  </head>
  
 </body>
 <div id="Container">
		<div id="Header">
			<div id="logo"><p align = "right"><a href ="./jsp/login.jsp">已有账号，请登录</a></p></div>
		</div>
		<div id="Midbar" >
			<p align = "center" class = "ziti">欢迎注册
			<img align = "left" src="./img/t1.jpg" width=100px height=60px></p>
		</div>
		<div id="Content">
			<div id="Content-Mid">
				<form class="form-horizontal" action="Regctrl" method="post" id = "reg-form">
					<div>
						<div class="form-group">
							<div class="col-md-6">
								<label for="first_name" class="control-label">用户名</label> <input
									type="text" class="form-control" id="userName" name="userName"
									placeholder="输入用户名" onchange="checkname()" /required>	
									<div id="userInfo"></div>							
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-6">
								<label  for="password" class="control-label">密码</label> <input
									type="password" class="form-control" name="pwd"
									placeholder="输入密码" /required>
							</div>
							<div class="col-md-6">
								<label for="password" class="control-label">确认密码</label> <input
									type="password" class="form-control" id="password_confirm"
									placeholder="再输入一次密码" /required>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-12">
								<label><input type="checkbox" onclick="c()"
									id="checktosubmit">我同意</label><a onclick=s()
									data-toggle="modal" data-target="#templatemo_modal"> 服务协议</a> 和
									<a onclick="s()" data-toggle="modal"
									data-target="#templatemo_modal">法律声明.</a>
								
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-12">
								<input type="submit" value="注册" class="btn btn-info"
									disabled="true" id="csubmit">
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="Clear">
			<!--如何你上面用到float,下面布局开始前最好清除一下。-->
		</div>
		<div id="Footer">
			<img src="img/b1.png" width=1200px height=158px>
		</div>
	</div>
</body>
</html> 
