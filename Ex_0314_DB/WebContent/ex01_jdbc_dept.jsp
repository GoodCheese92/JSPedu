<%@page import="vo.Ex01_DeptVO"%>
<%@page import="java.util.ArrayList"%>
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
	// 톰캣이 참조할 JNDI를 검색
	InitialContext ic = new InitialContext(); // javax.naming.InitialContext
	
	// Resource의 위치 검색
	Context ctx = (Context)ic.lookup("java:comp/env"); // javax.naming.Context, lookup의 파라미터는 상수값
	DataSource dataSource = (DataSource)ctx.lookup("jdbc/oracle_test"); // javax.sql.DataSource
	// lookup의 파라미터는 resource의 name이다.
	
	// Resource에서 얻어낸 정보를 통해서 DB에 연결하기 위한 객체
	Connection conn = dataSource.getConnection(); // java.sql.Connection
	
	System.out.println("----DB연결 성공----");
	
	// DB 연결 후 dept 테이블 조회
	String sql = "select * from dept";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	ResultSet rs = pstmt.executeQuery();
	
	List<Ex01_DeptVO> dept_list = new ArrayList<>();
	
	// DB에서 행을 한줄씩 검색하여 vo에 저장하고,
	// 그 값을 dept_list에 add()하자
	while(rs.next()){
		Ex01_DeptVO vo = new Ex01_DeptVO();
		vo.setDeptno(rs.getInt("deptno"));
		vo.setDname(rs.getString("dname")); // 컬럼명과 같아야 한다.
		vo.setLoc(rs.getString("loc"));
		
		dept_list.add(vo);
	} // end of while
	
	// DB접근을 위해 만들어진 객체들(pstmt, rs)은 역순으로 닫아준다.
	rs.close();
	pstmt.close();
		
	// DBCP를 10으로 잡아놓았기 때문에 close()가 없으면 11번째 사용자는 접근이 불가
	// 그러므로 conn을 연결하여 사용한 뒤에는 반드시 끝내줘야 다음 사용자가 연결할 수 있다.
	conn.close(); // close()를 하지 않는다면 max가 10으로 설정되어 있기 때문에 10번 새로고침하면 오류 발생
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ex01_jdbc_dept</title>
		
		<style>
			table{border-collapse: collapse;
				  margin: 5px auto;}
			td{font-family: "바탕체", "human myeongjo", sans-serif;
			   text-align:center;}
			caption{font: bold 25px "hy헤드라인m", sans-serif;
					color: blue;}
			a{text-decoration: none;}	
		</style>
		
		<script>
			// 부서이름을 누르면 파라미터를 가지고 ex02_jdbc_sawon.jsp로 넘어간다.
			function send(no){
				// alert(no);
				let ff = document.ff;	// name이 ff인 form태그를 가져와라
				
				// alert(ff.deptno.value);
				
				ff.deptno.value = no;
				
				ff.action = "ex02_jdbc_sawon.jsp";
				ff.submit();
			}
		</script>
	</head>
	<body>
		<form name='ff'>
		<table border='1'>
			<caption>부서목록</caption>
			<tr>
				<th>부서번호</th>			
				<th>부서이름</th>			
				<th>부서위치</th>			
			</tr>
			
			<%	for(int i=0; i<dept_list.size(); i++){
				Ex01_DeptVO vo = dept_list.get(i);
			%>
			<tr>
				<td><%= vo.getDeptno() %></td>	
				<td>
					<!-- javascript의 메서드라고 표시, 잘 사용하지 않는다. -->
					<a href="javascript:send('<%= vo.getDeptno() %>')">
					<%= vo.getDname() %>
					</a>
				</td>	
				<td><%= vo.getLoc() %></td>	
			</tr>
			<% } %>
		</table>
		
		<!-- 인풋이 아니면 name을 넘겨줄 수가 없다. -->
		<input type="hidden" name="deptno">
		</form>
	</body>
</html>