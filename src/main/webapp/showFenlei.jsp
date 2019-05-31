

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
  String path=request.getContextPath();

  String base=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/"+path+"/";
%>
<!-- http://localhost:端口号/项目名/ -->
<!DOCTYPE html>
<html>
<head>
<!-- 1.要使用Bootstrap的话，必须是html5文档-->
<meta charset="UTF-8">
<!-- 2.移动设备优先 -->
<mate name="viewport" content="width=device-width, initial-scale=1">
<!-- 3.导入核心的css文件 -->
<link rel="stylesheet" href="<%=base%>bootstrap/css/bootstrap.css" />
<!-- 4.需要引入jQuery文件 -->
<script type="text/javascript" src="<%=base%>bootstrap/js/jQuery.js"></script> 
<!-- 5.引入Bootstrap的核心JS文件 -->
<script type="text/javascript" src="<%=base%>bootstrap/js/bootstrap.js"></script>
<title>查看所有分类</title>
<script type="text/javascript">
		window.onload=function(){
			
			var selectAll=document.getElementById("selectAll");
			
			selectAll.onclick=function(){
				
				var check=document.getElementsByName("ids");
	
				for(var i=0;i<check.length;i++){
					
					check[i].checked=true;
				}
			};
			
			var unselectAll=document.getElementById("unselectAll");
			
			unselectAll.onclick=function(){
				
				var check=document.getElementsByName("ids");
				
				for(var i=0;i<check.length;i++){
					
					check[i].checked=false;
				}
				
			};
			
			var fanxuan=document.getElementById("fanxuan");
		
			fanxuan.onclick=function(){
				
				var check=document.getElementsByName("ids");

                for(var i=0;i<check.length;i++){
                	
					if(check[i].checked==true){
						
						check[i].checked=false;
						
					}else{
						
						check[i].checked=true;
					}				
                	
                }
				
			};
			
			var deleteStudent=document.getElementById("deleteStudent");
			
			deleteStudent.onclick=function(){
				
				var check=document.getElementsByName("ids");
				
				//判断一下,他选了没有
				var flag=false;
				
				for(var i=0;i<check.length;i++){
					
					if(check[i].checked==true){   
						
						flag=true;
						
						break;
						
					}																
				}
				
				if(flag==false){
					
					alert("请至少勾选一项进行删除！");
					
					location.href="<%=base %>FenleiServlet?action=showFenleiByPage";
					
					return;
				}	
						
				//如果选择了
						
				var str="";
						
				for(var i=0;i<check.length;i++){
							
					if(check[i].checked==true){
								
					str=str+check[i].value+",";
	
				}
			}
								
				//去除最后一个逗号
				str=str.slice(0,str.length-1);
												
		        //发送给服务器
				var queren=confirm("您确定要删除这些分类吗？");
				
				if(queren==true){
					
					location.href="<%=base %>FenleiServlet?action=delete&ids="+ str;

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
</head>
<body background="<%=base%>./imgs/l.jpg">
	<%-- <table align="center" width="200px" height="200px" border="1px"
		cellspacing="0" bordercolor="silver">
		<caption align="top">
			<h1>
				<font color="red">查看所有分类</font>
			</h1>
			<hr size="2px" color="red" width="600px" />
		</caption>
		<tr align="center">
			<td>选择</td>
			<td>编号</td>
			<td>分类名称</td>
		</tr>
		<c:forEach items="${pb.beanList }" var="f" varStatus="s">
			<tr align="center">
				<td><input type="checkbox" name="ids" value="${f.id }" /></td>
				<td>${s.index+1 }</td>
				<td>${f.name }</td>
			</tr>
		</c:forEach>
		<tr height="30px">
			<td colspan="3" align="center"><button id="selectAll" class="btn btn-success btn-xs">全选</button>
				<button id="unselectAll" class="btn btn-info btn-xs">全不选</button>
				<button id="fanxuan" class="btn btn-success btn-xs">反选</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="deleteStudent" class="btn btn-info btn-xs">删除</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="<%=base%>updateFenlei.jsp">
				<input type="submit" value="修改" class="btn btn-success btn-xs"/></a></td>
		</tr>
	</table> --%>
	<div class="col col-md-8">
		<ul class="nav nav-tabs">
		    <li class="active"><a href="addFenlei.jsp">添加分类</a></li>
		    <li class="active"><a href="updateFenlei.jsp">修改分类</a></li>
			<li><a id="selectAll" href="#">全选</a></li>
			<li><a id="unselectAll" href="#">全不选</a></li>
			<li><a id="fanxuan" href="#">反选</a></li>
			<li><a id="deleteStudent" href="#">删除</a></li>
			</ul>
	<div class="container">
     <div class="panel panel-warning">
       <div class="panel-heading">
         <div class="panel-title">
           <h2>查看所有分类</h2>
         </div>
       </div>
       <div class="panel-body">
         <table class="table table-borderd table-striped table-hover">
		 <!-- info蓝色    success绿色    warning黄色    danger红色    active灰色 -->
			<tr align="center">
			<td>选择</td>
			<td>编号</td>
			<td>分类名称</td>
		</tr>
			<c:forEach items="${pb.beanList }" var="f" varStatus="s">
			<tr align="center">
				<td><input type="checkbox" name="ids" value="${f.id }" /></td>
				<td>${s.index+1 }</td>
				<td>${f.name }</td>
			</tr>
		</c:forEach>
		</table>
		</div>
		<%-- <div class="panel-footer text-center">
          <tr height="30px">
			<td colspan="3" align="center"><button id="selectAll" class="btn btn-warning btn-xs">全选</button>
				<button id="unselectAll" class="btn btn-warning btn-xs">全不选</button>
				<button id="fanxuan" class="btn btn-warning btn-xs">反选</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="deleteStudent" class="btn btn-warning btn-xs">删除</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="<%=base%>updateFenlei.jsp">
				<input type="submit" value="修改" class="btn btn-warning btn-xs"/></a></td>
		</tr>
       </div> --%>
		</div>
		</div>
	<center>
	<p>
		第${pb.pageNow }页/共${pb.pages }页 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		<ul class="pagination">
		<li><a href="<%=base %>FenleiServlet?action=showFenleiByPage&pageNow=1">首页</a></li>
		     &nbsp;&nbsp;
		     <c:if test="${pb.pageNow>1 }">
		     <li><a href="<%=base %>FenleiServlet?action=showFenleiByPage&pageNow=${pb.pageNow-1 }">上一页</a></li>
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
		                 <li class="active"><span>${i }</span></li>
		                </c:when>
		                <c:otherwise>
		                <li><a href="<%=base %>FenleiServlet?action=showFenleiByPage&pageNow=${i }">${i }</a></li>
		                </c:otherwise>
		            </c:choose>
		           
		        </c:forEach>
		       &nbsp;
		       <c:if test="${pb.pageNow<pb.pages }">
		     <li><a href="<%=base %>FenleiServlet?action=showFenleiByPage&pageNow=${pb.pageNow+1 }">下一页</a></li>
		     </c:if>
		       &nbsp;&nbsp;
		     <li><a href="<%=base %>FenleiServlet?action=showFenleiByPage&pageNow=${pb.pages }">尾页</a></li>
		</ul>
		</div>
	
	<%-- <table align="center">
		<tr align="center">
			<td><h4>没有您想要的分类？您可以点击这里<a href="<%=base%>addFenlei.jsp">添加分类</a></h4></td>
		</tr>
	</table> --%>
</body>
</html>