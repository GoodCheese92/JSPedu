<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>photo_list</title>
		
		<link rel="stylesheet" href="css/photo.css">
		
	</head>
	<body>
		<div id="background">
		<div id="main_box">
			<h1>:::PhotoGallery:::</h1>
			<div align="center" style="margin:10px">
				<input type="button" value="사진등록"
				 style="font:bold 20px 'hy헤드라인m', sans-serif;" onclick="location.href='photo_insert_form.jsp'">
			</div>
			
			<div id="photo_box">
				<c:forEach var="vo" items="${ list }">
					<div class="photo_type">
						<img src="upload/${ vo.filename }" alt="" />
						<div class="title" align="center">${ vo.title }</div>
						<form>
							<div align="center">
								<input type="password" name="pwd2" size="10">
								<input type="button" value="삭제" style="color:black;" onclick="del(this.form)">
							</div>
						</form>
					</div>
				</c:forEach>	
			</div>
		</div>
		</div>
	</body>
</html>