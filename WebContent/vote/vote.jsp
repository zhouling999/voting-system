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
<title>投票界面</title>
<link rel="stylesheet" type="text/css" href="css/vote.css" />
</head>
<body>
	<div class="div-body">
		欢迎您，
		<s:property value="#session.name" />
		<br>
		<h1 class="hh2">您正在投票页面</h1>
		<div class="wrap">

			<form action="vote/VoteAction!showByContent" method="post">
				<table class="table2" border="1">
					<tr>
						<td>查询项目内容：</td>
						<td><input type="text" name="vote.content"
							required="required"></td>
					<tr>
						<td colspan="2"><input type="submit" style="width:190px;height:40px" value="查询"></td>
					</tr>
				</table>
			</form>

			<hr>
			<table class="table1" border="1">
				<thead>
					<tr>
						<td colspan="3"><a href="vote/VoteAction!showVoteAll">所有投票项目</a></td>
					</tr>
					<tr>
						<td>编号</td>
						<td>投票内容</td>
						<td>操作</td>
					</tr>
				</thead>

				<s:iterator value="lists" var="s">
					<form action="option/OptionAction!showOptionByName" method="post">
						<tr>
							<td><s:property value="#s.vname" /> <input type="hidden"
								name="option.vote.vname" value="<s:property value="#s.vname" />"></td>
							<td><s:property value="#s.content" /></td>
							<td><input type="submit" value="开始投票"></td>
						</tr>
					</form>
				</s:iterator>
			</table>

			<hr>
			<form action="option/OptionAction!addNum" method="post">
				<table class="table1" border="1">
					<thead>
						<tr>
							<td></td>
							<td>编号</td>
							<td>选项内容</td>
						</tr>
					</thead>

					<s:iterator value="optionList" var="s">
						<tr>
							<td>投票选项：</td>
							<td><input name="option.oid" type="radio"
								value="<s:property value="#s.oid" />" /> <s:property
									value="#s.oid" /></td>
							<td><s:property value="#s.option" /></td>
						</tr>
					</s:iterator>
					<tr>
						<td colspan="3"><input type="submit" value="投票" style="width:190px;height:40px"
							OnClick="return confirm('你确定投票吗？')"></td>
					</tr>
				</table>
			</form>
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