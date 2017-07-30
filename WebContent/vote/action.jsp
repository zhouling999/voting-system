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
<title>操作界面</title>
<link rel="stylesheet" type="text/css" href="css/vote.css" />
</head>
<body>
	<div class="div-body">
		欢迎您，
		<s:property value="#session.name" />
		<br>
		<h1 class="hh2">您正在投票管理界面</h1>
		<div class="wrap">

			<form action="vote/VoteAction!addVote" method="post">
				<table class="table2" border="1">
					<tr>
						<td colspan="2">添加新项目</td>
					</tr>
					<tr>
						<td>新项目序号:</td>
						<td><input type="text" name="vote.vname"></td>
					</tr>
					<tr>
						<td>新项目内容:</td>
						<td><input type="text" name="vote.content"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" style="width:190px;height:30px" value="ok"></td>
					</tr>
				</table>
			</form>
			<hr>
			<form action="option/OptionAction!saveOption" method="post">
				<table class="table2" border="1">
					<tr>
						<td colspan="2">添加新选项</td>
					</tr>
					<tr>
						<td>项目序号:</td>
						<td><input type="text" name="option.vote.vname"></td>
					</tr>
					<tr>
						<td>选项内容:</td>
						<td><input type="text" name="option.option"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" style="width:190px;height:30px" value="ok"></td>
					</tr>
				</table>
			</form>
			<hr>
			<h3 class="hh4 text-center">
				<a href="vote/VoteAction!showVoteAll"><font color=#C0FF3E>投票页面</font></a>
			</h3>
			<h3 class="hh4 text-center">
				<a href="user/main.jsp"><font color=#9400D3>主界面</font></a>
			</h3>
			<h3 class="hh4 text-center">
				<a href="index.jsp"><font color=#EE0000>退出</font></a>
			</h3>
			<hr>

			<table class="table3" border="1">
				<thead>
					<tr>
						<td colspan="6"><a href="option/OptionAction!showOption">显示所有选项</a></td>
					</tr>
					<tr>
						<td>项目序号</td>
						<td>投票内容</td>
						<td>选项ID</td>
						<td>投票选项</td>
						<td>投票数</td>
						<td>操作</td>
					</tr>
				</thead>
				<s:iterator value="optionList" var="o">
					<tr>
						<td><s:property value="#o.vote.vname" /></td>
						<td><s:property value="#o.vote.content" /></td>
						<td><s:property value="#o.oid" /></td>
						<td><s:property value="#o.option" /></td>
						<td><s:property value="#o.num" /></td>
						<td><a
							href="option/OptionAction!remove?option.oid=<s:property value='#o.oid'/>">删除<img
								src="images/delete.jpg" height="20px" /></a></td>
					</tr>
				</s:iterator>
			</table>
	
		</div>
		<h1 class="hh2">
			<br>
	</div>
</body>
</html>