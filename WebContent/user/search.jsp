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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查找界面</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>
	<div class="div-body">
		欢迎您，
		<s:property value="#session.name" />
		<br>
		<h1 class="hh2">您正在用户查找界面</h1>
		<div class="wrap">
			<h3 class="hh4">进行查找</h3>
			<form action="user/UserAction!search" method="post">
				<table class="table3" border="1">
					<tr>
						<td height="22" align="center">请输入用户名:</td>
						<td><input type="text" name="user.Name" size="15" value=""
							required="required" /></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" style="width:190px;height:40px" name="search" value="查询"
							action="user/UserAction!search" /></td>
					</tr>

				</table>
				<hr>
				<h3 class="hh4">查找结果</h3>
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
					<a href="user/UserAction!showUserAll"><font color=#C0FF3E>总表显示</font></a>
				</h3>
				<h3 class="hh4 text-center">
					<a href="user/UserAction!showUserAllPage"><font color=#BFEFFF>分页显示</font></a>
				</h3>
				<h3 class="hh4 text-center">
					<a href="user/main.jsp"><font color=#9400D3>主界面</font></a>
				</h3>
				<h3 class="hh4 text-center">
					<a href="index.jsp"><font color=#EE0000>退出</font></a>
				</h3>
			</form>
		</div>
		<h1 class="hh2">
			<br>
		</h1>
	</div>
</body>
</html>