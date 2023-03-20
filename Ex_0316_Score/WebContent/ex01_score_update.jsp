<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ex01_score_update</title>
		
		<style type="text/css">
			table{margin:5px auto;
				  border-collapse: collapse;
				  border-width: 3px;}
			caption{font:bold 30px "hy헤드라인m", sans-serif;
				    color:blue;}
			th{border-right-style: double;
			   border-right-width: 2px;
			   background: #FFFF8F;}
			td{text-align: center;}	
		</style>
		
		<script>
			window.onload = function(){
				// alert("aa");
				<% 
					String name = request.getParameter("name");
					int no = Integer.parseInt(request.getParameter("no"));
					int kor = Integer.parseInt(request.getParameter("kor"));
					int eng = Integer.parseInt(request.getParameter("eng"));
					int mat = Integer.parseInt(request.getParameter("mat"));
				%>
				
				let ff = document.ff;	// name이 ff인 form태그 검색
				ff.name.value = '<%= name %>';				
				ff.no.value = '<%= no %>';				
				ff.kor.value = '<%= kor %>';				
				ff.eng.value = '<%= eng %>';				
				ff.mat.value = '<%= mat %>';				
			
			};
			
			function send(f){
				let name = f.name.value;
				// name 유효성 검사
				if(name == ''){
					alert("이름을 입력하세요.");
					f.name.focus();
					return;
				}
				
				let kor = f.kor.value;
				let eng = f.eng.value;
				let mat = f.mat.value;
				let score_check = /^[0-9]+$/;
				
				if(!score_check.test(kor) || kor < 0 || kor > 100){
					alert("0~100 사이의 값만 입력해주세요.");
					f.kor.focus();
					return;
				}
				if(!score_check.test(eng) || eng < 0 || eng > 100){
					alert("0~100 사이의 값만 입력해주세요.");
					f.eng.focus();
					return;
				}
				if(!score_check.test(mat) || mat < 0 || mat > 100){
					alert("0~100 사이의 값만 입력해주세요.");
					f.mat.focus();
					return;
				}
				
				f.action="ex01_update_result.jsp";
				f.submit();
			} // end of send()
		</script>
	</head>
	<body>
		<form name="ff">
			<input type="hidden" name="no">
		
		<table border='1'>
			<caption>:::성적 수정:::</caption>
			<tr>
				<th>이름</th>
				<td><input name="name"></td>
			</tr>
			<tr>
				<th>국어</th>
				<td><input name="kor"></td>
			</tr>
			<tr>
				<th>영어</th>
				<td><input name="eng"></td>
			</tr>
			<tr>
				<th>수학</th>
				<td><input name="mat"></td>
			</tr>
			<tr>
				<td colspan='2'>
					<input type="button" value="등록" onclick="send(this.form)">
					<input type="button" value="취소" onclick="location.href='ex01_student.jsp'">
					<!-- 밑 코드는 뒤로가기 역할을 한다., 하지만 첫 화면이 score_input이라면 뒤로가기가 안되므로 위 코드를 선호 -->
					<!-- <input type="button" value="취소" onclick="history.go(-1)"> -->
				</td>
			</tr>
		</table>
		</form>
	</body>
</html>