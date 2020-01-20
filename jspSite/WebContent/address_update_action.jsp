<%@page import="com.itwill.address.Address"%>
<%@page import="com.itwill.address.AddressService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		/*
		 * 1.파라메타바끼
		 * 2.AddressService.update메쏘드호출
		 * 3.address_detail.jsp 로 redirection
		 */
request.setCharacterEncoding("UTF-8");
String noStr = request.getParameter("no");
String id = request.getParameter("id");
String name =request.getParameter("name");
String phone =request.getParameter("phone");
String address =request.getParameter("address");
try {
	AddressService addressService = new AddressService();
	int result = addressService.update(new Address(Integer.parseInt(noStr), id, name, phone, address));
	if (result >= 0) {
		response.sendRedirect("address_detail.jsp?no="+noStr+"");
	}
}catch (Exception e) {
	e.printStackTrace();
}
%>