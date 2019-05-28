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
<!-- <style type="text/css">
.container {
	border: 1px solid aqua;
	background-color: lightpink;
}

.container-fluid {
	border: 1px solid green;
}
</style> -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%-- <c:if test="${!(empty msg) }">
	<script>
		alert("${msg }");
	</script>
	<c:remove var="msg" scope="session" />
</c:if> --%>
<title>添加分类</title>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="jQuery/jquery-1.8.3.js"></script>
<script type="text/javascript">
	var flag;

	function validateName() {

		var name = document.fenlei.name;

		var nameReg = /^[\u0391-\uFFE5_A-z0-9]{2,15}$/;

		var NameMsg = document.getElementById("NameMsg");

		ajax({
			method : "POST",
			url : "FenleiServlet",
			params : "action=validateName&name=" + name.value,
			type : "text",
			success : function(data) {

				if (nameReg.test(name.value)) {

					if (data == "0") {//图书名称已经存在

						NameMsg.style.color = "red";

						NameMsg.innerHTML = "此分类名称已经存在";

						name.focus();

						flag = false;

					} else {//图书名称不存在

						NameMsg.style.color = "darkcyan";

						NameMsg.innerHTML = "此分类名称可以添加";

						flag = true;

					}

				} else {

					NameMsg.style.color = "red";

					NameMsg.innerHTML = "必须是长度为2-15的汉字字母数字下划线";
					
					name.focus();

					flag = false;
				}
			}
		})
	}

	/*	var xmlhttp = getXMLHttpRequest();

		xmlhttp.open("POST", "FenleiServlet", true);

		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");

		xmlhttp.send("action=validateName&name=" + name.value);
		
		var nameReg = /^[\u0391-\uFFE5_A-z0-9]{2,15}$/;

		var flag1 = nameReg.test(name.value);

		var NameMsg = document.getElementById("NameMsg");
		
		if (flag1) {

		xmlhttp.onreadystatechange = function() {

			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

				var content = xmlhttp.responseText;

				var span = document.getElementById("NameMsg");

				if (content == "0") {//图书名称已经存在

					span.style.color = "red";

					span.innerHTML = "此分类名称已经存在";

					span.focus();

					flag = false;					

				} else {//图书名称不存在

					span.style.color = "darkcyan";

					span.innerHTML = "此分类名称可以添加";

					flag = true;
					
				}
				
			 }
			
		  }
		} else {

			NameMsg.style.color = "red";

			NameMsg.innerHTML = "必须是长度为2-15的汉字字母数字下划线";

			flag=false;
		}
				
	}*/

	function Fenlei() {

		//alert(flag);
		return (flag);
	};
	

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
	<form action="FenleiServlet?action=addFenlei" method="post"
		enctype="application/x-www-form-urlencoded" name="fenlei"
		onsubmit="return Fenlei()">
		<br>
					<br>
						<h1 class="text-center text-danger"><font face="幼圆">添加分类</font></h1>
						<hr>
	                <div class="form-group">
						<label>请输入分类的名称:</label> 
						<input type="text" name="name" class="form-control" onblur="validateName()" placeholder="分类名称"/>
						<span id="NameMsg"></span>
					</div>
					<br>
					<div class="form-group text-center">
						<ul class="list-inline">
							<li><button type="submit" class="btn btn-warning" style="width:200px;">添加</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="reset" class="btn btn-danger" style="width:200px;">重填</button></li>
						</ul>
						</div>
					
					</form>
					</div>
					</div>
					</div>
</body>
</html>