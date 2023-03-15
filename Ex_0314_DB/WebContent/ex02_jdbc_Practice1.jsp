<%@page import="java.util.ArrayList"%>
<%@page import="vo.Ex02_SawonVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	InitialContext ic = new InitialContext();

	Context ct = (Context)ic.lookup("java:comp/env");
	DataSource dataSource = (DataSource)ct.lookup("jdbc/oracle_test");
	
	Connection conn = dataSource.getConnection();
	
	String sql = "SELECT * FROM sawon";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	List<Ex02_SawonVO> sawon_list = new ArrayList<>();
	
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
		<title>ex02_jdbc_Practice2</title>
	</head>
	<body>
		<table border="1">
			<caption>사원테이블</caption>
			<tr>
				<th>사번</th>
				<th>이름</th>
				<th>부서번호</th>
				<th>직종</th>
			</tr>
			<% for(Ex02_SawonVO vo : sawon_list){ %>
			<tr align="center">
				<td><%= vo.getSabun() %></td>
				<td><%= vo.getSaname() %></td>
				<td><%= vo.getDeptno() %></td>
				<td><%= vo.getSajob() %></td>
			</tr>
			<% } %>
		</table>
	</body>
</html>