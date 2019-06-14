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
<script type="text/javascript" src="bootstrap/js/ajax.js"></script>
<!-- 5.引入Bookstrap的核心JS文件 --> 
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<title>查看图书</title> 
<script type="text/javascript" src="jQuery/jquery-1.8.3.js"></script> 
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<style type="text/css">
#img {
	width: 50px;
	height: 50px;
}
</style>
</head>
<script type="text/javascript" src="jQuery/jquery-1.8.3.js"></script>
<script type="text/javascript">
$(function(){

			

			var selectAll = document.getElementById("selectAll");

			selectAll.onclick = function() {
				//全选
                var chek = document.getElementsByName("ids");
				
				for (i = 0; i < chek.length; i++) {

					chek[i].checked = true;

				}

			}
			//全不选
			var selectNot = document.getElementById("selectNot");

			selectNot.onclick = function() {
				
				var chek = document.getElementsByName("ids");

				for (i = 0; i < chek.length; i++) {

					chek[i].checked = false;

				}

			}

			//反选
			var fanxuan = document.getElementById("fanxuan");

			fanxuan.onclick = function() {
				
				var chek = document.getElementsByName("ids");

				for (i = 0; i < chek.length; i++) {
					if (chek[i].checked == true) {
						chek[i].checked = false;

					} else {
						chek[i].checked = true;

					}

				}

			}

			var df = document.getElementById("dfd");

			df.onclick = function() {
				
				var check = document.getElementsByName("ids");

				var flag = false;

				for (i = 0; i < check.length; i++) {

					if (check[i].checked == true) {
						flag = true;
						break;
					}
				}

				if (flag == false) {
					alert("请至少选一项");
					location.href = "showUserByPage";
					return;

				} else {

					var str = "";

					for (var i = 0; i < check.length; i++) {

						if (check[i].checked == true) {

							str += check[i].value + ",";

						}
					}
					str = str.slice(0, str.length - 1);

					var queren = confirm("你确定删除所勾选的用户吗？");
					if (queren == true) {//确定
						//拿到请求地址

						var $url = "user/" + str;
						/* var $url = "http://localhost/Book/deleteUser/" + str
							+ "/${pb.pageNow}";  */

						//var $url = this.href;
						//拿到表单
						$("#deleteForm").attr("action", $url);

						//提交表单
						$("#deleteForm").submit();

						return false;

					} else {//取消

						location.reload();

					}

				}
			};

			//导出部分	  
			var outIds = document.getElementById("outIds");

			outIds.onclick = function() {
				
				var chek = document.getElementsByName("ids");

				var flag = false;

				for (i = 0; i < chek.length; i++) {

					if (chek[i].checked == true) {
						flag = true;
						break;
					}
				}

				if (flag == false) {
					alert("请至少选一项");
					location.href = "showUserByPage";
					return;

				} else {

					var str = "";

					for (var i = 0; i < chek.length; i++) {

						if (chek[i].checked == true) {

							str += chek[i].value + ",";

						}
					}
					str = str.slice(0, str.length - 1);

					var flag = confirm("你确定导出所勾选的用户信息吗？");
					if (flag == true) {//确定
						 
						window.location.href = "outPutUser/" + str;
					} else {//取消
						location.reload();
					}
				}
			};

			var outAll = document.getElementById("outAll");
			outAll.onclick = function() {
				var flag = confirm("你确定导出全部的用户信息吗？");

				if (flag) {//确定
					window.location.href ="all";
				}
			}
		});
</script>
<style>
#f1 {
	color: #337AB7;
	width: 400px;
}
.col {
	width: 900px;
}

#div2 {
	margin-left: 10px;
}
#div1 {
	background-size: cover;
}
.ss {
	margin-left: 40%;
}
	</style>
<body background="./imgs/l.jpg">
	<div class="container">
	<div class="panel panel-warning">
			<div class="panel-heading">
				<div class="panel-title">
					<h2>查看用户</h2>
				</div>
			</div>
		<div class="container-fluid" id="div1">
		<div class="col col-md-8 " id="div3">
		<ul class="nav nav-tabs">
		<li class="active"><a href="addUser.jsp">添加用户</a></li>
			<li role="presentation"><a id="selectAll">全选</a></li>
				<li role="presentation"><a id="selectNot">全不选</a></li>
				<li role="presentation"><a id="fanxuan">反选</a></li>
				<li role="presentation"><a id="dfd">删除</a></li>
				<li role="presentation"><a id="outIds">导出选中</a></li>
				<li role="presentation"><a id="outAll">导出全部</a></li>
			
		</ul>
		<div class="panel-body">
				<table class="table table-borderd table-striped table-hover">
		
			<tr>
				<td>编号</td>
				    <td>id</td>
				<td>头像</td>
				<td>姓名</td>
				<td>用户名</td>
				<td>密码</td>
				<td>手机号</td>
				<td>注册时间</td>
			    <td>选择</td>		
			    <td>修改</td>			
			</tr>
			<c:forEach items="${pb.beanList }"  var="u" varStatus="u1">
				<tr>
					<td>${u1.index+1}</td>
					<td>${u.id }</td>
					<td><img src="${u.touxiang}" width="30" height="30"></td>
					<td>${u.name }</td>
					<td>${u.userName }</td>
					<td>${u.password }</td>
					<td>${u.phone }</td>
					<td>${u.time }</td>
					<td><input type="checkbox" name="ids" value="${u.id }"></td>
					<%-- <td><a href="/user/{ids}/${u.id }" class="deleteId btn btn-primary" >删除</a></td> --%>
						
					<td><a href="updateUser/${u.id }"><input type="submit" value="修改" class="btn btn-warning" /></a></td>
				</tr>
			</c:forEach>
		</table>

		<!-- 准备一个隐藏表单 -->
		<form action="" method="post" id="deleteForm">
			<input type="hidden" name="_method" value="DELETE">
		</form>
</div>
</div>

	<center>
		<p>第${pb.pageNow }页/共${pb.pages }页
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<ul class="pagination">
				<li><a href="showUserByPage?pageNow=1">首页</a></li>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<c:if test="${pb.pageNow>1 }">
					<li><a href="showUserByPage?pageNow=${pb.pageNow-1 }">上一页</a></li>
				</c:if>
				<!-- 分两种情况		 
		   1.如果页数小于10
		   2.如果页数大于10 
		-->
				<c:choose>
					<c:when test="${pb.pages<=10 }">
						<c:set var="begin" value="1"></c:set>
						<c:set var="end" value="${pb.pages }"></c:set>
					</c:when>
					<c:otherwise>
						<c:set var="begin" value="${pb.pageNow-5 }"></c:set>
						<c:set var="end" value="${pb.pageNow+4 }"></c:set>
						<c:if test="${begin<=1 }">
							<c:set var="begin" value="1"></c:set>
							<c:set var="end" value="10"></c:set>
						</c:if>
						<c:if test="${end>=pb.pages }">
							<c:set var="begin" value="${pb.pageNow-9 }"></c:set>
							<c:set var="end" value="${pb.pages }"></c:set>
						</c:if>
					</c:otherwise>
				</c:choose>
				<!-- 循环十个数 -->
				<c:forEach begin="${begin }" end="${end }" var="i">
					<c:choose>
						<c:when test="${pb.pageNow==i }">
							<li class="active"><span>${i }</span></li>
						</c:when>
						<c:otherwise>
							<li><a href="showUserByPage?pageNow=${i }">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<c:if test="${pb.pageNow<pb.pages }">
					<li><a href="showUserByPage?pageNow=${pb.pageNow+1 }">下一页</a></li>
				</c:if>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<li><a href="showUserByPage?pageNow=${pb.pages }">尾页</a></li>
			</ul>
</div>
</body>
</html>
