<%@page import="com.itwill.user.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script type="text/javascript">
	var id = opener.document.f.userId.value;
	if(!id){
		alert("아이디를 입력해주세요");
	}
	function checkId() {
		document.getElementById("userId").value = id;
	}
	function sendValue() {
		opener.document.f.checkId.value = "idCheck";
		opener.document.f.userId.value = document.getElementById("userId").value;
		if (opener != null) {
			opener.checkForm = null;
			self.close();
		}
	}
</script>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
</head>
<body onload="checkId()">
	<div id="wrapper">
		<br> <b><font size="4" color="gray">아이디 중복체크</font></b><hr><br>
		<div id="content">
			<form id="checkForm">
				<input type="text" name="idInput" value="" id="userId"> 
<%
	request.setCharacterEncoding("UTF-8");
	String idCheck = request.getParameter("idInput");
	System.out.println(idCheck);
	UserService userService = new UserService();
	boolean checkId = userService.existedUser(idCheck);
	if (checkId) {
		out.println("<script>");
		out.println("alert('중복된아이디입니다.');");
		out.println("</script>");
		return;
	} else {
		out.println("<script>");
		out.println("alert('사용가능한아이디입니다.');");
		out.println("</script>");
	}
%>
			</form>
			<div id="button"></div>	<br> 
			<input id="useBtn" type="button" value="사용하기" onclick="sendValue()"> 
			<input id="cancelBtn" type="button" value="취소" onclick="window.close()">
		</div>
	</div>
</body>
</html>


