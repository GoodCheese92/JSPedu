<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ex02_주민등록번호</title>
		
		<script>
			function check(f){
				let jumin = f.jumin.value;
				let jumin_check = /^\d{2}[0-1]\d[0-3]\d-[1-4]\d{6}$/;
				
				if(!jumin_check.test(jumin)){
					alert("주민번호 입력 오류입니다.");
					return;
				}
				
				f.action="jumin.do";
				f.submit();
			} // end of check()	
		</script>
	</head>
	<body>
		<form>
			주민번호 <input name="jumin">
			<input type="button" value="확인" onclick="check(this.form);">
		</form>
	</body>
</html>