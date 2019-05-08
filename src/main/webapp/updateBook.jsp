<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<script type="text/javascript" src="bootstrap/js/jQuery.js"></script> <!-- 5.引入Bookstrap的核心JS文件 -->
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改图书</title>
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
	};
</script>
</head>
<body background="./imgs/l.jpg">
	<%-- <center>
		<form action="BookServlet?action=update" method="post"
			enctype="application/x-www-form-urlencoded" name="upp"
			onsubmit="return upp()">
			<input type="hidden" name="id" value="${b.id }" />
			<table width="350px" height="200px" align="center" border="1px"
				bordercolor="silver" cellspacing="0">
				<caption align="top">
					<h1>
						<font color="red">修改图书</font>
					</h1>
					<hr size="2px" color="red" width="600px" />
				</caption>
				<tr align="center">
					<td>请选择分类:</td>
					<td>
					<select name="name" id="fenleiList">
					<option>---请选择您要修改的分类---</option>
					</select>
					</td>
				</tr>
				<tr align="center">
					<td>图&nbsp;书&nbsp;名&nbsp;称:</td>
					<td><input type="text" name="bname" value="${b.bname }"
						onblur="validatebName()" /></td>
					<td width="300px"><span id="BNameMsg"></span></td>
				</tr>
				<tr align="center">
					<td>图&nbsp;书&nbsp;价&nbsp;格:</td>
					<td><input type="text" name="price" value="${b.price }"
						onblur="validateprice()" /></td>
					<td width="300px"><span id="PriceMsg"></span></td>
				</tr>
				<tr align="center">
					<td>出&nbsp;&nbsp;&nbsp;版&nbsp;&nbsp;&nbsp;社:</td>
					<td><input type="text" name="chuban" value="${b.chuban }"></td>
				</tr>
				<tr align="center">
					<td>状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态:</td>
					<td><input type="text" name="zhuangtai"
						value="${b.zhuangtai }" /></td>
				</tr>
				<tr align="center">
					<td>借&nbsp;&nbsp;&nbsp;书&nbsp;&nbsp;&nbsp;人:</td>
					<td><input type="text" name="jieshuren"
						value="${b.jieshuren }"></td>
				</tr>
				<tr align="center" height="30px">
					<td colspan="2"><input type="submit" value="修改" class="btn btn-success btn-xs">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
						type="reset" value="重置" class="btn btn-info btn-xs"></td>
				</tr>
			</table>
		</form> --%>
		<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-2">
				<form action="BookServlet?action=update" method="post" enctype="application/x-www-form-urlencoded">
					<input type="hidden" name="id" value="${b.id }" />
					<h1 class="text-center text-danger"><font face="幼圆">修改图书信息</font></h1>
					<hr>
					<!-- <ul class="nav">
						<li><b>请选择您想要修改的分类:</b></li>
						<li><select name="name" id="fenleiList" class="form-control">
								<option>---请选择您要修改的分类---</option>
						</select></li>
					</ul> -->
					<br>
					<div class="form-group">
						<label>分&nbsp;类&nbsp;名&nbsp;称:</label> <input type="text"
							name="flname" class="form-control" value="${b.flname }"/>
					</div>
					<div class="form-group">
						<label>图&nbsp;书&nbsp;名&nbsp;称:</label> <input type="text"
							name="bname" class="form-control" value="${b.bname }"/>
					</div>
					<div class="form-group">
						<label>图&nbsp;书&nbsp;价&nbsp;格:</label> <input type="text"
							name="price" class="form-control" value="${b.price }"/>
					</div>
					<div class="form-group">
						<label>出&nbsp;&nbsp;&nbsp;版&nbsp;&nbsp;&nbsp;社:</label> <input
							type="text" name="chuban" class="form-control" value="${b.chuban }"/>
					</div>
					<div class="form-group">
						<label>状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态:</label> 
						<input type="text" name="zhuangtai" value="${b.zhuangtai }" class="form-control"/>
					</div>
					<div class="form-group">
						<label>借&nbsp;&nbsp;&nbsp;书&nbsp;&nbsp;&nbsp;人:</label> 
						<input type="text" name="jieshuren" class="form-control" value="${b.jieshuren }"/> 
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