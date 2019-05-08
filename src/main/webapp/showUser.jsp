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
<style type="text/css">
#img {
	width: 50px;
	height: 50px;
}
</style>
<script type="text/javascript" src="jQuery/jquery-1.8.3.js"></script> <script
	type="text/javascript">
	window.onload = function() {

		var selectAll = document.getElementById("selectAll");

		selectAll.onclick = function() {

			var check = document.getElementsByName("ids2");

			for (var i = 0; i < check.length; i++) {

				check[i].checked = true;
			}
		};

		var unselectAll = document.getElementById("unselectAll");

		unselectAll.onclick = function() {

			var check = document.getElementsByName("ids2");

			for (var i = 0; i < check.length; i++) {

				check[i].checked = false;
			}

		};

		var fanxuan = document.getElementById("fanxuan");

		fanxuan.onclick = function() {

			var check = document.getElementsByName("ids2");

			for (var i = 0; i < check.length; i++) {

				if (check[i].checked == true) {

					check[i].checked = false;

				} else {

					check[i].checked = true;
				}

			}

		};

		var deleteStudent = document.getElementById("deleteStudent");

		deleteStudent.onclick = function() {

			var check = document.getElementsByName("ids2");

			//判断一下,他选了没有
			var flag = false;

			for (var i = 0; i < check.length; i++) {

				if (check[i].checked == true) {

					flag = true;

					break;

				}
			}

			if (flag == false) {

				alert("请至少勾选一项进行删除！");

				location.href = "UserServlet?action=showUser";

				return;
			}

			//如果选择了

			var str = "";

			for (var i = 0; i < check.length; i++) {

				if (check[i].checked == true) {

					str = str + check[i].value + ",";

				}
			}

			//去除最后一个逗号
			str = str.slice(0, str.length - 1);

			//发送给服务器
			var queren = confirm("您确定要删除这些用户吗？");

			if (queren == true) {

				location.href = "UserServlet?action=delete&ids2=" + str;

			} else {

				location.reload();
			}
		};

		//导出所有用户信息
		var OutAll = document.getElementById("OutAll");

		OutAll.onclick = function() {

			var flag = confirm("您确定要导出所有用户信息吗？");

			if (flag) {//真的话执行

				window.location.href = "OutPutUserServlet?action=all";
			}
		};

		//导出所选的用户信息
		var OutSelect = document.getElementById("OutSelect");

		OutSelect.onclick = function() {

			var check = document.getElementsByName("ids2");

			//判断一下,他选了没有
			var flag = false;

			for (var i = 0; i < check.length; i++) {

				if (check[i].checked == true) {

					flag = true;

					break;

				}
			}

			if (flag == false) {

				alert("请至少勾选一项进行导出！");

				location.href = "UserServlet?action=showUser";

				return;
			}

			//如果选择了

			var str = "";

			for (var i = 0; i < check.length; i++) {

				if (check[i].checked == true) {

					str = str + check[i].value + ",";

				}
			}

			//去除最后一个逗号
			str = str.slice(0, str.length - 1);

			//发送给服务器
			var queren = confirm("您确定要导出所勾选的用户吗？");

			if (queren == true) {

				location.href = "OutPutUserServlet?action=select&ids2=" + str;

			} else {

				location.reload();
			}
		};
	};

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
</script>
<title>查看用户信息</title>
</head>
<body background="./imgs/l.jpg">
	<%-- <table align="center" width="600px" height="200px" border="1px"
		cellspacing="0" bordercolor="silver">
		<caption align="top">
			<h1>
				<font color="red">查看用户信息</font>
			</h1>
			<hr size="2px" color="red" width="600px" />
		</caption>
		<tr>
			<td align="center">选择</td>
			<td align="center">编号</td>
			<td align="center">头像</td>
			<td align="center">姓名</td>
			<td align="center">用户名</td>
			<td align="center">密码</td>
			<td align="center">手机</td>
			<td align="center">注册时间</td>
			<td align="center">修改</td>
		</tr>
		<c:forEach items="${pb.beanList }" var="s" varStatus="u">
			<tr align="center">
				<td><input type="checkbox" name="ids2" value="${s.id }" /></td>
				<td align="center">${u.index+1 }</td>
				<td align="center"><img src="/img${s.touxiang }" id="img" class="img-circle"/></td>
				<td align="center">${s.name }</td>
				<td align="center">${s.userName }</td>
				<td align="center">${s.password }</td>
				<td align="center">${s.phone }</td>
				<td align="center">${s.time }</td>
				<td align="center">
				<a href="UserServlet?action=showOne&id=${s.id }">
				<input type="submit" value="修改"/></a></td>
			</tr>
		</c:forEach>
		<tr height="50px">
			<td colspan="9" align="center"><button id="selectAll" class="btn btn-success btn-xs">全选</button>
				<button id="unselectAll" class="btn btn-info btn-xs">全不选</button>
				<button id="fanxuan" class="btn btn-success btn-xs">反选</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="deleteStudent" class="btn btn-info btn-xs">删除</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="OutSelect" class="btn btn-success btn-xs">导出所选</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="OutAll" class="btn btn-info btn-xs">导出全部</button></td>
		</tr>
	</table> --%>
	<div class="col col-md-8">
		<ul class="nav nav-tabs">
			<li class="active"><a href="addUser.jsp">添加用户</a></li>
			<li><a id="selectAll" href="#">全选</a></li>
			<li><a id="unselectAll" href="#">全不选</a></li>
			<li><a id="fanxuan" href="#">反选</a></li>
			<li><a id="deleteStudent" href="#">删除</a></li>
			<li><a id="OutSelect" href="#">导出选中</a></li>
			<li><a id="OutAll" href="#">导出全部</a></li>
		</ul>
		<div class="container">
			<div class="panel panel-warning">
				<div class="panel-heading">
					<div class="panel-title">
						<h2>查看用户</h2>
					</div>
				</div>
				<div class="panel-body">
					<table class="table table-borderd table-striped table-hover">
						<!-- info蓝色    success绿色    warning黄色    danger红色    active灰色 -->
						<tr>
							<td align="center">选择</td>
							<td align="center">编号</td>
							<td align="center">头像</td>
							<td align="center">姓名</td>
							<td align="center">用户名</td>
							<td align="center">密码</td>
							<td align="center">手机</td>
							<td align="center">注册时间</td>
							<td align="center">修改</td>
						</tr>
						<c:forEach items="${pb.beanList }" var="s" varStatus="u">
							<tr align="center">
								<td><input type="checkbox" name="ids2" value="${s.id }" /></td>
								<td align="center">${u.index+1 }</td>
								<td align="center"><img src="/img${s.touxiang }" id="img"
									class="img-circle" /></td>
								<td align="center">${s.name }</td>
								<td align="center">${s.userName }</td>
								<td align="center">${s.password }</td>
								<td align="center">${s.phone }</td>
								<td align="center">${s.time }</td>
								<td align="center"><a
									href="UserServlet?action=showOne&id=${s.id }"> <input
										type="submit" value="修改" class="btn btn-warning" /></a></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<!-- <div class="panel-footer text-center">
          <tr height="50px">
			<td colspan="8" align="center"><button id="selectAll" class="btn btn-warning btn-xs">全选</button>
				<button id="unselectAll" class="btn btn-warning btn-xs">全不选</button>
				<button id="fanxuan" class="btn btn-warning btn-xs">反选</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="deleteStudent" class="btn btn-warning btn-xs">删除</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="OutSelect" class="btn btn-warning btn-xs">导出所选</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="OutAll" class="btn btn-warning btn-xs">导出全部</button></td>
		</tr>
       </div> -->
			</div>
		</div>
		<center>
			<p>第${pb.pageNow }页/共${pb.pages }页
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<ul class="pagination">
				<li><a href="UserServlet?action=showUserByPage&pageNow=1">首页</a></li>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<c:if test="${pb.pageNow>1 }">
					<li><a
						href="UserServlet?action=showUserByPage&pageNow=${pb.pageNow-1 }">上一页</a></li>
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
							<li><a
								href="UserServlet?action=showUserByPage&pageNow=${i }">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<c:if test="${pb.pageNow<pb.pages }">
					<li><a
						href="UserServlet?action=showUserByPage&pageNow=${pb.pageNow+1 }">下一页</a></li>
				</c:if>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<li><a
					href="UserServlet?action=showUserByPage&pageNow=${pb.pages }">尾页</a></li>
			</ul>
	</div>
</body>
</html>