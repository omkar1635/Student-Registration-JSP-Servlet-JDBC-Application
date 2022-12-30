package com.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import java.sql.*;
import java.util.Scanner;

public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		Connection connection;
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/comeback","root","root");
		return connection;
	
	}
 
    public register() {
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			response.setContentType("text/html");
			PrintWriter printWriter = response.getWriter();
			String firstname = request.getParameter("firstname");
			String lastname = request.getParameter("lastname");
		    String password = request.getParameter("password");
			String email = request.getParameter("email");
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
					if(cnt1!=0) {
						printWriter.println("idpresent");
						
					}
					else {
						
								
							String sql = " insert into student_class_servletjsp_project(firstname,lastname,email,password)"+" values (?,?, ?, ?)";
							
							
							PreparedStatement preparedStmt = connection.prepareStatement(sql);
							preparedStmt.setString(1,firstname);
							preparedStmt.setString(2,lastname);
							preparedStmt.setString(3, email);
							preparedStmt.setString(4, password);
							
							preparedStmt.execute();
							printWriter.println("saved");
							
//							
					}
					}catch (Exception e) {
						System.out.println("Exception message -> "+e);
						}
				printWriter.close();	
		        
			}


	}


