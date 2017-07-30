<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录失败</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>
	<div class="div-body" >
	<s:property value="#session.name"/>
	<br>
		<h1 class="hh2">
			系统提示
		</h1>
	<div class="wrap">
<h1 class="hh2">登录失败！</h1>
		<h1 class="hh4">用户名或密码错误！</a></h1>
		<h1 class="hh4"><a href="index.jsp">重新登录</a></h1>
</div>
		<h1 class="hh2"><br></h1>
		<h1 class="hh2"><br>
		
		</h1>
	</div>
</body>
</html>
