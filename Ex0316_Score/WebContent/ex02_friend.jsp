<%@page import="dao.Ex02_FriendDAO"%>
<%@page import="vo.Ex02_FriendVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Ex02_FriendVO> friend_list = Ex02_FriendDAO.getInstance().selectList();
	
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ex02_friend</title>
		
		<style type="text/css">
			table{border-collapse: collapse;
				  border-width:5px;
				  margin: 5px auto;}
			caption{color:blue;
				    font: bold 30px "hy헤드라인m", sans-serif;}
			th{border-bottom-style: double;
			   border-bottom-width: 3px;
			   background: #ffff8f;}
			td{text-align: center;}
			
		</style>
		
		<script type="text/javascript">
			function del(no){
				// alert(no);
				if(!confirm("삭제하시겠습니까?")){
					return;
				}
				
				location.href='ex02_friend_delete.jsp?no=' + no;
			} // end of delete()
			
			function modify(f){
				let no = f.no.value;
				let name = f.name.value;
				let age = f.age.value;
				let tel = f.tel.value;
				
				// alert(name);
				
				f.action = "ex02_friend_update.jsp";
				f.submit();
			} // end of modify()
		</script>
	</head>
	
	<body>
		<table border='1'>
			<caption>친구테이블</caption>
			<tr>
				<th>일련번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>전화번호</th>
				<th>비고</th>
			</tr>
			<% for(Ex02_FriendVO vo : friend_list){ %>
			<form>
			<tr>
				<td><%= vo.getNo() %></td>
				<td><%= vo.getName() %></td>
				<td><%= vo.getAge() %></td>
				<td><%= vo.getTel() %></td>
				<td colspan='2'>
					<input type="button" value="수정" onclick="modify(this.form);">
					<input type="button" value="삭제" onclick="del('<%= vo.getNo() %>');">
				</td>
			</tr>
				<input type="hidden" value='<%= vo.getNo() %>' name="no">
				<input type="hidden" value='<%= vo.getName() %>' name="name">
				<input type="hidden" value='<%= vo.getAge() %>' name="age">
				<input type="hidden" value='<%= vo.getTel() %>' name="tel">
			</form>
			<% } %>
			<tr>
				<td colspan='5'>
					<input type="button" value="친구 추가하기 " onclick="location.href='ex02_friend_input.jsp'">
				</td>
			</tr>
		</table>
	</body>
</html>