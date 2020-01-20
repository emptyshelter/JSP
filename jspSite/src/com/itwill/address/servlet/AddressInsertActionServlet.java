package com.itwill.address.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.address.Address;
import com.itwill.address.AddressDao;
import com.itwill.address.AddressService;

/**
 * Servlet implementation class AddressInsertActionServlet
 */
@WebServlet("/address_insert_action.do")
public class AddressInsertActionServlet extends HttpServlet {
	private AddressService addressService;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("address_list.do");
		return;
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 1. 파라미터 받기
		 * 2. AddressService.insert메소드 호출
		 * 3. address_list.do로 redirection
		 */
		try {
			response.setContentType("text/html; charset=EUC-KR");
			PrintWriter out = response.getWriter();
			request.setCharacterEncoding("EUC-KR");
			String id = request.getParameter("id");
			String name =request.getParameter("name");
			String phone =request.getParameter("phone");
			String address =request.getParameter("address");
			System.out.println(id+name+phone+address+"insert");
			if (id == null || id.equals("")) {
				out.println("<script>");
				out.println("alert('회원정보를 정확하게 입력해주세요.');");
				out.println("history.back();");
				out.println("</script>");
			}else {
			addressService = new AddressService();
			addressService.insert(new Address(0, id, name, phone, address));
			response.sendRedirect("address_list.do");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("address_insert_form.do");
		}
		
	}

}
