<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String loginId = (String) session.getAttribute("sUserId");
%>			
<p>
	<strong>메 뉴</strong>
</p>
<ul>	

		<% if(loginId==null || loginId.equals("")){%>
		<li><a href="user_login_form.jsp">로그인</a></li>
		<li><a href="user_write_form.jsp">회원가입</a></li>
		<%}else { %>
		<li><a href="user_logout.jsp"><%=loginId %> 님 로그아웃</a></li>
		<li><a href="user_list.jsp">회원리스트</a></li>
		<%} %>
</ul>
