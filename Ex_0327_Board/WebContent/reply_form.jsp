<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>reply_form.jsp</title>
		
		<link rel="stylesheet" href="css/insert_css.css">
		
		<script>
			function send(){
				let f = document.f;
				let subject = f.subject.value;
				let content = f.content.value;
				let name = f.name.value;
				let pwd = f.pwd.value;
				
				if(subject == ""){
					alert("제목을 입력해주세요.");
					f.subject.focus();
					return;
				}
				if(content == ""){
					alert("내용을 입력해주세요.");
					f.content.focus();
					return;
				}
				if(name == ""){
					alert("이름을 입력해주세요.");
					f.name.focus();
					return;
				}
				if(pwd == ""){
					alert("비밀번호를 입력해주세요.");
					f.pwd.focus();
					return;
				}
				
				f.method="post";
				f.submit();
			} // end of send()
		</script>
	</head>
	<body>
		<form action="board_reply.do" name="f">
			<input type="hidden" name="idx" value="${param.idx}"/>
		
			<table border="1">
				<caption>:::댓글 등록하기:::</caption>
				<tr class="title">
					<th class="title_th">제목</th>
					<td colspan="3" class="title_td"><input type="text" placeholder="제목" name="subject" style="width:97%; height:30px;"/></td>
				</tr>
				<tr class="content">
					<th class="title_th">내용</th>
					<td colspan="3" class="content_td">
						<textarea placeholder="내용" name="content" style="width:97%; height:400px; resize: none;"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="name_td" style="text-align: right">
						작성자 : <input type="text" placeholder="작성자" name="name" style="text-align:center; height:20px;" />
						/ 비밀번호 : <input type="password" placeholder="비밀번호" name="pwd" style="text-align:center; height:20px;"/>
					</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align: right">
						<img src="img/btn_reg.gif" onclick="send();" style="cursor:pointer;" />
						<img src="img/btn_back.gif" onclick="history.go(-1);" style="cursor:pointer;"/>
						<!-- <input type="button" value="등록" onclick="send(this.form);" style="height:30px;">
						<input type="button" value="취소" onclick="history.go(-1);" style="height:30px;"/> -->
					</td>
				</tr>
			</table>
		</form>	
	</body>
</html>