<%@page import="com.itwill.guest.Guest"%>
<%@page import="com.itwill.guest.GuestService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
1.파라메타바끼
2.GuestService.updateGuest()메쏘드호출
3.true -->guest_view.jsp redirection
  false-->guest_error.jsp redirection
*/
request.setCharacterEncoding("UTF-8");
String noStr = request.getParameter("guest_no");
if(noStr == null|| noStr.equals("")){
	response.sendRedirect("guest_view.jsp");
	return;
}
String name = request.getParameter("guest_name");
String email = request.getParameter("guest_email");
String home = request.getParameter("guest_homepage");
String title = request.getParameter("guest_title");
String content = request.getParameter("guest_content");
String date = "sysdate";
if(name==null || name.equals("")||content == null||content.equals("")){
	out.println("<script>");
	out.println("alert('방명록을 정확하게 입력해주세요.');");
	out.println("</script>");
	return;
}
GuestService guestService = new GuestService();
boolean updateGuest =
			guestService.updateGuest(new Guest(Integer.parseInt(noStr),name,date,email,home,title,content));
if(updateGuest){
	response.sendRedirect("guest_view.jsp");
}else{
	response.sendRedirect("guest_error.jsp");
}



%>