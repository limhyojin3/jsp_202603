<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 11_sign-up.jsp -->
	
	<!-- 아이디, 비밀번호, 비밀번호 확인, 이름, 나이를 입력받아서 -->
	<!-- submit 실행 시 12_sign-up-result.jsp 로 보내기 -->
	<!-- 단, 모든 값을 빈값 x -->
	<!-- 비밀번호, 비밀번호 확인은 같은 값이여야 함 -->
	
	<!-- 12_sign-up-result.jsp 에서는 받은 값을 출력 -->
	<!-- 아이디 : ooo, 이름 : ooo -->
	
	<form action="12_sign-up-result.jsp" name="signup">
		<div>
			<label>아이디 : <input name="userId"></label>
		</div>
		<div>
			<label>비밀번호 : <input name="pwd1" type="password"></label>
		</div>
		<div>
			<label>비밀번호확인 : <input name = "pwd2" type="password"></label>
		</div>
		<div>
			<label>이름 : <input name="userName"></label>
		</div>
		<div>
			<label>나이 : <input name="age"></label>
		</div>
		<div>
			<!-- submit 버튼을 클릭하면 form 태그의 action에 있는 페이지로 이동한다. -->
			
			<input type="button" value="로그인!" onclick="fnSignUp()">
			<!-- input type에 바로 submit 넣지않고, onclick 으로 메소드 실행해서 submit! -->
		</div>
		
	</form>
	
</body>
</html>
<script>
	function fnSignUp(){
		let obj = document.signup;
		
		//obj.userId.value =>입력받은값
		
		if(obj.userId.value.length == 0){
			alert("아이디를 입력하세요");
			obj.userId.focus();
			return;
		}
		
		if(obj.pwd1.value.length == 0){
			alert("비밀번호를 입력하세요");
			obj.pwd1.focus();
			return;
		}
		
		if(obj.pwd1.value != obj.pwd2.value){
			alert("비밀번호와 비밀번호 확인이 다릅니다.");
			return;
		}
		
		if(obj.userName.value.length == 0){
			alert("이름을 입력하세요");
			obj.userName.focus();
			return;
		}
		
		if(obj.age.value.length == 0){
			alert("나이를 입력하세요");
			obj.age.focus();
			return;
		}
		
		// 위 조건을 모두 만족했을 때, 최종 submit(action 페이지 호출)
		obj.submit();
		
		// 메소드 실행후에 submit! => 매개변수를 보낸다! form action="12_sign-up-result.jsp" <- 이주소로 보낸다!
}


</script>