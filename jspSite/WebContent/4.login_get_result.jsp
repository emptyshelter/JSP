<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String method = request.getMethod();
	String msg="";
	if(method.equalsIgnoreCase("GET")){
		msg="GET을......요청하셨네요?";
	}else{
		msg="POST요청하셨네요";
	}
	System.out.println(msg);
	
	response.setContentType("text/html;charset=UTF-8");
	/*
	 * 1.파라미터 받기 
	  	아이디:<input type="text" name="id">
		패에쓰:<input type="password" name="pass">
	 */
	request.setCharacterEncoding("UTF-8");
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	if(id==null || pass==null || id.equals("")|| pass.equals("")) {
		response.sendRedirect("4.login_get_form.jsp");
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
	out.println("<h1>GET로그인결과</h1><hr/>");
	if(isMember1 || isMember2) {
		//로그인성공
		out.println("<h3>"+id+"님 로그인성공</h3><hr>");
		out.println("<a href=''>메인으로</a>");
	}else {
		//로그인실패
		out.println("<h3>"+id+"님 로그인실패</h3><hr>");
		out.println("<a href=''>다시로그인</a>");
	}
%>    
