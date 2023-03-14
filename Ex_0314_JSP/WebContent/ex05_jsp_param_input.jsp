<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ex05_jsp_param_input</title>
		
		<style>
			table{margin:5px auto;}
		</style>
		
		<script>
			function send(f){
				let name = f.name.value.trim();
				let age = f.age.value;
				let tel = f.tel.value;
				
				// 유효성 체크
				if(name == ''){
					alert("이름을 입력하세요.");
					f.name.focus();	// name 속성의 input에게 커서를 옮긴다.
					return;
				}
				
				if(age == ''){
					alert("나이를 입력하세요.");
					f.age.focus();
					return;
				}
				
				f.action = "ex05_t_param.jsp"; // servlet뿐 아니라 jsp로도 파라미터를 넘길 수 있다.
				f.method = "post"; // 파라미터를 숨겨서 보낸다.
				f.submit();
			} // end of send()
		</script>
	</head>
	<body>
		<form>
			<table>
				<tr>
					<td>이름 : </td>
					<td><input name="name"></td>
				</tr>
				<tr>
					<td>나이 : </td>
					<td><input name="age"></td>
				</tr>
				<tr>
					<td>전화 : </td>
					<td><input name="tel"></td>
				</tr>
				<tr>
					<td colspan='2' align="center">
						<input type="button" value="파라미터 전송" onclick="send(this.form);">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>