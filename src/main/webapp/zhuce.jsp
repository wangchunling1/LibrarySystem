﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrapValidator.css">

<script type="text/javascript" src="bootstrap/js/jQuery.js"></script>
<script type="text/javascript" src="bootstrap/js/ajax.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>

<script type="text/javascript" src="bootstrap/js/bootstrapValidator.js"></script>
<title>注册</title>

<script type="text/javascript">
	$(function() {
		$(".form-horizontal").bootstrapValidator({


					feedbackIcons : {


						valid : "glyphicon glyphicon-ok",
						invalid : "glyphicon glyphicon-remove",
						validating : "glyphicon glyphicon-refresh"
					},


					fields : {


						userName : {


							validators : {


								notEmpty : {


									message : '用户名不能为空'


								},


								regexp : {


									regexp : /^[A-z0-9_]{3,25}$/,
									message : '用户名必须由3-25个英文字母、数字和下划线组成'


								},


								remote : {
									
									
									message : '该用户已被注册，请重新输入',


									url : "validate2",


									type : 'post',


									data : function(validator) {


										return {


											userName : $("input[name=userName]").val()
										}
									}
								}


							}
						}
					}
				});
	});
</script> 
</head>
<body background="imgs/t.jpg">

   <tr height="80px">
			<td colspan="2">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
				color="red" size="7" face="楷体"><b>Ling</b></font>&nbsp;<font
				size="6">图书管理系统</font>&nbsp;<font size="6" color="silver">|</font>&nbsp;<font
				color="silver" size="5">注册</font>
			</td>
		</tr>
		
		<hr>
	<div class = "container">
		<h1 align = "center">图书管理系统----管理员注册</h1>
		<hr width="1000px">
		<form action="register" class="form-horizontal" method="post" enctype="multipart/form-data">
		
			<!-- 姓名 -->
			<div class="form-group">
				<label for="name" class="col-sm-4 control-label">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="name"
						name="name" />
				</div>	
			</div>
			
			<!-- 手机 -->
			<div class="form-group">
				<label for="phone" class="col-sm-4 control-label">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="phone"
						name="phone" />
				</div>	
			</div>
			
			
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
			
			<!-- 头像 -->
			<div class="form-group">
				<label for="touxiang" class="col-sm-4 control-label">头&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;像</label>
				<div class="col-sm-4">
			      <input type="file" class="form-control" id="touxiang"
						name="touxiang" />
						
				 </div>	
			</div>
			
			
			<div class="form-group">
				<div class="col-sm-offset-5 col-sm-4">
					<button type="submit" class="btn btn-info">点击注册</button>
				</div>
			</div>
		
		</form>
		
		<div class="col-sm-offset-5 col-sm-4">
			<a href="login.jsp">已经是管理员？直接登录</a>
		</div>
	
	</div>
		
</body>
</html>