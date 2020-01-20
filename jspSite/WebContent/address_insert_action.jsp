<%@page import="com.itwill.address.Address"%>
<%@page import="com.itwill.address.AddressService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
		/*
		 * 1.파라메타바끼
		 * 2.AddressService.insert메쏘드호출
		 * 3.address_list.jsp 로 redirection
		 */
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String name =request.getParameter("name");
		String phone =request.getParameter("phone");
		String address =request.getParameter("address");
		if (id == null || id.equals("")) {
			out.println("<script>");
			out.println("alert('회원정보를 정확하게 입력해주세요.');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			AddressService addressService = new AddressService();
			addressService.insert(new Address(0, id, name, phone, address));
			response.sendRedirect("address_list.jsp");
		}
%>