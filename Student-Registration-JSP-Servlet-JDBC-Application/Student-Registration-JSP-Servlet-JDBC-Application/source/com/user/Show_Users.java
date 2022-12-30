package com.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.result.Row;

public class Show_Users extends HttpServlet {
	
	
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		Connection connection;
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/comeback","root","root");
		return connection;
	
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter printWriter = response.getWriter();
		
		printWriter.print("<!DOCTYPE html>");
		printWriter.print("<html>");
				printWriter.print("<body>");
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
//		PrintWriter printWriter = response.getWriter();
		String username = request.getParameter("username");
	    String password = request.getParameter("password");
		String email = request.getParameter("email");
		try
		{
		
			Connection connection = getConnection();
				Scanner scanner = new Scanner(System.in);
				Statement stmt1=connection.createStatement();  
				ResultSet rs1=stmt1.executeQuery("select * from student_class_servletjsp_project");
				int cnt1=0;
				if(rs1.next()==false) {
					printWriter.println("<h2>No data present in database..!!</h2>");
				}
				else {
					
//					printWriter.print("<table>");
//					printWriter.print("<tr>");
//					printWriter.print("<td>Username</td>");
//					printWriter.print("<td>Email</td>");
//					printWriter.print("<td>Password</td>");
//					printWriter.print("</tr>");
//					while(rs1.next()) {
//						printWriter.print("<tr>");
//						printWriter.print("<td>"+rs1.getString(2)+"</td>");
//						printWriter.print("<td>"+rs1.getString(3)+"</td>");
//						printWriter.print("<td>"+rs1.getString(4)+"</td>");
//						printWriter.print("</tr>");
//					}
//					printWriter.print("</table>");
					
					
					
					
				}
				
		
				}catch (Exception e) {
					System.out.println("Exception message -> "+e);
				}
		
			printWriter.close();	
			printWriter.print("</body>");
			printWriter.print("</html>");
	}
	
}
