<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 1.要使用Bokkstrap的话，必须是html5文档-->
<meta charset="UTF-8">
<!-- 2.移动设备优先 -->

<!-- 3.导入核心的css文件 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<!-- 4.需要引入jQuery文件 -->
<script type="text/javascript" src="bootstrap/js/jQuery.js"></script>
<!-- 5.引入Bookstrap的核心JS文件 -->
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<style type="text/css">
#img {
	width: 50px;
	height: 50px;
}
</style>
</head>
<script type="text/javascript" src="jQuery/jquery-1.8.3.js"></script>
<script type="text/javascript">
window.onload = function() {
	<%-- 	
		String path = request.getContextPath();
		String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "/"
				+ path + "/";
	 --%>
		/*	 
					$("#table2 tr").mouseover(function(){
						$(this).css("background-color","#F8C7D4");
					})
					
					$("#table2 tr").mouseout(function(){
						$(this).css("background-color","#FFFBFC");
						 
					})
			 */
			var chek = document.getElementsByName("ids");

			var selectAll = document.getElementById("selectAll");

			selectAll.onclick = function() {
				//全选

				for (i = 0; i < chek.length; i++) {

					chek[i].checked = true;

				}

			}
			//全不选
			var selectNot = document.getElementById("selectNot");

			selectNot.onclick = function() {

				for (i = 0; i < chek.length; i++) {

					chek[i].checked = false;

				}

			}

			//反选
			var fanxuan = document.getElementById("fanxuan");

			fanxuan.onclick = function() {

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

				var flag = false;

				for (i = 0; i < chek.length; i++) {

					if (chek[i].checked == true) {
						flag = true;
						break;
					}
				}

				if (flag == false) {
					alert("请至少选一项");
					return;

				} else {

					var str = "";

					for (var i = 0; i < chek.length; i++) {

						if (chek[i].checked == true) {

							str += chek[i].value + ",";

						}
					}
					str = str.slice(0, str.length - 1);

					var flag = confirm("你确定删除所勾选的用户吗？");
					if (flag == true) {//确定
						//拿到请求地址

						var $url = "http://localhost/LibrarySystem/user/" + str;
						/* var $url = "http://localhost/Book/deleteUser/" + str
							+ "/${pb.pageNow}";  */

						//var $url = this.href;
						//拿到表单
						$("#deleteForm").attr("action", $url);

						//提交表单
						$("#deleteForm").submit();

						return false;

					} else {//取消

						window.location.href = "http://localhost/LibrarySystem/showUserByPage";

					}

				}
			};

			//导出部分	  
			var outIds = document.getElementById("outIds");

			outIds.onclick = function() {

				var flag = false;

				for (i = 0; i < chek.length; i++) {

					if (chek[i].checked == true) {
						flag = true;
						break;
					}
				}

				if (flag == false) {
					alert("请至少选一项");
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
						 
						window.location.href = "http://localhost/LibrarySystem/outPutUser/" + str;
					} else {//取消
						window.location.href = "http://localhost/LibrarySystem/showUserByPage";
					}
				}
			};

			var outAll = document.getElementById("outAll");
			outAll.onclick = function() {
				var flag = confirm("你确定导出全部的用户信息吗？");

				if (flag == true) {//确定
					window.location.href ="http://localhost/LibrarySystem/outPutUser/all";
				} else {//取消
					window.location.href = "http://localhost/LibrarySystem/showUserByPage";
				}

			}
		};
</script>

<body>
	<div class="container">
		<h1 align="center">查看用户</h1>
		<div class="container-fluid" id="div1">
		<c:if test="${!empty mag }">
			<script>
				alert("${mag }");
			</script>
		</c:if>
		<c:remove var="mag" />

		<div class="col col-md-8 " id="div3">
		<ul class="nav nav-tabs">
			<li role="presentation" class="active"><a id="selectAll"
					href="#">全选</a></li>
				<li role="presentation"><a id="selectNot" href="#">全不选</a></li>
				<li role="presentation"><a id="fanxuan" href="#">反选</a></li>
				<li role="presentation"><a id="outIds" href="#">导出选中</a></li>
				<li role="presentation"><a id="outAll" href="#">导出全部</a></li>
			
		</ul>
			<tr>
				<th>用户编号</th>
				    <th>id</th>
				<th>用户头像</th>
				<th>用户姓名</th>
				<th>用户名</th>
				<th>密码</th>
				<th>手机号</th>
				<th>注册时间</th>
				<td><button id="dfd">删除</button></td>
								
								
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
					<td><a href="/user/{ids}/${u.id }" class="deleteId btn btn-primary" >删除</a></td>
						
					<td><a href="/updateUser/${u.id }" class="btn btn-primary">修改</a></td>
				</tr>
			</c:forEach>
		</table>

		<!-- 准备一个隐藏表单 -->
		<form action="" method="post" id="deleteForm">
			<input type="hidden" name="_method" value="DELETE">
		</form>

		<center>
			<a href="showUserByPage?pageNow=1">首页</a> &nbsp;&nbsp;
			<c:if test="${pb.pageNow>1 }">
				<a href="showUserByPage?pageNow=${pb.pageNow-1 }">上一页</a>
			</c:if>
			&nbsp;
			<!-- 分两种情况：
		         如果页数小于10：
		         如果页数大于10：         
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
						<c:set var="begin" value="${pb.pages-9 }"></c:set>
						<c:set var="end" value="${pb.pages }"></c:set>
					</c:if>
				</c:otherwise>
			</c:choose>
			<!-- 循环十个数 -->
			<c:forEach begin="${begin }" end="${end }" var="i">
				<c:choose>
					<c:when test="${pb.pageNow==i }">
						<span>${i}</span>
					</c:when>
					<c:otherwise>
						<a href="showUserByPage?pageNow=${i }">[${i }]</a>
					</c:otherwise>
				</c:choose>

			</c:forEach>
			&nbsp;
			<c:if test="${pb.pageNow<pb.pages }">
				<a href="showUserByPage?pageNow=${pb.pageNow+1 }">下一页</a>
			</c:if>
			&nbsp;&nbsp; <a href="showUserByPage?pageNow=${pb.pages }">尾页</a>

		
	</div>
	<p align="center">第${pb.pageNow }页/共${pb.pages }页</p>



	<p align="center">
		<a href="addUser.jsp">点击添加用户</a>
	</p>
</body>
</html>
