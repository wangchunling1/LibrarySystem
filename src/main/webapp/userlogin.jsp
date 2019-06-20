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
<!-- 3.导入核心的CSS文件 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<!-- 4.需要引入jQuery文件 --> 
<script type="text/javascript" src="bootstrap/js/jQuery.js"></script> 
<!-- 5.引入Bootstrap的核心JS文件 --> 
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<style type="text/css">
.container {
	width: 300px;
	height: 300px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<c:if test="${!(empty msg2) }">
	<script>
		alert("${msg2 }");
	</script>
	<c:remove var="msg2" scope="session" />
</c:if>
<title>登录</title>
<script type="text/javascript" src="js/ajax.js"></script> 
<script type="text/javascript">
	/* function validateUserName(){
	
	 var flag=false;
	
	 var userName=document.login.userName;
	
	 var xmlhttp=getXMLHttpRequest();
	
	 xmlhttp.open("POST","AdminServlet",true);
	
	 xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	
	 xmlhttp.send("action=validateUserName&userName="+userName.value);
	
	 xmlhttp.onreadystatechange=function(){
	
	 if(xmlhttp.readyState==4 && xmlhttp.status==200){
	
	 var content=xmlhttp.responseText;
	
	 var span=document.getElementById("userNameMsg");
	
	 if(content=="0"){//用户名没有注册，提示先注册
	
	 span.style.color="red";
	
	 span.innerHTML="您输入的用户名错误，或者不存在";
	
	 span.focus();
	
	 flag=false;
	
	 }else{//用户名存在
	
	 span.style.color="darkcyan";
	
	 span.innerHTML="用户名存在，可以登录";
	
	 flag=true;
	
	 }
	
	 }
	 }
	
	 return flag;
	 }
	 function test(){
	
	 return validateUserName();
	 }
	 */
	/* $(function(){
	  
	  //$("table tr:even").css("background-color","pink");
	  $("table tr:even").addClass("success");
	  $("table tr:odd").addClass("warning");
	 }); */
</script>
</head>
<body background="./imgs/i.jpg">
	<div class="container-fluid" style="background-color: white;">
		<table width="100%" height="50px" cellspacing="0">
			<tr height="80px">
				<td colspan="2">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
					color="red" size="7" face="楷体"><b>Ling</b></font>&nbsp;<font
					size="6">图书管理系统</font>&nbsp;<font size="6" color="silver">|</font>&nbsp;<font
					color="silver" size="5">前台登录</font>
				</td>
			</tr>
		</table>
	</div>
	<div class="container-fluid" style="height: 580px;">
				<form action="login2" method="post"
					class="form-horizontal">
					<br>
					<br>
					<h1 class="text-center text-danger">登录</h1>
					<hr>
					<div class="form-group">
						<label for="userName" class="col-md-4 control-label text-danger">
							<!-- class="sr-only" --><font size="3">用&nbsp;户&nbsp;名&nbsp;:</font>
						</label>
						<div class="col-md-4">
							<input type="text" class="form-control" name="userName"
								placeholder="用户名" />
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-md-4 control-label text-danger"><font size="3">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码&nbsp;:</font></label>
						<div class="col-md-4">
							<input type="password" class="form-control" name="password"
								placeholder="密码" />
						</div>
					</div>
	<div class="form-group">
       <div class="col-md-4 col-md-offset-4">
         <div class="checkbox">
            <label class="text-danger">
              <input type="checkbox"/>两周内自动登录
            </label>
         </div>
        </div>
       </div>
       <div class="form-group">
        <div class="col-md-4 col-md-offset-4">
         <button class="btn btn-warning btn-block">登录</button>
        </div>
      </div>
      <div class="form-group">
        <div class="col-md-4 col-md-offset-4">
      <a href="zhuce.jsp" class="btn btn-danger btn-block">还不是会员？立即注册</a>
      </div>
      </div>
  </form>
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