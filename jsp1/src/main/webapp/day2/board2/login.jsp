<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- login.jsp -->
	
	<form action="login-result.jsp" method="get" name="login">
		<div>
		
			아이디 : <input name="userId">
		</div>
		<div>
			
			비밀번호 : <input name="pwd" type="password">
		</div>
		<div>
			<input type="button" value="로그인" onclick="fnLogin()">
		</div>
	</form>
</body>
</html>
<script>
	
	function fnLogin(){
		let form = document.login;  
		
		//form태그의 객체  =>document.(form태그의name)
		
		/* alert(form.userId); 태그를 의미함.*/  
		/* alert(form.userId.value); */
		
		if(form.userId.value.length == 0){
			alert("아이디 입력하세요.");
			return;
		}
		
		//괄호갯수 주의!!
		if(form.pwd.value.length == 0){
			alert("비밀번호 입력하세요.");
			return;
		}
		
		form.submit();
		
	}


</script>