<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 1.要使用Bootstrap的话，必须是html5文档-->
<meta charset="UTF-8">
<!-- 2.移动设备优先 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 3.导入核心的css文件 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<!-- 4.需要引入jQuery文件 -->
<script type="text/javascript" src="bootstrap/js/jQuery.js"></script>
<script type="text/javascript" src="bootstrap/js/ajax.js"></script>
<!-- 5.引入Bootstrap的核心JS文件 -->
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>修改用户信息</title>
<style type="text/css">
#img {
	width: 50px;
	height: 50px;
}
</style>
</head>
<body background="./imgs/l.jpg">

	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-2">
	 	<form id="f1" action="updateTouxiang"  method="post"  enctype="multipart/form-data"  class="form-horizontal f1">
					<input type="hidden" name="id" value="${user.id }"> 
					<div class="form-group">
						<label class="col-sm-3 col-sm-offset-2 control-label text-info">
							<img src="${user.touxiang }" width="90" height="90">
						</label>
						
					 <div class="col-sm-4 f1input1">
							<input type="file" name="touxiang" class="form-control input-sm" />
						</div>
						<div class="col-sm-4  f1input2">
						 
						  <button class="btn" type="submit">修改头像</button>					 
						</div>
						</div>
					 
				</form> 
				<form action="updateUser" method="post"  >
				<input type="hidden" name="_method" value="PUT">
				<input type="hidden" name="id" value="${user.id }" />
				
					<h1 class="text-center text-danger"><font face="幼圆">修改用户信息</font></h1>
					<hr>
					
					<div class="form-group">
						<label>真实姓名:</label> 
						<input type="text" name="name" value="${user.name }" class="form-control"/>
					</div>
					<div class="form-group">
						<label>用&nbsp;&nbsp;户&nbsp;&nbsp;名:</label> 
						<input type="text" name="userName" value="${user.userName }" class="form-control"/>
					</div>
					<div class="form-group">
						<label>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</label> 
						<input type="text" name="password" value="${user.password }" class="form-control"/>
					</div>
					<div class="form-group">
						<label>手机号码:</label> 
						<input type="text" name="phone" value="${user.phone }" class="form-control"/>
					</div>
					<div class="form-group">
						<label>注册时间:</label> 
						<input type="date" name="time" value="${user.time }" class="form-control"/>
					</div>
					<br>
					<div class="form-group text-center">
						<ul class="list-inline">
							<li><button type="submit" class="btn btn-warning" style="width:200px;">修改</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-danger" style="width:200px;"><a href="showUserByPage">返回</a></button></li>
						</ul>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>