<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>board_content</title>
		
		<link rel="stylesheet" href="css/content_css.css">
		
		<script type="text/javascript">
			function reply(){
				location.href="reply_form.jsp?idx=${vo.idx}";
			} // end of reply()
		</script>
	</head>
	<body>
	<form name="f">
		<table border="1">
			<caption>:::게시판 상세내용:::</caption>
			<tr>
				<th width="120">제목</th>
				<td>${ vo.subject }</td>
			</tr>
			<tr>
				<th width="120">작성자</th>
				<td>${ vo.name }</td>
			</tr>
			<tr>
				<th width="120">작성일</th>
				<td>${ vo.regidate }</td>
			</tr>
			<tr>
				<th width="120">ip</th>
				<td>${ vo.ip }</td>
			</tr>
			<tr>
				<th width="120">내용</th>
				<td><pre>${ vo.content }</pre></td>
			</tr>
			<tr>
				<th width="120">비밀번호</th>
				<td><input type="password" id="c_pwd" /></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<!-- 목록으로 돌아가기  -->
					<img src="img/btn_list.gif" onclick="location.href='board_list.do'" style="cursor: pointer;"/>
					
					<!-- 댓글 -->
					<c:if test="${vo.idx eq vo.ref }">
						<img src="img/btn_reply.gif" onclick="reply();" style="cursor: pointer;"/>
					</c:if>
					<!-- 글삭제 -->
					<img src="img/btn_delete.gif" onclick="del();" style="cursor: pointer;"/>
				</td>
			</tr>
		</table>
	</form>
	</body>
</html>