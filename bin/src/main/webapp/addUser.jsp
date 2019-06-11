<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 1.要使用Bootstrap的话，必须是html5文档-->
<meta charset="UTF-8">
<!-- 2.移动设备优先 -->
<mate name="viewport" content="width=device-width, initial-scale=1">
<!-- 3.导入核心的css文件 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<!-- 4.需要引入jQuery文件 -->
<script type="text/javascript" src="bootstrap/js/jQuery.js"></script> 
<!-- 5.引入Bootstrap的核心JS文件 -->
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>添加用户</title>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="jQuery/jquery-1.8.3.js"></script>
<script type="text/javascript">



	$(function(){
		   
		   $("tr:even").css("background-color","transparent");
		   
		   $("tr:odd").css("background-color","transparent");
		   
		   //事件
		   $("tr").mouseover(function(){
			   
			   $(this).css("background-color","LightYellow");
		   });
		   
		   $("tr").mouseout(function(){
			   
			   $("tr:even").css("background-color","transparent");
			   
			   $("tr:odd").css("background-color","transparent");
		   });
	   });
</script>

</head>
<body background="./imgs/l.jpg">
	
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-2">
				<form action="user" class="form-horizontal"  method="post" >
		            

					<h1 class="text-center text-danger"><font face="幼圆">添加用户</font></h1>
					<hr>
					<div class="form-group">
						<label>头&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;像:</label> 
						<input type="file" name="touxiang" onblur="validateTouxiang()" class="form-control"/>
				        <span id="touxiangMsg"></span>
					</div>
					<div class="form-group">
						<label>真实姓名:</label> 
						<input type="text" name="name" onblur="validateName()" class="form-control" placeholder="真实姓名"/>
				       <span id="nameMsg"></span>
					</div>
					<div class="form-group">
						<label>用&nbsp;&nbsp;户&nbsp;&nbsp;名:</label> 
						<input type="text" name="userName" onblur="validateUName()" class="form-control" placeholder="用户名"/>
				        <span id="UNameMsg"></span>
					</div>
					<div class="form-group">
						<label>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</label> 
						<input type="text" name="password" onblur="validatePasswprd()" class="form-control" placeholder="密码"/>
				         <span id="passwordMsg"></span>
					</div>
					<div class="form-group">
						<label>手机号码:</label> 
						<input type="text" name="phone" onblur="validatePhone()" class="form-control" placeholder="手机号码"/>
				        <span id="phoneMsg"></span> 
					</div>
					<div class="form-group">
						<label>注册时间:</label> 
						<input type="date" name="time" onblur="validateTime()" class="form-control"/>
				        <span id="timeMsg"></span>
					</div>
					<br>
					<div class="form-group text-center">
						<ul class="list-inline">
							<li><button type="submit" class="btn btn-warning" style="width:200px;">添加用户</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="reset" class="btn btn-danger" style="width:200px;">重置</button></li>
						</ul>
						</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>