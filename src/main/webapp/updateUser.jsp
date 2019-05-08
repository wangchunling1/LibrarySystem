<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 1.要使用Bokkstrap的话，必须是html5文档-->
<meta charset="UTF-8">
<!-- 2.移动设备优先 -->
<mate name="viewport" content="width=device-width, initial-scale=1">
<!-- 3.导入核心的css文件 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<!-- 4.需要引入jQuery文件 -->
<script type="text/javascript" src="bootstrap/js/jQuery.js"></script> 
<!-- 5.引入Bookstrap的核心JS文件 -->
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改用户信息</title>
<style type="text/css">
#img {
	width: 50px;
	height: 50px;
}
</style>
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
<body background="./imgs/l.jpg">

	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-2">
				<form action="UserServlet?action=update" method="post" enctype="multipart/form-data">
				<input type="hidden" name="id" value="${u.id }" />
					<h1 class="text-center text-danger"><font face="幼圆">修改用户信息</font></h1>
					<hr>
					<div class="form-group">
						<label>头&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;像:</label> 
						<img src="/img${u.touxiang }" id="img" class="img-circle"/>
						<input type="file" name="touxiang" value="${u.touxiang }" class="form-control"/>
					</div>
					<div class="form-group">
						<label>真实姓名:</label> 
						<input type="text" name="name" value="${u.name }" class="form-control"/>
					</div>
					<div class="form-group">
						<label>用&nbsp;&nbsp;户&nbsp;&nbsp;名:</label> 
						<input type="text" name="userName" value="${u.userName }" class="form-control"/>
					</div>
					<div class="form-group">
						<label>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</label> 
						<input type="text" name="password" value="${u.password }" class="form-control"/>
					</div>
					<div class="form-group">
						<label>手机号码:</label> 
						<input type="text" name="phone" value="${u.phone }" class="form-control"/>
					</div>
					<div class="form-group">
						<label>注册时间:</label> 
						<input type="date" name="time" value="${u.time }" class="form-control"/>
					</div>
					<br>
					<div class="form-group text-center">
						<ul class="list-inline">
							<li><button type="submit" class="btn btn-warning" style="width:200px;">修改</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="reset" class="btn btn-danger" style="width:200px;">清空</button></li>
						</ul>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>