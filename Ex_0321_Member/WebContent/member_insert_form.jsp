<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>member_insert_form</title>
		
		<link rel="stylesheet" href="css/table.css">
		<style type="text/css">
			th{border-bottom: solid 1px black;
			   border-right: double 3px black;}
		</style>
		<script type="text/javascript" src="js/httpRequest.js"></script>
		<script type="text/javascript" src="js/member_js.js"></script>
	</head>
	<body>
		<form>
			<table border='1'>
				<caption>:::회원가입:::</caption>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="id" id="id" onchange='che();'>
						<input type="button" value="중복체크" onclick="check_id();">
					</td>
				</tr>
				
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="pwd">
					</td>
				</tr>

				<tr>
					<th>이름</th>
					<td>
						<input name="name">
					</td>
				</tr>

				<tr>
					<th>이메일</th>
					<td>
						<input name="email">
					</td>
				</tr>

				<tr>
					<th>주소</th>
					<td>
						<input name="addr">
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="button" value="가입" onclick="send(this.form);">
						<input type="button" value="취소" onclick="history.go(-1)">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>