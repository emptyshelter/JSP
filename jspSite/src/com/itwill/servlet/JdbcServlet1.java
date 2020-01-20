package com.itwill.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.address.ConnectionFactory;
@WebServlet("/jdbc_servlet1.do")
public class JdbcServlet1 extends HttpServlet {
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		try {
			response.setContentType("text/html;charset=EUC-KR");
			PrintWriter out = response.getWriter();
			String selectAll = "select * from address";
			/*
			WebContent\WEB-INF\lib\classes 에 있는 DriverManger사용
			String driverClass="oracle.jdbc.OracleDriver";
			String url="jdbc:oracle:thin:@182.237.126.19:1521:XE";
			String user="javaspring20";
			String password="javaspring20";
			Class.forName(driverClass); 
			 */
			Connection con = ConnectionFactory.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs =stmt.executeQuery(selectAll);
			
			out.println("<html>");
			out.println("<head>");
			out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"com.css\">");
			out.println("</head>");
			out.println("<body>");
			out.println("<br>");
			out.println("<p align=center><font size=5 color=#0000FF>◈◈ JDBC 테스트 1◈◈</font><br>");
			out.println("<table width=80% align=center border=1 cellspacing=0 bordercolordark=white bordercolorlight=#ADADAD>");
			out.println("<tr bgcolor=#000000 class=t1>");
			out.println("<td align=center height=20 width=15%><font color=#FFFFFF>번호</font></td>");
			out.println("<td align=center height=20 width=15%><font color=#FFFFFF>아이디</font></td>");
			out.println("<td align=center height=20 width=15%><font color=#FFFFFF>이름</font></td>");
			out.println("<td align=center height=20 width=15%><font color=#FFFFFF>전화번호</font></td>");
			out.println("<td align=center height=50 width=50%><font color=#FFFFFF>주소</font></td>");
			out.println("</tr>");
			while(rs.next()) {
				out.println("<tr class=t1>");
				out.println("<td align=center width=15% height=10>"+rs.getInt("no")+"</td>");
				out.println("<td align=center width=15% height=10>"+rs.getString("id")+"</td>");
				out.println("<td align=center width=15% height=10>"+rs.getString("name")+"</td>");
				out.println("<td align=center width=1\5% height=10>"+rs.getString("phone")+"</td>");
				out.println("<td align=center width=50% height=20>"+rs.getString("address")+"</td>");
				
				out.println("</tr>");
			}
			out.println("</table>");
			out.println("</body>");
			out.println("</html> ");
		}catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.html");
		}
	}

}
