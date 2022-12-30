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

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.event.TreeWillExpandListener;

/**
 * Servlet implementation class update_user
 */
@WebServlet(urlPatterns = "/update_user")
public class update_user extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	  public Connection getConnection() throws ClassNotFoundException, SQLException
	  { 
		  Connection connection; Class.forName("com.mysql.cj.jdbc.Driver");
		  connection =
				  DriverManager.getConnection("jdbc:mysql://localhost:3306/comeback","root","root"); return connection;
	 
	  }
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			Thread.sleep(2000);
		} catch (InterruptedException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		PrintWriter printWriter = response.getWriter();
		
		String email = request.getParameter("email");
		System.out.println(email + "   Email ID ");
		if(email.equals("")) {
			printWriter.print("empty");
		}
		else {
			try
			{
					Connection connection = getConnection();
					Scanner scanner = new Scanner(System.in);
					PreparedStatement stmt1=connection.prepareStatement("select * from student_class_servletjsp_project"); 
					ResultSet rs1=stmt1.executeQuery();
					
					int cnt1=0;
					while(rs1.next()) {
						if(rs1.getString(3).equals(email)) {
							cnt1++;
							break;
						}
					}
					if(cnt1==0) {
						
						System.out.println("ID is not present in database");
						RequestDispatcher requestDispatcher = request.getRequestDispatcher("IdNotPresent.jsp");
						request.setAttribute("email_att", email);
						requestDispatcher.forward(request, response);
						System.out.println("ending request dispatcher");
						
						
					}
					else {
							String first_name="",last_name="",emailid="",password="";
							PreparedStatement preparedStmt = connection.prepareStatement("select * from student_class_servletjsp_project where email = ?");
							preparedStmt.setString(1,email);
							ResultSet resultSet =  preparedStmt.executeQuery();
							
							while(resultSet.next()) {
								first_name = resultSet.getString(1);
								last_name = resultSet.getString(2);
								emailid = resultSet.getString(3);
								password = resultSet.getString(4);
							}
							System.out.println("starting request dispatcher");
							RequestDispatcher requestDispatcher = request.getRequestDispatcher("update_details_page.jsp");
							System.out.println(emailid+"  "+first_name+"   "+last_name+"  "+password);
							request.setAttribute("email_att", emailid);
							request.setAttribute("firstname_att",first_name );
							request.setAttribute("lastname_att",last_name);
							request.setAttribute("password_att",password );
							requestDispatcher.forward(request, response);
							System.out.println("ending request dispatcher");
					}
					}catch (Exception e) {
						System.out.println("Exception message -> "+e);
						}
		}
		
			printWriter.close();	
	        
		}
	

}
