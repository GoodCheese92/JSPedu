<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ex01_uploadinput</title>
		
		<script type="text/javascript">
			function send(f){
				let title = f.title.value;
				let photo = f.photo.value;
				
				if(title == ""){
					alert("제목을 입력하세요.");
					return;
				}
				
				if(photo == ""){
					alert("파일을 선택하세요.");
					return;
				}
				
				f.action = "upload.do";
				f.submit();
				
			} // end of send()
		</script>
	</head>
	<body>
		<!-- 파일 업로드를 위해 반드시 지켜야 하는 고려사항
	     	  반드시 form태그에서 사용해야 하며, 전송방식은 post, enctype이 설정되어 있어야 한다. -->
		<form method="post" enctype="multipart/form-data">
			제목 : <input name="title"><br>
			첨부 : <input type="file" name="photo"><br>
			<input type="button" value="업로드" onclick="send(this.form)">
			
		</form>
	</body>
</html>