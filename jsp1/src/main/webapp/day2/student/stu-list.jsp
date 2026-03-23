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
	
	<table>
		<tr>
			<th>학번</th>
			<th>이름</th>
			<th>학과</th>
			<th>학년</th>
			<!-- STU_NO, STU_NAME, STU_DEPT, STU_GRADE  -->
		</tr>
	<% 
		String sql = "SELECT * FROM STUDENT";
		
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
			
	%>	
			<tr>
				<td><%= rs.getString("STU_NO") %></td>
				<td><a href="javascript:;" onclick="fnView(<%= rs.getString("STU_NO")%>)"> <%= rs.getString("STU_NAME") %></a></td>
				<td><%= rs.getString("STU_DEPT") %></td>
				<td><%= rs.getString("STU_GRADE") %></td>
			</tr>
	<%
		}
	%>
	</table>
	<div>
		<input type="button" value="학생삽입" onclick="fnAdd()">
	</div>
</body>
</html>
<script>
	function fnAdd(){
		location.href = "stu-add.jsp";
	}
	function fnView(stuNo){
		location.href = "stu-view.jsp?stuNo=" + stuNo;
	}

</script>