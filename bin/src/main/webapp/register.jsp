<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 1.要使用Bokkstrap的话，必须是html5文档-->
<meta charset="UTF-8">
<!-- 2.移动设备优先 -->
<mate name="viewport" content="width=device-width, initial-scale=1"/>
<!-- 3.导入核心的css文件 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrapValidator.css"/>
<!-- 4.需要引入jQuery文件 -->
<script type="text/javascript" src="bootstrap/js/jQuery.js"></script> 
<!-- 5.引入Bookstrap的核心JS文件 -->
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrapValidator.js"></script>
<style type="text/css">
.container {
	width: 800px;
	height: 300px;
}
</style>
<title>注册</title>
<script type="text/javascript" src="js/ajax.js"></script>
<script>
	var flage1=false;
	var flage2=false;
	var flage3=false;
	var flage4=false;
	var flage5=false;
	var flage6=false;

	//1.校验姓名
	function validateName() {

		var name = document.register.name;

		var nameReg = /^[\u0391-\uFFE5]{2,10}$/;

		var flag1 = nameReg.test(name.value);

		var nameMsg = document.getElementById("nameMsg");

		if (flag1) {

			nameMsg.style.color = "darkcyan";

			nameMsg.innerHTML = "姓名合法";

			flage1=true;

		} else {

			nameMsg.style.color = "red";

			nameMsg.innerHTML = "姓名必须是2-10位汉字";

			name.focus();

			flage1=false;
		}

	}

	//2.校验用户名
	function validateUserName() {

		var userName = document.register.userName;

		var reg = /^[A-z0-9_]{3,15}$/;//必须是数字字母下划线，长度3-15

		var userNameMsg = document.getElementById("userNameMsg");

		ajax({
			method : "POST",
			url : "AdminServlet",
			params : "action=validateUserName&userName=" + userName.value,
			type : "text",
			success : function(data) {

				if (reg.test(userName.value)) {

					if (data == "0") {//用户名不存在，可以注册

						userNameMsg.style.color = "darkcyan";

						userNameMsg.innerHTML = "此用户名可以注册";

						flage2 = true;

					} else {//用户名存在

						userNameMsg.style.color = "red";

						userNameMsg.innerHTML = "此用户名已经存在";

						userName.focus();

						flage2 = false;

					}

				} else {

					userNameMsg.style.color = "red";

					userNameMsg.innerHTML = "必须是长度为3-15的数字字母下划线";

					userName.focus();

					flage2 = false;
				}

			}
		})
	}
	/*
	 var xmlhttp = getXMLHttpRequest();

	 xmlhttp.open("POST", "AdminServlet", true);

	 xmlhttp.setRequestHeader("Content-type",
	 "application/x-www-form-urlencoded");

	 xmlhttp.send("action=validateUserName&userName=" + userName.value);

	 if (reg.test(userName.value)) {

	 //userNameMsg.style.color = "darkcyan";

	 //userNameMsg.innerHTML = "用户名合法";
	
	 xmlhttp.onreadystatechange=function(){
	
	 if(xmlhttp.readyState==4 && xmlhttp.status==200){
	
	 var content=xmlhttp.responseText;
	
	 var span=document.getElementById("userNameMsg");
	
	 if(content=="0"){//用户名不存在，可以注册
	
	 span.style.color="darkcyan";
	
	 span.innerHTML="此用户名可以注册";
	
	 span.focus();
	
	 flag=true;
	
	 }else{//用户名存在
	
	 span.style.color="red";
	
	 span.innerHTML="此用户名已经存在";
	
	 flag=false;
	
	 }
	 }
	 }
	 }else{

	 userNameMsg.style.color = "red";

	 userNameMsg.innerHTML = "必须是长度为3-15的数字字母下划线";

	 return false;
	 }
	 }
	 */
	//3.校验密码
	function validatePasswprd() {

		var password = document.register.password;

		var reg = /^(\w|\W){6,15}$/;

		var passwordMsg = document.getElementById("passwordMsg");

		if (reg.test(password.value)) {

			passwordMsg.style.color = "darkcyan";

			passwordMsg.innerHTML = "密码合法";

			flage3=true;
		} else {

			passwordMsg.style.color = "red";

			passwordMsg.innerHTML = "必须是长度为6-15的数字字母下划线或者特殊字符";

			password.focus();

			flage3=false;
		}
	}

	//4.确认密码
	function validateRepassword() {

		var password = document.register.password;

		var repassword = document.register.repassword;

		var repasswordMsg = document.getElementById("repasswordMsg");

		if (repassword.value == password.value) {

			repasswordMsg.style.color = "darkcyan";

			repasswordMsg.innerHTML = "两次密码一致";

			flage4=true;

		} else {

			repasswordMsg.style.color = "red";

			repasswordMsg.innerHTML = "两次密码不一致";

			repassword.focus();

			flage4=false;
		}

	}

	//5.校验手机号
	function validatePhone() {

		var phone = document.register.phone;

		var reg = /^1[3-9][0-9]{9}$/;

		var phoneMsg = document.getElementById("phoneMsg");

		if (reg.test(phone.value)) {

			phoneMsg.style.color = "darkcyan";

			phoneMsg.innerHTML = "手机号合法";

			flage5=true;
		} else {

			phoneMsg.style.color = "red";

			phoneMsg.innerHTML = "手机号不合法";

			phone.focus();

			flage5=false;
		}

	}

	//6.校验头像
    function validateTouxiang() {

		var touxiang = document.register.touxiang;

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
			
			flage6=true;
			
		} else {
			
			touxiangMsg.style.color = "red";

			touxiangMsg.innerHTML = "头像格式不合法";
			
			flage6=false;
		}
	}

	function jiaoyan() {

		/* alert(flage1);
		alert(flage2);
		alert(flage3);
		alert(flage4);
		alert(flage5);
		alert(flage6); */
		return flage1 && flage2 && flage3 && flage4 && flage5 && flage6;
		/* validateName() && flag && validatePasswprd()
				&& validateRepassword() && validatePhone() && validateTouxiang(); */
	}
</script>
</head>
<body>
	<table width="100%" height="800px" cellspacing="0">
		<tr height="80px">
			<td colspan="2">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
				color="red" size="7" face="楷体"><b>Ling</b></font>&nbsp;<font
				size="6">图书管理系统</font>&nbsp;<font size="6" color="silver">|</font>&nbsp;<font
				color="silver" size="5">注册</font>
			</td>
		</tr>
		<tr background="./imgs/11.jpg">
			<td width="30%"></td>
			<td align="center">
				<center>
					<form action="AdminServlet?action=register" method="post"
						enctype="multipart/form-data" name="register"
						onsubmit="return jiaoyan()" class="container">
						<table frame="box" width="600px" height="280px"
							bordercolor="white" class="table table-hover">
							<tr>
								<td colspan="3">&nbsp;&nbsp;&nbsp;<font color="black"
									size="4"><b>注册账号</b></font>
								</td>
							</tr>
							<tr>
								<td align="center" width="500px"><font color="black"><b>头&nbsp;&nbsp;&nbsp;&nbsp;像:</b></font>
								</td>
								<td><input type="file" name="touxiang"
									onblur="validateTouxiang()" /></td>
								<td width="400px"><span id="touxiangMsg"></span></td>
							</tr>
							<tr>
								<td align="center" width="500px"><font color="black"><b>姓&nbsp;&nbsp;&nbsp;&nbsp;名:</b></font>
								</td>
								<td><input type="text" name="name" onblur="validateName()" /></td>
								<td width="400px"><span id="nameMsg"></span></td>
							</tr>
							<tr>
								<td align="center" width="500px"><font color="black"><b>手机号码:</b></font></td>
								<td><input type="text" name="phone"
									onblur="validatePhone()" /></td>
								<td width="400px"><span id="phoneMsg"></span></td>
							</tr>
							<tr>
								<td align="center" width="500px"><font color="black"><b>帐&nbsp;&nbsp;&nbsp;&nbsp;号:</b></font>
								</td>
								<td><input type="text" name="userName"
									onblur="validateUserName()" /></td>
								<td width="400px"><span id="userNameMsg"></span></td>
							</tr>
							<tr>
								<td align="center" width="500px"><font color="black"><b>密&nbsp;&nbsp;&nbsp;&nbsp;码:</b></font>
								</td>
								<td><input type="password" name="password"
									onblur="validatePasswprd()" /></td>
								<td width="400px"><span id="passwordMsg"></span></td>
							</tr>
							<tr>
								<td align="center" width="500px"><font color="black"><b>确认密码:</b></font>
								</td>
								<td><input type="password" name="repassword"
									onblur="validateRepassword()" /></td>
								<td width="400px"><span id="repasswordMsg"></span></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="image" src=".\imgs\zhuce.png" /></td>
							</tr>
						</table>
					</form>
			</td>
		</tr>
		<tr height="100px">

			<td align="center" colspan="2"><font color="gray" size="4"
				face="楷体">Ling公司版权所有&copy;2000-2018</font></td>
		</tr>
	</table>
</body>
</html>