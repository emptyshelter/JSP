package com.itwill.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GugudanServlet
 */
public class GugudanServlet extends HttpServlet {
	public GugudanServlet() {
		// TODO Auto-generated constructor stub
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=EUC-KR");
		PrintWriter out=response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>하이 서블릿</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<center>");
		out.println("<center><h1>서블릿 잘났어 정말 최악이야!!!!!!!!!</h1><center>");
		out.println("<img src='./tomcat.gif'/>");
		out.println("<center><h2>서블릿 구구단</h2></center>");
		out.println("<table border=1 width=600 bgcolor=#CCFF33 bordercolordark=#FF6600 cellspacing=0>");
		out.println("<th align=center colspan = \"9\">구구구구구구구구구구구구단 젠장</th>");
		out.println("<tr>");
		for (int i = 1; i < 10; i++) {
			for (int j = 2; j < 10; j++) {
				out.println("<td align=center>"+j+"X"+i+" ="+(i*j)+"</td>");
					if (j==9) {
						out.println("</tr>");
					}
			}
		}
		out.println("<br/>");
		out.println("<br/>");
		out.println("<tr>");
		for (int i = 2; i < 10; i++) {
			out.println("<th>"+i+"단"+"</th>"); 
		}
		out.println("</table>");
		out.println("<table border=1 width=600 bgcolor=#CCFF33 bordercolordark=#FF6600 cellspacing=0>");
		out.println("<tr>");
		for (int i = 1; i < 10; i++) {
			for (int j = 2; j < 10; j++) {
				out.println("<td align=center>"+j+"X"+i+" ="+(i*j)+"</td>");
					if (j==9) {
						out.println("</tr>");
					}
			}
		}
		out.println("<tr>");
		out.println("</table>");
		out.println("<br/>");
		out.println("</center>");
		out.println("</body>");
		out.println("<html>");
	}

}












