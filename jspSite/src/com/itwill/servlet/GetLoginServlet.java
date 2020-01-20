package com.itwill.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetLoginServlet
 */
@WebServlet("/get_login.do")
public class GetLoginServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//super.service(request, response);
		if(request.getMethod().equalsIgnoreCase("GET")) {
			this.doGet(request, response);
		}else if(request.getMethod().equalsIgnoreCase("POST")) {
			this.doPost(request, response);
		}
	}
	/*
	 * 1. service  : GET or POST 요청이 모두실행
	 * 2. doGet	   : GET  요청에 의해서만 실행
	 * 2. doPost   : POST  요청에 의해서만 실행
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("요청메소드:"+request.getMethod());
		response.setContentType("text/html;charset=EUC-KR");
		PrintWriter out=response.getWriter();
		/*
		 * 1. 파라미터 받기
			아이디:<input type="text" name="id">
			패스워드:<input type="password" name="pass">
		 */
		request.setCharacterEncoding("EUC-KR");
		String id=request.getParameter("id");
		String pass=request.getParameter("pass");
		if(id==null || pass==null || id.equals("")|| pass.equals("")) {
			response.sendRedirect("05-01.login_get.html");
			return;
		}
		/*
		 * 2. 업무실행 
		 	id | pass
		  -------------
		   xxx | 1111
		   yyy | 2222
		 */
		boolean isMember1 = 
				id.equals("xxx")&&pass.equals("1111");
		boolean isMember2 = 
				id.equals("yyy")&&pass.equals("2222");
		/*
		 * 3. 클라이언트로 결과전송
		 */
		out.println("<h1>GET로그인결과</h1><hr/>");
		if (isMember1 || isMember2) {
			//로그인성공
			out.println("<h3>"+id+"님 로그인 성공</h3><hr/>");
			out.println("<a href='01.HelloServlet.html'>메인으로</a>");
		}else {
			//로그인실패
			out.println("<h3>+"+id+"님 로그인 실패</h3><hr/>");
			out.println("<a href='05-01.login_get.html'>다시로그인</a>");
			
		}
	}

}
