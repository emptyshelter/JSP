<%--@page import="com.oreilly.servlet.MultipartRequest"--%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("A.file_upload.jsp");
		return;
	}
	String contextRealPath = application.getRealPath("upload");
	String saveDirectory = contextRealPath;
	//application.log("contextRealPath:"+contextRealPath);
	//System.out.println("contextRealPath:"+contextRealPath);
	MultipartRequest multipartyRequest = 
			new MultipartRequest(request,saveDirectory,1024*1024*100,"UTF-8");
	/*
	MultipartRequest객체생성이후에는
	request를사용해서 파라메타를 읽을수없다.
	*/
	String name1 = request.getParameter("name");
	/*
	MultipartRequest객체를 사용해서 파라메타를 읽어야한다.
	*/
	String name2 = multipartyRequest.getParameter("name");
	String fileone= multipartyRequest.getFilesystemName("fileone");
	String filetwo= multipartyRequest.getFilesystemName("filetwo");

%>
<h1>Upload Data</h1>
<pre>C:\JAVA_SPRING\Program\spring-tool-suite-3.9.11.RELEASE-e4.14.0-win32-x86_64\sts-bundle\pivotal-tc-server\instances\base-instance\wtpwebapps\jspSite\upload</pre>
<hr/>
<br/>
<br/>
<br/>
<li>name1:<%=name1 %></li>
<li>name2:<%=name2 %></li>
<li>fileone:<%=fileone %></li>
<li>filetwo:<%=filetwo %></li>
