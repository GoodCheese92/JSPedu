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
				  border-collapse: collapse;
				  width:700px;
				  table-layout: fixed;
				  word-break:break-all;}
			caption{font:bold 30px "hy헤드라인m", sansserif;
			        color:green;}
			th{background:#ffff8f;
			   border-bottom: 3px double black;}
			td{text-align: center;}
			a{text-decoration:none;}
			.title{text-align: left;}
			.register{text-align: right;} 
		</style>
		
	</head>
	<body>
		<table border="1">
			<caption>:::게시판 목록:::</caption>
			<colgroup>
				<col width="8%"/>
				<col width=""/>
				<col width="10%"/>
				<col width="15%"/>
				<col width="10%"/>
			</colgroup>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>이름</th>
				<th>등록날짜</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="vo" items="${ board_list }">
			<tr>
				<td>${ vo.idx }</td>
				
							
				<td class="title">
					<!-- 댓글 들여쓰기 -->
					<c:forEach begin="1" end="${ vo.depth }">&nbsp;</c:forEach>
					
					<!-- 댓글기호 표시 -->
					<c:if test="${ vo.depth ne 0 }">└</c:if>
					
					<a href="view.do?idx=${ vo.idx }">
						${ vo.subject }
					</a>
				</td>			
				<td>${ vo.name }</td>			
				<td>${ vo.regidate }</td>			
				<td>${ vo.readhit }</td>			
			</tr>
			</c:forEach>

			<tr>
				<td colspan="5" align="center">
					◀ 1 2 3 ▶
				</td>
			</tr>
			<tr>
				<td colspan="5" class="register">
					<img src="img/btn_reg.gif" onclick="location.href='board_insert_form.jsp'" style="cursor:pointer;">
				</td>
			</tr>
		</table>
	</body>
</html>