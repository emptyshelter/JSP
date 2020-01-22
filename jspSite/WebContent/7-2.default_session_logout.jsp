<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String loginid = (String)session.getAttribute("loginid");
	if(loginid==null){
		response.sendRedirect("7-2.default_session_login_form.jsp");
		return;
	}
%>
    
<%	
	/*
	세션의 무효화	
	*/
	session.invalidate();
	response.sendRedirect("7-2.default_session_login_form.jsp");
%>
<h1>로그아웃</h1><hr>
<div>
	<%=loginid %>님 안녕히가세요.
</div>
<div>
	<a href='7-2.default_session_login_form.jsp'>로그인페이지</a>
	<a href='7-2.default_session_use1.jsp'>회원전용 페이지1</a>
	<a href='7-2.default_session_use2.jsp'>회원전용 페이지2</a>
</div>   