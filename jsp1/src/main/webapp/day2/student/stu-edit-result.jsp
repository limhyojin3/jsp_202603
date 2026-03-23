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
	
		String sql = "UPDATE STUDENT SET " 
			+ "STU_NO = '" + stuNo + "', "
			+ "STU_NAME = '" + stuName + "', "
			+ "STU_DEPT = '" + stuDept + "', "
			+ "STU_GRADE = " + stuGrade 
			+ " WHERE STU_NO = '" + stuNo + "'";
		//System.out.println(sql);
		
		int result = stmt.executeUpdate(sql);
		
	
	%>
</body>
</html>
<script>
	let result = <%= result %>;
	if(result > 0){
		alert("수정되었습니다!");
	} else{
		alert("수정에 실패했습니다!");
	} //수정에 실패햇다는데? ( ) =>PK키 수정하려고 하니까 실패했대..
	
	location.href = "stu-list.jsp";

</script>