<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="vo.TestVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Map<String, Object> map = new HashMap<>();
	map.put("name", "홍길동");
	map.put("age", 20);
	map.put("height", 167.2);
	
	request.setAttribute("myMap", map);
	
	// request 영역에 VO를 저장하고 출력해보자
	TestVO vo1 = new TestVO();
	vo1.setName("홍길동");
	vo1.setAge(22);
	
	TestVO vo2 = new TestVO();
	vo2.setName("김길동");
	vo2.setAge(26);
	
	request.setAttribute("vo", vo1);
	
	// ArrayList에 담긴 vo들의 정보를 출력
	List<TestVO> test_list = new ArrayList<>();
	test_list.add(vo1);
	test_list.add(vo2);
	request.setAttribute("arr", test_list);
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ex04_EL</title>
	</head>
	<body>
		<!-- 3가지 방법이 있다. -->
		이름 : ${ myMap.get("name") }<br>
		나이 : ${ myMap['age'] }살<br>
		키 : ${ myMap.height }cm<br>
		\${ myMap.height } --> 가장 많이 사용하는 구조
		
		<hr>
		
		<!-- 원래는 getName으로 접근해야 하지만, EL에서는 name으로 바로 접근이 가능하다. -->
		<!-- name과 age로 바로 접근이 가능하지만, getter가 없으면 불가능하다. -->
		이름 : ${ vo.name }, 나이 : ${ vo.age }<br>
		
		<hr>
		
		이름 : ${ arr[0].name } / 나이 : ${ arr[0].age }<br>
		이름 : ${ arr[1].name } / 나이 : ${ arr[1].age }
		
	</body>
</html>