<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 현재 페이지와 같이 servlet을 통한 DB조회와 결과 출력을 나눠서 작업하는 구조를 model2(MVC 패턴) 구조라고 한다.
	 M(Model) : DAO
	 V(View) : jsp
	 C(Controller) : Servlet -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Member List</title>
		
		<style type="text/css">
			table{margin:5px auto;
				  border-collapse: collapse;
				  border-width: 5px;}
			caption{font:bold 30px "hy헤드라인m", sans-serif;
					color: blue;}
			th{background: #ffff8f;
			   border-bottom: 3px double black;}
			td{text-align: center;}
		</style>
		<!-- Ajax를 사용하기 위해 js를 등록 -->
		<script type="text/javascript" src="js/httpRequest.js"></script>
		<script type="text/javascript" src="js/member_js.js"></script>
	</head>
	<body>
		<table border='1'>
			<caption>:::회원목록:::</caption>
			<tr>
				<th>회원번호</th>
				<th>이름</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이메일</th>
				<th>주소</th>
				<th colspan='2'>비고</th>
			</tr>
			
			<c:forEach var="vo" items="${ member_list }">
				<tr>
					<td>${ vo.idx }</td>
					<td>${ vo.name }</td>
					<td>${ vo.id }</td>
					<td>${ vo.pwd }</td>
					<td>${ vo.email }</td>
					<td>${ vo.addr }</td>
					<td>
						<input type="button" value="수정" onclick="" >
					</td>
					<td>
						<input type="button" value="삭제" onclick="del('${ vo.idx }');" >
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="8"><input type="button" value="회원가입" onclick="location.href='member_insert_form.jsp'">	
			</tr>
		</table>
	</body>
</html>