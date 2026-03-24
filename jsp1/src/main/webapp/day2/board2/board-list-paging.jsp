<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#container{
		width : 800px;
		margin : 10px auto;
	}
	table{
		width : 100%;
		margin : 0 auto;
	}
	.select-area{
		text-align: right;
		margin-bottom : 5px; 
	}
	body {
		margin : 30px;
	}
	table, th, tr, td {
		border : 1px solid black;
		padding : 5px 10px;
		border-collapse: collapse;
		text-align: center;
	}
	th {
		background-color: #eee;
	}
	.paging-area {
		margin-top : 5px;
		text-align: center
	}
	.paging-area a {
		padding : 5px;
		text-decoration: none;
		color : #4c4848;
		font-size: 20px;
	}
	.paging-area .active{
		font-weight: bold;
		color : black;
	}
</style>
</head>
<body>
<div id="container">
	<form action="board-list-paging.jsp" name="form">
		<%@ include file="../../db.jsp" %>
		<%
			int pageSize = 5;  //pageSize를 5로초기화
		
		
			
			//a 태그 클릭한후에 파라미터가 넘어온다. ?page=3&pageSize=10
			if(request.getParameter("pageSize") != null){
				pageSize = Integer.parseInt(request.getParameter("pageSize"));
			} //pageSize를 10으로 바꿈.
			
		%>
		<div class="select-area">
			<select name="pageSize" onchange="fnPageSize()">
				<%
					int arr[] = {3, 5, 10, 15, 20};
					for(int i=0; i<arr.length; i++){
				%>
						<option value="<%= arr[i] %>" <%= pageSize == arr[i] ? "selected" : "" %>> <%= arr[i] %> 개씩 </option>
				<%		
					}
				%>
			</select>
		</div>
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
		<%	
			
			ResultSet rsCnt = stmt.executeQuery(
				"SELECT COUNT(*) AS TOTAL FROM TBL_BOARD "
			);	
			rsCnt.next();
			int total = rsCnt.getInt("TOTAL");
			int pageList = (int) Math.ceil((double) total / pageSize); //페이지갯수
			
			
			int currentPage = 1;  //맨첨에 currentPage를 1로 초기화
			
			//a 태그 클릭한후에 ?page=3&pageSize=10
			if(request.getParameter("page") != null){
				currentPage = Integer.parseInt(request.getParameter("page"));
			}
			
			
			
			int offset = (currentPage - 1) * pageSize; //(+) 이 순서부터~~~ page(+), pagesize 읽기(+)
			
			String sql = "SELECT B.*, TO_CHAR(CDATETIME, 'YYYY-MM-DD') AS CDATE "
						+ "FROM TBL_BOARD B WHERE 1=1 ";
			
			if(true){
				sql += "ORDER BY BOARDNO ASC ";	
			}
			
			
			if(true){
				sql += "OFFSET " + offset + " ROWS FETCH NEXT " +  pageSize  + " ROWS ONLY";
			}
			
			
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
		%>
				<tr>
					<td><%= rs.getString("BOARDNO") %></td>
					<td><%= rs.getString("TITLE") %></td>
					<td><%= rs.getString("USERID") %></td>
					<td><%= rs.getString("CNT") %></td>
					<td><%= rs.getString("CDATE") %></td>
				</tr>	
		<%		
			}
		%>
		</table>
		<div class="paging-area">
		
		
			<% if(currentPage != 1){ %>
				<a href="?page=<%= currentPage-1 %>&pageSize=<%= pageSize %>">◀</a>
			<% } %>
			
			
			
			
			
			<%
				for(int i=1; i <= pageList; i++){ 
					//i=1,2,3,4
			%>
				<a href="?page=<%= i %>&pageSize=<%= pageSize %>" class="<%= currentPage == i ? "active" : "" %>"> <%= i %> </a>
			<%		
				}
				//?page=3&pageSize=10 => a태그에서 파라미터를 넘겨준다.**
			%>
			
			
			
			
			<% if(currentPage != pageList){ %>
				<a href="?page=<%= currentPage+1 %>&pageSize=<%= pageSize %>">▶</a>
			<% } %>
			
			
		</div>
	</form>
</div>
</body>
</html>
<script>
	function fnPageSize(){
		document.form.submit();
		//"board-list-paging.jsp" 로 이동한다
	}

</script>