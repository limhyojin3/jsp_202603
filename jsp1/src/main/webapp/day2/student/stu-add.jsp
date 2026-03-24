<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	select {
	    width: 50px;
		text-align: center;	
	}
</style>
</head>
<body>
	
	<form action="stu-add-result.jsp">
		<div>
			<label>학번 : <input name="stuNo"></label>
		</div>
		<div>
			<label>이름 : <input name="stuName"></label>
		</div>
		<div>
			<label>학과 : <input name="stuDept"></label>
		</div>
		<div>
			<label>학년 : 
				<select name="stuGrade">
					<option value="1"> 1 </option>
					<option value="2"> 2 </option>
					<option value="3"> 3 </option>
				</select>
			</label>
		</div>
		<div>
			<input type="submit" value="추가">
		</div>
	</form>
</body>
</html>