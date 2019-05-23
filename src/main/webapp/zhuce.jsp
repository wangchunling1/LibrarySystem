<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 1.要使用Bootstrap的话，必须是html5文档-->
<meta charset="UTF-8">
<!-- 2.移动设备优先 -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- 3.导入核心的CSS文件 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrapValidator.css" />
<!-- 4.需要引入jQuery文件 -->
<script type="text/javascript" src="bootstrap/js/jQuery.js"></script>
<!-- 5.引入Bootstrap的核心JS文件 -->
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrapValidator.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {

		$("#register").bootstrapValidator({

			feedbackIcons : {

				valid : "glyphicon glyphicon-ok",
				invalid : "glyphicon glyphicon-remove",
				validating : "glyphicon glyphicon-refresh"
			},

			fields : {

				touxiang : {

					validators : {

						notEmpty : {

							message : '头像不能为空'

						}

					}

				},

				name : {

					validators : {

						notEmpty : {

							message : '姓名不能为空'

						},

						regexp : {

							regexp : /^[\u0391-\uFFE5]{2,10}$/,
							message : '姓名必须是2-10位汉字'

						}

					}

				},

				phone : {

					validators : {

						notEmpty : {

							message : '手机号不能为空'

						},

						regexp : {

							regexp : /^1[3-9][0-9]{9}$/,
							message : '手机号输入格式不正确'

						}

					}
				},

				userName : {

					validators : {

						notEmpty : {

							message : '用户名不能为空'

						},

						regexp : {

							regexp : /^[A-z0-9_]{6,12}$/,
							message : '用户名必须由6-12个英文字母、数字和下划线组成'

						},
						
						remote:{
							
							message:'用户名已经存在',
							url:'AdminServlet',
							type:'post',//不指定type,默认为get
							
							data:{
								
								userName:$('input[name=userName]').val(),
								
								action:'validateUserName'
								
							}

						}

					}

				},

				password : {

					validators : {

						notEmpty : {

							message : '密码不能为空'

						},

						regexp : {

							regexp : /^[A-z0-9_]{6,12}$/,
							message : '密码必须由6-12个英文字母、数字或者下划线组成'
						},

						different : {

							field : 'userName',
							message : '密码不能和用户名一样'
						}

					}
				},

				repass : {

					validators : {

						notEmpty : {

							message : '确认密码不能为空'
						},

						regexp : {

							regexp : /^[A-z0-9_]{6,12}$/,
							message : '密码必须由6-12个英文字母、数字或者下划线组成'
						},

						identical : {

							field : 'password',
							message : '两次密码不一致'
						}

					}
				}
			}
		});
	});
</script>
</head>
<body background="imgs/i.jpg">
<div class="container-fluid" style="background-color: white;">
<table width="100%" height="50px" cellspacing="0">
		<tr height="80px">
			<td colspan="2">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
				color="red" size="7" face="楷体"><b>Ling</b></font>&nbsp;<font
				size="6">图书管理系统</font>&nbsp;<font size="6" color="silver">|</font>&nbsp;<font
				color="silver" size="5">注册</font>
			</td>
		</tr>
		</table>
</div>
	<div class="container" style="height: 650px;">
		<div class="row">
			<div class="col-md-5 col-md-offset-3">
				<form action="register" id="register" enctype="multipart/form-data" method="post">
					<br>
					<br>
					<div class="form-group">
						<label class="text-danger">头像：</label>
						<div class="img-responsive">
							<input type="file" name="touxiang" />
						</div>
					</div>
					<div class="form-group">
						<label class="text-danger">真实姓名：</label> <input type="text" name="name"
							class="form-control" placeholder="真实姓名"/>
					</div>
					<div class="form-group">
						<label class="text-danger">手机号：</label> <input type="text" name="phone"
							class="form-control" placeholder="手机号"/>
					</div>
					<div class="form-group">
						<label class="text-danger">用户名：</label> <input type="text" name="userName"
							class="form-control" placeholder="用户名"/>
					</div>
					<div class="form-group">
						<label class="text-danger">密码：</label> <input type="password" name="password"
							class="form-control" placeholder="密码"/>
					</div>
					<div class="form-group">
						<label class="text-danger">确认密码：</label> <input type="password" name="repass"
							class="form-control" placeholder="确认密码"/>
					</div>
					<div class="form-group">
						<label class="text-danger">点击注册：</label>
						<button type="submit" class="btn btn-warning btn-block">注册</button>
					</div>
					<div class="form-group">
						<label class="text-danger">已是管理员？点击这里去登录：</label>
						<a href="login.jsp" class="btn btn-danger btn-block">去登录吧~</a>
					</div>
				</form>
			</div>
		</div>
	</div>
<div class="container-fluid" style="background-color: white;">
	<table align="center">
	<tr height="100px">

			<td align="center" colspan="2"><font color="gray" size="4"
				face="楷体">Ling公司版权所有&copy;2000-2018</font></td>
		</tr>
	</table>
</div>
</body>
</html>