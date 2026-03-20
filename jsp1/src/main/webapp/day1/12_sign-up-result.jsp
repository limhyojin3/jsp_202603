<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 3. 스크립틀릿 : 자바 + HTML -->

	<%
		String userId = request.getParameter("userId");
		String pwd1 = request.getParameter("pwd1");
		String userName = request.getParameter("userName");
		String age = request.getParameter("age");
		
		/* 넘어온 value값이 왼쪽에 담기겠지~ */
		
		/* 자바 변수선언 : userId,pwd1,userName,age */
	%>
	
	
				<!-- 2. 표현식 -->
	<div>아이디 : <%= userId %></div>
	<div>이름 : <%= userName %></div>
</body>
</html>