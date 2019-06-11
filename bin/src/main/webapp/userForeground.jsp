<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "/"
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<!-- 1.要使用Bootstrap的话，必须是html5文档-->
<meta charset="UTF-8">
<!-- 2.移动设备优先 -->
<mate name="viewport" content="width=device-width, initial-scale=1">
<!-- 3.导入核心的css文件 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<!-- 4.需要引入jQuery文件 --> 
<script type="text/javascript" src="bootstrap/js/jQuery.js"></script> 
<!-- 5.引入Bootstrap的核心JS文件 --> 
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<title>查看图书</title>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script>
	 $(function(){
		
		 $(".not").click(function(){
          alert("亲，请先登录\(^-^)/");		 
		  
		 
		 });
		 
		 $(".jieshu").click(function(){
	          alert("亲,非常抱歉,本书已借出,再看看别的吧(T-T)");		 
			  
			 
			 });
		 $(".huanshu").click(function(){
	          alert("亲,这本书没有借出,难道你要送我一本($-$)");		 
			  
			 
			 });	 
	
		
	}); 
</script>
<style>
#div3 {
	height: 580px;
	background-image: url("imgs/i.jpg");
	background-size: cover;
 
}

.footer {
	color: #777;
	border-top: 1px solid #e5e5e5;
	text-align: center;
	padding: 30px 0;
}

.fm {
	margin-top: 10px;
}
</style>
</head>
<body>

	<div class="container-fluid" id="div1">
		<c:if test="${!empty mag }">
			<script>
				alert("${mag }");
			</script>
		</c:if>
		<c:remove var="mag" />

		<div class="container-fluid " id="div3">
			<div class="container" id="div4">
				<table id="t" class="table ">
					<tr height="6%">
						<td align="center" colspan=2><br>
							<div class="col-md-3 col-md-offset-4">
								<font size="7" color="#CF1834" face="隶书"><strong>图书信息</strong></font>
							</div>
							<div class="col-md-4 col-md-offset-1 fm">
								<form class="navbar-form navbar-left"
									action="UserForegroundServlet?action=showPasgeUsBook&qusername=${qusername }"
									method="post">
									<div class="form-group">
										<input type="text" class="form-control" placeholder="图书名称"
											name="bname">
									</div>
									<button type="submit" class="btn btn-default">搜索</button>
								</form>
							</div></td>
					</tr>

					<tr align="center">
						<td>
							<table class="table table-bordered table-hover " cellspacing="0"
								cellpadding="20" id="tb2">
								<tr align="center">
									<td>图书编号</td>
									<td>分类名称</td>
									<td>图书名称</td>
									<td>图书价格</td>
									<td>图书出版社</td>
									<td>状态</td>
									<td>借/还</td>
								</tr>
								<c:forEach items="${pb.beanList }" var="s" varStatus="ss">
									<tr align='center'>
										<td>${ss.index+1}</td>
										<td>${s.flname}</td>
										<td>${s.bname}</td>
										<td>${s.price}</td>
										<td>${s.chuban}</td>
										<td><c:if test="${s.zhuangtai=='未借出'}">
												 未借出 

											</c:if> <c:if test="${s.zhuangtai=='借出'}">
												 借出   
											</c:if></td>
										<td>
									 <c:choose>
										<c:when test="${empty qusername }">
												<a  href="#" id="jieshu" class="  btn  btn-sm  btn-danger not" > 借阅 </a> &nbsp;&nbsp;&nbsp;&nbsp;
						                   <a href="#" id="huanshu" class="btn  btn-sm  btn-danger not" > 还书 </a>
											</c:when>
									 <c:otherwise>
											<c:if test="${s.zhuangtai=='未借出'}">
												<a  href="<%=base%>UserForegroundServlet?action=jieshu&pageNow=${pb.pageNow+1 }&id=${s.id }&qusername=${qusername }"
													id="jieshu" class="btn btn-default btn-sm " > 借阅 </a> 
						                       <a href="#" id="huanshu"  class="btn btn-sm  btn-danger huanshu"> 还书 </a>
											</c:if>
											<c:if test="${s.zhuangtai=='借出'}">
												<a  href="#" id="jieshu" class="btn btn-sm  btn-danger jieshu"> 借阅 </a> 
						                   <a href="<%=base%>UserForegroundServlet?action=huanshu&pageNow=${pb.pageNow+1 }&id=${s.id }&qusername=${qusername }" id="huanshu" class="btn  btn-default  btn-sm"> 还书 </a>
											</c:if>
												</c:otherwise>
										 </c:choose>
										 </td>
									</tr>
								</c:forEach>
							</table>


							<p>第${pb.pageNow }页/共${pb.pages }&nbsp;&nbsp;&nbsp;&nbsp;
							<ul class="pagination">

								<li><a
									href="<%=base%>UserForegroundServlet?action=showBookByPage&pageNow=1&qusername=${qusername }">首页</a>
									&nbsp;&nbsp;&nbsp;&nbsp;</li>
								<c:if test="${pb.pageNow>1 }">
									<li><a aria-label="Previous"
										href="<%=base %>UserForegroundServlet?action=showBookByPage&pageNow=${pb.pageNow-1 }&qusername=${qusername }"><span
											aria-hidden="ture">上一页</span></a></li>
								</c:if>

								<!-- 分页2种情况
			               1.页数小于10
			                   2.页数大于10
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
											<c:set var="end" value="${pb.pages}"></c:set>
										</c:if>

									</c:otherwise>
								</c:choose>
								<!-- 每页面显示10页数 -->

								<c:forEach begin="${begin }" end="${end }" var="i">
									<c:choose>
										<c:when test="${pb.pageNow==i }">
											<li class="active"><span>${i }</span></li>
										</c:when>
										<c:otherwise>
											<li><a
												href="<%=base %>UserForegroundServlet?action=showBookByPage&pageNow=${i}&qusername=${qusername }">${i }</a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>


								<c:if test="${pb.pageNow<pb.pages }">
									<li><a
										href="<%=base %>UserForegroundServlet?action=showBookByPage&pageNow=${pb.pageNow+1 }&qusername=${qusername }"
										aria-label="Previous"><span aria-hidden="ture">下一页</span></a>
									</li>
								</c:if>

								<li>
								<li>&nbsp;&nbsp;&nbsp;&nbsp;<a
									href="<%=base %>UserForegroundServlet?action=showBookByPage&pageNow=${pb.pages}&qusername=${qusername }">尾页
								</a>
								</li>
								</p>
							</ul> <br>

						</td>
					</tr>
				</table>
			</div>
		</div>
		<footer class="footer">
			<!-- 下 -->

			<h4>
				<font size="4" color="silver">Ling图书管理系统版权所有&nbsp;&copy;&nbsp;&nbsp;2000-2019</font>
			</h4>
		</footer>
	</div>
</body>
</html>