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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />

<script type="text/javascript" src="bootstrap/js/jquery.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet" href="bootstrap/css/bootstrapValidator.css" />
<script type="text/javascript" src="iconfont/iconfont.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrapValidator.js"></script>

<title>Insert title here</title>
<style type="text/css">
 .icon {
	width: 1em;
	height: 1em;
	vertical-align: -0.15em;
	fill: currentColor;
	overflow: hidden;
	margin-top: 10px;
}
 h4{
 margin-top: 40px;
 }
 </style>
</head>
<body>
	 <div class="container-fluid">
	<div class="row header" id="divt">
			<!-- 上 -->
		 
				<div class="col col-md-7 col-md-offset-1">
	<marquee hspace="20" align="texttop" behavior="slide"
						scrollamount="20" direction="left" width=500>
				  <svg class="icon" aria-hidden="true" style="font-size: 50px;">
              <use xlink:href="#icon-tushu" ></use>
                 </svg>
                 <font size="7" color="#CF1834" face=华文新魏><b>甲骨文</b></font><font
							size="5" color="silver">图书管理系统</font><font size="5"
							color="silver">|</font><font size="5" color="silver">用户</font>
					</marquee>
				
				</div>
					<div  class="col col-md-2 ">
                 <h4 id="userlogin">
                  <c:if test="${empty qusername  }"> 
						<a href='<%=base %>userlogin.jsp' target="_top">请登录</a>
				 </c:if>
                    <c:if test="${!empty qusername  }"> 
						<font class="text-warning"> ${qusername},欢迎您  </font>|&nbsp;<a href='<%=base %>userlogin.jsp' target="_top">退出</a>
				 </c:if>		 
                 </h4>
				</div>
			</div>
 	</div>
	 
</body>
</html>