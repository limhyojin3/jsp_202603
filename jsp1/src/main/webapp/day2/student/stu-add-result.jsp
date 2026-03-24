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
		String stuName = request.getParameter("stuName");
		String stuDept = request.getParameter("stuDept");
		String stuGrade = request.getParameter("stuGrade");
		
		String sql = "INSERT INTO STUDENT(STU_NO, STU_NAME, STU_DEPT, STU_GRADE) "
					+ "VALUES("
					+ "'" + stuNo + "',"
					+ "'" + stuName + "',"
					+ "'" + stuDept + "',"
					+ "'" + stuGrade + "')";
		int result = stmt.executeUpdate(sql);
		if(result > 0){
			/* out.println("추가되었습니다.!"); */
			response.sendRedirect("stu-list.jsp");
		} else {
			out.println("에러 발생!");
		}
		
	%>
</body>
</html>