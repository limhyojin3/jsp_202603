<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 디렉티브 include -->
	<!-- 파일을 한곳에 다 모은다음 컴파일(실행) -->
	<%@ include file="variable.jsp" %>
	
	<!-- 액션 include -->
	<!-- 각 파일에서 먼저 컴파일 한 후 결과를 합친다. -->
	<%-- <jsp:include page="variable.jsp"></jsp:include> --%>
	
	<%= num1 + num2 %>

</body>
</html>