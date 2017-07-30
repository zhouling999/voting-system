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
<title>结果界面</title>
<link rel="stylesheet" type="text/css" href="css/vote.css" />
</head>
<body>
<div class="div-body">
欢迎您，
		<s:property value="#session.name" />
<br>
		<h1 class="hh2">您正在查看投票结果</h1>
<div class="wrap">
	 <form action="option/OptionAction!showResultByContent" method="post">
		<table class="table1" border="1">
			<tr>
				<td>查询项目内容：</td>
				<td><input type="text" name="option.vote.content" required="required"></td>
			<tr>
				<td colspan="2"><input type="submit" value="查询"></td>
			</tr>
		</table>
	</form>

	<hr>
	
	<table class="table1" border="1">
		<thead>
			<tr>
				<td colspan="5"><a href="option/OptionAction!showResult">所有投票结果</a></td>
			</tr>
			<tr>
				<td>项目ID</td>
				<td>项目内容</td>
				<td>选项ID</td>
				<td>投票选项</td>
				<td>投票数</td>
			</tr>
		</thead>
		<s:iterator value="optionList" var="o">
			<tr>
				<td><s:property value="#o.vote.vname" /></td>
				<td><s:property value="#o.vote.content" /></td>
				<td><s:property value="#o.oid" /></td>
				<td><s:property value="#o.option" /></td>
				<td><s:property value="#o.num" /></td>

			</tr>
		</s:iterator>
	</table>
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