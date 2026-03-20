<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form action="9_loginResult.jsp" name="login" method="get">
		<div>
			<label>아이디 : <input name="userId"></label>
			
			<!-- input의 name속성("userId")이 키(key), 입력받은 값이 value -->
		</div>
		<div>
			<label>비밀번호 : <input name="pwd" type="password"></label>
		</div>
		<div>
			<input type="button" value="로그인!" onclick="fnCheck()">
		</div>
			<!-- input type에 바로 submit 넣지않고, onclick 으로 메소드 실행해서 submit! -->
	</form>
</body>
</html>
<script>
	
	function fnCheck(){
		/* let userId = document.querySelector("#userId").value; */
		
		let login = document.login;
		
		/* console.log(login.userId.value); 입력받은값*/
		
		if(login.userId.value.length == 0){
			alert("아이디를 입력하세요");
			login.userId.focus();
			return;
		}
		
		if(login.pwd.value.length == 0){
			alert("비밀번호를 입력하세요");
			login.pwd.focus();
			return;
		}
		
		// 위 조건을 모두 만족했을 때, 최종 submit(action 페이지 호출)
		login.submit();
		// 메소드 실행후에 submit!
	}
	
	// 자바스크립트!
</script>