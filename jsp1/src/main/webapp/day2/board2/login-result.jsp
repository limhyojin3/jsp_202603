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
	
	
	<!-- login-result.jsp -->
	<!-- 아이디와패스워드를 받아서 검증. -->

	<%
		String userId = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
	
		/* out.println(userId + " " + pwd); */
		
		/* String sql = 
			"SELECT * FROM TBL_USER "
			+ "WHERE USERID = '" + userId + "' " 
			+ "AND PWD = '" + pwd + "'"; */
		
		String sql = String.format(
			"SELECT * FROM TBL_USER WHERE USERID = '%s' AND PWD = '%s'", userId, pwd);
		
		ResultSet rs = stmt.executeQuery(sql);
		
		
		if(rs.next()){
		
			out.println("로그인 성공!");
			
			String sessionId = rs.getString("USERID");
			String sessionRole = rs.getString("ROLE"); //A,C
			
			
			
			session.setAttribute("sessionId", sessionId);  //키값, value값 (+)
			session.setAttribute("sessionRole", sessionRole);
			
			
			session.setMaxInactiveInterval(60 * 30);  //세션을 얼만큼 유지할것인가(초단위) , 30분
			
			
			
			response.sendRedirect("board-list.jsp");
		} else{
			out.println("로그인 실패!");
		}
		
	%>

</body>
</html>