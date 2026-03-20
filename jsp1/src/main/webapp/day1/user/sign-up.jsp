<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="sign-up-result.jsp" name="signup">
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
			성별 :
			<label><input type="radio" name="gender" value="M" checked>남자</label>
			<label><input type="radio" name="gender" value="F">여자</label>
		</div>
		<div>
			<!-- submit 버튼을 클릭하면 form 태그의 action에 있는 페이지로 이동한다. -->
			
			<input type="button" value="가입!" onclick="fnSignUp()">
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
		
		// 위 조건을 모두 만족했을 때, 최종 submit(action 페이지 호출)
		obj.submit();
		
		// 메소드 실행후에 submit! => 매개변수를 보낸다! form action="sign-up-result.jsp" <- 이주소로 보낸다!
}


</script>