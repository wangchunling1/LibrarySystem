<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- <style>
		#changefenlei{
			display: none;
		}
		#changeBook{
			display: none;
		}
		#changeUser{
			display: none;
		}
		#changeAdmin{
			display: none;
		}
	</style>
<script>
		window.onload=function(){
		   //1.拿到p标记
			   var fenlei=document.getElementById("fenlei");
			   
			   //2.绑定单击事件
			    fenlei.onclick=function(){
				   
				   var changefenlei=document.getElementById("changefenlei");
				   
				   //判断是不是隐藏的
				   
				   if(changefenlei.style.display=="block"){  //显示
					   
					   fenlei.innerHTML="+分类管理";
					   
					   changefenlei.style.display="none";
					   
				   }else{
					   
					   fenlei.innerHTML="-分类管理";
					   
					   changefenlei.style.display="block";
				   }
			   };
			   
			 //1.拿到p标记
			   	var book=document.getElementById("book");
			   	
			   	//2.绑定单击事件
			   	book.onclick=function(){
			   		
			   		var changeBook=document.getElementById("changeBook");
			   		
			   		//判断是不是隐藏的
			   		
			   		if(changeBook.style.display=="block"){  //显示
			   			
			   			book.innerHTML="+图书管理";
			   			
			   			changeBook.style.display="none";
			   			
			   		}else{
			   			
			   			book.innerHTML="-图书管理";
			   			
			   			changeBook.style.display="block";
			   		}
		    };
			   
			   //1.拿到p标记
			   	var user=document.getElementById("user");
			   	
			   	//2.绑定单击事件
			   	user.onclick=function(){
			   		
			   		var changeUser=document.getElementById("changeUser");
			   		
			   		//判断是不是隐藏的
			   		
			   		if(changeUser.style.display=="block"){  //显示
			   			
			   			user.innerHTML="+用户管理";
			   			
			   			changeUser.style.display="none";
			   			
			   		}else{
			   			
			   			user.innerHTML="-用户管理";
			   			
			   			changeUser.style.display="block";
			   		}
		    };
		    
		  //1.拿到p标记
		   	var admin=document.getElementById("admin");
		   	
		   	//2.绑定单击事件
		   	admin.onclick=function(){
		   		
		   		var changeAdmin=document.getElementById("changeAdmin");
		   		
		   		//判断是不是隐藏的
		   		
		   		if(changeAdmin.style.display=="block"){  //显示
		   			
		   			admin.innerHTML="+管理员信息管理";
		   			
		   			changeAdmin.style.display="none";
		   			
		   		}else{
		   			
		   			admin.innerHTML="-管理员信息管理";
		   			
		   			changeAdmin.style.display="block";
		   		}
	    };
			
	};
		
	</script> -->

<style>
li {
	list-style-type: none;
	padding-top: 5px;
}

a {
	text-decoration: none;
}
</style>
<link type="text/css" rel="stylesheet" href="jquery-ui.css" />
<script type="text/javascript" src="jQuery/jquery1.js"></script>
<script type="text/javascript" src="jQuery/jquery-ui.js"></script>
<script type="text/javascript">
	$(function() {

		$("#accordion").accordion();

		$("#btn1").button({

			showLabel : true
		});

		$("#btn2").button({

			showLabel : true
		});

		$("#btn3").button({

			showLabel : true
		});

		$("#btn4").button({

			showLabel : true
		});

		$("#btn5").button({

			showLabel : true
		});

		$("#btn6").button({

			showLabel : true
		});

		$("#btn7").button({

			showLabel : true
		});

		$("#btn8").button({

			showLabel : true
		});

		$("#btn9").button({

			showLabel : true

		});

		$("#btn10").button({

			showLabel : true
		});
	});
</script>
<body>
	<table bgcolor="pink" width="200px" border="1" align="center"
		bordercolor="white">
		<br>
		<div id="accordion">
			<h3>分类管理</h3>
			<!-- <div id="changefenlei"> -->
			<div height="80px" align="center" cellspacing="0" width="100px">
				<ul>
					<li><span class="ui-icon ui-icon-plusthick"></span><a
						href="addFenlei.jsp" target="right"><input type="button"
							value="添加分类" id="btn1" /></a></li>
				</ul>
				<ul>
					<li><span class="ui-icon ui-icon-search"></span><a
						href="fenleis" target="right"><input
							type="button" value="查看分类" id="btn2" /></a></li>
				</ul>
				<ul>
					<li><span class="ui-icon ui-icon-pencil"></span><a
						href="updateFenlei.jsp" target="right"><input type="button"
							value="修改分类" id="btn3" /></a></li>
				</ul>
			</div>
			<h3>图书管理</h3>
			<!-- <div id="changeBook"> -->
			<div height="80px" align="center" cellspacing="0" width="100px">
				<ul>
					<li><span class="ui-icon ui-icon-plusthick"></span><a
						href="addBook.jsp" target="right"><input type="button"
							value="添加图书" id="btn4" /></a></li>
				</ul>
				<ul>
					<li><span class="ui-icon ui-icon-search"></span>
					<a href="books" target="right"><input
							type="button" value="查看图书" id="btn5" /></a></li>
				</ul>
			</div>

			<h3>用户管理</h3>
			<!-- <div id="changeUser"> -->
			<div height="80px" align="center" cellspacing="0" width="100px">
				<ul>
					<li><span class="ui-icon ui-icon-plusthick"></span><a
						href="addUser.jsp" target="right"><input type="button"
							value="添加用户" id="btn6" /></a></li>
				</ul>
				<ul>
					<li><span class="ui-icon ui-icon-search"></span><a
						href="UserServlet?action=showUserByPage" target="right"><input
							type="button" value="查看用户" id="btn7" /></a></li>
				</ul>
			</div>

			<h3>管理员信息管理</h3>
			<!-- <div id="changeAdmin"> -->
			<div height="100px" align="center" cellspacing="0" width="100px">
				<ul>
					<li><span class="ui-icon ui-icon-search"></span><a
						href="showAdmin.jsp" target="right"><input type="button"
							value="查看管理员" id="btn8" /></a></li>
				</ul>
				<ul>
					<li><span class="ui-icon ui-icon-pencil"></span><a
						href="changePassword.jsp" target="right"><input type="button"
							value="修改密码" id="btn9" /></a></li>
				</ul>
				<ul>
					<li><span class="ui-icon ui-icon-power"></span><a
						href="AdminServlet?action=exit" target="_parent"><input
							type="button" value="退出登录" id="btn10" /></a></li>
				</ul>
			</div>
		</div>
	</table>
</body>

