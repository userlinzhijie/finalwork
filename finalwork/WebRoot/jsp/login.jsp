<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登陆</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="./css/styles.css">
	<link href="./css/reg.css" rel="stylesheet" type="text/css">

  </head>
  
  </body>
 <div id="Container">
		<div id="Header">
			<div id="logo"><p align = "right"><a href ="./jsp/reg.jsp">没有账号，请注册</a></p></div>
		</div>
		<div id="Midbar" >
			<p align = "center" class = "ziti">欢迎登陆
		</div>
		<div id="Content">
			<div id="Content-Mid">
				<form class="form-horizontal" action="Loginctrl" method="post" id = "reg-form">
					<div>
						<div class="form-group">
							<div class="col-md-6">
								<label for="first_name" class="control-label">用户名</label> <input
									type="text" class="form-control" id="lguserName" name="lguserName"
									placeholder="输入用户名" /required>								
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-6">
								<label  for="password" class="control-label">密码</label> <input
									type="password" class="form-control" name="lgpwd"
									placeholder="输入密码" /required>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-12">
								<input type="submit" value="登陆" class="btn btn-info" id="csubmit">
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
