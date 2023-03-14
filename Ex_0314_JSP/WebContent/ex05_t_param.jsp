<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	// ex05_t_param.jsp?name=홍길동&age=20&tel=010-1111-1111
	
	// post방식으로 파라미터가 전달 되었을 때, 값에 한글이 섞여있다면 깨져서 표기된다.
	// 이를 해결하기 위해 request의 메서드를 정의해 줘야 한다.
	request.setCharacterEncoding("utf-8");
	
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String tel = request.getParameter("tel");
%>    

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ex05_t_param</title>
		
		<style>
			table{margin:5px auto;
				  border-collapse: collapse;}
		</style>
	</head>
	<body>
		<table border="1">
			<tr>
				<th>이름</th>
				<td><%= name %></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><%= age %></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><%= tel %></td>
			</tr>
		</table>
	</body>
</html>