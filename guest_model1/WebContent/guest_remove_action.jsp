<%@page import="com.itwill.guest.GuestService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	1.파라미터 받기
	2.GuestService.deleteGuest()메소드 호출
	3.true-->guest_list.jsp redirection
	  false-->guest_error.jsp redirection
	
	*/
	request.setCharacterEncoding("UTF-8");
	String noStr = request.getParameter("guest_no");
	if(noStr == null|| noStr.equals("")){
		response.sendRedirect("guest_list.jsp");
		return;
	}
	GuestService guestService = new GuestService();
	boolean deleteGuest = guestService.deleteGuest(Integer.parseInt(noStr));
	
	if(deleteGuest){
		response.sendRedirect("guest_list.jsp");
	}else{
		response.sendRedirect("guest_error.jsp");
	}
	
%>
