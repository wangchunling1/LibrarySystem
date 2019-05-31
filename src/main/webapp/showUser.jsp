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
//导出所选的用户信息
var OutSelect = document.getElementById("OutSelect");

OutSelect.onclick = function() {

	var check = document.getElementsByName("ids");

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

		location.href = "action=showUser";

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

		location.href = "users"
				+ str;

	} else {

		location.reload();
	}
};

ajax({

	method : "POST",

	url : "user",

	ansy : true,

	params : "action=user",

	type : "xml",

	success : function(data) {

		var select = document.getElementById("userList");

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

	$(function() {
		$(".deleteId").click(function() {
			var $url = this.href;

			$("#deleteForm").attr("action", $url);

			$("#deleteForm").submit();

			return false;
		});
	});
</script>

<body>
	<div class="container">
		<h1 align="center">图书管理系统</h1>
		<ul class="nav nav-tabs">
			<li><a id="OutSelect" href="#">导出选中</a></li>
			<li><a id="OutAll" href="#">导出全部</a></li>
		</ul>
			<tr>
				<th>用户编号</th>
				<th>用户头像</th>
				<th>用户姓名</th>
				<th>用户名</th>
				<th>密码</th>
				<th>手机号</th>
				<th>注册时间</th>
				<th>点击删除</th>
				<th>点击修改</th>
			</tr>
			<c:forEach items="${pb.beanList }" var="u">
				<tr>
					<td>${u.userId }</td>
					<td>${u.touxiang}</td>
					<td>${u.name }</td>
					<td>${u.userName }</td>
					<td>${u.password }</td>
					<td>${u.phone }</td>
					<td>${u.time }</td>
					<td><a href="user/${u.userId }"
						class="deleteId btn btn-danger">删除</a></td>
					<td><a href="user/${u.userId }" class="btn btn-primary">修改</a></td>
				</tr>
			</c:forEach>
		</table>






		<!-- 准备一个隐藏表单 -->
		<form action="users" method="post" id="deleteForm">
			<input type="hidden" name="_method" value="DELETE">
		</form>

		<center>
			<a href="users?pageNow=1">首页</a> &nbsp;&nbsp;
			<c:if test="${pb.pageNow>1 }">
				<a href="users?pageNow=${pb.pageNow-1 }">上一页</a>
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
						<a href="users?pageNow=${i }">[${i }]</a>
					</c:otherwise>
				</c:choose>

			</c:forEach>
			&nbsp;
			<c:if test="${pb.pageNow<pb.pages }">
				<a href="users?pageNow=${pb.pageNow+1 }">下一页</a>
			</c:if>
			&nbsp;&nbsp; <a href="users?pageNow=${pb.pages }">尾页</a>

		</center>
	</div>
	<p align="center">第${pb.pageNow }页/共${pb.pages }页</p>



	<p align="center">
		<a href="addUser.jsp">点击添加用户</a>
	</p>
</body>
</html>
