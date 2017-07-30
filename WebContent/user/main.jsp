<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>welcome</title>
<script src="js/jquery-1.9.1.min.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" type="text/css"
	href="css/easy-responsive-tabs.css " />
<link href="//fonts.googleapis.com/css?family=Questrial"
	rel="stylesheet">
<link href="css/main.css" rel="stylesheet" type="text/css" />
</head>
<body class="bg agileinfo">
	<h1 class="agile_head text-center">
		欢迎登陆，
		<s:property value="#session.name" />
	</h1>
	<h1>
		<br> <br>
	</h1>
	<div class="w3layouts_main wrap">
		<h2 class="hh2 text-center">请选择:</h2>
		<h3 class="hh3 text-center">
			<a href="user/UserAction!showUserAll"><font color=#BFEFFF>用户管理</font></a>
		</h3>
		<h3 class="hh3 text-center">
			<a href="vote/action.jsp"><font color=#C0FF3E>投票管理</font></a>
		</h3>
		<h3 class="hh3 text-center">
			<a href="vote/vote.jsp"><font color=#EE9A00>进入投票</font></a>
		</h3>
				<h3 class="hh3 text-center">
			<a href="updown/uploadpage.jsp"><font color=#FF00FF>图片管理</font></a>
		</h3>
		<h3 class="hh3 text-center">
			<a href="index.jsp"><font color=#EE0000>退出</font></a>
		</h3>

	</div>
</body>
</html>