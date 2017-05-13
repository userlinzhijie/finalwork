<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>首页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/styles.css">
	<link href="./css/playphoto.css" rel="stylesheet" type="text/css">
	<link href="./css/reg.css" rel="stylesheet" type="text/css">
	<link href="./css/selectlist.css" rel="stylesheet" type="text/css">
	
	<script language="javascript" type="text/javascript">
	//菜单折叠代码
            function showSubMenu() {
                var m = document.getElementById("subMenu");
                m.style.display = "block";
            }
 
            function hiddenSubMenu() {
                var m = document.getElementById("subMenu");
                m.style.display = "none";
            }
    </script>
    
	<script language="javascript" type="text/javascript">
	//图片轮转代码
	var s=function(){
	var interv=2000; //切换间隔时间
	var interv2=10; //切换速速
	var opac1=80; //文字背景的透明度
	var source="fade_focus" //焦点轮换图片容器的id名称
	//获取对象
	function getTag(tag,obj){if(obj==null){return document.getElementsByTagName(tag)}else{return obj.getElementsByTagName(tag)}}
	function getid(id){return document.getElementById(id)};
	var opac=0,j=0,t=63,num,scton=0,timer,timer2,timer3;var id=getid(source);id.removeChild(getTag("div",id)[0]);var li=getTag("li",id);var div=document.createElement("div");var title=document.createElement("div");var span=document.createElement("span");var button=document.createElement("div");button.className="button";for(var i=0;i<li.length;i++){var a=document.createElement("a");a.innerHTML=i+1;a.onclick=function(){clearTimeout(timer);clearTimeout(timer2);clearTimeout(timer3);j=parseInt(this.innerHTML)-1;scton=0;t=63;opac=0;fadeon();};a.className="b1";a.onmouseover=function(){this.className="b2"};a.onmouseout=function(){this.className="b1";sc(j)};button.appendChild(a);}
	//控制图层透明度
	function alpha(obj,n){if(document.all){obj.style.filter="alpha(opacity="+n+")";}else{obj.style.opacity=(n/100);}}
	//控制焦点按钮
	function sc(n){for(var i=0;i<li.length;i++){button.childNodes[i].className="b1"};button.childNodes[n].className="b2";}
	title.className="num_list";title.appendChild(span);alpha(title,opac1);id.className="d1";div.className="d2";id.appendChild(div);id.appendChild(title);id.appendChild(button);
	//渐显
	var fadeon=function(){opac+=5;div.innerHTML=li[j].innerHTML;span.innerHTML=getTag("img",li[j])[0].alt;alpha(div,opac);if(scton==0){sc(j);num=-2;scrolltxt();scton=1};if(opac<100){timer=setTimeout(fadeon,interv2)}else{timer2=setTimeout(fadeout,interv);};}
	//渐隐
	var fadeout=function(){opac-=5;div.innerHTML=li[j].innerHTML;alpha(div,opac);if(scton==0){num=2;scrolltxt();scton=1};if(opac>0){timer=setTimeout(fadeout,interv2)}else{if(j<li.length-1){j++}else{j=0};fadeon()};}
	//滚动文字
	var scrolltxt=function()
	{t+=num;span.style.marginTop=t+"px";
	if(num<0 && t>3)
	{timer3=setTimeout(scrolltxt,interv2)}
	else if(num>0 && t<62)
	{timer3=setTimeout(scrolltxt,interv2)}else{scton=0}};
	fadeon();
	}
	//初始化
	window.onload=s;
</script>
	

  </head>
  
  <body>
    <%String name = (String)session.getAttribute("user"); %>
  	<%if(name==null){%>
  	<div id="Header">
  	<div id="logo">
  	<p align = "right"><a href="jsp/login.jsp">你好，请登录&nbsp;&nbsp;</a> <a href="jsp/reg.jsp">注册&nbsp;&nbsp;&nbsp;</a></p>
  	<%}else{%>
  	<p align =right>欢迎回来,<%= name %>  <a href = "jsp/exit.jsp">退出登陆</a><p> 
	<% } %>
	</div></div>
 	<p align = "center" class = "ziti">购物系统</p><br>
 	<a  href="#" onmouseover="showSubMenu()" onmouseout="hiddenSubMenu()">省市</a>
        <ul id="subMenu">
                <li>河北</li>
                <li>河南</li>
                <li>山东</li>
        </ul>
 	<form action = "index.jsp" method="post">
 	<p align = "center" ><input type = "text" name = "search"><input type = "submit" value = "搜索"><br>
 	</form><br><br>
 	<div>
	 	<div class="div0">
		<table class="hovertable"><br>
			<tr>  
			    <th>可选分类</th>  
			</tr>  
			<tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">  
			    <td><a href="">键盘</a></td>  
			</tr>  
			<tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">  
			    <td><a href="">鼠标</a></td>  
			</tr>  
			<tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">  
			    <td><a href="">耳机</a></td>  
			</tr>  
			<tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">  
			    <td><a href="">音响</a></td>  
			</tr>    
		</table>
	 	</div>
	 	<div class="div1">
	 	<div id="fade_focus">
		<div class="loading">Loading...<br></div>
		<ul>
		<li><a href="" ><img src="" width="700" height="300" alt="xxx键盘" /></a></li>
		<li><a href="" ><img src="" width="700" height="300" alt="xxx鼠标" /></a></li>
		<li><a href="" ><img src="" width="700" height="300" alt="xxx耳机" /></a></li>
		<li><a href="" ><img src="" width="700" height="300" alt="xxx音响" /></a></li>
		</ul>
		</div></div>
	</div>	
  </body>
</html>
