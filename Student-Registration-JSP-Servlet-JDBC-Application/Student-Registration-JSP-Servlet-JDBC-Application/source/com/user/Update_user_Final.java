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
 * Servlet implementation class Update_user_Final
 */
@WebServlet(urlPatterns = "/Update_user_Final")
public class Update_user_Final extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		Connection connection;
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/comeback","root","root");
		return connection;
	
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
				String sqlString = "update student_class_servletjsp_project set firstname='"+firstname+"', lastname='"+lastname+
						"',email='"+email+"', password ='"+password+"' where email = '"+email+"'";
				PreparedStatement preparedStatement = connection.prepareStatement(sqlString);
				preparedStatement.execute();
				
				printWriter.print("updated");
		
		}catch (Exception e) {
			System.out.println("Exception message -> "+e);
			printWriter.print("exception");
		}
		printWriter.close();	
	        
		
		
	}

}
