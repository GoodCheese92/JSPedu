<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
	// 선언부 : 변수나 메서드를 정의하는 영역(전역변수 개념)
	int n = 0;
	Random rnd = new Random();
	
	public int plus(int a, int b){
		return a+b;
	}
%>

<%
	//스크립트 릿 : 지역변수의 개념
	int n1 = 0;
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ex02_architecture</title>
	</head>
	<body>
		<p><%= plus(10, 5)%></p>
		<!-- 웹브라우저를 새로고침하면 n은 계속 증가하지만 n1은 0으로 계속 초기화된다. -->
		<p><%= "n : " + n++ %></p><!-- println 안에 들어가는 내용만 들어갈 수 있다. -->
		<p><%= "n1 : " + n1++ %></p>
	</body>
</html>