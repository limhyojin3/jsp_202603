<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 독립적으로 실행ㄴㄴ -->
	
	<%@ include file="../../db.jsp" %>
	
	<%
						// 요청할때 보내온 파라미터 가져오기
		String userId = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
		
		//변수 선언: userId, pwd;
		
		/* TBL_USER 테이블에 USERID, PWD 컬럼값과 비교하여 */
		/* 동일한 데이터 있으면 '로그인 성공' 출력 */
		/* x 둘 중 하나라도 다르면 '로그인 실패' 출력 */
		
		/* 아이디 없는 경우 : '해당 아이디는 존재하지 않습니다.' */
		/* 아이디는 있는데 비밀번호가 다른 경우 : '비밀번호를 확인해주세요.' */
		
		/* String sql = "SELECT * FROM TBL_USER WHERE USERID = '" + userId + "' AND PWD = '" + pwd + "'";
		System.out.println(sql);
		
		ResultSet rs = stmt.executeQuery(sql);
		// 커서위치(rs) 는 테이블의 바로 위.(만족하는 행의 바로 위)
		
		if(rs.next()){
			out.println("로그인 성공");
		} else{
			out.println("로그인 실패");
		} */
		
		String sql = "SELECT * FROM TBL_USER WHERE USERID = '" + userId + "'";
		System.out.println(sql);
		
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			if(rs.getString("PWD").equals(pwd)){
				out.println("로그인 성공");
			} else{
				out.println("비밀번호를 확인해주세요.");
			}
		} else{
			out.println("해당 아이디는 존재하지 않습니다.");
		}
		
	%>
	
	
	
	<div>아이디 : <%= userId %></div>
	<div>비밀번호 : <%= pwd %></div>
	
	<!-- 선언한 변수(uesrId, pwd)를 사용. -->
</body>
</html>