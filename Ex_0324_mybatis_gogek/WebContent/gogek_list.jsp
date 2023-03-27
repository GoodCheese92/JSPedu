<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>gogek_list</title>
		<style>
			table{margin:0 auto;
				  border-width:5px;
				  border-collapse: collapse;}
			caption{font:bold 30px "hy헤드라인m", sansserif;
			        color:green;}
			th{background:#ffff8f;
			   border-bottom: 3px double black;}
			td{text-align: center;} 
		</style>
		
		<script type="text/javascript">
			function del(f){
				let idx = f.idx.value;
				if(!confirm("정말 삭제하시겠습니까?")){
					return;
				}
				
				f.action = "gogek_del.do?idx="+idx;
				f.submit();
			} // end of del()
			
			function search(){
				let addr_search = document.getElementById("addr_search").value;
				
				location.href="gogek_search.do?addr="+addr_search;
			} // end of search()
		</script>
	</head>
	<body>
		<table border="1">
			<caption>:::고객리스트:::</caption>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>주소</th>
				<th>주민등록번호</th>
				<th>담당자번호</th>
				<th>비고</th>
			</tr>
			
			<c:forEach var="vo" items="${ gogek_list }">
			<form>
				<tr>
					<td>${ vo.gobun }</td>
					<td>${ vo.goname }</td>
					<td>${ vo.goaddr }</td>
					<td>${ vo.gojumin }</td>
					<td>${ vo.godam }</td>
					<input type="hidden" name="idx" value="${ vo.gobun }">
					<td><input type="button" value="삭제" onclick="del(this.form)"/></td>
				</tr>
			</form>
			</c:forEach>
				<tr>
					<td colspan="6">
						<input type="button" value="전체보기" onclick="location.href='list.do'"/>
						<input type="text" placeholder="검색할 지역을 입력하세요" id="addr_search"
							onkeyup="if(window.event.keyCode==13){search();}"/>
						<input type="button" value="검색" onclick="search();"/>
						<span>/</span>
						<input type="button" value="등록" onclick="location.href='insert_form.jsp'"/>
					</td>
				</tr>
		</table>
	</body>
</html>
