<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>insert_form</title>
		
		<style>
			table{margin:0 auto;
				  border-width:5px;
				  border-collapse: collapse;}
			caption{font:bold 30px "hy헤드라인m", sansserif;
			        color:green;}
			th{background:#ffff8f;
			   border-right: 3px double black;}
			td{text-align: center;} 
		</style>
		
		<script type="text/javascript">
			function send(f){
				// name, addr, jumin, godam
				let name = f.name.value;
				let addr = f.addr.value;
				let jumin = f.jumin.value;
				let godam = f.godam.value;
				// 유효성 검사 해야하지만, 여기서는 생략
				if(name == ''){
					alert("이름을 입력해주세요.");
					f.name.focus();
					return;
				}
				if(addr == ''){
					alert("주소를 입력해주세요.");
					f.addr.focus();
					return;
				}
				let jumin_check = /^\d{2}[0-1]\d[0-3]\d-[1-4]\d{6}$/;
				if(!jumin_check.test(jumin)){
					alert("주민등록번호를 입력해주세요.");
					f.jumin.focus();
					return;
				}
				let godam_check = /^[0-9]+$/;
				if(!godam_check.test(godam)){
					alert("담당자 번호를 입력해주세요.");
					f.godam.focus();
					return;
				}
				
				f.action = "insert_form.do";
				f.method = "post";
				f.submit();
			} // end of send()		
		</script>
	</head>
	<body>
		<form>
			<table border="1">
				<caption>:::회원등록:::</caption>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name"/></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="addr"/></td>
				</tr>
				<tr>
					<th>주민등록번호</th>
					<td><input type="text" name="jumin"/></td>
				</tr>
				<tr>
					<th>담당자번호</th>
					<td><input type="text" name="godam"/></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="등록" onclick="send(this.form)"/>
						<input type="button" value="취소" onclick="history.go(-1)"/>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
