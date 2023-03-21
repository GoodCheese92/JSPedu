<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- JSON(Javascript Object Notation) 표기법 : 
	  서로 다른 플랫폼에서 데이터를 교환하기 위해 정의되어 있는 공통적(약속된)인 표기법 -->    
    
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>ex02_json</title>
		
		<script type="text/javascript">
			// 기본형태의 json 구조
			let p = {'name' : '홍길동', 'age':30, 'tel' : '010-123-1234'};
			document.write(p.name + " / " + p['age'] + " / " + p.tel);
			document.write("<hr>");
			
			// 배열형태의 json 구조
			let p_arr = [{'name':'hong', 'age':'20'}, {'name':'kim', 'age':'30'}, {'name':'lee', 'age':'40'}];
			
			document.write(p_arr[0].name + " / " + p_arr[0].age);
			document.write("<br>");
			document.write(p_arr[1].name + " / " + p_arr[1].age);
			document.write("<br>");
			document.write(p_arr[2].name + " / " + p_arr[2].age);
			document.write("<hr>");
			
			// 띄어쓰기 X
			let course = {'name':'임베디드웹개발',
						  'start':'2023-01-01',
						  'end':'2023-06-01',
						  'sub':['java', 'web', 'jsp'],
						  'student':[ {'name':'hong', 'age':'20'},
							  		  {'name':'kim', 'age':'24'},
							  		  {'name':'lee', 'age':'30'} ]};
			document.write("과목명 : " + course.name + "<br>");
			document.write("시작일 : " + course.start + "<br>");
			document.write("종료일 : " + course.end);
			document.write("<hr>");
			
			for(let i=0; i<course.sub.length; i++){
				document.write(course.sub[i]+" / ");
			} // for
			
			document.write("<hr>");
			
			for(let i=0; i<course.student.length; i++){
				document.write(course.student[i].name + ", " + course.student[i].age + "살<br>");
			} // for
		</script>
	</head>
	<body>
	
	</body>
</html>