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
	
	<%
		String productId = request.getParameter("productId");
		out.println(productId); //1~20
	
		String sql = "SELECT * FROM PRODUCT WHERE PRODUCT_ID = " + productId; //5
		ResultSet rs = stmt.executeQuery(sql);
		// rs(커서)가 만족하는 행의 바로 위에 있다.
		
		// 데이터가 있는경우
		if(rs.next()){
			out.println("<div>제품 이름 : " + rs.getString("PRODUCT_NAME") + "</div>");
			out.println("<div>브랜드 : " + rs.getString("BRAND") + "</div>");
			out.println("<div>종류 : " + rs.getString("CATEGORY") + "</div>");
			out.println("<div>가격 : " + rs.getString("PRICE") + "</div>");
			out.println("<div>설명 : " + rs.getString("DESCRIPTION") + "</div>");
		} else{
			out.println("제품 없지롱");
		}
	%>
</body>
</html>