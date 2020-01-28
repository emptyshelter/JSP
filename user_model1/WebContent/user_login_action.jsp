<%@page import="com.itwill.user.User"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.itwill.user.exception.PasswordMismatchException"%>
<%@page import="com.itwill.user.exception.UserNotFoundException"%>
<%@page import="com.itwill.user.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("user_login_form.jsp");
		return;
	}
	try{
		String userId=request.getParameter("userId");
		String password=request.getParameter("password");
		UserService userService= UserService.getInstance();
		User loginUser=userService.login(userId,password);
		
		session.setAttribute("sUserId", userId);
		session.setAttribute("sUser", loginUser);
		
		
		response.sendRedirect("user_list.jsp");
	}catch(UserNotFoundException e){
		/***********************case 1[redirect] **************************
		String msg1 = URLEncoder.encode(e.getMessage(),"UTF-8");
		response.sendRedirect("user_login_form.jsp?msg1="+msg1);
		*********************************************************/
		/***********************case 2[forward] **************************/
		request.setAttribute("msg1", e.getMessage());
		RequestDispatcher rd = request.getRequestDispatcher("user_login_form.jsp");
		rd.forward(request, response);
	}catch(PasswordMismatchException e){
		/***********************case 1 **************************
		String msg2 = URLEncoder.encode(e.getMessage(),"UTF-8");
		response.sendRedirect("user_login_form.jsp?msg2="+msg2);
		*********************************************************/		
		request.setAttribute("msg2", e.getMessage());
		RequestDispatcher rd = request.getRequestDispatcher("user_login_form.jsp");
		rd.forward(request, response);
		
	}catch(Exception e){
		e.printStackTrace();
		//response.sendRedirect("user_error.jsp");
		RequestDispatcher rd = request.getRequestDispatcher("user_error.jsp");
		rd.forward(request, response);
	}
%>}
	
	/*
	boolean checkUser = userService.login(userId, password);
	if (userId.equals("admin") && password.equals("admin")) {
		out.println("<script>");
		out.println("alert('관리자모드로 접속하셨습니다.');");
		out.println("location.href='user_list.jsp';");
		out.println("</script>");
	}
	if (!(checkUser)) {
		out.println("<script>");
		out.println("alert('로그인 실패 다시 시도해주세요!!');");
		out.println("location.href='user_login_form.jsp';");
		out.println("</script>");
		return;
	} else {
		out.println("<script>");
		out.println("alert('환영합니다" + userId + "님!!');");
		out.println("location.href='user_list.jsp';");
		out.println("</script>");
	}
	*/

%>
