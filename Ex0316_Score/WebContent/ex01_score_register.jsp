<%@page import="java.io.PrintWriter"%>
<%@page import="vo.Ex01_ScoreVO"%>
<%@page import="dao.Ex01_ScoreDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	// ex01_score_input으로부터 넘어온 파라미터를 수신
	String name = request.getParameter("name");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int mat = Integer.parseInt(request.getParameter("mat"));
	
	Ex01_ScoreVO vo = new Ex01_ScoreVO();
	vo.setName(name);
	vo.setKor(kor);
	vo.setEng(eng);
	vo.setMat(mat);
	
	// dao에 이름, 국영수 정보를 전달
	int n = Ex01_ScoreDAO.getInstance().insert(vo);	// 성공한 행수가 반환됨
	
	// response.setContentType("text/html; charset=UTF-8");
	// PrintWriter out1 = response.getWriter();
	if(n == 1){
		// 등록에 성공했다면 ex01_student.jsp로 화면 전환
		// location.href = "ex01_student.jsp"; -> 자바 코드 아니라서 사용 불가
		// out1.print("<script>alert('성공!'); </script>");
		// out1.flush();
		response.sendRedirect("ex01_student.jsp"); // 자바 코드로 변경
	} else{
		// out1.print("<script>alert('실패!'); </script>");
		// out1.flush();
	}
	// response.flushBuffer();
	// out1.close();
%>   
 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ex01_score_register</title>
	</head>
	<body>
	
	</body>
</html>