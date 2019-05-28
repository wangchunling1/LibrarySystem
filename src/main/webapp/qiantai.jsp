<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>图书管理系统</title>
<style>
      body{
	  margin:0
	  }
</style>
</head>
<body>
<table cellspacing="0" width="100%" height="900px">
<tr height="80px">
			<td colspan="2">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
				color="red" size="7" face="楷体"><b>Ling</b></font>&nbsp;<font
				size="6">图书管理系统</font>&nbsp;<font size="6" color="silver">|</font>&nbsp;<font
				color="silver" size="5">前台</font>
			</td>
		</tr>
<tr background="imgs/11.jpg">
<!-- 中 -->
<td width="30%"></td>
<td align="center">
<center>
   <form action="books" method="post" enctype="application/x-www-form-urlencoded">       
	  
		<table align="center" width="600px" height="210px" border="1px" cellspacing="0" bordercolor="silver">
		  <caption align="top">
			<h1>
				<font color="red">所有图书信息</font>
			</h1>
			<hr size="2px" color="red" width="600px"/>	 
		</caption>
		<tr align="center">
			<td>图书编号</td>
			<td>图书名称</td>
			<td>图书价格</td>
			<td>图书出版社</td>
			<td>状态</td>
			<td>借/还</td>
		</tr>
		<c:forEach items="${pb.beanList }" var="q" varStatus="s">
			<tr align="center">
				<td>${s.index+1 }</td>
				<td>${q.bname }</td>
				<td>${q.price }</td>
				<td>${q.chuban }</td>
				<td>${q.zhuangtai }</td>
				<td><button>借/还</button></td>
			</tr>
		</c:forEach>
		</table>
	 </form>
	 </center>
	 </td>
	 </tr>
      <tr height="100px">

			<td align="center" colspan="2"><font color="gray" size="4"
				face="楷体">Ling公司版权所有&copy;2000-2018</font></td>
		</tr>
</table>
</html>