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
	th {
		width : 50px;
		background-color: #eee;
	}
	td {
		width : 250px;
	}
	.contents {
		height : 200px;
	}
	.btn-area {
		margin-top : 5px;
	}
</style>
</head>
<body>
<%@ include file="../../db.jsp" %>
<form action="" name="form">
	<%
		String boardNo = request.getParameter("boardNo");
	%>
	<input name="boardNo" value="<%= boardNo %>" hidden>
	
		<!-- hidden 으로 한 이유 : 파라미터를 다음페이지로 넘기고싶지만 화면에 표시하긴 싫어서. -->
	
	<table>
	<%
		
		String sql ="UPDATE TBL_BOARD SET CNT = CNT + 1 "
					+ "WHERE BOARDNO = " + boardNo;
		stmt.executeUpdate(sql);
		
		sql = "SELECT * FROM TBL_BOARD WHERE BOARDNO = " + boardNo;
		ResultSet rs = stmt.executeQuery(sql);
		if(rs.next()){
	%>
		<tr>
			<th>제목</th>
			<td colspan="3"><%= rs.getString("TITLE") %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%= rs.getString("USERID") %></td>
			<th>조회수</th>
			<td><%= rs.getString("CNT") %></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td colspan="3"><%= rs.getString("CDATETIME") %></td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3" class="contents"><%= rs.getString("CONTENTS") %></td>
		</tr>
	<%	
		} else {
			out.println("게시글이 존재하지 않습니다.");
		}
		
	%>
	</table>
	<div class="btn-area">
		<input type="button" value="수정" onclick="fnEdit()">
		<input type="button" value="삭제" onclick="fnRemove()">
		<input type="button" value="되돌아가기">
	</div>
</form>
</body>
</html>
<script>
	function fnEdit(){
		let form = document.form;
		form.action = "board-edit.jsp";
		form.submit();
	}
	function fnRemove(){
		console.log(<%= boardNo %>);
		location.href = "board-remove.jsp?boardNo=" + <%= boardNo %>;
		/* let form = document.form;
		form.action = "board-remove.jsp";
		form.submit(); */
			
	}
</script>