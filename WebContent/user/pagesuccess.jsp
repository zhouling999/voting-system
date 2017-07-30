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
<title>分页</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>

	<div class="div-body">
		欢迎您，
		<s:property value="#session.name" />
		<br>
		<h1 class="hh2">您正在用户管理界面</h1>
		<div class="wrap">
			<h1 class="hh4">用户表单——分页</h1>
			<table class="table1" border="1">
				<thead>
					<tr>
						<td>ID</td>
						<td>用户名</td>
						<td>密码</td>
						<td>邮箱</td>
						<td>电话</td>
						<td colspan="2">操作</td>
					</tr>
				</thead>
				<s:iterator value="lists" var="s">
					<tr>
						<td style=""><s:property value="#s.sid" /></td>
						<td><s:property value="#s.name" /></td>
						<td><s:property value="#s.pwd" /></td>
						<td><s:property value="#s.email" /></td>
						<td><s:property value="#s.phone" /></td>

						<td><a
							href="user/UserAction!remove?user.sid=<s:property value='#s.sid'/>">删除<img
								src="images/delete.jpg" height="20px" /></a></td>
						<td><a
							href="user/UserAction!showUserById?user.sid=<s:property value='#s.sid'/>">修改<img
								src="images/modify.jpg" height="22px" /></a></td>
					</tr>
				</s:iterator>
			</table>
			<br>
			<hr>
			总共有
			<s:property value="page.count" />
			行数&nbsp; 当期是第
			<s:property value="page.goPage" />
			页
			<s:url action="UserAction!showUserAllPage" namespace="/user" var="up">
				<s:param name="goPage" value='page.goPage-1'></s:param>
			</s:url>
			<s:a href="%{#up}">上一页</s:a>
			&nbsp; &nbsp; &nbsp; &nbsp;
			<s:url action="UserAction!showUserAllPage" namespace="/user"
				var="down">
				<s:param name="goPage" value='page.goPage+1'></s:param>
			</s:url>
			<s:a href="%{#down}">下一页</s:a>
			<h3 class="hh4 text-center">
				<a href="user/UserAction!showUserAll"><font color=#BFEFFF>总表显示</font></a>
			</h3>
			<h3 class="hh4 text-center">
				<a href="user/search.jsp"><font color=#EE9A00>查找</font></a>
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