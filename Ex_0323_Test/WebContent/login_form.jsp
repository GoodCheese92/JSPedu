<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인 화면</title>
		
		<style type="text/css">
			table{border-collapse: collapse;
				  border: 5px solid green; }
			caption{font:bold 30px "hy헤드라인m", sans-serif;
				    color:#41A149;}
			th{background:#B3CF58;}
		</style>
	</head>
	<body>
		<form action="">
		<div id="login">
			<table border='1' align='center'>
				<caption>로그인</caption>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id"/></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pwd"/></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="button" value="로그인" size="20"/></td>
				</tr>
			</table>
			<div align="left">
				<a href="#">아이디 찾기</a> 
				<a href="#">비밀번호 찾기</a>
			</div>
		</div>
		</form>
	</body>
</html>