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
		String pwd = request.getParameter("pwd1");
		String userName = request.getParameter("userName");
		String age = request.getParameter("age");
		
		String[] hobby = request.getParameterValues("hobby"); //코딩 유튜브 독서
		
		for(int i=0; i< hobby.length; i++){
			out.println(hobby[i]);
		}
		/* 왜 줄바꿈이 적용이 안될까? => Java의 출력 방식과 브라우저의 해석 방식이 다르기 때문*/
		/* out.println => 브라우저에 출력! */
		 
		
		/* 넘어온 value값이 왼쪽에 담기겠지~ */
		
		/* 자바 변수선언 : userId,pwd,userName,age */
	%>
	
	
				<!-- 2. 표현식 -->
	<div>아이디 : <%= userId %></div>
	<div>이름 : <%= userName %></div>
</body>
</html>