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
<c:if test="${!(empty msg3) }">
	<script>
		alert("${msg3 }");
	</script>
	<c:remove var="msg3" scope="session" />
</c:if>
<title>添加用户</title>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="jQuery/jquery-1.8.3.js"></script>
<script type="text/javascript">

	var flag;

	//1.校验姓名
	function validateName() {

		var name = document.user.name;

		var nameReg = /^[\u0391-\uFFE5]{2,10}$/;

		var flag1 = nameReg.test(name.value);

		var nameMsg = document.getElementById("nameMsg");

		if (flag1) {

			nameMsg.style.color = "darkcyan";

			nameMsg.innerHTML = "姓名合法";

			return true;

		} else {

			nameMsg.style.color = "red";

			nameMsg.innerHTML = "姓名必须是2-10位汉字";

			name.focus();

			return false;
		}

	}

	//2.校验用户名
	function validateUName() {

		var userName = document.user.userName;

		var nameReg = /^[A-z0-9_]{3,15}$/;//必须是数字字母下划线，长度3-15

		var UNameMsg = document.getElementById("UNameMsg");

		ajax({
			method : "POST",
			url : "UserServlet",
			params : "action=validateUName&userName=" + userName.value,
			type : "text",
			success : function(data) {

				if (nameReg.test(userName.value)) {

					if (data == "0") {//用户名已经存在

						UNameMsg.style.color = "red";

						UNameMsg.innerHTML = "此用户名已经存在";

						userName.focus();

						flag = false;

					} else {//用户名不存在

						UNameMsg.style.color = "darkcyan";

						UNameMsg.innerHTML = "此用户名可以添加";

						flag = true;

					}

				} else {

					UNameMsg.style.color = "red";

					UNameMsg.innerHTML = "必须是数字字母下划线，长度3-15";

					userName.focus();

					flag = false;
				}

			}
		})
	}

	/*	var xmlhttp = getXMLHttpRequest();

		xmlhttp.open("POST", "UserServlet", true);

		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");

		xmlhttp.send("action=validateUName&userName=" + userName.value);

		var nameReg = /^[A-z0-9_]{3,15}$/;//必须是数字字母下划线，长度3-15

		var flag1 = nameReg.test(userName.value);

		var UNameMsg = document.getElementById("UNameMsg");

		if (flag1) {//用户名合法

			xmlhttp.onreadystatechange = function() {

				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

					var content = xmlhttp.responseText;

					var span = document.getElementById("UNameMsg");

					if (content == "0") {//用户名已经存在

						span.style.color = "red";

						span.innerHTML = "此用户名已经存在";

						span.focus();

						flag = false;

					} else {//用户名不存在

						span.style.color = "darkcyan";

						span.innerHTML = "此用户名可以添加";

						flag = true;

					}
					
				}

			}
		} else {

			UNameMsg.style.color = "red";

			UNameMsg.innerHTML = "必须是数字字母下划线，长度3-15";

			flag=false;
		}

	}
	 */
	//3.校验密码
	function validatePasswprd() {

		var password = document.user.password;

		var reg = /^(\w|\W){6,15}$/;

		var passwordMsg = document.getElementById("passwordMsg");

		if (reg.test(password.value)) {

			passwordMsg.style.color = "darkcyan";

			passwordMsg.innerHTML = "密码合法";

			return true;

		} else {

			passwordMsg.style.color = "red";

			passwordMsg.innerHTML = "必须是长度为6-15的数字字母下划线或者特殊字符";

			password.focus();

			return false;
		}
	}

	//4.校验手机号
	function validatePhone() {

		var phone = document.user.phone;

		var reg = /^1[3-9][0-9]{9}$/;

		var phoneMsg = document.getElementById("phoneMsg");

		if (reg.test(phone.value)) {

			phoneMsg.style.color = "darkcyan";

			phoneMsg.innerHTML = "手机号合法";

			return true;

		} else {

			phoneMsg.style.color = "red";

			phoneMsg.innerHTML = "手机号不合法";

			phone.focus();

			return false;
		}

	}

	//5.校验日期格式
	/* 	function validateTime() {

	 var time = document.user.time;

	 var reg = /^[1-9]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;

	 var timeMsg = document.getElementById("timeMsg");

	 if (reg.test(time.value)) {

	 timeMsg.style.color = "darkcyan";

	 timeMsg.innerHTML = "日期格式正确";

	 return true;
	 } else {

	 timeMsg.style.color = "red";

	 timeMsg.innerHTML = "日期格式不正确，正确格式为：2014-01-01";
	
	 time.focus();

	 return false;
	 } */

	function validateTime() {

		var time = document.user.time;

		var timeMsg = document.getElementById("timeMsg");

		var date = new Date;

		var year = date.getFullYear();

		var month = date.getMonth();

		var day = date.getDate();

		var today = new Date(year, month, day);

		var reg = /\d+/g;

		var temp = time.value.match(reg);

		var foday = new Date(temp[0], parseInt(temp[1]) - 1, temp[2]);

		//var foday = new Date(year, month + 1, day);

		if (foday > today) {

			timeMsg.style.color = "red";

			timeMsg.innerHTML = "日期输入错误,在今天之后";

			//alert('在今天之后 ');

			time.focus();

			return false;

		} else if (foday < today) {

			timeMsg.style.color = "red";

			timeMsg.innerHTML = "日期输入错误,在今天之前";

			//alert('在今天之前 ');

			time.focus();

			return false;

		} else {

			timeMsg.style.color = "darkcyan";

			timeMsg.innerHTML = "日期输入正确";

			return true;
		}
	}
	 
	//6.校验头像
	    function validateTouxiang() {

			var touxiang = document.user.touxiang;

			var flag = false; //状态

			var arr = [ "jpg", "png", "gif" ];

			var index = touxiang.value.lastIndexOf(".");

			var ext = touxiang.value.substr(index + 1);
			//循环比较
			for (var i = 0; i < arr.length; i++) {

				if (ext == arr[i]) {

					flag = true; //一旦找到合适的，立即退出循环
					
					break;
				}
			}
			//条件判断
			if (flag) {
				
				touxiangMsg.style.color = "green";

				touxiangMsg.innerHTML = "头像格式合法";
				
				return true;
				
			} else {
				
				touxiangMsg.style.color = "red";

				touxiangMsg.innerHTML = "头像格式不合法";
				
				return false;
			}
		}

	function User() {

		//alert(flag);
		return validateName() && (flag) && validatePasswprd()
				&& validatePhone() && validateTime() && validateTouxiang();
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
	<%-- <form action="UserServlet?action=addUser" method="post"
		enctype="multipart/form-data" name="user"
		onsubmit="return User()">
		<table align="center" width="100px" height="300px" border="1px"
			cellspacing="0" bordercolor="silver">
			<caption align="top">
				<h1>
					<font color="red">添加用户</font>
				</h1>
				<hr size="2px" color="red" width="600px"/>
			</caption>
			<tr align="center">
				<td>头&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;像:</td>
				<td align="center"><input type="file" name="touxiang" onblur="validateTouxiang()"></td>
				<td width="300px"><span id="touxiangMsg"></span></td>
			</tr>
			<tr align="center">
				<td>真实姓名:</td>
				<td><input type="text" name="name" onblur="validateName()" /></td>
				<td width="300px"><span id="nameMsg"></span></td>
			</tr>
			<tr align="center">
				<td>用&nbsp;&nbsp;户&nbsp;&nbsp;名:</td>
				<td><input type="text" name="userName" onblur="validateUName()" /></td>
				<td width="300px"><span id="UNameMsg"></span></td>
			</tr>
			<tr align="center">
				<td>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</td>
				<td><input type="text" name="password"
					onblur="validatePasswprd()" /></td>
				<td width="300px"><span id="passwordMsg"></span></td>
			</tr>
			<tr align="center">
				<td>手机号码:</td>
				<td><input type="text" name="phone" onblur="validatePhone()" /></td>
				<td width="300px"><span id="phoneMsg"></span></td>
			</tr>
			<tr align="center">
				<td>注册时间:</td>
				<td><input type="date" name="time" onblur="validateTime()" /></td>
				<td width="300px"><span id="timeMsg"></span></td>
			</tr>
			
			<tr align="center">
				<td colspan="2"><input type="submit" value="添加用户" class="btn btn-success btn-xs"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="reset" value="重新填写" class="btn btn-info btn-xs"/></td>
				<td></td>
			</tr>
		</table>
	</form> --%>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-2">
				<form action="UserServlet?action=addUser" method="post"
		            enctype="multipart/form-data" name="user"
		            onsubmit="return User()">
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