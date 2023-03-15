<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String[] fruit = {"사과", "배", "오렌지", "참외", "복숭아"};
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ex03_test_array</title>
	</head>
	<body>
		<ul>
			<!-- 끊어서 자바는 사용이 가능하다., 자바코드와 html을 잘 구분하도록 하자. -->
			<% for(int i = 0; i<fruit.length; i++){ %>
			<li><%= fruit[i] %> </li>					
			<% } %>
		</ul>
	</body>
</html>