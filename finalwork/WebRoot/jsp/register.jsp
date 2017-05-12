<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

<title>注册页面</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="../css/styles.css">
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="../css/bootstrap-theme.min.css" rel="stylesheet"
	type="text/css">
<link href="../css/templatemo_style.css" rel="stylesheet" type="text/css">


</head>

<body>
	<div id="Container">
		<div id="Header">
			<div id="logo"></div>
		</div>
		<div id="Midbar">
			<img src="../img/t1.jpg" width=100px height=50px>
		</div>
		<div id="Content">
			<div id="Content-Mid">
				<form
					class="form-horizontal templatemo-create-account templatemo-container"
					action="#" method="post">
					<div class="form-inner">
						<div class="form-group">
							<div class="col-md-6">
								<label for="first_name" class="control-label">用户名</label> <input
									type="text" class="form-control" id="first_name"
									placeholder="输入用户名">
							</div>
							<div class="col-md-6">
								<label for="last_name" class="control-label">昵称</label> <input
									type="text" class="form-control" id="last_name"
									placeholder="输入昵称">
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-12">
								<label for="username" class="control-label">邮箱</label> <input
									type="text" class="form-control" id="email" placeholder="输入邮箱">
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-6">
								<label for="password" class="control-label">密码</label> <input
									type="password" class="form-control" id="password"
									placeholder="输入密码">
							</div>
							<div class="col-md-6">
								<label for="password" class="control-label">确认密码</label> <input
									type="password" class="form-control" id="password_confirm"
									placeholder="再输入一次密码">
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-12">
								<label><input type="checkbox" onclick="c()"
									id="checktosubmit">我同意 <a onclick=s()
									data-toggle="modal" data-target="#templatemo_modal"> 服务协议</a> 和
									<a onclick="s()" data-toggle="modal"
									data-target="#templatemo_modal">法律声明.</a>
								</label>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-12">
								<input type="submit" value="注册" class="btn btn-info"
									disabled="true" id="csubmit"> <a href="index.jsp"
									class="pull-right">返回</a>
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
<script type="text/javascript">
	function s() {
		alert("服务协议如下。。。");
	}
	function c() {
		if (document.getElementById("checktosubmit").checked)
			document.getElementById("csubmit").disabled=false;
	}
</script>
