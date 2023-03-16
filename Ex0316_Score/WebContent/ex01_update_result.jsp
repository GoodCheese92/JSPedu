<%@page import="dao.Ex01_ScoreDAO"%>
<%@page import="vo.Ex01_ScoreVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	// ex01_update_result.jsp?no=14&name=육길동&kor=50&eng=80&mat=40
	int no = Integer.parseInt(request.getParameter("no"));
	String name = request.getParameter("name");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int mat = Integer.parseInt(request.getParameter("mat"));
	
	//업데이트를 위해 넘겨 받은 파라미터를 vo로 묶는다.
	Ex01_ScoreVO vo = new Ex01_ScoreVO();
	vo.setNo(no);
	vo.setName(name);
	vo.setKor(kor);
	vo.setEng(eng);
	vo.setMat(mat);
	// DAO에게 업데이트를 요청
	int n = Ex01_ScoreDAO.getInstance().update(vo);
	
	// 업데이트가 완료되면 ex01_student.jsp로 화면 전환
	if(n == 1){
		response.sendRedirect("ex01_student.jsp");
	}
	
%>    
    
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>ex01_update_result</title>
	</head>
	<body>
	
	</body>
</html>