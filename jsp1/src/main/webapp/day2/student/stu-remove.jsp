<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../db.jsp" %>
	
	<%
		String stuNo = request.getParameter("stuNo");
	
		
		String sql = "DELETE FROM STUDENT WHERE STU_NO = " + stuNo;
		int result = stmt.executeUpdate(sql);
		
		if(result > 0){
			out.println("삭제되었습니다!");
		} else{
			out.println("실패했습니다!");
		}
	
	
	%>
	<a href="stu-list.jsp"><button>되돌아가기</button></a>
</body>
</html>