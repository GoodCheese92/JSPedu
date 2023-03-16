<%@page import="dao.Ex02_FriendDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int no = Integer.parseInt(request.getParameter("no"));	

	int num = Ex02_FriendDAO.getInstance().delete(no);
	
	if(num == 1){
		response.sendRedirect("ex02_friend.jsp");
	}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ex02_friend_delete</title>
	</head>
	<body>
	
	</body>
</html>