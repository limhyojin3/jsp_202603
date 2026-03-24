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
	<!-- 이거 잠시 막아두면 어떤일이? ( ) 
	    => 괜찮다! 파라미터 보내는 방법이 2개임.
	    => 1. name hidden 인걸로 보내거나 
	       2. 주소?파라미터=() 형태로 보내거나 !-->
	
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
		location.href = "stu-remove.jsp?stuNo=" + <%= stuNo %>; 
		// ?(물음표)뒤에가 파라미터로 쓰일까? ( ) => 그렇다고함! 파라미터 바로 옆에 따옴표붙이지않는다!
		//작은 따옴표가 앞페이지든 뒤페이지든 중복으로 들어가지않게 조심 !! **
	}

</script>