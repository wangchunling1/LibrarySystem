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
</head>
<body align="center"  background="./imgs/l.jpg">
	
         <caption>
			<font size="7" face="宋体">查看管理员信息</font>
		</caption>
		<h1 class="text-center text-danger"><span class="glyphicon glyphicon-user"></span></h1>


		<table  border="1" align="center" width="500px"
			height="300px" cellspacing="0">
			<tr align="center">
				<th>编号</th>
				<th>${admin.id}</th>
			</tr>
			
			<tr align="center">
				<th>姓名</th>
				<th>${admin.name}</th>
			</tr>
			
			<tr align="center">
				<th>手机</th>
				<th>${admin.phone}</th>
			</tr>
			
			<tr align="center">
				<th>账号</th>
				<th>${admin.userName}</th>
			</tr>
			
			<tr align="center">
				<th>密码</th>
				<th><input type="password" value="${admin.password}" disabled="disabled"/></th>
			</tr>
			
		</table>
</body>
</html>