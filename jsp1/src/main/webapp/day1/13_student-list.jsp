<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 13_student-list.jsp --> <!-- 파일을 include -->
	<%@ include file="../db.jsp" %>
	
	<!-- 3.스크립틀릿 -->
	
	<%
		String sql = "SELECT * FROM STUDENT";
		ResultSet rs = stmt.executeQuery(sql);
		// rs는 커서위치. 만족하는 테이블의 바로 위.
		
		while(rs.next()){
	%>
			<div><%= rs.getString("STU_NO") %> <%= rs.getString("STU_NAME") %></div> 	
	<%
		}
	%>
		

</body>
</html>