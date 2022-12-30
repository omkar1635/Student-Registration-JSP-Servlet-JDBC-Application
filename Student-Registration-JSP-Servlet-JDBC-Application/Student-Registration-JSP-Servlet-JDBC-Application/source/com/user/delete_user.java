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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class delete_user
 */
@WebServlet(urlPatterns = "/delete_user")
public class delete_user extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		Connection connection;
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/comeback","root","root");
		return connection;
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter printWriter = response.getWriter();
		try {
			Thread.sleep(500);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String email = request.getParameter("email");
		if(email.equals("")) {
			printWriter.print("empty");
		}
		else {
			
		}
		try
		{
			Connection connection = getConnection();
				Scanner scanner = new Scanner(System.in);
				Statement stmt1=connection.createStatement();  
				ResultSet rs1=stmt1.executeQuery("select * from student_class_servletjsp_project");
				
				int cnt1=0;
				while(rs1.next()) {
					if(rs1.getString(3).equals(email)) {
						cnt1++;
						break;
					}
					
				}
				if(cnt1==0) {
					printWriter.println("idnotpresent");
					
				}
				else {

						PreparedStatement preparedStmt = connection.prepareStatement("delete from student_class_servletjsp_project where email = ?");
						preparedStmt.setString(1,email);
						preparedStmt.execute();
						printWriter.println("deleted");
						
//						
				}
				}catch (Exception e) {
					System.out.println("Exception message -> "+e);
					}
			printWriter.close();	
	        
		}
	}


