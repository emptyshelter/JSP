<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String logoutUser = (String) session.getAttribute("sUserId");
	if (logoutUser == null || logoutUser.equals("")) {
		out.println("<script>");
		out.println("alert('회원정보가 확인되지 않습니다.');");
		out.println("location.href='user_login_form.jsp';");
		out.println("</script>");
		return;
	} else {
		out.println("<script>");
		out.println("alert('안녕히가세요" + logoutUser + " 님');");
		out.println("location.href='user_main.jsp';");
		out.println("</script>");
	}
	session.invalidate();
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>