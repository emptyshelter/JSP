<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! 
int count = 0;
public void jspInit(){
	System.out.println("1.jspInit(): 객체 생성시 생성장 호출후 단 한번 호출되는 메소드 [객체초기화,리소스획득]");
	
}
public void jspDestroy(){
	System.out.println("2.jspInit(): 객체가 메모리에서 해제시 호출 [리소스 반환]");
}
%>
<%
	System.out.println("2. jspService() 호출");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body bgcolor=#40e0d0 style="font-size: 9pt; line-height: 140%;">
	<center>
		현재까지 페이지뷰 수  <font color=#0000FF> <% out.println(++count);%> </font> 번입니다
	</center>
</body>
</html>
