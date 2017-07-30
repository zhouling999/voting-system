
<!DOCTYPE html>
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
<title>voting system</title>

<!-- custom-theme -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Simple Login and Signup Form web template Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web Templates, Login sign up Responsive web template, SmartPhone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!-- //custom-theme -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script src="js/jquery-1.9.1.min.js"></script>
<!--// js -->
<link rel="stylesheet" type="text/css"
	href="css/easy-responsive-tabs.css " />
<link href="//fonts.googleapis.com/css?family=Questrial"
	rel="stylesheet">
</head>
<body class="bg agileinfo">
	<h1 class="agile_head text-center">WELCOME TO VOTING SYSTEM!</h1>
	<div class="w3layouts_main wrap">
		<!--Horizontal Tab-->
		<div id="parentHorizontalTab_agile">
			<ul class="resp-tabs-list hor_1">
				<li>LogIn</li>
				<li>SignUp</li>
			</ul>
			<div class="resp-tabs-container hor_1">
				<div class="w3_agile_login">
					<form action="user/UserAction!login" method="post"
						class="agile_form">
						<p>Username</p>
						<input class="agile_its_registration" type="text" name="user.name"
							required="required" />
						<p>Password</p>
						<input type="password" name="user.pwd" required="required"
							class="password" />
						<p>permission</p>
						<select name="user.permission" style="width: 100%">
							<option value="用户"><span>用户</span></option>
							<option value="管理员"><span>管理员</span></option>
						</select> <br> <br> <input type="submit" value="LogIn"
							class="agileinfo" />
					</form>
					<!-- 	<div class="login_w3ls">
						<a href="user/modify.jsp">forget password</a>
					</div> -->
				</div>
				<div class="agile_its_registration">
					<form action="user/UserAction!saveUser" method="post"
						class="agile_form" style="">
						<p>Username</p>
						<input type="text" name="user.name" required="required" />
						<p>Password</p>
						<input type="password" name="user.pwd" id="password1"
							required="required">
						<p>Confirm Password</p>
						<input type="password" name="Confirm Password" id="password2"
							required="required">
						<p>Email</p>
						<input type="email" name="user.email" required="required" />
						<p>phone</p>
						<input type="text" name="user.phone" required="required" />
						<p>age</p>
						<input type="text" name="user.age" required="required" />
						<p>address</p>
						<input type="text" name="user.address" required="required" />
						<p>sex</p>
						<select class="text1" name="user.sex" style="width: 100%">
							<option value="男"><span>男</span></option>
							<option value="女"><span>女</span></option>
						</select>
						<p>permission</p>
						<select class="text1" name="user.permission" style="width: 100%">
							<option value="用户"><span>用户</span></option>
							<option value="管理员"><span>管理员</span></option>
						</select> <br> <br> <input type="submit" value="Signup" /> <br>
						<br> <input type="reset" value="Reset" />
					</form>
				</div>
			</div>
		</div>
		<!-- //Horizontal Tab -->
	</div>
	<div class="agileits_w3layouts_copyright text-center">
		<p>© 2017 Voting system. All rights reserved ZL Design by
			W3layouts</p>
	</div>


	<!--script-->
	<script src="js/easyResponsiveTabs.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			//Horizontal Tab
			$('#parentHorizontalTab_agile').easyResponsiveTabs({
				type : 'default', //Types: default, vertical, accordion
				width : 'auto', //auto or any width like 600px
				fit : true, // 100% fit in a container
				tabidentify : 'hor_1', // The tab groups identifier
				activate : function(event) { // Callback function if tab is switched
					var $tab = $(this);
					var $info = $('#nested-tabInfo');
					var $name = $('span', $info);
					$name.text($tab.text());
					$info.show();
				}
			});
		});
	</script>
	<script type="text/javascript">
		//判断密码
		window.onload = function() {
			document.getElementById("password1").onchange = validatePassword;
			document.getElementById("password2").onchange = validatePassword;
		}
		function validatePassword() {
			var pass2 = document.getElementById("password2").value;
			var pass1 = document.getElementById("password1").value;
			if (pass1 != pass2)
				document.getElementById("password2").setCustomValidity(
						"Passwords Don't Match");
			else
				document.getElementById("password2").setCustomValidity('');
		}
	</script>
</body>
</html>