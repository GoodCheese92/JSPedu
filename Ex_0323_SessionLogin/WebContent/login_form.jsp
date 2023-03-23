<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>login_form</title>
		<style type="text/css">
			table{border-collapse: collapse;}
			caption{font:bold 30px "hy헤드라인m", sans-serif;
					color:blue;}
			th{background:#ffff8f;
			   border-right:double 1px black;}
		</style>
		<script src="js/httpRequest.js"></script>
		<script type="text/javascript">
			function send(f){
				let id = f.id.value;
				let pwd = f.pwd.value;
				
				// 유효성 체크 했다 쳐
				
				var url = "login.do";
				// encodeURIComponent : 특수문자가 섞여있는 데이터를 파라미터로 보내려면 필요한 함수
				var param = "id=" + id + "&pwd=" + encodeURIComponent(pwd);
				
				sendRequest(url, param, resFn, "post");
			} // end of send()
			
			function resFn(){
				if(xhr.readyState == 4 && xhr.status == 200){
					var data = xhr.responseText;
					
					if(data == 'no_id'){
						alert("아이디가 존재하지 않습니다.");
					} else if(data == "no_pwd"){
						alert("비밀번호가 일치하지 않습니다.");
					} else{
						location.href="main_content.jsp";
					}
				}
			} // end of resFn()
		</script>
	</head>
	<body>
		<form>
			<table border='1' align="center">
				<caption>:::로그인:::</caption>
				<tr>
					<th>아이디</th>
					<td><input name="id"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input name="pwd" type="password"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="로그인" onclick="send(this.form)">
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>