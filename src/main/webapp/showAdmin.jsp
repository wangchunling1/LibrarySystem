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
<style>

#div1 {
	background-size: cover;
}

</style>
</head>
<body background="./imgs/l.jpg">
	
         <div class="container">
		<div class="panel panel-warning">
			<div class="panel-heading">
				<div class="panel-title">
					<h2>查看管理员信息</h2>
				</div>
			</div>
		<!-- <h1 class="text-center text-danger"><span class="glyphicon glyphicon-user"></span></h1> -->

<div class="container-fluid" id="div1">
     <div class="panel-body">
		<table class="table table-borderd table-striped table-hover" width="500px"
			height="300px" cellspacing="0">
			<tr align="center">
				<td>编号</td>
				<td>${admin.id}</td>
			</tr>
			
			<tr align="center">
				<td>姓名</td>
				<td>${admin.name}</td>
			</tr>
			
			<tr align="center">
				<td>手机</td>
				<td>${admin.phone}</td>
			</tr>
			
			<tr align="center">
				<td>账号</td>
				<td>${admin.userName}</td>
			</tr>
			
			<tr align="center">
				<td>密码</td>
				<td><input type="password" value="${admin.password}" disabled="disabled"/></td>
			</tr>
			
			<tr align="center">
				<td>头像</td>
				<td>
			       <img src="touxiang/${sessionScope.touxiang }" style="width:60px;height:50px" class="img-cicle img-responsive" />
			    </td>
			</tr>
			
		</table>
		</div>
		</div>
		</div>
		</div>
</body>
</html>