<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// ex01_gugudan_ajax.jsp?dan=5
	int dan = Integer.parseInt(request.getParameter("dan"));
	
	String str = "";
	
	for(int i = 1; i <= 9; i++){
		str += String.format("%d * %d = %d<br>", dan, i, dan*i);
	} // for
	
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ex01_gugudan_ajax.jsp</title>
	</head>
	<body>
		<%= str %>
	</body>
</html>