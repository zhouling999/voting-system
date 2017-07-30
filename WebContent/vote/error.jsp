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
<title>出错界面</title>
<link rel="stylesheet" type="text/css" href="css/vote.css" />
</head>
<body>
	<div class="div-body">
		欢迎您，
		<s:property value="#session.name" />
		<br>
		<h1 class="hh2">系统提示</h1>
		<div class="wrap">
			<h1 class="hh2">出错！</h1>

			<h2 class="hh4">请确认点击了选项</h2>
			<h3 class="hh4 text-center">
				<a href="vote/vote.jsp"><font color=#C0FF3E>返回</font></a>
			</h3>
			<h3 class="hh4 text-center">
				<a href="user/main.jsp"><font color=#9400D3>主界面</font></a>
			</h3>
			<h3 class="hh4 text-center">
				<a href="index.jsp"><font color=#EE0000>退出</font></a>
			</h3>
		</div>
		<h1 class="hh2">
			<br>
		</h1>

	</div>
</body>
</html>