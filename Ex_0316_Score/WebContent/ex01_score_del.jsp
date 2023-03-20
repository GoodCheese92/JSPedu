<%@page import="dao.Ex01_ScoreDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	// ex01_score_del.jsp?no=1
	int no = Integer.parseInt(request.getParameter("no"));
	
	int n = Ex01_ScoreDAO.getInstance().delete(no);
	
	if(n == 1){
		response.sendRedirect("ex01_student.jsp");
	}
	
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ex01_score_del</title>
	</head>
	<body>
	
	</body>
</html>