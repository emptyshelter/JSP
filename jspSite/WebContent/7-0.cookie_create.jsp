<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String searchKeyword  =request.getParameter("searchKeyword");
	if(searchKeyword==null || searchKeyword.equals("")){
		response.sendRedirect("7-0.cookie_search.jsp");
		return;
	}
	/*
		1.Cookie객체 생성
	*/
	Cookie searchKeywordCookie = 
		new Cookie("searchKeyword",URLEncoder.encode(searchKeyword, "UTF-8"));
	/*
		2.Cookie객체 설정
			-Cookie의 유효기간 설정하면(파일로 저장)
			-Cookie의 유효기간 설정 안하면(메모리에 저장)
	*/
	searchKeywordCookie.setMaxAge(60*60*24*365);
	/*
		3. 응답객체에 쿠키 설정
	*/
	response.addCookie(searchKeywordCookie);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> 검색 결과[쿠키생성]</h1><hr/>
<div> 니안에 쿠키있다.</div>
<ol>
	<li><%=searchKeyword %>의 검색결과</li>
	<li><%=searchKeyword %>의 검색결과</li>
	<li><%=searchKeyword %>의 검색결과</li>
	<li><%=searchKeyword %>의 검색결과</li>
	<li><%=searchKeyword %>의 검색결과</li>
	<li><%=searchKeyword %>의 검색결과</li>
	<li><%=searchKeyword %>의 검색결과</li>
	<li><%=searchKeyword %>의 검색결과</li>
	<li><%=searchKeyword %>의 검색결과</li>
</ol>
<div>
	<a href="7-0.cookie_search.jsp">다시검색[쿠키읽기]</a>
	<a href="7-0.cookie_delete.jsp">쿠키삭제</a>
	
</div>
</body>
</html>