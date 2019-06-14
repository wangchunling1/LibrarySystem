<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<c:if test="${!(empty msg3) }">
  <script>
    alert("${msg3 }");
  </script>
  <c:remove var="msg3" scope="session"/>
</c:if>
<title>Insert title here</title>
</head>
<body>
   <form action="AdminServlet?action=exit" method="post">
</form>
</body>
</html>