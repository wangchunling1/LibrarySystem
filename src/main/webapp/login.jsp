<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<meta name="viewport" content="width=device-width,initial-scale=1">
<!--移动设备优先 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
<!--导入核心css文件 -->
<script type="text/javascript" src="bootstrap/js/jquery.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>

<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript">
	
</script>
<title>登录</title>
</head>
<body background="imgs/t.jpg">
     <tr height="80px">
			<td colspan="2">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
				color="red" size="7" face="楷体"><b>Ling</b></font>&nbsp;<font
				size="6">图书管理系统</font>&nbsp;<font size="6" color="silver">|</font>&nbsp;<font
				color="silver" size="5">登录</font>
			</td>
		</tr>
		<hr>
      <div class = "container">
		<h1 align="center">图书管理系统----管理员登录</h1>
		<hr width="1000px">
		<form action="login" class="form-horizontal" method="post">

			<!-- 用户名 -->
			<div class="form-group">
				<label for="userName" class="col-sm-4 control-label">用&nbsp;&nbsp;户&nbsp;&nbsp;名</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="userName"
						name="userName" />
				</div>
			</div>

			<!-- 密码 -->
			<div class="form-group">
			
				<label for="password" class="col-sm-4 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="password"
						name="password" />
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-5 col-sm-4">
					<button type="submit" class="btn btn-info">点击登录</button>
				</div>
			</div>

		</form>
		<div class="col-sm-offset-5 col-sm-4">
			<a href="zhuce.jsp">还不是管理员？点击注册</a>
		</div>
	</div>

</body>
</html>