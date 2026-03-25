<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	select {
	    width: 50px;
		text-align: center;	
	}
</style>
</head>
<body>
	<%@ include file="../../db.jsp" %>
	<%
		String stuNo = request.getParameter("stuNo");
		String sql = "SELECT * FROM STUDENT WHERE STU_NO = '" + stuNo + "'";
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		String stuGrade = rs.getString("STU_GRADE");
	%>
	<form action="stu-edit-result.jsp">
		<input name="stuNo" value="<%= rs.getString("STU_NO") %>" hidden>
		<div>
			<label>학번 : <input name="stuNo" value="<%= rs.getString("STU_NO") %>" disabled></label>
		</div>
		<div>
			<label>이름 : <input name="stuName" value="<%= rs.getString("STU_NAME") %>"></label>
		</div>
		<div>
			<label>학과 : <input name="stuDept" value="<%= rs.getString("STU_DEPT") %>"></label>
		</div>
		<div>
			<label>학년 : 
				<select name="stuGrade">
					<option value="1" <%= stuGrade.equals("1") ? "selected" : "" %>> 1 </option>
					<option value="2" <%= stuGrade.equals("2") ? "selected" : "" %>> 2 </option>
					<option value="3" <%= stuGrade.equals("3") ? "selected" : "" %>> 3 </option>
				</select>
			</label>
		</div>
		<div>
			<input type="submit" value="수정">
		</div>
	</form>
</body>
</html>