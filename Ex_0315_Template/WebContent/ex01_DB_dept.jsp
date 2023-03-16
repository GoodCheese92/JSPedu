<%@page import="vo.Ex01_DeptVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.Ex01_DeptDAO"%>
<%@page import="service.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Ex01_DeptDAO dao = Ex01_DeptDAO.getInstance();
	List<Ex01_DeptVO> dept_list = dao.selectList();
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ex01_db_dept</title>
		<style type="text/css">
			table{margin:5px auto;
				  border-collapse: collapse;}
			caption{font-family: "hy헤드라인m", sans-serif;
				    font-weight:bold;
				    font-size: 30px;
				    color:blue;}
			td{text-align: center;}	
		</style>
	</head>
	
	<body>
		<table border='1'>
			<caption>부서테이블</caption>
			<tr>
				<th>부서번호</th>
				<th>부서이름</th>
				<th>부서위치</th>
			</tr>
			<% for(Ex01_DeptVO vo : dept_list){ %>
			<tr>
				<td><%= vo.getDeptno() %></td>
				<td><%= vo.getDname() %> </td>
				<td><%= vo.getLoc() %> </td>
			</tr>
			<% } %>
		</table>
	</body>
</html>