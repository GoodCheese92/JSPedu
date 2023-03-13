<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 가입</title>
		
		<style>
			table{border-collapse: collapse;}
		</style>
		
		<script>
			// register_func(this.form) 
			function register_func(form){
				// 유효성 체크는 클라이언트 쪽에서 진행하여
				// 서버에서 실행되는 부하를 최대한 줄여주자
				let id = form.id.value; // name이 id인 input의 값을 대입
				if(id.trim() == ""){
					alert("아이디는 필수 입력사항입니다.");
					return;
				}
				let pwd = form.pwd.value;
				if(pwd.trim() == ''){
					alert("비밀번호를 입력하세요.");
					return;
				}
				let age = form.age.value;
				let number_format = /^[0-9]+$/;
				if(!number_format.test(age)){
					alert("나이는 정수만 입력해주세요.");
					return;
				}
				
				// form.action = "join.do";
				form.submit();
			} // end of register_func()
		</script>
	</head>
	
	<body>
		<form action="join.do">
			<table border="1">
				<tr>
					<th>ID</th>
					<td><input name="id"></td>
				</tr>
				<tr>
					<th>PW</th>
					<td><input type="password" name="pwd"></td>
				</tr>
				<tr>
					<th>Age</th>
					<td><input name="age"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<!-- this.form : 내 자신(가입하기 버튼)을 포장하고 있는 가장 가까운 form 태그 -->
						<!-- this.form 키워드는 input, textarea 외에는 사용이 불가 -->
						<input type="button" value="가입하기" onclick="register_func(this.form);">
					</td>
				</tr>
			</table>
			
			
		</form>
	</body>
</html>


