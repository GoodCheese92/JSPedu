<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 날짜 데이터에서 00:00:00을 제거하기 위해 functions를 등록 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>sawon_list</title>
		
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
			<caption>:::사원목록:::</caption>
			<tr>
				<th>사번</th>
				<th>이름</th>
				<th>성별</th>
				<th>부서번호</th>
				<th>직책</th>
				<th>입사일</th>
				<th>상사번호</th>
				<th>연봉</th>
			</tr>
			
			<c:forEach var="vo" items="${ sawon_list }">
				<tr>
					<td>${ vo.sabun }</td>
					<td>${ vo.saname }</td>
					<td>${ vo.sagen }</td>
					<td>${ vo.deptno }</td>
					<td>${ vo.sajob }</td>
					<!-- vo.sahire를 ' ' 띄어쓰기를 기준으로 배열로 바꾸고 0번방을 가져온다. -->
					<td>${ fn:split(vo.sahire, ' ')[0] }</td>
					<td>${ vo.samgr }</td>
					<td><fmt:formatNumber value="${ vo.sapay }"></fmt:formatNumber>만원</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>