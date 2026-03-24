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
	<form action="stu-add-result.jsp" name="form">
	
		<table>
			<tr>
				<th>학번</th>
				<td><input name="stuNo"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input name="stuName"></td>
			</tr>
			<tr>
				<th>학과</th>
				<td><input name="stuDept"></td>
			</tr>
			<tr>
				<th>학년</th>
				<td><input name="stuGrade"></td>
			</tr>
			
			<!-- 학번,이름,학과,학년 -->
		</table>
		
		<div>
			<input type="button" value="작성" onclick="fnAdd()">
			<input type="reset" value="초기화">
			<a href="stu-list.jsp"><input type="button" value="되돌아가기"></a>
		
		</div>
	</form>
</body>
</html>
<script>
	function fnAdd(){
		let form = document.form;
		
		/* if(form.stuNo.value.length == 0 ||
				form.stuName.value.length == 0 ||
				form.stuDept.value.length == 0 ||
				form.stuGrade.value.length == 0) {
			alert("공백을 두지마세요. 내용을 입력하세요.");
			return;
		} */
		
		form.submit();
	}


</script>