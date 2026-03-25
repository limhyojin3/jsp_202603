<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="area.jsp" name="form">


	<%@ include file="../db.jsp" %>
	
	
	
	
	시/도 : <select name = "paramSi" onchange="fnSelectSi()">
			<option value="">:: 선택 :: </option>
	
	<%
		String paramSi = request.getParameter("paramSi");
	
	
	
		String sql = "SELECT DISTINCT SI FROM AREA";
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			
			String si = rs.getString("SI");
			String selected = si.equals(paramSi) ? "selected" : "";
	%>
	
			<option value="<%= si %>" <%= selected %>><%= si %></option>
	
	
	<%
			
		}
	
	
	%>
	
	</select>
	
	구 : <select name = "paramGu" onchange="fnSelectSi()">
			<option value="">:: 선택 :: </option>
			
	<%
	
		String paramGu = request.getParameter("paramGu");
	
		paramGu = paramGu != null? paramGu : "";
	
	
		sql = "SELECT DISTINCT GU FROM AREA WHERE GU IS NOT NULL ";
		sql += "AND SI ='" + paramSi + "' ";

	
		rs = stmt.executeQuery(sql);
	
		
		while(rs.next()){
			
			String gu = rs.getString("GU");
			String selected = gu.equals(paramGu) ? "selected" : "";
	%>
	
			<option value="<%= gu %>" <%= selected %>><%= gu %></option>
	
	
	<%
			
		}
	%>		
	</select>
	
	동 : <select name="paramDong" onchange="fnSelectSi()">       
			<!-- paramDong=법흥동 -->
			<option value="">:: 선택 :: </option>      
			
	<%
		String paramDong = request.getParameter("paramDong");	
	
		//paramDong = paramDong != null? paramDong : "";    //필요없음  
	
		sql = "SELECT DISTINCT DONG FROM AREA WHERE SI = '" + paramSi + "' AND GU = '" + paramGu + "' AND DONG IS NOT NULL ";   
														//paramSi가 ''으로 들어갈수있다.		//paramGu ''으로 들어갈수있다.
		
		rs = stmt.executeQuery(sql);       
		
		while(rs.next()){
			String dong = rs.getString("DONG");              
			String selected = dong.equals(paramDong) ? "selected" : "";          
	%>
			<option value="<%= dong %>" <%= selected %>><%= dong %></option>         
	
	<%	
		
		}
		
	
	%>
			
	</select>
</form>
</body>
<script>

	function fnSelectSi(){
		document.form.submit();
		
	}
</script>
</html>