<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
 <%
 String  path=request.getContextPath();
 String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <base href="<%=basePath%>">
 <meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>上传成功</title>
		<link rel="stylesheet" type="text/css" href="css/style_admin.css">
</head>
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>
	<div class="div-body">
		欢迎您，
		<s:property value="#session.name" />
		<br>
		<h1 class="hh2">您正在上传界面</h1>
		<div class="wrap2">
		<table  class="table1" border="1" >
			 
			<tr>
				 
				<td align="center" class="altbg1">
					<b>name</b>
				</td>
				<td align="center" class="altbg1">
					<b>type</b>
				</td>
				<td align="center" class="altbg1">
					<b>picture</b>
				</td>			
				<td align="center" class="altbg1">
					<b>work</b>
				</td>
				 
			</tr>
		<s:iterator value="productList" var="product" status="st">
			<tr>
			 
				<td    align="center">
				  <s:property value="#product.productName"/>
				</td>
				<td   align="center">
				  <s:property value="#product.brand"/>
				</td>
				<td   align="center">
				<a href="product/download?picFileName=<s:property value='#product.picture'/>"><img src="upload/<s:property value='#product.picture'/>" height="auto" width="100"/></a>
				 	</td>				
				<td   align="center">
				  <a href="product/download?picFileName=<s:property value='#product.picture'/>">下载</a>
				 
				  
				 		</td>
			</tr>
			 </s:iterator>
			 
			</table>
			
			<h3 class="hh4 text-center">
				<a href="updown/uploadpage.jsp"><font color=#FF00FF>上传图片</font></a>
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
  