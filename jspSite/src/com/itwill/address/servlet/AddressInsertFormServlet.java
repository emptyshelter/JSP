package com.itwill.address.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddressInsertFormServlet
 */
@WebServlet("/address_insert_form.do")
public class AddressInsertFormServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String name =request.getParameter("name");
		String phone =request.getParameter("phone");
		String address =request.getParameter("address");
		try {
		response.setContentType("text/html; charset=EUC-KR");
		PrintWriter out = response.getWriter();
		System.out.println();
		out.println("<h1 align =\"center\"><b>Address 쓰기폼<b></h1>");
		out.println("<div>");
		out.println("	<a href='address_list.do'>주소록리스트</a>");
		out.println("</div>");
		out.println("<form method='post' action='address_insert_action.do'>");
//		out.println("아이디--<input type = \"text\" name= 'id' value="+request.getParameter("id")+"><br>");
//		out.println("이름----<input type = \"text\" name= 'name' value="+request.getParameter("name")+"><br>");
//		out.println("전화번호<input type = \"text\" name= 'phone' value="+request.getParameter("phone")+"><br>");
//		out.println("주소----<input type = \"text\" name= 'address' value="+request.getParameter("address")+"><br>");
		out.println("아이디--<input type = \"text\" name=\"id\"><br>");
		out.println("이름----<input type = \"text\" name=\"name\"><br>");
		out.println("전화번호<input type = \"text\" name=\"phone\"><br>");
		out.println("주소----<input type = \"text\" name=\"address\"><br>");
		out.println("<input type = 'submit' value ='쓰기'>");
		out.println("<input type = 'reset' value ='폼지우기'>");
		out.println("</form>");
		}
		catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("address_list.do");
		}

	}

}
