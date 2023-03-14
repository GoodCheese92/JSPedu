<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ex01_calculator</title>
		
		<script type="text/javascript">
			function myClick(form){
				let su1 = form.su1.value;
				let su2 = form.su2.value;
				
				// 유효성 체크
				let su_check = /^[0-9]+$/;
				if(!su_check.test(su1) || !su_check.test(su2)){
					alert("숫자만 입력할 수 있습니다.");
					return;
				}
				
				// form.action = "calc.do"; --> form태그에 써놨기 때문에 따로 작성 X
				form.submit();
				
			} // end of myClick()
		</script>
	</head>
	<body>
		<form action="calc.do">
			수1 : <input name="su1"><br>
			수2 : <input name="su2"><br>
			<input type="button" value="확인" onclick="myClick(this.form);">
		</form>
	</body>
</html>