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
<!-- 5.引入Bookstrap的核心JS文件 --> 
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<c:if test="${!(empty mag) }">
<script>
  alert("${mag }");
</script>
<c:remove var="mag" scope="session"/>
</c:if>
<title>查看所有分类</title>
<script type="text/javascript">
<%-- <c:if test="${!(empty mag) }">
<script>
  alert("${mag }");
</script>
<c:remove var="mag" scope="session"/>
</c:if> --%>

/* $(function(){
	   
	   $(".deleteId").click(function(){
		   
		   var $url=this.href;
		   
		   //alert($url);
		   
		   $("#deleteForm").attr("action",$url);
		   
		   //提交表单
		   $("#deleteForm").submit();
		   
		   return false;
	   });
}); */











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
			
			
	 
	 
	/*  var deleteF=document.getElementById("DeleteF");
		
		deleteF.onclick=function(){
			
			var check=document.getElementsByName("ids");
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
				location.href = "fenleis";
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
			var queren = confirm("您确定要删除这些分类吗？");
			
			if (queren == true) {
				
			   var $url="fenlei/"+str;
				   
			   //alert($url);
			   
			   $("#deleteForm").attr("action",$url);
			   
			   //提交表单
			   $("#deleteForm").submit();
			   
			   return false;
			   
			} else {
				
				location.reload();
			}
		};
		 
		  */
		  
		  
		//删除	  
			var df = document.getElementById("DeleteF");

		    var chek = document.getElementsByName("ids");
		  
			df.onclick = function() {

				var flag = false;

				for (i = 0; i < chek.length; i++) {

					if (chek[i].checked == true) {
						flag = true;
						break;
					}
				}

				if (flag == false) {
					alert("请勾选一项");
					return;

				} else {    
					
					var str = "";
	                var m=0;
					for (var i = 0; i < chek.length; i++) {

						if (chek[i].checked == true) {
	                          m++;
							str += chek[i].value + ",";

						}
						if(m>1){
							alert("分类只支持一次删除一个");
							return;
						}
					}
					str = str.slice(0, str.length - 1);
					//alert(str);
	          
				 
					var flage = confirm("你确定删除所勾选的分类吗？");
					if (flage == true) {//确定
						//拿到请求地址
						var $url = "http://localhost:8080/LibrarySystem/fenlei_delete/"+ str;

						//alert($url);
						//拿到表单
						$("#deleteForm").attr("action", $url);

						//提交表单
						$("#deleteForm").submit();
						
						

					} else {//取消

						 
						window.location.href = "http://localhost:8080/LibrarySystem/fenleis/1";

					}
				}
			};
	 
	 
	 
	 var  outAll=document.getElementById("OutAll");
		
		outAll.onclick=function(){
		
			var flag=confirm("你确定导出所有分类信息吗？");
			
			if(flag){
			
				window.location.href="OutAll "
			
			}
		
		};
		
		var outSelect=document.getElementById("OutSelect");
		
		outSelect.onclick=function(){
			
			var chek=document.getElementsByName("ids");
			
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
				
				var flag = confirm("你确定导出选中的分类信息？");
				
				if (flag) {//确定
					
					
					window.location.href = "OutSelect/"+str;


				}
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
<body background="./imgs/l.jpg">
	
	<div class="container">
     <div class="panel panel-warning">
       <div class="panel-heading">
         <div class="panel-title">
           <h2>查看分类</h2>
         </div>
       </div>
       <div class="col col-md-10">
		<ul class="nav nav-tabs">
		    <li class="active"><a href="addFenlei.jsp">添加分类</a></li>
			<li><a id="selectAll" href="#">全选</a></li>
			<li><a id="unselectAll" href="#">全不选</a></li>
			<li><a id="fanxuan" href="#">反选</a></li>
			<li><a id="DeleteF" href="#">删除</a></li>
			<li><a id="OutSelect" href="#">导出选中</a></li>
			<li><a id="OutAll" href="#">导出全部</a></li>
			
			</ul>
		</div>
       <div class="panel-body">
         <table class="table table-borderd table-striped table-hover">
		 <!-- info蓝色    success绿色    warning黄色    danger红色    active灰色 -->
			<tr align="center">
			<td>选择</td>
			<td>编号</td>
			<td>分类名称</td>
			<td>修改</td>
			
			<!-- <td>删除</td> -->
		</tr>
			<c:forEach items="${pb.beanList }" var="f" varStatus="s">
			<tr align="center">
				<td><input type="checkbox" name="ids" value="${f.id }" /></td>
				<td>${s.index+1 }</td>
				<td>${f.name }</td>
				<td><a href="fenlei/${f.id }">
				<input type="submit" value="修改" class="btn btn-warning" /></a></td>
			    <%-- <td><a href="fenlei/${f.id }" class="deleteId btn btn-danger">删除</a></td> --%>
			</tr>
		</c:forEach>
		</table>
		<form action="" method="post" id="deleteForm">
		  <input type="hidden" name="_method" value="DELETE"/>
		</form>
		</div>
		</div>
		<hr>
	<center>
		<p>第${pb.pageNow }页/共${pb.pages }页
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<ul class="pagination">
				<li><a href="fenleis?pageNow=1">首页</a></li>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<c:if test="${pb.pageNow>1 }">
					<li><a href="fenleis?pageNow=${pb.pageNow-1 }">上一页</a></li>
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
							<li><a href="fenleis?pageNow=${i }">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<c:if test="${pb.pageNow<pb.pages }">
					<li><a href="fenleis?pageNow=${pb.pageNow+1 }">下一页</a></li>
				</c:if>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<li><a href="fenleis?pageNow=${pb.pages }">尾页</a></li>
			</ul>
		</div>
</body>
</html>