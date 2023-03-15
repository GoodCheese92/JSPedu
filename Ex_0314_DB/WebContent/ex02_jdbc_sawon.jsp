<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="vo.Ex02_SawonVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	
	request.setCharacterEncoding("utf-8");
	// http://localhost:9090/Ex_0314_DB/ex02_jdbc_sawon.jsp?deptno=10
	int deptno = Integer.parseInt(request.getParameter("deptno"));
	
	// JNDI 검색
	InitialContext ic = new InitialContext();
	
	// Resource 검색
	Context ct = (Context)ic.lookup("java:comp/env");
	DataSource dataSource = (DataSource)ct.lookup("jdbc/oracle_test");
	
	// DB 연결
	Connection conn = dataSource.getConnection();
	
	System.out.println("DB연결 성공");
	
	// sql 연결 및 실행
	String sql = "SELECT * FROM sawon WHERE deptno = " + deptno;
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	List<Ex02_SawonVO> sawon_list = new ArrayList<>();
	
	// 사원테이블에서 우리에게 필요한 정보를(사번, 이름, 부서번호, 직책) vo에 저장	
	// vo 객체에 DB 정보 대입 및 ArrayList에 추가
	while(rs.next()){
		Ex02_SawonVO vo = new Ex02_SawonVO();
		vo.setSabun(rs.getInt("sabun"));
		vo.setSaname(rs.getString("saname"));
		vo.setDeptno(rs.getInt("deptno"));
		vo.setSajob(rs.getString("sajob"));
		
		sawon_list.add(vo);
	} // while
	
	rs.close();
	pstmt.close();
	conn.close();
	
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ex02_jdbc_sawon</title>
		
		<style>
			table{margin: 5px auto;
				  border-collapse: collapse;
				  width:300px;
				  border-width: 3px;}
			caption{font-family: "hy헤드라인m", sans-serif;
					font-weight:bold;
					font-size:30px;
				    color:blue;}
			th{border-bottom-style: double;
			   border-bottom-width: 2px;} 
			td{text-align: center;
			   font-family: "바탕체", sans-serif;}
		</style>
	</head>
	<body>
		<table border="1">
			<caption>사원테이블</caption>
			<tr>
				<th>사번</th>
				<th>이름</th>
				<th>부서번호</th>
				<th>직책</th>
			</tr>
			<% for(Ex02_SawonVO vo : sawon_list) { %>
			<tr>
				<td><%= vo.getSabun() %></td>
				<td><%= vo.getSaname() %></td>
				<td><%= vo.getDeptno() %></td>
				<td><%= vo.getSajob() %></td>
			</tr>
			<% } %>
		</table>
	</body>
</html>