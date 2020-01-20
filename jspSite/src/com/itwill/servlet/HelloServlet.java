package com.itwill.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// #2-1. 클라이언트에 전송할 데이타의 타입(종류)설정
		response.setContentType("text/html;charset=EUC-KR");
		// #2-2. 클라이언트에데이타를 전송하기위한 출력스트림 생성
		PrintWriter out=response.getWriter();
		// #2-3. 클라이언트로 데이타(HTML) 전송
		for (int i = 0; i < 10; i++) {
			out.println("<h1>Hello Servlet!!!!(안녕서블릿)"+(i+1)+"</h1><hr>");
		}
	}
}
