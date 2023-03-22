/**
 * 
 */
let b_idCheck = false;
function send(f){
	let id = f.id.value;
	let pwd = f.pwd.value;
	let name = f.name.value;
	let email = f.email.value;
	let addr = f.addr.value;
	
	// 유효성 체크 했다쳐
	if(id == ''){
		alert("아이디를 입력하세요.");
		f.id.focus();
		return;
	}
	
	if(pwd == ''){
		alert("비밀번호를 입력해주세요.")
		f.pwd.focus();
		return;
	}
	
	if(name == ''){
		alert("이름을 입력해주세요.")
		f.name.focus();
		return;
	}
	
	let email_check = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

	
	if(!email_check.test(email)){
		alert("이메일을 바르게 입력해주세요.")
		f.email.focus();
		return;
	}
	
	if(addr == ''){
		alert("주소를 입력해주세요.")
		f.addr.focus();
		return;
	}
	
	if(!b_idCheck){
		alert("아이디 중복체크를 하세요.");
		return;	
	}
	
	f.action="insert.do";
	f.method="post";
	f.submit();
		
} // end of send()

// 아이디 중복 체크를 위한 메서드
function check_id(){
	let id = document.getElementById("id").value.trim();
	
	if(id == ''){
		alert("아이디를 입력하세요.");
		return;
	}
	
	// Ajax를 통해 아이디 중복검사
	var url = "check_id.do";
	var param = "id="+id;
	sendRequest(url, param, resultFn, "GET");
	
} // end of check_id()

// 중복체크 버튼 클릭 후 자동으로 호출되는 콜백메서드
function resultFn(){
	if(xhr.readyState == 4 && xhr.status == 200){
		let data = xhr.responseText;
		// data = "{'result':'yes'}"
		//alert(data);
		
		// 문자열로 넘어온 data를 실제 json구조로 변경
		let json = (new Function('return' + data))();
		
		// alert(json[0].result);
		
		if(json[0].result == 'yes'){
			alert("이미 사용중인 아이디 입니다.")
		} else{
			alert("사용 가능한 아이디 입니다.");
			b_idCheck = true;
		}
	} // if
	
} // end of resultFn()

function che(){
	// 아이디를 입력 받는 창의 값이 변경되면 호출되는 메서드
	b_idCheck = false;
} // end of che()

// 멤버 삭제 (Ajax 사용해서)
function del(idx){
	// location.href = 'delete.do?idx='+idx;
	if(!confirm("삭제하시겠습니까?")){
		return;
	}
	
	// idx를 Ajax를 통해서 서버측으로 전달
	var url = "delete.do";
	var param = "idx=" + idx;
	
	sendRequest(url, param, resultFn_del, "get");
	
} // end of del()

function resultFn_del(){
	
	if(xhr.readyState == 4 && xhr.status == 200){
		var data = xhr.responseText;
		// data --> "no" or "yes"
		// alert(data);
		if(data == "yes"){
			alert("삭제 성공");
			// location.href="member_list.do";
			history.go(0);
		} else{
			alert("삭제 실패. 관리자에게 문의하세요");
		}
			
		// location.href = "member_list.do";
		// console.log("test");
		// location.reload();
		// location.replace(location.href);
	}
} // end of resultFn_del