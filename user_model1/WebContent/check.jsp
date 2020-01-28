<%@page import="com.itwill.user.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String idCheck = request.getParameter("userId");
	UserService userService = new UserService();
	boolean checkId = userService.existedUser(idCheck);
	if (checkId) {
		out.println("<script>");
		out.println("alert('중복된아이디입니다.');");
		out.println("self.close();");
		out.println("</script>");
		return;
	} else {
		out.println("<script>");
		out.println("alert('사용가능한아이디입니다.');");
		out.println("self.close();");
		out.println("</script>");
	}
%>
