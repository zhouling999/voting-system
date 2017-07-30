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
<title>修改界面</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>
	<div class="div-body">
		欢迎您，
		<s:property value="#session.name" />
		<br>
		<h1 class="hh2">您正在修改界面</h1>
		<div class="wrap1">
			<form action="user/UserAction!modify" method="post">
				<table class="table2" border="1">
					<tr>
						<td colspan="2">请修改基本信息</td>
					</tr>
					<tr>
						<td>用户名:</td>
						<td><input type="text" name="user.name" placeholder="修改用户名"
							value="<s:property value="user.name" />"></td>
					</tr>
					<tr>
						<td>密码:</td>
						<td><input type="text" name="user.pwd" placeholder="修改密码"
							value="<s:property value="user.pwd" />"></td>
					</tr>
					<tr>
						<td>e-mail:</td>
						<td><input type="text" name="user.email" placeholder="修改邮箱地址"
							value="<s:property value="user.email"/>"></td>
					</tr>
					<tr>
						<td>电话:</td>
						<td><input type="text" name="user.Phone" placeholder="修改手机号码"
							value="<s:property value="user.phone"/>"></td>
					</tr>
					<tr>
						<td>年龄:</td>
						<td><input type="text" name="user.age" placeholder="修改年龄"
							value="<s:property value="user.age"/>"></td>
					</tr>
					<tr>
						<td>性别:</td>
						<td><select class="text1" name="user.sex">
								<option value="<s:property value="user.sex"/>"><s:property
										value="user.sex" /></option>
								<option value="男"><span>男</span></option>
								<option value="女"><span>女</span></option>
						</select></td>
					</tr>
					<tr>
						<td>地址:</td>
						<td><input type="text" name="user.address"
							placeholder="修改地址信息" value="<s:property value="user.address"/>"></td>
					</tr>
					<tr>
						<td>权限:</td>
						<td><select class="text1" name="user.permission">
								<option value="<s:property value="user.permission"/>"><s:property
										value="user.permission" /></option>
								<option value="用户"><span>用户</span></option>
								<option value="管理员"><span>管理员</span></option>
						</select></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="保存"></td>
					</tr>
				</table>
			</form>
			<h3 class="hh4 text-center">
				<a href="user/UserAction!showUserAllPage"><font color=#C0FF3E>分页显示</font></a>
			</h3>
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