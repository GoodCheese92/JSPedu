<%@page import="vo.Ex01_ScoreVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.Ex01_ScoreDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Ex01_ScoreVO> score_list = Ex01_ScoreDAO.getInstance().selectList();	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ex01_student</title>
		
		<style type="text/css">
			table{margin:5px auto;
				  border-collapse: collapse;
				  border-width: 3px;}
			caption{font:bold 30px "hy헤드라인m", sans-serif;
				    color:blue;}
			th{border-bottom-style: double;
			   border-bottom-width: 2px;
			   background: #FFFF8F;}
			td{text-align: center;}	
		</style>
		
		<script type="text/javascript">
			function del(no){
				if(!confirm("정말 삭제하시겠어요?")){
					return;
				}
				// alert(no);
				location.href="ex01_score_del.jsp?no="+no;
			} // end of del()
			
			function modify(no, name, kor, eng, mat){
				// alert(no);
				location.href='ex01_score_update.jsp?no='+no+'&name='+name+
							  '&kor='+kor+'&eng='+eng+'&mat='+mat;
				
			} // end of modify()
		</script>
	</head>
	<body>
		<table border='1'>
			<caption>성적관리테이블</caption>
			<tr>
				<th>no</th>
				<th>이름</th>
				<th>국어</th>
				<th>영어</th>
				<th>수학</th>
				<th>총점</th>
				<th>평균</th>
				<th>등수</th>
				<th colspan="2">비고</th>
			</tr>
			
			<% for(Ex01_ScoreVO vo : score_list) { %>
			<tr>
				<td id="id_no"><%= vo.getNo() %></td>
				<td id="id_name"><%= vo.getName() %></td>
				<td id="id_kor"><%= vo.getKor() %></td>
				<td id="id_eng"><%= vo.getEng() %></td>
				<td id="id_mat"><%= vo.getMat() %></td>
				<td><%= vo.getTotal() %></td>
				<td><%= vo.getAvg() %></td>
				<td><%= vo.getRank() %></td>
				<td>
					<input type="button" value="삭제" onclick="del('<%= vo.getNo() %>');">
					<!-- <button></button>, button 태그도 존재하지만 기본 설정이 submit()으로 되어있기 때문에 input
					을 사용하는 것이 좋다. -->
					<input type="button" value="수정" onclick="modify('<%= vo.getNo() %>',
																	 '<%= vo.getName() %>',
																	 '<%= vo.getKor() %>',
																	 '<%= vo.getEng() %>',
																	 '<%= vo.getMat() %>');">
				</td>
			</tr>
			<% } %><!-- for -->
			
			<!-- form태그가 있었다면 -->
			<!-- onclick = "modify(this.form)"
			<input type="hidden" value="<%= vo.getNo() %>" name="no";> -->
			
			<tr>
				<td colspan="9">
					<input type="button" value="학생정보 추가" onclick="location.href='ex01_score_input.jsp'">
				</td>
			</tr>
		</table>
	</body>
</html>