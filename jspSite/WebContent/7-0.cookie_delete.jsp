<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		1. Cookie 얻기 
	*/
	Cookie[] cookies = request.getCookies();
	
	if(cookies!=null){
		for(Cookie cookie: cookies){
			if(cookie.getName().equals("searchKeyword")){
				/*
				2. searchKeyword쿠키 찾아서 setMaxAge(0)로 설정
				*/
				cookie.setValue("");
				cookie.setMaxAge(0);
				/*
				3. 응답객체에 추가(Client로 전송)
				*/
				response.addCookie(cookie);
				break;
			}
		}
	}

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>쿠키삭제</h1><hr/>
<div>
니안에 쿠키없다.
</div>
<div>
	<a href='7-0.cookie_search.jsp'>다시검색[쿠키읽기]</a>
</div>
</body>
</html>