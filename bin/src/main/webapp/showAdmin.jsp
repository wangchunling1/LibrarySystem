<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 1.要使用Bokkstrap的话，必须是html5文档-->
<meta charset="UTF-8">
<!-- 2.移动设备优先 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 3.导入核心的css文件 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<!-- 4.需要引入jQuery文件 -->
<script type="text/javascript" src="bootstrap/js/jQuery.js"></script> 
<!-- 5.引入Bookstrap的核心JS文件 -->
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<style type="text/css">
a {
	text-decoration: none;
}
</style>
<title>查看管理员信息</title>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="jQuery/jquery-1.8.3.js"></script>
<script type="text/javascript">
	window.onload = function() {

		var opt = {

			method : "POST",

			url : "AdminServlet",

			params : "action=showAdmin",

			type : "json",

			success : function(data) {

				var admin = data;

				var id = document.getElementById("id");

				id.innerHTML = admin.id;

				var name = document.getElementById("name");

				name.innerHTML = admin.name;

				var phone = document.getElementById("phone");

				phone.innerHTML = admin.phone;

				var userName = document.getElementById("userName");

				userName.innerHTML = admin.userName;

				var password = document.getElementById("password");

				password.value = admin.password;

				var touxiang = document.getElementById("touxiang");

				var img = document.createElement("img");

				img.src = "/img" + admin.touxiang;

				img.width = 50;

				img.height = 50;

				touxiang.appendChild(img);

			}

		};

		ajax(opt);
	};

	$(function() {

		$("tr:even").css("background-color", "transparent");

		$("tr:odd").css("background-color", "transparent");

		//事件
		$("tr").mouseover(function() {

			$(this).css("background-color", "LightYellow");
		});

		$("tr").mouseout(function() {

			$("tr:even").css("background-color", "transparent");

			$("tr:odd").css("background-color", "transparent");
		});
	});
</script>
</head>
<body background="./imgs/l.jpg">
	<%-- <center>
		<table width="300px" height="300px" border="1px" bordercolor="pink"
			cellspacing="0">

			<caption align="top">
				<h1>
					<font color="red">查看管理员信息</font>
				</h1>
				<hr size="2px" color="red" width="600px" />
			</caption>

			<tr align="center">
				<td>编号</td>
				<td id="id"></td>
			</tr>

			<tr align="center">
				<td>头像</td>
				<td id="touxiang"></td>
			</tr>

			<tr align="center">
				<td>姓名</td>
				<td id="name"></td>
			</tr>

			<tr align="center">
				<td>手机</td>
				<td id="phone"></td>
			</tr>

			<tr align="center">
				<td>账号</td>
				<td id="userName"></td>
			</tr>

			<tr align="center">
				<td>密码</td>
				<td><input type="password" id="password" disabled="disabled" /></td>
			</tr>
		</table> --%>
	<div class="container">
     <div class="panel panel-warning">
       <div class="panel-heading">
         <div class="panel-title">
           <h2>查看图书</h2>
         </div>
       </div>
       <div class="panel-body">
         <table class="table table-borderd table-striped table-hover">
         <tr align="center" height="60px">
				<td>编号</td>
				<td id="id"></td>
			</tr>

			<tr align="center" height="60px">
				<td>头像</td>
				<td id="touxiang"></td>
			</tr>

			<tr align="center" height="60px">
				<td>姓名</td>
				<td id="name"></td>
			</tr>

			<tr align="center" height="60px">
				<td>手机</td>
				<td id="phone"></td>
			</tr>

			<tr align="center" height="60px">
				<td>账号</td>
				<td id="userName"></td>
			</tr>

			<tr align="center">
				<td>密码</td>
				<td><input type="password" id="password" disabled="disabled" /></td>
			</tr>
			</table>
			</div>
			</div>
			</div>
</body>
</html>