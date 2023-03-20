<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ex02_friend_input</title>
		
		<style type="text/css">
			table{border-collapse: collapse;
				  border-width:5px;
				  margin: 5px auto;}
			caption{color:blue;
				    font: bold 30px "hy헤드라인m", sans-serif;}
			th{border-right-style: double;
			   border-right-width: 3px;
			   background: #ffff8f;}
			td{text-align: center;}
		</style>
		
		<script>
			function add(f){
				let name = f.name.value;
				let age = f.age.value;
				let tel = f.tel.value;
				
				let age_check = /^[0-9]+$/;
				let tel_check = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
				// 유효성 체크
				if(name == ''){
					alert("이름을 입력해주세요");
					f.name.focus();
					return;
				}
				
				if(!age_check.test(age) || age < 0  || age > 150){
					alert("나이를 입력해주세요");
					f.age.focus();
					return;
				}
				
				if(!tel_check.test(tel)){
					alert("전화번호를 올바르게 입력해주세요.ex)000-0000-0000");
					f.tel.focus();
					return;
				}
				
				f.action = "ex02_friend_register.jsp";
				f.submit();
			} // end of add()
		</script>
	</head>
	<body>
		<form>
		<table border='1'>
			<caption>친구 추가하기</caption>
			<tr>
				<th>이름</th>
				<td><input name="name"></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input name="age"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input name="tel"></td>
			</tr>
			<tr>
				<td colspan='2'>
					<input type="button" value="추가" onclick="add(this.form);">
					<input type="button" value="취소" onclick="location.href='ex02_friend.jsp'">
				</td>
			</tr>
		</table>
		</form>
	</body>
</html>