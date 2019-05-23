<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<title>修改管理员密码</title>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="jQuery/jquery-1.8.3.js"></script>
<script type="text/javascript">

    var flag;

    //1.校验原密码
    function validatePassword() {
	
	var password = document.change.password;

	var YpasswordMsg = document.getElementById("YpasswordMsg");
	
	ajax({
		method:"POST",
		url:"AdminServlet",
		params:"action=validatePassword&password=" + password.value,
		type:"text",
		success:function(data){
			
			if(data=="1"){
				
				YpasswordMsg.style.color="darkcyan";
				
				YpasswordMsg.innerHTML="原密码输入正确";
							 	
				flag=true;
				
			}else{
				
				YpasswordMsg.style.color="red";
				
				YpasswordMsg.innerHTML="原密码输入错误";
				 
				password.focus();
				
				flag=false;
				
			 }
				 if(password.value=="" || password.value==null){
					 
					 YpasswordMsg.style.color="red";
					
					 YpasswordMsg.innerHTML="密码不能为空";
					
					 password.focus();
					
					 flag=false;
				 }
			
		}
	})
   }

/*	var xmlhttp = getXMLHttpRequest();

	xmlhttp.open("POST", "AdminServlet", true);

	xmlhttp.setRequestHeader("Content-type",
			"application/x-www-form-urlencoded");

	xmlhttp.send("action=validatePassword&password=" + password.value);

		xmlhttp.onreadystatechange=function(){
		
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			
			 var content=xmlhttp.responseText;
			
			 var span=document.getElementById("YpasswordMsg");
			
			 if(content==1){//
			
			 span.style.color="darkcyan";
			
			 span.innerHTML="密码正确";
						 	
			 flag=true;
			
			 }else{
			
			 span.style.color="red";
			
			 span.innerHTML="密码错误";
			 
			 span.focus();
			
			 flag=false;
			
			 }
			 if(password.value=="" || password.value==null){
				 
				span.style.color="red";
				
				span.innerHTML="密码不能为空";
				
				span.focus();
				
				flag=false;
			 }
		 }
	   }

    }*/
	//2.校验新密码
	function validateNewPassword() {
		
		var password = document.change.password;

		var newpassword = document.change.newpassword;

		var reg = /^(\w|\W){6,15}$/;

		var newpasswordMsg = document.getElementById("newpasswordMsg");

		if (reg.test(newpassword.value)) {

			//newpasswordMsg.style.color = "darkcyan";

			//newpasswordMsg.innerHTML = "密码合法";
			
			if (newpassword.value == password.value) {

				newpasswordMsg.style.color = "red";

				newpasswordMsg.innerHTML = "与原密码相同";
				
				newpassword.focus();

				return false;
				
			} else {

				newpasswordMsg.style.color = "darkcyan";

				newpasswordMsg.innerHTML = "新密码可用";

				return true;
			}
		} else {

			newpasswordMsg.style.color = "red";

			newpasswordMsg.innerHTML = "必须是长度为6-15的数字字母下划线或者特殊字符";
			
			newpassword.focus();

			return false;
		}
	}

	//3.确认密码
	function validateRePassword(){

		var newpassword = document.change.newpassword;

		var repassword = document.change.repassword;

		var repasswordMsg = document.getElementById("repasswordMsg");

		if (repassword.value == newpassword.value) {

			repasswordMsg.style.color = "darkcyan";

			repasswordMsg.innerHTML = "两次密码一致";

			return true;
			
		} else {

			repasswordMsg.style.color = "red";

			repasswordMsg.innerHTML = "两次密码不一致";
			
			repassword.focus();

			return false;
		}

	}
	
	function ch(){
		
		return flag&&validateNewPassword()&&validateRePassword();
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
<!-- 	<center>
		<form action="AdminServlet?action=changePassword" method="post" name="change" enctype="application/x-www-form-urlencoded" onsubmit="return ch()">
			<table width="600px" height="280px" border="1px" bordercolor="pink"
				cellspacing="0">
				<caption align="top">
					<h1>
						<font color="red">修改管理员密码</font>
					</h1>
					<hr size="2px" color="red" width="600px" />
				</caption>
				<tr align="center">
					<td>原&nbsp;&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;码</td>
					<td><input type="password" name="password" onblur="validatePassword()" ></td>
					<td width="300px"><span id="YpasswordMsg"></span></td>
				</tr>
				<tr align="center">
					<td>新&nbsp;&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;码</td>
					<td><input type="password" name="newpassword" onblur="validateNewPassword()" /></td>
					<td width="300px"><span id="newpasswordMsg"></span></td>
				</tr>
				<tr align="center">
					<td>确认新密码</td>
					<td><input type="password" name="repassword" onblur="validateRePassword()" /></td>
					<td width="300px"><span id="repasswordMsg"></span></td>
				</tr>
				<tr align="center">
					<td colspan="2"><input type="submit" value="确认修改" class="btn btn-success btn-xs"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
						type="reset" value="重新填写" class="btn btn-info btn-xs"/></td>
				    <td></td>
				</tr>
			</table>
		</form> -->
       <div class="container" >
		<div class="row">
			<div class="col-md-6 col-md-offset-2">
				<form action="AdminServlet?action=changePassword" method="post" name="change" enctype="application/x-www-form-urlencoded" onsubmit="return ch()">
					<table class="table">
					<br>
					<br>
						<h1 class="text-center text-danger"><font face="幼圆">修改管理员密码</font></h1>
						<hr>
						<br>
						<div class="form-group">
							<label>原&nbsp;&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;码</label>
							<input type="password" name="password" onblur="validatePassword()" class="form-control" placeholder="原密码"/>
					         <span id="YpasswordMsg"></span>
						</div>
						<div class="form-group">
							<label>新&nbsp;&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;码</label>
							<input type="password" name="newpassword" onblur="validateNewPassword()" class="form-control" placeholder="新密码"/>
					         <span id="newpasswordMsg"></span>
						</div>
						<div class="form-group">
							<label>确认新密码</label>
							<input type="password" name="repassword" onblur="validateRePassword()" class="form-control" placeholder="确认新密码"/>
					         <span id="repasswordMsg"></span>
						</div>
						<br>
						<div class="form-group text-center">
						<ul class="list-inline">
							<li><button type="submit" class="btn btn-warning" style="width:200px;">确认修改</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="reset" class="btn btn-danger" style="width:200px;">清空</button></li>
						</ul>
						</div>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>