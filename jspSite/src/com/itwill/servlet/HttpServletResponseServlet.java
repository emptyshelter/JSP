package com.itwill.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HttpServletResponseServlet
 */
@WebServlet("/response.do")
public class HttpServletResponseServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=EUC-KR");
		PrintWriter out = response.getWriter();
		/* 요청 URL
		 * 	http://192.168.15.20/servletSite/response.do?
		 * 	http://192.168.15.20/servletSite/response.do?cmd=
		 * 	http://192.168.15.20/servletSite/response.do?cmd=1
		 * 	http://192.168.15.20/servletSite/response.do?cmd=2
		 * 	http://192.168.15.20/servletSite/response.do?cmd=3
		 */
		String cmd = request.getParameter("cmd");
		out.println("<h1>HttpServletResponse</h1><hr>");
		if (cmd == null || cmd.equals("")) {
			//response.do ---> null
			//response.do ---> cmd=""
//			out.println("<p>잘못된요청입니다.</p>");
			response.sendRedirect("04.HttpServletResponse.html");
			return;
		}else {
			if(cmd.equals("1")) {
				out.println("<p>정상응답입니다.</p>");
			}else if(cmd.equals("2")) {
				/*
				 * error
				 *  1.응답라인  
				 *     HTTP/1.1 404
				 *  2.응답헤더
				 *        
				 */
//				response.sendError(404);
//				response.sendError(HttpServletResponse.SC_NOT_FOUND);
//				response.sendError(403);
				response.sendError(500);
			}else if(cmd.equals("3")) {
				/*
				 * redirection
				 * 	1.응답라인
				 * 		HTTP/1.1 302
				 * 	2.응답헤더
				 * 		redirection url포함 
				 */
//				response.sendRedirect("http://www.cjmall.co.kr");
//				response.sendRedirect("01.Hello.html");
				response.sendRedirect("gugudan.do");
				/*
				 * 3. 응답바디데이터를 전송하지 않는다.
				 */
				
			}else {
				response.sendRedirect("04.HttpServletResponse.html");
			}
		}
		return;
	}

}
