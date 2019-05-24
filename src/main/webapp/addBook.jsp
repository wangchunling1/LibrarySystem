<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>添加图书</title>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="jQuery/jquery-1.8.3.js"></script>
<script type="text/javascript">
 $(function(){
	  $(".form-horizontal").bootstrapValidator({
		  
		  feedbackIcons:{
			  
			  valid : "glyphicon glyphicon-ok",
				invalid : "glyphicon glyphicon-remove",
				validating : "glyphicon glyphicon-refresh"
		  },
		  
		  fields:{
			  price : {
					validators : {
						
						notEmpty : {
							message : '书的价格不能为空'
						},
						regexp : {
							regexp :  /(^[1-9]\d*(\.\d{1,2})?$)|(^0(\.\d{1,2})?$)/,
							message : '价格格式不合法，正确格式为  52.11 或   52 或0.99'
						}

					}
				},
			  bname:{
				  
				  validators :{
					  
					  notEmpty : {

							message : '图书名称不能为空'

						},

						regexp : {

							regexp : /^[\u0391-\uFFE5_A-z0-9]{1,15}$/,
							message : '图书名称必须由长度为1-15的汉字字母数字下划线组成'

						},
					  
						remote:{
						  message:'该图书已被添加，请重新输入',
						  
						  url:"validate",
						
						  type:'post',
						  
						  data:function(validator){
							  
							  return{
								  
								  bname:$("input[name=bname]").val()
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
<body background="./imgs/l.jpg">

	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-2">
				<form action="book" method="post"
					enctype="application/x-www-form-urlencoded" name="add"
					onsubmit="return addb()" class="form-horizontal">
					<br>
					<h1 class="text-center text-danger">
						<font face="幼圆">添加图书</font>
					</h1>
					<hr>
					<div class="form-group">
						<label>请选择您想要添加的分类:</label> 
						<select name="fId" class="form-control">
							<c:forEach items="${fList }" var="fenlei">
								<option value="${fenlei.id }">${fenlei.name }</option>
							</c:forEach>
						</select>
					</div>
					<br>

					<div class="form-group">
						<label>图&nbsp;书&nbsp;名&nbsp;称:</label> <input type="text"
							name="bname" id="bname" class="form-control" placeholder="图书名称" />

					</div>
					<div class="form-group">
						<label>图&nbsp;书&nbsp;价&nbsp;格:</label> <input type="text"
							name="price" id="price" class="form-control" placeholder="图书价格" />
					</div>
					<div class="form-group">
						<label>出&nbsp;&nbsp;&nbsp;版&nbsp;&nbsp;&nbsp;社:</label> <input
							type="text" name="chuban" class="form-control" placeholder="出版社" />
					</div>
					<div class="form-group">
						<label>状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态:</label> <label
							class="radio-inline"> <input type="radio"
							name="zhuangtai" value="未借出" checked />未借出
						</label> <label class="radio-inline"> <input type="radio"
							name="zhuangtai" value="借出" />借出
						</label>
					</div>
					<div class="form-group">
						<label>借&nbsp;&nbsp;&nbsp;书&nbsp;&nbsp;&nbsp;人:</label> <input
							type="text" name="jieshuren" checked value="无"
							class="form-control" />
					</div>
					<br>
					<div class="form-group text-center">
						<ul class="list-inline">
							<li><button type="submit" class="btn btn-warning"
									style="width: 200px;">添加</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="reset" class="btn btn-danger"
									style="width: 200px;">重填</button></li>
						</ul>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>