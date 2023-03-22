<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>photo_insert_form</title>
		
		<style>
			caption{font:bold 30px "hy헤드라인m", sans-serif;
					color:blue;}
			th{background: #ffff8f;
			   border-right: 3px double black;}
		</style>
		
		<script>
			function send(f){
				let title = f.title.value;
				let pwd = f.pwd.value;
				let photo = f.photo.value;
				
				if(photo == ""){
					alert('사진은 필수입니다.');
					f.photo.focus();
					return;
				}
				
				if(pwd == ""){
					alert("비밀번호를 입력해주세요.")
					f.pwd.focus();
					return;
				}
				
				if(title == ""){
					alert("제목을 입력해주세요.")
					f.title.focus();
					return;
				}
				
				f.submit();
			} // end of send()
		</script>
	</head>
	
	<body>
		<form method="post" enctype="multipart/form-data" action="insert.do">
			<table border='1' align="center">
				<caption>:::사진 등록하기:::</caption>
				<tr>
					<th>제목</th>
					<td><input name="title"></td>
				</tr>
				
				<tr>
					<th>비밀번호</th>
					<td><input name="pwd" type="password"></td>
				</tr>
				
				<tr>
					<th>사진</th>
					<td><input name="photo" type="file"></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="업로드" onclick="send(this.form);">
						<input type="button" value="목록으로" onclick="history.go(-1)">
					</td>
				</tr>
			</table>
		</form>	
	</body>
</html>