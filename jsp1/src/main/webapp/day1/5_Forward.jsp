<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:forward page="forward-view.jsp"> 
		<jsp:param name="userId" value="hong12"/>
		<jsp:param name="age" value="30"></jsp:param>
	</jsp:forward>
</body>
</html>
<!-- 이 페이지로 이동하면서 파라미터를 넘긴다 -->