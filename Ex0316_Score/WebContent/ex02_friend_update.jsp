<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ex02_friend_input</title>
		
		<style type="text/css">
			table{border-collapse: collapse;
				  border-width:5px;
				  margin: 5px auto;}
			caption{color:blue;
				    font: bold 30px "hy헤드라인m", sans-serif;}
			th{border-right-style: double;
			   border-right-width: 3px;
			   background: #ffff8f;}
			td{text-align: center;}
		</style>
		
		<script>
			window.onload = function(){
				// alert("test");
				<% 
					int no = Integer.parseInt(request.getParameter("no"));
					String name = request.getParameter("name");
					int age = Integer.parseInt(request.getParameter("age"));
					String tel = request.getParameter("tel");
				%>
				
				ff.no.value = '<%= no %>';
				ff.name.value = '<%= name %>';
				ff.age.value = '<%= age %>';
				ff.tel.value = '<%= tel %>';
			};
		
			function update(f){
				let no = f.no.value;
				let name = f.name.value;
				let age = f.age.value;
				let tel = f.tel.value;
				
				let age_check = /^[0-9]+$/;
				let tel_check = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
				// 유효성 체크
				if(name == ''){
					alert("이름을 입력해주세요");
					f.name.focus();
					return;
				}
				
				if(!age_check.test(age) || age < 0  || age > 150){
					alert("나이를 입력해주세요");
					f.age.focus();
					return;
				}
				
				if(!tel_check.test(tel)){
					alert("전화번호를 올바르게 입력해주세요.ex)000-0000-0000");
					f.tel.focus();
					return;
				}
				
				f.action = "ex02_friend_update_result.jsp";
				f.submit();
			} // end of add()
		</script>
	</head>
	<body>
		<form name = "ff">
		<table border='1'>
			<caption>친구 수정하기</caption>
			<tr>
				<th>이름</th>
				<td><input name="name"></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input name="age"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input name="tel"></td>
			</tr>
			<tr>
				<td colspan='2'>
					<input type="hidden" name="no">
					<input type="button" value="수정" onclick="update(this.form);">
					<input type="button" value="취소" onclick="location.href='ex02_friend.jsp'">
				</td>
			</tr>
		</table>
		</form>
	</body>
</html>