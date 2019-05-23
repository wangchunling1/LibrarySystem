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
<!-- 4.需要引入jQuery文件 --> <script type="text/javascript"
	src="bootstrap/js/jQuery.js"></script> <!-- 5.引入Bookstrap的核心JS文件 --> <script
	type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改分类</title>
<script type="text/javascript" src="js/ajax.js"></script> <script
	type="text/javascript" src="jQuery/jquery-1.8.3.js"></script> 
<script type="text/javascript">
		/* window.onload=function(){   //页面加载完成
		   
		   var http=getXMLHttpRequest();
		   
		   var select=document.getElementById("fenleiList");
		   
		   http.open("POST","FenleiServlet",true);
		   
		   http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			 
		   http.send("action=updateShowFenlei");
			 
			 http.onreadystatechange=function(){
				 
				 if(http.readyState==4 && http.status==200){
					 
					 var content=http.responseXML;
					 
					 var names=content.getElementsByTagName("name");
					 
					 for(var i=0;i<names.length;i++){
						 
						 var name=names[i];
						 
						 var opt=document.createElement("option");
						 
						 var value;
						 
						 if(window.addEventListener){
							 
							 value=name.textContent;
							 
						 }else{
							 
							 value=text;
						 }
						 
						 opt.innerHTML=value;
						 
						 opt.value=value;
						 
						 select.appendChild(opt);
					}
				 }
			 }
					 
		 }*/

		window.onload = function() {

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
			});
		};

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
	</script>
</head>
<body background="./imgs/l.jpg">
	<%-- 	<form action="FenleiServlet?action=update" method="post" enctype="application/x-www-form-urlencoded">
		<table align="center" width="400px" height="200px" border="1px"
			cellspacing="0" bordercolor="silver">
			<caption align="top">
				<h1>
					<font color="red">修改分类页面</font>
				</h1>
				<hr size="2px" color="red" width="600px" />
			</caption>
			<tr align="center">
				<td>请选择您想要修改的分类:</td>
				<td>
				<select name="name" id="fenleiList">
				<option>---请选择您要修改的分类---</option>
			<!-- 	<c:forEach items="${updateList }" var="fenlei">
				<option>${fenlei.name }</option>
				</c:forEach>  -->
				</select>
				</td>
			</tr>
			<tr align="center">
				<td>请输入新的分类名称:</td>
				<td><input type="text" name="newname" /></td>
			</tr>
			<tr align="center">
				<td colspan="2">
				<input type="submit" value="修改" class="btn btn-success btn-xs"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" value="清空" class="btn btn-info btn-xs"/>
				</td>
			</tr>
		</table>
	</form> --%>

	<div class="container" >
		<div class="row">
			<div class="col-md-6 col-md-offset-2">
				<form action="FenleiServlet?action=update" method="post"
					enctype="application/x-www-form-urlencoded">
					<table class="table">
					<br>
					<br>
						<h1 class="text-center text-danger"><font face="幼圆">修改分类</font></h1>
						<hr>
						<ul class="nav">
							<li><b>请选择您想要修改的分类:</b></li>
							<li><select name="name" id="fenleiList" class="form-control">
									<option>---请选择您要修改的分类---</option>
									<!-- 	<c:forEach items="${updateList }" var="fenlei">
				<option>${fenlei.name }</option>
				</c:forEach>  -->
							</select></li>
						</ul>
						<br>
						<div class="form-group">
							<label>请输入新的分类名称:</label> <input type="text" name="newname"
								class="form-control" placeholder="新的分类名称"/>
						</div>
						<br>
						<div class="form-group text-center">
						<ul class="list-inline">
							<li><button type="submit" class="btn btn-warning" style="width:200px;">修改</button>
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