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
</head>
<body background="./imgs/l.jpg">
	<div class="container">
		<div class="panel panel-warning">
			<div class="panel-heading">
				<div class="panel-title">
					<h2>查看部分图书</h2>
				</div>
			</div>
			
	<div class="container-fluid" id="div1">
	<div class="col col-sm-10">
			<div class="panel-body">
				<table class="table table-borderd table-striped table-hover">
					<!-- info蓝色    success绿色    warning黄色    danger红色    active灰色 -->
					<tr align="center">
							
						<td>图书编号</td>
						<td>分类名称</td>
						<td>图书名称</td>
						<td>图书价格</td>
						<td>图书出版社</td>
						<td>状态</td>
						<td>借书人</td>
					
					</tr>
					<c:forEach items="${pb.beanList }" var="q" varStatus="s">
						<tr align="center">
                    
							<td>${s.index+1 }</td>
							<td>${q.fenlei.name}</td>
							<td>${q.bname }</td>
							<td>${q.price }</td>
							<td>${q.chuban }</td>
							<td>${q.zhuangtai }</td>
							<td>${q.jieshuren }</td>
						
						</tr>
					</c:forEach>
				</table>
			</div>
		
		</div>
	</div>
	<hr>
	<center>
		<p>第${pb.pageNow }页/共${pb.pages }页
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<ul class="pagination">
				<li><a href="${pb.url }&pageNow=1">首页</a></li>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<c:if test="${pb.pageNow>1 }">
					<li><a href="${pb.url }&pageNow=${pb.pageNow-1 }">上一页</a></li>
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
							<li><a href="${pb.url }&pageNow=${i }">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<c:if test="${pb.pageNow<pb.pages }">
					<li><a href="${pb.url }&pageNow=${pb.pageNow+1 }">下一页</a></li>
				</c:if>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<li><a href="${pb.url }&pageNow=${pb.pages }">尾页</a></li>
			</ul>
</div>
		</div>
</body>
</html>