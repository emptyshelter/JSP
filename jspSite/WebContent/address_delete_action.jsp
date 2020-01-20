<%@page import="com.itwill.address.AddressService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		/*
		 * 1.파라메타바끼
		 * 2.AddressService.delete메쏘드호출
		 * 3.address_list.jsp 로 redirection
		 */

String noStr = request.getParameter("no");
try {
	if (noStr == null ||noStr.equals("")) {
		response.sendRedirect("address_list.jsp");
		return;
	}
	AddressService addressService = new AddressService();
	int address = addressService.delete(Integer.parseInt(noStr));
	response.sendRedirect("address_list.jsp");
	
} catch (Exception e) {
	e.printStackTrace();
	response.sendRedirect("address_list.jsp");
}
%>