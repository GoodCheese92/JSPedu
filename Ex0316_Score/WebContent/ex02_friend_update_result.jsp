<%@page import="vo.Ex02_FriendVO"%>
<%@page import="dao.Ex02_FriendDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
		
	Ex02_FriendVO vo = new Ex02_FriendVO();
	vo.setNo(Integer.parseInt(request.getParameter("no")));
	vo.setName(request.getParameter("name"));
	vo.setAge(Integer.parseInt(request.getParameter("age")));
	vo.setTel(request.getParameter("tel"));

	int num = Ex02_FriendDAO.getInstance().update(vo);
	if(num == 1){
		response.sendRedirect("ex02_friend.jsp");
	}
%>    

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ex02_friend_update_result</title>
	</head>
	<body>
	
	</body>
</html>