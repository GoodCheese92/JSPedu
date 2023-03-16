<%@page import="vo.Ex02_SawonVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.Ex02_SawonDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// Ex02_SawonDAO dao = Ex02_SawonDAO.getInstance();
	// List<Ex02_SawonVO> sawon_list = dao.selectList();
	List<Ex02_SawonVO> sawon_list = Ex02_SawonDAO.getInstance().selectList();
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ex02_DB_sawon</title>
		<style type="text/css">
			table{margin:5px auto;
				  border-collapse: collapse;}
			caption{font:bold 30px "hy헤드라인m", sans-serif;
				    color:blue;}
			td{font-family:'바탕체', sans-serif;
			   text-align: center;}	
		</style>
	</head>
	<body>
		<table border='1'>
			<caption>사원목록</caption>
			<tr>
				<th>사원번호</th>
				<th>사원이름</th>
				<th>부서번호</th>
				<th>직책</th>
				<th>입사일</th>
			</tr>
			<% for(Ex02_SawonVO vo : sawon_list){ %>
			<tr>
				<td><%= vo.getSabun() %></td>
				<td><%= vo.getSaname() %></td>
				<td><%= vo.getDeptno() %></td>
				<td><%= vo.getSajob() %></td>
				<td><%= vo.getSahire() %></td>
			</tr>	
			<% } %>
		</table>
	</body>
</html>