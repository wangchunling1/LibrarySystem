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
		$("#login").bootstrapValidator({

			feedbackIcons : {
				valid : "glyphicon glyphicon-ok",
				invalid : "glyphicon glyphicon-remove",
				validating : "glyphicon glyphicon-refresh"
			},
			fields : {
				name : {
					validators : {
						notEmpty : {
							message : '姓名不能为空'
						},
						regexp : {
							regexp : /^[\u0391-\uFFE5]{2,10}$/,
							message : '姓名必须是2~10个汉字'
						},
					}
				},
				 phone:{
					  validators:{
						  notEmpty:{
							  message:'手机号不能为空'
						  },
						  regexp:{
							  regexp:/^1[3-9][0-9]{9}$/,
						    message:'手机号不合法'
						  },
					  }
				  },
				  userName:{
					  validators:{
						  notEmpty:{
							  message:'用户名不能为空'
						  },
						  regexp:{
							  regexp:/^[A-Za-z_\.]{6,12}$/,
						    message:'用户名必须是6~12位字母或下划线'
						  },
					  }
				  },
				password:{
					  validators:{
						  notEmpty:{
							  message:'密码不能为空'
						  },
						  regexp:{
							  regexp:/^[A-Za-z_\.0-9]{6,}$/,
							    message:'密码至少六位数'
							  },
						  different:{
							  field:'userName',
							 message:'密码不能和用户名一样'
						  }
						  
					  }
				  },
				  repassword:{
					  validators:{
						  notEmpty:{
							  message:'确认密码不能为空'
						  },
						  identical:{
							  field:'password',
								  message:'两次密码不一致'
						  }
						  
					  }
				  },
				 

				
				
				  time: {
					validators : {
						notEmpty : {
							message : '注册时间不能为空'
						},
						regexp : {
							regexp : /^([1][7-9][0-9][0-9]|[2][0][0-9][0-9])(\-)([0][1-9]|[1][0-2])(\-)([0-2][1-9]|[3][0-1])$/g,
							message : '注册时间必须是当天'
						},
					}
				},
				
			}

		})
		 
	   });
</script>

</head>
<body background="./imgs/l.jpg">
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<form id="login" action="add" method="post">
					<h3 class="text-center text-success">添加用户</h3>
					<div class="form-group">
						<label>姓&nbsp;&nbsp;名&nbsp;:</label> <input type="text"
							name="name" class="form-control" />
					</div>
					<div class="form-group">
						<label>手&nbsp;机&nbsp;号&nbsp;码:</label> <input type="text"
							name="phone" class="form-control" />
					</div>
					<div class="form-group">
						<label>用&nbsp;&nbsp;&nbsp;户&nbsp;&nbsp;&nbsp;名:</label> <input
							type="text" name="username" class="form-control" />
					</div>
                    <div class="form-group">
						<label>密&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;&nbsp;</label> <input
							type="text" name="password" class="form-control" />
					</div>
					  <div class="form-group">
						<label>确&nbsp;&nbsp;认&nbsp;&nbsp;密&nbsp;&nbsp;码</label> <input
							type="text" name="repassword" class="form-control" />
					</div>
					<div class="form-group">
						<label>注&nbsp;&nbsp;册&nbsp;时&nbsp;&nbsp;&nbsp;间:</label> <input
							type="date" name="zhucetime" class="form-control" />
					</div>
					
					<div class="form-group">
						<button type="submit" class="btn btn-success btn-block">添加</button>
						<button type="reset" class="btn btn-success btn-block">重填</button>
					</div>
				</form>

			</div>


		</div>

	</div>
	 
</body>
</html>