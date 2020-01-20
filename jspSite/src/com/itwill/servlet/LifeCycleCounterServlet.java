package com.itwill.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "lifecycle",
			urlPatterns = { "/lifecycle.do",
							"/lifecycle.nhn",
							"/lifecycle.itwill"} )
public class LifeCycleCounterServlet extends HttpServlet {
    private int count;
	public LifeCycleCounterServlet() {
    	System.out.println("0.LifeCycleCounterServlet()생성자:"+this);
    }

    @Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		count=0;
		System.out.println("1.init() 생성자호출직후에 단한번호출[객체초기화,리소스획득] ");
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println
		("2.service() 요청시마다호출"+Thread.currentThread().getName()+"-->"+request.getRemoteAddr()+"["+request.getRemotePort()+"]");
		response.setContentType("text/html;charset=EUC-KR");
		PrintWriter out = response.getWriter();
		
		out.println("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Insert title here</title>");
		out.println("</head>");
		out.println("<body bgcolor=#40e0d0 style=\"font-size: 9pt; line-height: 140%;\">");
		out.println("<center>");
		synchronized (this) {
			out.println("현재까지의 방문자수는 <font color=#0000FF> "+ ++count +" </font> 명입니다.");
		}
		out.println("</center>");
		out.println("</body>");
		out.println("</html>");
		
	}
	@Override
	public void destroy() {
		System.out.println("3.destroy() 객체가 메모리에서 해제될때 호출");
	}

}













