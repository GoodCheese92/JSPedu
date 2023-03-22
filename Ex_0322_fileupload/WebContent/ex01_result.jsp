<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ex01_result</title>
	</head>
	<body>
		제목 : ${ title }<br>
		<!-- img태그는 WebContent상의 경로로만 접근이 가능하기 때문에
			 c드라이브에 저장되어 있는 이미지를 불러올 수 없다. -->
		<img src="upload/${ filename }">
	</body>
</html>