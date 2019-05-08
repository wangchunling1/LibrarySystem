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
<title>查看图书</title>
<script type="text/javascript" src="js/ajax.js"></script> <script
	type="text/javascript" src="jQuery/jquery-1.8.3.js"></script> <script
	type="text/javascript">
		window.onload = function() {

			var selectAll = document.getElementById("selectAll");

			selectAll.onclick = function() {

				var check = document.getElementsByName("ids");

				for (var i = 0; i < check.length; i++) {

					check[i].checked = true;
				}
			};

			var unselectAll = document.getElementById("unselectAll");

			unselectAll.onclick = function() {

				var check = document.getElementsByName("ids");

				for (var i = 0; i < check.length; i++) {

					check[i].checked = false;
				}

			};

			var fanxuan = document.getElementById("fanxuan");

			fanxuan.onclick = function() {

				var check = document.getElementsByName("ids");

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

					alert("请至少勾选一项进行删除！");

					location.href = "BookServlet?action=showBook";

					return;
				}

				//如果选择了

				var str = "";

				for (var i = 0; i < check.length; i++) {

					if (check[i].checked == true) {

						str = str + check[i].value + ",";

					}
				}
				;

				//去除最后一个逗号
				str = str.slice(0, str.length - 1);

				//发送给服务器
				var queren = confirm("您确定要删除这些图书吗？");

				if (queren == true) {

					location.href = "BookServlet?action=delete&ids=" + str;

				} else {

					location.reload();
				}
			};

			//导出所有用户信息
			var OutAll = document.getElementById("OutAll");

			OutAll.onclick = function() {

				var flag = confirm("您确定要导出所有用户信息吗？");

				if (flag) {//真的话执行

					window.location.href = "OutPutBookServlet?action=all";
				}
			};

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

					location.href = "BookServlet?action=showBook";

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

					location.href = "OutPutBookServlet?action=select&ids="
							+ str;

				} else {

					location.reload();
				}
			};

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
<style>
#f1 {
	color: #337AB7;
	width: 400px;
}
.col {
	width: 1000px;
	height: 500px;
}

#div1 {
	height: 840px;
	background-size: cover;
}
.ss {
	margin-left: 40%;
}
	</style>
</head>
<body background="./imgs/l.jpg">
	 <!-- <div class="container"> -->
		<!--  <ul class="nav nav-pills nav-justified">
							<li><select name="name" id="fenleiList" class="form-control">
									<option>---请选择您要查看的分类---</option>
							</select>
							</li>
        <li class="dropdown">
           <a href="#" class="dropdown-toggle" data-toggle="dropdown">作者</a>
           <ul class="dropdown-menu">
				<li><input type="text" class="form-control" placeholder="作者"/></li>
			</ul>
         </li>
       <li class="dropdown">
           <a href="#" class="dropdown-toggle" data-toggle="dropdown">借书人</a>
           <ul class="dropdown-menu">
			   <li><input type="text" class="form-control" placeholder="借书人"/></li>
			</ul>
         </li>
        <li class="dropdown">
           <a href="#" class="dropdown-toggle" data-toggle="dropdown">状态</a>
           <ul class="dropdown-menu">
			   <li><input type="text" class="form-control" placeholder="状态"/></li>
			</ul>
         </li>
       <li><button class="btn">搜&nbsp;索&nbsp;图&nbsp;书</button></li>
     </ul>-->
     <div class="container-fluid" id="div1">
	<div class="col col-md-10">
		<ul class="nav nav-tabs">
		    <li class="active"><a href="addBook.jsp">添加图书</a></li>
			<li><a id="selectAll" href="#">全选</a></li>
			<li><a id="unselectAll" href="#">全不选</a></li>
			<li><a id="fanxuan" href="#">反选</a></li>
			<li><a id="deleteStudent" href="#">删除</a></li>
			<li><a id="OutSelect" href="#">导出选中</a></li>
			<li><a id="OutAll" href="#">导出全部</a></li>
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown">高级搜索<span class="caret"></span></a>
				<ul class="dropdown-menu dropdown-menu-right" role="menu">
					<li>
					<form action="BookServlet" class="form-horizontal" id="f1">

							<!-- 隐藏域，用来传递action -->

							<input type="hidden" name="action" value="findBookByWhere">

							<div class="form-group">
								<br> <label class="col-sm-4 control-label">选择分类：
								</label>
								<div class="controls col-sm-6">
									<select name="flname" class="form-control  input-sm"
										id="fenleiList">
										<option value="0">----请选择----</option>
										<c:forEach items="${updateList }" var="fenlei">
											<option>${fenlei.name}</option>
										</c:forEach>
									</select><br>
								</div>
							</div>
                            
							<div class="form-group">
								<label class="col-sm-4  control-label">书&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</label>
								<div class="controls col-sm-6">
									<input name="bname" type="text" class="form-control" /><br>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4 control-label"> 出&nbsp;版&nbsp;社:</label>
								<div class="controls  col-sm-6">
									<input name="chuban" type="text" class="form-control" /><br>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4 control-label">借&nbsp;书&nbsp;人:</label>
								<div class="controls  col-sm-6">
									<input name="jieshuren" type="text" class="form-control" /><br>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-4"> 状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态:</label>
								<div class="controls  col-sm-6">
									<input name="zhuangtai" type="text" class="form-control" /><br>
								</div>
							</div>

							<div class="control-group">

								<div class="controls ss">
									<button type="submit" class="btn btn-info ">
										<span class="glyphicon glyphicon-search"></span> 开始搜索
									</button>
									<br> <br>
								</div>
							</div>

						</form>
					</li>

				</ul></li>
		</ul>
	
	<div class="container">
		<div class="panel panel-warning">
			<div class="panel-heading">
				<div class="panel-title">
					<h2>查看图书</h2>
				</div>
			</div>
			<div class="panel-body">
				<table class="table table-borderd table-striped table-hover">
					<!-- info蓝色    success绿色    warning黄色    danger红色    active灰色 -->
					<tr align="center">
						<td>选择</td>
						<td>图书编号</td>
						<td>分类名称</td>
						<td>图书名称</td>
						<td>图书价格</td>
						<td>图书出版社</td>
						<td>状态</td>
						<td>借书人</td>
						<td>修改</td>
					</tr>
					<c:forEach items="${pb.beanList }" var="q" varStatus="s">
						<tr align="center">
							<td><input type="checkbox" name="ids" value="${q.id }" /></td>
							<td>${s.index+1 }</td>
							<td>${q.flname }</td>
							<td>${q.bname }</td>
							<td>${q.price }</td>
							<td>${q.chuban }</td>
							<td>${q.zhuangtai }</td>
							<td>${q.jieshuren }</td>
							<td><a href="BookServlet?action=showOne&id=${q.id }"> <input
									type="submit" value="修改" class="btn btn-warning" /></a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<!-- <div class="panel-footer text-center">
				<tr height="30px">
					<td colspan="8" align="center"><button id="selectAll"
							class="btn btn-warning btn-xs">全选</button>
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
			<li><a href="BookServlet?action=showBookByPage&pageNow=1">首页</a></li>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<c:if test="${pb.pageNow>1 }">
				<li><a
					href="BookServlet?action=showBookByPage&pageNow=${pb.pageNow-1 }">上一页</a></li>
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
						<li><a href="BookServlet?action=showBookByPage&pageNow=${i }">${i }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<c:if test="${pb.pageNow<pb.pages }">
				<li><a
					href="BookServlet?action=showBookByPage&pageNow=${pb.pageNow+1 }">下一页</a></li>
			</c:if>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<li><a
				href="BookServlet?action=showBookByPage&pageNow=${pb.pages }">尾页</a></li>
		</ul>
		</div>
		</div>
</body>
</html>