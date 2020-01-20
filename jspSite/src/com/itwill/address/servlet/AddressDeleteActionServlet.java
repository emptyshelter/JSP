package com.itwill.address.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.address.Address;
import com.itwill.address.AddressService;

/**
 * Servlet implementation class AddressDeleteActionServlet
 */
@WebServlet("/address_delete_action.do")
public class AddressDeleteActionServlet extends HttpServlet {
	private AddressService addressService;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		 * 1.파라미터받기
		 * 2.AddressService.delete메쏘드호출
		 * 3.address_list.do redirection
		 */
		try {
			String noStr = request.getParameter("no");
			System.out.println(noStr+"action");
			if (noStr == null ||noStr.equals("")) {
				response.sendRedirect("address_list.do");
				return;
			}
			addressService = new AddressService();
			int address = addressService.delete(Integer.parseInt(noStr));
			response.sendRedirect("address_list.do");
			
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("address_list.do");
		}
		
	}

}
