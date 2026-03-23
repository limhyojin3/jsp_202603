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
	}
	.btn-area {
		margin-top : 5px;
	}

</style>
</head>
<body>
	<!-- stu-view.jsp -->
	
<%@ include file="../../db.jsp" %>
	
<form action="" name="form">
	
	<% 
		String stuNo = request.getParameter("stuNo");
	%>
	<input name="stuNo" value="<%= stuNo %>" hidden>
	
	<table>
	<% 
		String sql = "SELECT STU_NO, STU_NAME, STU_DEPT, STU_GRADE" 
			+ " FROM STUDENT WHERE STU_NO = '" + stuNo + "'";
		
		ResultSet rs = stmt.executeQuery(sql);
		if(rs.next()){
			
	%>	
			<tr>
				<th>학번</th>
				<td><%= rs.getString("STU_NO") %></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><%= rs.getString("STU_NAME") %></td>
			</tr>
			<tr>
				<th>학과</th>
				<td><%= rs.getString("STU_DEPT") %></td>
			</tr>
			<tr>
				<th>학년</th>
				<td><%= rs.getString("STU_GRADE") %></td>
			</tr>
	<%
		} else{
			out.println("해당학번 학생이 존재하지 않습니다.");
		}
		
	%>
	</table>
	<div class="btn-area">
		<input type="button" value="수정" onclick="fnEdit()">
		<input type="button" value="삭제" onclick="fnRemove()">
		<input type="button" value="되돌아가기" onclick="fnList()">
	</div>


</form>	
	
</body>
</html>
<script>
	function fnEdit(){
		let form = document.form;
		form.action = "stu-edit.jsp";
		form.submit();
	}
	function fnList(){
		let form = document.form;
		form.action = "stu-list.jsp";
		form.submit();
	}
	function fnRemove(){
		location.href = "stu-remove.jsp?stuNo='" + <%= stuNo %> + "'"; 
	}

</script>