<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 독립적으로 실행ㄴㄴ -->
	
	<!-- id가 test, pwd 1234 면 '로그인 성공' 출력 -->
	<!-- 아니면 '로그인 실패' 출력 -->
	<%
		String userId = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
		
		//변수 선언: userId, pwd;
		
		if(userId.equals("test") && pwd.equals("1234")){
			out.println("로그인 성공!");
		} else{
			out.println("로그인 실패");
		}
	%>
	
	
	
	<div>아이디 : <%= userId %></div>
	<div>비밀번호 : <%= pwd %></div>
	
	<!-- 선언한 변수(uesrId, pwd)를 사용. -->
</body>
</html>