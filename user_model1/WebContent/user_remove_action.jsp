<%@page import="com.itwill.user.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	String loginId = (String) session.getAttribute("userId");
	UserService userService = UserService.getInstance();

	if (loginId.equals("admin")) {
		int deleteUser = userService.remove(loginId);
		out.println("<script>");
		out.println("alert('관리자가" + loginId + " 님을 꺼지라고합니다. 바이바이');");
		out.println("location.href='user_main.jsp';");
		out.println("</script>");
		return;
	} else {
		int deleteUser = userService.remove(loginId);
		out.println("<script>");
		out.println("alert('안녕히가세요" + loginId + " 님');");
		out.println("location.href='user_main.jsp';");
		out.println("</script>");
	}
	session.invalidate();
%>
