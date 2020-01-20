package com.itwill.address.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.address.Address;
import com.itwill.address.AddressService;

/**
 * Servlet implementation class AddressUpdateActionServlet
 */
@WebServlet("/address_update_action.do")
public class AddressUpdateActionServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 1. 파라미터 받기
		 2. AddressService update메소드호출
		 3. address_detail.do로 redirection
		 */
		request.setCharacterEncoding("EUC-KR");
		String noStr = request.getParameter("no");
		String id = request.getParameter("id");
		String name =request.getParameter("name");
		String phone =request.getParameter("phone");
		String address =request.getParameter("address");
		try {
			AddressService addressService = new AddressService();
			int result = addressService.update(new Address(Integer.parseInt(noStr), id, name, phone, address));
			if (result >= 0) {
				response.sendRedirect("address_detail.do?no="+noStr+"");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
