package com.itwill.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "imagecounter", urlPatterns = { "/imagecounter.do", "/imagecounter.nhn", "/imagecounter.itwill" })
public class ImageCounterServlet extends HttpServlet {
	private int count;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("2.service() 요청시마다호출:" + Thread.currentThread().getName() + "-->" + request.getRemoteAddr()
				+ "[" + request.getRemotePort() + "]");
		response.setContentType("text/html;charset=EUC-KR");
		PrintWriter out = response.getWriter();
		out.println(
				"<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>카운트다운.....이요....</title>");
		out.println("</head>");
		out.println("<body bgcolor=#40e0d0 style=\"font-size: 9pt; line-height: 140%;\">");
		out.println("<center>");
		out.println("현재까지의 페이지뷰수 ");
		out.println("<meta http-equiv=\"refresh\" content=\"3\">");
//		String countImage = ++count+"";
		String countImage = Integer.toString(++count);
		for (int i = 0; i < countImage.length(); i++) {
			out.println("<img src= http://192.168.15.20/servletSite/image/"+countImage.charAt(i)+".png>");
		}
		out.println("[" + countImage + "] 번입니다");
		out.println("</center>");
		out.println("</body>");
		out.println("</html>");
	}

}
