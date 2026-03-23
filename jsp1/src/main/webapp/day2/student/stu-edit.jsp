<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
		margin : 30px;
	}
	table, th, tr, td {
		border : 1px solid black;
		padding : 5px 10px;
		border-collapse: collapse;
		text-align: center;
	}

</style>
</head>
<body>
	<%@ include file="../../db.jsp" %>
	<form action="stu-edit-result.jsp" name="form">
	<% 
		String stuNo = request.getParameter("stuNo");
	%>
	<%-- <input name="stuNo" value="<%= stuNo %>" hidden> --%>
	
	<table>
	<% 
		String sql = "SELECT STU_NO, STU_NAME, STU_DEPT, STU_GRADE" 
			+ " FROM STUDENT WHERE STU_NO = '" + stuNo + "'";
		
		ResultSet rs = stmt.executeQuery(sql);
		if(rs.next()){
			
	%>	
			<tr>
				<th>학번</th>
				<td><input name="stuNo" value="<%= rs.getString("STU_NO") %>"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input name="stuName" value="<%= rs.getString("STU_NAME") %>"></td>
			</tr>
			<tr>
				<th>학과</th>
				<td><input name="stuDept" value="<%= rs.getString("STU_DEPT") %>"></td>
			</tr>
			<tr>
				<th>학년</th>
				<td><input name="stuGrade" value="<%= rs.getString("STU_GRADE") %>"></td>
			</tr>
	<%
		} else{
			out.println("해당학번 학생이 존재하지 않습니다.");
		}
		
	%>
	</table>
	<div class="btn-area">
		<input type="button" value="수정" onclick="fnEdit()">
		<input type="reset" value="초기화">
		<input type="button" value="되돌아가기" onclick="fnList()")>
	</div>
	</form>
</body>
</html>
<script>
	function fnEdit(){
		let form = document.form;
		/* if(form.stuNo.value.length == 0 ||
				form.stuName.value.length == 0 ||
				form.stuDept.value.length == 0 ||
				form.stuGrade.value.length == 0) {
			alert("공백을 두지마세요. 내용을 입력하세요.");
			return;
		} //오류나는데?( ) => PK키 STU_NO 이 8글자라서 공백생김.. */
		
		form.submit();
	}
	function fnList(){
		let form = document.form;
		form.action = "stu-list.jsp";
		form.submit();
	}

</script>