<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>board_list</title>
		
		<style>
			table{margin:0 auto;
				  border-width:5px;
				  border-collapse: collapse;}
			caption{font:bold 30px "hy헤드라인m", sansserif;
			        color:green;}
			th{background:#ffff8f;
			   border-bottom: 3px double black;}
			td{text-align: center;} 
		</style>
		
	</head>
	<body>
		<table border="1">
			<caption>:::게시판 목록:::</caption>
			<tr>
				<th>게시판번호</th>
				<th>제목</th>
				<th>이름</th>
				<th>등록날짜</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="vo" items="${ board_list }">
			<tr>
				<td>${ vo.idx }</td>			
				<td>${ vo.subject }</td>			
				<td>${ vo.name }</td>			
				<td>${ vo.regidate }</td>			
				<td>${ vo.readhit }</td>			
			</tr>
			</c:forEach>
			
		
		</table>
	</body>
</html>