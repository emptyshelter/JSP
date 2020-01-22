<%@page import="com.itwill.guest.Guest"%>
<%@page import="com.itwill.guest.GuestService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	1.파라미터받기
	2.GuestService.insertGuest()메쏘드호출
	3.true -->guest_list.jsp redirection
      false-->guest_error.jsp redirection
	*/
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("guest_name");
	String email = request.getParameter("guest_email");
	String home = request.getParameter("guest_homepage");
	String title = request.getParameter("guest_title");
	String content = request.getParameter("guest_content");
	String date = "sysdate";
	if(name==null || name.equals("")||content == null||content.equals("")){
		out.println("<script>");
		out.println("alert('방명록을 정확하게 입력해주세요.');");
		out.println("history.back();");
		out.println("</script>");
	}
	GuestService guestService = new GuestService();
	boolean insertGuest = guestService.insertGuest(new Guest(0,name,date,email,home,title,content));
	if(insertGuest){
		response.sendRedirect("guest_list.jsp");
	}else{
		response.sendRedirect("guest_error.jsp");
	}
%>