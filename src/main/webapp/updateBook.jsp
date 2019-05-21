<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<!-- 5.引入Bootstrap的核心JS文件 -->
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改图书</title>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="jQuery/jquery-1.8.3.js"></script>
<script type="text/javascript">
	/* $(function() {

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
	}); */

	/* window.onload = function() {

		ajax({

			method : "POST",

			url : "FenleiServlet",

			ansy : true,

			params : "action=updateShowFenlei",

			type : "xml",

			success : function(data) {

				var select = document.getElementById("fenleiList");

				var names = data.getElementsByTagName("name");

				for (var i = 0; i < names.length; i++) {

					var name = names[i];

					var opt = document.createElement("option");

					var value;

					if (window.addEventListener) {

						value = name.textContent;

					} else {

						value = text;
					}

					opt.innerHTML = value;

					opt.value = value;

					select.appendChild(opt);
				}
			}
		}); */
</script>
</head>
<body background="./imgs/l.jpg">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-2">
				<form action="book" method="post"
					enctype="application/x-www-form-urlencoded">
					<input type="hidden" name="_method" value="PUT"> <input
						type="hidden" name="id" value="${book.id }" />
					<h1 class="text-center text-danger">
						<font face="幼圆">修改图书信息</font>
					</h1>
					<hr>
					<ul class="nav">
						<li><b>请选择您想要修改的分类:</b></li>
						<li> 
						<select name="fId" class="form-control">
						<!-- list 1 2 3 -->
						<!-- monster school schoolId 2 -->
						<c:forEach items="${flist }" var="f">
							<c:if test="${f.id == book.fenlei.id}">
								<option value="${f.id }" selected="selected">${f.name }</option>
							</c:if>
							<c:if test="${f.id != book.fenlei.id}">
								<option value="${f.id }">${f.name }</option>
							</c:if>
						</c:forEach>
						</select></li>
					</ul>
					<br>

					<div class="form-group">
						<label>图&nbsp;书&nbsp;名&nbsp;称:</label> <input type="text"
							name="bname" class="form-control" value="${book.bname }" />
					</div>
					<div class="form-group">
						<label>图&nbsp;书&nbsp;价&nbsp;格:</label> <input type="text"
							name="price" class="form-control" value="${book.price }" />
					</div>
					<div class="form-group">
						<label>出&nbsp;&nbsp;&nbsp;版&nbsp;&nbsp;&nbsp;社:</label> <input
							type="text" name="chuban" class="form-control"
							value="${book.chuban }" />
					</div>
					<div class="form-group">
						<label>状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态:</label> <input
							type="text" name="zhuangtai" value="${book.zhuangtai }"
							class="form-control" />
					</div>
					<div class="form-group">
						<label>借&nbsp;&nbsp;&nbsp;书&nbsp;&nbsp;&nbsp;人:</label> <input
							type="text" name="jieshuren" class="form-control"
							value="${book.jieshuren }" />
					</div>
					<br>
					<div class="form-group text-center">
						<ul class="list-inline">
							<li><button type="submit" class="btn btn-warning"
									style="width: 200px;">修改</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="reset" class="btn btn-danger"
									style="width: 200px;">清空</button></li>
						</ul>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>