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
				<th colspan="1">${ vo.idx }</th>
				<th colspan="7" style="width:90%; height:50px;">제목 : ${ vo.subject }</th>
			</tr>
			<tr class="title2">
				<td colspan="3">작성자 : ${ vo.name }</td>
				<td colspan="3">작성날짜 : ${ vo.regidate }</td>
				<td colspan="2">조회수 : ${ vo.readhit }</td>
			</tr>
			<tr>
				<td colspan="1" class="title2">내용</td>
				<td colspan="7" style="width:90%; height:300px;">
					${ vo.content }
				</td>
			</tr>
			<tr>
				<td colspan="5"><input type="button" value="댓글달기"/></td>
				<td colspan="3" class="button">
					<input type="button" value="수정"/>
					<input type="button" value="이전" onclick="history.go(-1);"/>
				</td>
			</tr>
		</table>
	</body>
</html>