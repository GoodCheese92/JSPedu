<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>board_content</title>
		
		<link rel="stylesheet" href="css/content_css.css">
	</head>
	<body>
		<table border="1">
			<caption>:::게시판 상세내용:::</caption>
			<tr>
				<th>${ vo.idx }</th>
				<th colspan="7"></th>
			</tr>
			<tr>
				<td colspan="2">작성자 : ${ vo.name }</td>
				<td colspan="3">작성날짜 : ${ vo.regidate }</td>
				<td colspan="2">조회수 : ${ vo.readhit }</td>
			</tr>
			<tr>
				<td colspan="8">${ vo.content }</td>
			</tr>
		</table>
	</body>
</html>