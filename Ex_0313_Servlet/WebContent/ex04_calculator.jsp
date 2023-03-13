<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>간단한 수 계산</title>
		
		<script>
			function cal(form){
				let su1 = form.su1.value;
				let su2 = form.su2.value;
				
				let su_check = /^[0-9]+$/;
				if(!su_check.test(su1) || !su_check.test(su2)){
					alert("정수만 입력해주세요.");
					return;
				}
				
				form.action = "calc.do";
				form.submit();
			} // end of cal()
		</script>
	</head>
	
	<body>
		<form>
			<table>
				<tr>
					<th>수1 : </th>
					<td><input name="su1"></td>
				</tr>
				<tr>
					<th>수2 : </th>
					<td><input name="su2"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="확인" onclick="cal(this.form);">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>