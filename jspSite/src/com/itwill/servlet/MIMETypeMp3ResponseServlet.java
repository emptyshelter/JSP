package com.itwill.servlet;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MIMETypeImageResponseServlet
 */
@WebServlet("/response_mp3.do")
public class MIMETypeMp3ResponseServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("audio/mpeg");
		//JSP는 PrintWriter가 이미 존재하기 떄문에 OutputStream을 사용할 수 없다.
		OutputStream out = response.getOutputStream();
		/*
		 * ServletContext: context(site)의 정보를 가지고있는 객체 
		 */
		ServletContext servletContext = this.getServletContext();
		String contextRealPath = servletContext.getRealPath("image/a.mp3");
		System.out.println("contextRealPath:"+contextRealPath);
		FileInputStream fis = new FileInputStream(contextRealPath);
		while (true) {
			int readByte = fis.read();
			if (readByte == -1)break; 
			out.write(readByte);
		}
		fis.close();
		
		
		
	}

}
