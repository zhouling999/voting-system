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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>用户管理</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>
	<div class="div-body">
		欢迎您，
		<s:property value="#session.name" />
		<br>
		<h1 class="hh2">您正在用户管理界面</h1>
		<div class="wrap">
			<h1 class="hh4">用户表单</h1>
			<table class="table1" border="1">
				<thead>
					<tr>
						<td>ID</td>
						<td>用户名</td>
						<td>密码</td>
						<td>邮箱</td>
						<td>电话</td>
						<td>年龄</td>
						<td>性别</td>
						<td>地址</td>
						<td>权限</td>
						<td colspan="2">操作</td>
					</tr>
				</thead>
				<s:iterator value="lists" var="s">
					<tr>
						<td><s:property value="#s.sid" /></td>
						<td><s:property value="#s.name" /></td>
						<td><s:property value="#s.pwd" /></td>
						<td><s:property value="#s.email" /></td>
						<td><s:property value="#s.phone" /></td>
						<td><s:property value="#s.age" /></td>
						<td><s:property value="#s.sex" /></td>
						<td><s:property value="#s.address" /></td>
						<td><s:property value="#s.permission" /></td>

						<td><a
							href="user/UserAction!remove?user.sid=<s:property value='#s.sid'/>">删除<img
								src="images/delete.jpg" height="20px" /></a></td>
						<td><a
							href="user/UserAction!showUserById?user.sid=<s:property value='#s.sid'/>">修改<img
								src="images/modify.jpg" height="22px" /></a></td>
					</tr>
				</s:iterator>
			</table>
			<h3 class="hh4 text-center">
				<a href="user/UserAction!showUserAllPage"><font color=#BFEFFF>分页显示</font></a>
			</h3>
			<h3 class="hh4 text-center">
				<a href="user/search.jsp"><font color=#EE9A00>查找</font></a>
			</h3>
			<h3 class="hh4 text-center">
				<a href="user/main.jsp"><font color=#9400D3	>主界面</font></a>
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