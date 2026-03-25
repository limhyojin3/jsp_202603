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
	.search-area {
		margin : 10px 0px;
	}
</style>
</head>
<body>
<form action="board-list.jsp" name="form">
	<%@ include file="../../db.jsp" %>
	<% 
		String sessionId = (String) session.getAttribute("sessionId"); // Object를 String으로 다운캐스팅 //(+)
		String sessionRole = (String) session.getAttribute("sessionRole");
		
		
		String keyword = request.getParameter("keyword");	//?keyword='공지'  => 주소?파라미터 => getParameter로 꺼낼수있음 !**
				
		String kind = request.getParameter("kind");
		kind = kind != null ? kind : "";
	%>
	<!-- board-list.jsp -->
	
	<div class="session-info">
		<div>현재 로그인한 사용자 : <%= sessionId %></div>
	</div>
	
	
	<div class="search-area">
		<label>검색어 : 
			<input name="keyword" 
				   value="<%= keyword != null ? keyword : ""  %>">
		</label>
			   
		<input type="submit" value="검색">
		
		<!-- option.value(옵션에있는밸류가) => select.value(셀렉트의밸류가된다) => this.value => select.value 를 의미함!
		<!-- 다음페이지에 파라미터로 넘어간다. ?kind=2 => name=2 -->
		
		
		<select name="kind" onchange="fnKind(this.value)">  
		
			<option value="">:: 전체 ::</option>
			<option value="1" <%= kind.equals("1") ? "selected" : "" %>>공지사항</option>
			<option value="2" <%= kind.equals("2") ? "selected" : "" %>>자유게시판</option>	
			<option value="3" <%= kind.equals("3") ? "selected" : "" %>>문의게시판</option>	
		</select>
		
		
	</div>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>작성일</th>
			<th>삭제</th>
		</tr>
	<%	
		
		String sql = "SELECT B.*, TO_CHAR(CDATETIME, 'YYYY-MM-DD') AS CDATE "
					+ "FROM TBL_BOARD B WHERE 1=1 ";
		if(keyword != null){
			sql += "AND TITLE LIKE '%" + keyword + "%' ";
		}
		
		//(+) null이 아니면서 빈값도 아니어야
		if(kind != null && !kind.equals("")){
			sql += "AND KIND = " + kind + " ";
		}
		
		
		if(true){
			sql += "ORDER BY BOARDNO ASC ";	
		}
		
		
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
	%>
			<tr>
				<td><%= rs.getString("BOARDNO") %></td>
				<td><a href="javascript:;" onclick="fnView(<%= rs.getString("BOARDNO") %>)"><%= rs.getString("TITLE") %></a></td>
				<td><%= rs.getString("USERID") %></td>
				<td><%= rs.getString("CNT") %></td>
				<td><%= rs.getString("CDATE") %></td>
	<% 
	
			if(sessionId.equals(rs.getString("USERID")) || sessionRole.equals("A")){  // 
	%>
				<td><input type="button" value="삭제" onclick="fnRemove(<%= rs.getString("BOARDNO") %>)"></td>
	
	<%			
				
			}
	%>			
				
			</tr>	
	<%		
		}
		
	%>
	</table>
	<div>
		<input type="button" value="글쓰기" onclick="fnAdd()">
	</div>
</form>
</body>
</html>
<script>
	function fnAdd(){
		// board-add.jsp
		location.href = "board-add.jsp";
	}
	
	function fnView(boardNo){
		location.href = "board-view.jsp?boardNo=" + boardNo;
		//파라미터 바로 옆에 따옴표 붙이지않는다! **
	}
	
	function fnKind(v){
	/* 	let form = document.form;
		form.submit(); 
	*/
		document.form.submit();
		// =>"board-list.jsp" 로 간다
		
	}
	
	function fnRemove(boardNo){
		location.href = "board-remove.jsp?boardNo=" + boardNo;
	}
</script>