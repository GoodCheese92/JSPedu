<%@page import="dao.Ex02_FriendDAO"%>
<%@page import="vo.Ex02_FriendVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	Ex02_FriendVO vo = new Ex02_FriendVO();
	vo.setName(request.getParameter("name"));
	vo.setAge(Integer.parseInt(request.getParameter("age")));
	vo.setTel(request.getParameter("tel"));
	
	int n = Ex02_FriendDAO.getInstance().insert(vo);
	if(n == 1){
		response.sendRedirect("ex02_friend.jsp");
	}
%>

<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>ex02_friend_register</title>
	</head>
	<body>
	
</body>
</html>