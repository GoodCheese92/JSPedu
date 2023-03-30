<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>board_list</title>
		
		<style>
			table{margin:0 auto;
				  border-width:5px;
				  border-collapse: collapse;
				  width:700px;
				  table-layout: fixed;
				  word-break:break-all;}
			caption{font:bold 30px "hy헤드라인m", sansserif;
			        color:green;}
			th{background:#ffff8f;
			   border-bottom: 3px double black;}
			td{text-align: center;}
			a{text-decoration:none;}
			.title{text-align: left;}
			.register{text-align: right;} 
		</style>
		
		<script type="text/javascript">
			function search(){
				// 조회 카테고리 검색
				let search = document.getElementById("search").value;
				
				// 검색어 조회
				let search_text = document.getElementById("search_text").value.trim();
				
				// 카테고리가 전체보기(all)로 지정되어 있지 않은 경우라면
				// 반드시 검색어가 입력되어 있어야 한다.
				if(search != 'all' && search_text == ''){
					alert("검색어를 입력하세요.");
					return;
				}
				
				// 검색 카테고리, 검색어, 페이지정보를 list.do에게 전달
				location.href="board_list.do?search="+search+"&search_text="
								+encodeURIComponent(search_text);
				
			} // end of search()
		</script>
	</head>
	<body>
		<table border="1">
			<caption>:::게시판 목록:::</caption>
			<colgroup>
				<col width="8%"/>
				<col width=""/>
				<col width="10%"/>
				<col width="15%"/>
				<col width="10%"/>
			</colgroup>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>이름</th>
				<th>등록날짜</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="vo" items="${ board_list }">
			<tr>
				<c:if test="${ vo.del_info ne -1 }">
					<td>${ vo.idx }</td>
				</c:if>
				<c:if test="${ vo.del_info eq -1 }">
					<td></td>
				</c:if>
							
				<td class="title">
					<!-- 댓글 들여쓰기 -->
					<c:forEach begin="1" end="${ vo.depth }">&nbsp;</c:forEach>
					
					<!-- 댓글기호 표시 -->
					<c:if test="${ vo.depth ne 0 }">└</c:if>
					
					<c:if test="${ vo.del_info ne -1 }">
						<a href="view.do?idx=${ vo.idx }&page=${ param.page }
						&search=${param.search}&search_text=${param.search_text}">${ vo.subject }</a>
					</c:if>
					<c:if test="${ vo.del_info eq -1 }">
						<font color="gray">이미 삭제된 게시글입니다.</font>
					</c:if>
				</td>
				<c:if test="${ vo.del_info ne -1 }">			
					<td>${ vo.name }</td>			
					<td>${ vo.regidate }</td>			
					<td>${ vo.readhit }</td>
				</c:if>			
				<c:if test="${ vo.del_info eq -1 }">			
					<td> </td>			
					<td> </td>			
					<td> </td>
				</c:if>			
			</tr>
			</c:forEach>

			<tr>
				<td colspan="5" align="center">
					${ pageMenu }
				</td>
			</tr>
			<tr>
				<td colspan="4" style="text-align: center;">
					<div>
						<!-- 조회 카테고리 -->
						<select id="search">
							<option value="all">전체보기</option>
							<option value="subject">제목</option>
							<option value="name">이름</option>
							<option value="content">내용</option>
							<option value="name_subject_content">제목+이름+내용</option>
						</select>
						
						<input type="text" id="search_text"/><!-- 검색어 입력창 -->
						<input type="button" value="검색" onclick="search();"/>
					</div>
				</td>
				
				<td class="register">
					<img src="img/btn_reg.gif" onclick="location.href='board_insert_form.jsp'" style="cursor:pointer;">
				</td>
			</tr>
		</table>
	</body>
</html>