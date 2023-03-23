<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>photo_list</title>
		
		<link rel="stylesheet" href="css/photo.css">
		
		<!-- Ajax사용을 위한 js파일 준비 -->
		<script src="js/httpRequest.js"></script>
		<script type="text/javascript">
			function del(f){
				let idx = f.idx.value;
				let pwd = f.pwd.value; // 원본 비밀번호
				let pwd2 = f.pwd2.value; // 삭제를 위해서 입력한 비밀번호
				
				if(pwd != pwd2){
					alert("비밀번호가 일치하지 않습니다.");
					return;
				}
				
				if(!confirm("삭제하시겠습니까?")){
					return;
				}
				
				let url = "photo_del.do";
				let param = "idx=" + idx;
				sendRequest(url, param, resultFn, "post");
				
			} // end of del()
			
			function resultFn(){
				if(xhr.readyState == 4 && xhr.status == 200){
					var data = xhr.responseText;
					
					if(data == 0){
						alert("삭제 실패");
					} else{
						alert("삭제 성공");
					}
				}
				
				// location.href = "list.do";
				history.go(0);
			} // end of resultFn()
			
			function download(filename){
				location.href="download.do?dir=/upload/&filename="+filename;
			}
		</script>
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
							<input type="hidden" name="idx" value="${ vo.idx }">
							<input type="hidden" name="pwd" value="${ vo.pwd }">
							
							<div align="center">
								<input type="password" name="pwd2" size="6">
								<input type="button" value="삭제" style="color:black;" onclick="del(this.form)">
								<input type="button" value="다운" onclick="download('${ vo.filename }');">
							</div>
						</form>
					</div>
				</c:forEach>	
			</div>
		</div>
		</div>
	</body>
</html>