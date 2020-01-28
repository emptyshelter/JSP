<%@page import="com.itwill.user.exception.ExistedUserException"%>
<%@page import="com.itwill.user.UserService"%>
<%@page import="com.itwill.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	if (request.getMethod().equalsIgnoreCase("GET")) {
		response.sendRedirect("user_write_form.jsp");
		return;
	}
	//request.setCharacterEncoding("UTF-8");
	String userId = request.getParameter("userId");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	User newUser = null;
	try {
		UserService userService = UserService.getInstance();
		newUser = new User(userId, password, name, email);
		userService.create(newUser);
		response.sendRedirect("user_login_form.jsp");
	} catch (ExistedUserException e) {
		/*
		out.println("<script>");
		out.println("alert('"+e.getMessage()+"');");
		out.println("location.href='user_write_form.jsp';");
		out.println("</script>");
		*/
		request.setAttribute("msg", e.getMessage());
		request.setAttribute("fuser", newUser);
		RequestDispatcher rd = request.getRequestDispatcher("user_write_form.jsp");
		rd.forward(request, response);
		return;
	} catch (Exception e) {
		e.printStackTrace();
		RequestDispatcher rd = request.getRequestDispatcher("user_write_form.jsp");
		rd.forward(request, response);
		//response.sendRedirect("user_error.jsp");
		return;
	}
	/*if (request.getMethod().equalsIgnoreCase("GET")) {
		response.sendRedirect("user_write_form.jsp");
		return;
	}
	String userId = request.getParameter("userId");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	UserService userService = UserService.getInstance();
	boolean checkUser = userService.existedUser(userId);
	if (userId == null || userId.equals("")) {
		out.println("<script>");
		out.println("alert('잘못된접근입니다. 회원가입창으로 이동합니다.');");
		out.println("location.href='user_write_form.jsp';");
		out.println("</script>");
		return;
	} else if (checkUser) {
		out.println("<script>");
		out.println("alert('회원가입실패!" + userId + " 은(는)이미 존재하는 ID입니다.');");
		out.println("location.href='user_write_form.jsp';");
		out.println("</script>");
		return;
	} else {
		int createUser = userService.create(new User(userId, password, name, email));
		out.println("<script>");
		out.println("alert('회원가입성공! 환영합니다 " + userId + " 님');");
		out.println("location.href='user_list.jsp';");
		out.println("</script>");
	}
	session.setAttribute("sUserId", userId);
	*/
%>
















