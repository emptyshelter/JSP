<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("4.login_post_form.jsp");
		return;
	}
	System.out.println("요청메쏘드:"+request.getMethod());
	response.setContentType("text/html;charset=UTF-8");
	PrintWriter out1=response.getWriter();
	/*
	 * 1.파라메타바끼
	  	아이디:<input type="text" name="id">
		패에쓰:<input type="password" name="pass">
	 */
	request.setCharacterEncoding("EUC-KR");
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	if(id==null || pass==null || id.equals("")|| pass.equals("")) {
		response.sendRedirect("");
		return;
	}
	/*
	 * 2.업무실행(DB)
	 *  id |pass
	 *  ---------
	 *  xxx|1111
	 *  yyy|2222
	 */
	boolean isMember1 = 
			id.equals("xxx")&& pass.equals("1111");
	boolean isMember2 = 
			id.equals("yyy")&& pass.equals("2222");
	
	/*
	 * 3.클라이언트로 결과전송
	 */
	out.println("<h1>POST로그인결과</h1><hr/>");
	if(isMember1 || isMember2) {
		//로그인성공
		out1.println("<h3>"+id+"님 로그인성공</h3><hr>");
		out1.println("<a href='1.hello.jsp'>메인으로</a>");
	}else {
		//로그인실패
		out1.println("<h3>"+id+"님 로그인실패</h3><hr>");
		out1.println("<a href='4.login_post_form.jsp'>다시로그인</a>");
	}


%>