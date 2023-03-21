<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- EL 표기법 : jsp에서 표현되는 표현식을 더 간결하게 사용할 수 있도록 해 주는 표현 형태
	 EL(Expression Language) : EL로 값을 표현하려면 jsp의 관리하에 있는 4개의 영역에서만 사용을 할 수 있다.
	 1) page영역 : 단 하나의 페이지(현재페이지)에서만 값을 저장하고 공유할 수 있다.
	 2) request영역(가장 많이 쓰임) : 지역개념으로 페이지가 닫히면 영역도 종료가 된다. 
	 							  최대 두 개의 페이지에서 값을 저장하거나 공유할 수 있다. 
	 3) session영역 : 전역 개념으로 브라우저가 완전히 종료되기 전까지는 영역이 살아있다.
	 				 같은 웹 브라우저내에서 요청되는 페이지들에게 값을 공유 
	 4) application 영역 : 한 프로젝트에서 요청되는 페이지들간 값의 공유 
	 
	 // 주석에도 달러를 쓰면 오류 발생할 수 있다.
	 EL의 접근형식 : 달러표시{영역.변수}	 
-->

<%
	String msg = "안녕";
		
	// pageScope에 값을 저장
	pageContext.setAttribute("msg", "page 영역입니다."); 

	// requestScope에 값을 저장
	request.setAttribute("msg", "request 영역입니다.");
	request.setAttribute("hi", "안녕하세요");
	
	session.setAttribute("msg", "session 영역입니다.");
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ex03_EL</title>
	</head>
	<body>
		일반 jsp 표현식 : <%= msg %><br>
		EL표현식(생략) : ${msg}<br>
		EL표현식(생략) : ${hi}<br>
		EL표현식(생략x) : ${requestScope.msg}<br>
		EL표현식(생략x) : ${sessionScope.msg}<br>
		EL표현식(생략x) : ${requestScope.hi}<br>
		<!-- 파라미터로 넘어온 것 중에 'age'이름을 가진 파라미터의 값을 가져온다. -->
		EL표현식(파라미터) : ${param.age}
		
		<!-- 생략식을 사용했을 때 영역의 참조 순서
			 1. pageScope
			 2. requestScope
			 3. sessionScope
			 4. applicationScope -->
			 
		<hr>
		
		EL표기법의 연산자<br>
		\${ 1 + 1 } : ${ 1 + 1 }<br><!-- 역슬래시(\)를 앞에 붙이면 그대로 나온다. -->
		\${ 2 + 2 } : ${ 2 + 2 }<br>
		\${ 10 / 3 } : ${ 10 / 3 }<br> 
		\${ 10 % 3 } : ${ 10 % 3 }<br>
		\${ param.age / 3 } : ${ param.age / 3 }<br>
		
		<hr>
		
		비교연산자<br>
		\${ 3 > 2 } : ${ 3 > 2 } or ${3 gt 2}<br> 
		\${ 3 < 2 } : ${ 3 < 2 } or ${3 lt 2}<br>
		\${ 3 >= 2 } : ${ 3 ge 2 }<br> 
		\${ 3 <= 2 } : ${ 3 le 2 }<br>
		\${ 3 == 2 } : ${ 3 eq 2 }<br>
		\${ 3 != 2 } : ${ 3 ne 2 }
		
		<hr>
		
		삼항연산자<br>
		파라미터 값 : ${ param.msg == null ? '값 없음' : param.msg }<br>
		<!-- empty : 비어있는지를 체크, 추천하는 방법 -->
		파라미터 값 : ${ empty param.msg ? '값 없음' : param.msg }<br>  
		
		<hr>
		
		논리연산자<br>
		${ 10 gt 3 && 5 eq 5 }<br>
		<!-- 문장으로 작성하기도 한다. -->
		${ 10 gt 3 and 5 eq 5 }
		${ 10 gt 3 or 5 eq 5 }
	</body>
</html>