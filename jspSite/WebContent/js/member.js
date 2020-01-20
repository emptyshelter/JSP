/**
 * 
 */
function checkForm(f) {
	
	// 널체크
	if (isNull(f.id.value)) {
		alert('아이디를 입력하세요');
		f.id.focus();
		return false;
	}
	if (isNull(f.pass.value)) {
		alert('패쓰워드를 입력하세요');
		f.pass.focus();
		return false;
	}
	if (isNull(f.repass.value)) {
		alert('패쓰워드확인을 입력하세요');
		f.repass.focus();
		return false;
	}
	if (isNull(f.name.value)) {
		alert('이름을 입력하세요');
		f.name.focus();
		return false;
	}
	if (isNull(f.addr.value)) {
		alert('주소를 입력하세요');
		f.addr.focus();
		return false;
	}
	// 패쓰워드,확인일치체크
	if (!isSame(f.pass.value, f.repass.value)) {
		alert("패쓰워드와확인은 일치해야합니다");
		f.pass.select();
		return false;
	}

	// 아이디
	// 1.5~8글자사이
	// 2.영문,_,숫자 로만구성
	// 3.숫자로시작하면안되요
	var id = f.id.value;
	var check = /([^a-zA-Z0-9_])/;
	var check2 = /[0-9]/;
	if((id.length< 5 || id.length>8)) {
		alert("아이디의 길이는 5~8글자 사이여야 합니다");
		f.id.focus();
		return false;
	}
	console.log(f.id.value);
	
	if((check.test(id))){
		alert("영문,_,숫자 로만구성되어야 합니다.");
		f.id.focus();
		return false;
	}
	
	if (check2.test(id.charAt(0))) {
		alert("아이디는 숫자로시작할 수 없습니다.");
		f.id.focus();
		return false;
	}

	if(!window.confirm("가입하실래요?")){
		return false;
	}
	return true;
}

















