<%@page import="com.itwill.user.exception.ExistedUserException"%>
<%@page import="com.itwill.user.User"%>
<%@page import="com.itwill.user.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	if (request.getMethod().equalsIgnoreCase("GET")) {
		response.sendRedirect("user_login_form.jsp");
		return;
	}
	
	String password = request.getParameter("password");
	String password2 = request.getParameter("password2");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String userId = request.getParameter("userId");
	String loginId = (String) session.getAttribute("sUserId");
	User updateUser= null;
	try{
		UserService userService = UserService.getInstance();
		updateUser = new User(userId, password, name, email);
		userService.update(updateUser);
		out.println("<script>");
		out.println("alert('" + userId + " 님 회원정보 수정완료!.');");
		out.println("location.href='user_list.jsp';");
		out.println("</script>");
	
	}catch (ExistedUserException e){
		request.setAttribute("msg", e.getMessage());
		request.setAttribute("fuser", updateUser);
		RequestDispatcher rd = request.getRequestDispatcher("user_write_form.jsp");
		rd.forward(request, response);
		return;
		
	}catch (Exception e){
		e.printStackTrace();
		RequestDispatcher rd = request.getRequestDispatcher("user_write_form.jsp");
		rd.forward(request, response);
	}
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>