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
<title>上传界面</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>
	<div class="div-body">
		欢迎您，
		<s:property value="#session.name" />
		<br>
		<h1 class="hh2">您正在上传界面</h1>
		<div class="wrap1">
			<form name='form' method='post' action="product/productAction"
				enctype="multipart/form-data">
				<h1 class="hh4">上传图片</h1>
				<table border="1" class="table2" id="table3">

					<tr>
						<td>name：</td>
						<td><input type="text" style="height:30px"name="product.productName"
							value=""></td>
					</tr>
					<tr>
						<td>type：</td>
						<td><input type="text" style="height:30px"name="product.brand" value=""></td>
					</tr>  
					<tr>
						<td>picture：</td>
						<td><input type="file" name="pic" style="width:190px;height:30px"></td>
					</tr>

					<tr>

						<td colspan="2"><input style="width:190px;height:40px" type="submit" value="上传" name="B1" />
						</td>

					</tr>
					<tr>

						<td colspan="2"><input style="width:190px;height:40px" type="reset" value="重置" name="B2" /></td>

					</tr>

				</table>
			</form>
			<h3 class="hh4 text-center">
				<a href="product/productAction!findAll"><font color=#FF00FF>查看图片</font></a>
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