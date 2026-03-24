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
<form action="stu-list.jsp" name="form">
	<%@ include file="../../db.jsp" %>
	<% 
	
		String stuDept = request.getParameter("stuDept");//?stuDept='기계' , ?stuDept=''
		stuDept = stuDept != null? stuDept : "";
	
	%>
	
	<div>
	
	
		<select name="stuDept" onchange="fnDept(this.value)">
		
			<option value="">:: 전체 ::</option>
			<option value="기계" <%= stuDept.equals("기계") ? "selected" : "" %>>기계</option>
			<option value="전기전자" <%= stuDept.equals("전기전자") ? "selected" : "" %>">전기전자</option>
			<option value="컴퓨터정보" <%= stuDept.equals("컴퓨터정보") ? "selected" : "" %>>컴퓨터정보</option>
		
		</select>
	
	</div>
	
	
	
	<table>
		<tr>
			<th>학번</th>
			<th>이름</th>
			<th>학과</th>
			<th>학년</th>
		</tr>
	<%
		String sql = "SELECT * FROM STUDENT WHERE 1=1 ";
	
		if(stuDept != null && !stuDept.equals("")){
			sql += "AND STU_DEPT = '" + stuDept + "' ";
		}
	
	
	
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
	%>
		<tr>
			<td><%= rs.getString("STU_NO") %></td>
			<td><a href="stu-view.jsp?stuNo=<%= rs.getString("STU_NO") %>"><%= rs.getString("STU_NAME") %></a></td>
			<td><%= rs.getString("STU_DEPT") %></td>
			<td><%= rs.getString("STU_GRADE") %></td>
		</tr>
	<%		
		}
	%>
	</table>
	<div>
		<a href="stu-add.jsp"><input type="button" value="학생추가"></a>
	</div>
</form>
</body>
</html>
<script>

	function fnDept(v){
		let form = document.form;
		form.submit();
	}

</script>