<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>주민등록번호 입력</title>
		
		<script>
			function info(form){
				let jumin = form.jumin.value;
				let jumin_check = /^\d{2}[0-1]\d[0-3]\d-[1-4]\d{6}$/;
				
				if(!jumin_check.test(jumin)){
					alert("주민등록번호 입력이 잘못되었습니다.");
					return;
				}
				
				form.action = "jumin.do";
				form.submit();
			} // end of info()
		</script>		
	</head>
	<body>
		<form>
			<h2>주민번호
			<input name="jumin">
			<input type="button" value="확인" onclick="info(this.form);">
			</h2>
		</form>
	</body>
</html>