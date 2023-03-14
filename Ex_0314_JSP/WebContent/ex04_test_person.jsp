<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.Ex04_PersonVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Model-1 구조 : 하나의 jsp파일에서 자바의 연산코드와 html의 디자인 코드를 모두 작성하는 형태 -->
    
<%
	Ex04_PersonVO p1 = new Ex04_PersonVO();
	p1.setName("홍길1");
	p1.setAge(20);
	p1.setTel("010-111-1111");
	
	Ex04_PersonVO p2 = new Ex04_PersonVO();
	p2.setName("홍길2");
	p2.setAge(23);
	p2.setTel("010-111-2222");
	
	Ex04_PersonVO p3 = new Ex04_PersonVO();
	p3.setName("홍길3");
	p3.setAge(27);
	p3.setTel("010-111-3333");
	
	// 준비해둔 vo객체들을 ArrayList에 탑재
	List<Ex04_PersonVO> pList = new ArrayList<>();
	// ArrayList는 List 인터페이스를 구현하고 있기 때문에 인스턴스가 같다. 따라서 List로 ArrayList의 메모리를 할당받는 것이 효율적이다.
	pList.add(p1);
	pList.add(p2);
	pList.add(p3);
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ex04_test_person</title>
		
		<style>
			table{border-collapse: collapse;
				  margin:5px auto;
				  width:300px; height: 150px;}
			tr{text-align:center;}
			caption{font:bold 20px "hy헤드라인m", sans-serif;
					color:blue;}
		</style>
	</head>
	<body>
		<table border='1'>
			<caption>:::개인정보 목록:::</caption>
			<tr>
				<th>이름</th>
				<th>나이</th>
				<th>전화번호</th>
			</tr>
				<% for(int i=0; i<pList.size(); i++){ %>
			<tr>
				<td><%= pList.get(i).getName() %></td>
				<td><%= pList.get(i).getAge() %></td>
				<td><%= pList.get(i).getTel() %></td>
			</tr>
				<% } %>
		</table>
	</body>
</html>