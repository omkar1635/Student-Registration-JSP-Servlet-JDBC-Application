<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*,java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Users</title>
</head>
<style>    
	table, th, td {    
	border: 1px solid black;  
	margin-left: auto;  
	margin-right: auto;   
	width: 500px;  
	text-align: center;  
	font-size: 20px;  
	}    
</style>


<body style="background: url(images/signup_image.jpg); background-attachment: fixed; background-size: cover;" >
		
		<%!ResultSet rs1;
		Connection connection;
		Scanner scanner;
		Statement stmt1;
		PrintWriter printWriter ;
		%>
		
		
	<div class="container">
	<div class="vertical-center">
		<div class="row">
			<div class="col m6 offset-m3">
				<div class="card">
					<div class="card-content">
						<div class="form center-align">
						
						<h5 id="msg"></h5>
						<table border="1" bgcolor="white">    
							<tr>  
								<th>First Name</th>  
								<th>Last Name</th>  
								<th>Email</th>  
								<th>Password</th>  
							</tr>    
						<%
						
						 printWriter = response.getWriter();
						Class.forName("com.mysql.cj.jdbc.Driver");
						connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/comeback","root","root");
						try
						{
					
								 scanner = new Scanner(System.in);
								 stmt1=connection.createStatement();  
								 rs1=stmt1.executeQuery("select * from student_class_servletjsp_project");
								int cnt1=0;
								if(rs1.next()==false) {
									/* printWriter.println("<h2>No data present in database..!!</h2>"); */
								}
								else {
									
									while(rs1.next()) {
										String col1,col2,col3,col4;
										col1=rs1.getString(1);
										col2=rs1.getString(2);
										col3=rs1.getString(3);
										col4=rs1.getString(4);
										
										
									%>
					
									<tr>
										<th><%= col1%></th><th><%= col2%></th><th><%= col3%></th><th><%= col4%></th>
									</tr>
					
									<%
								
									}		
									
								}
								
						
								}catch (Exception e) {
									System.out.println("Exception message -> "+e);
								}
						
						%>    
						</table>    
						</div>
						
						
					</div>			
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"
  integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
  crossorigin="anonymous"></script>
  
  
  
	<script>
		
		$(document).ready(function(){
			console.log("Page isr ready for run..!!");
			
			$("#myform").on('submit',function(event){
				event.preventDefault();
				var f = $(this).serialize();
				console.log(f);
				
				$(".loader").show();
				$(".form").hide();
				
				
				$.ajax({
					url:"register",
					data: f,
					type: "POST",
					success: function(data, textStatus ,jqXHR) {
						console.log(data);
						console.log("success.....")
						$(".loader").hide();
						$(".form").show();
						
						if(data.trim()==='idpresent'){
							$('#msg').html("Email ID is already present..!!");
							$('#msg').addClass("red-text")
						}
						else if(data.trim()==='saved'){
							$('#msg').html("Successfully registerted..!!");
							$('#msg').addClass("green-text")
						}
						
						else{
							$('#msg').html("Something went wrong in server..!!");
							$('#msg').addClass("red-text")
						}
						
					},
					error: function(jqXHR, textStatus, errorThrown){
						console.log(data);
						console.log("Error.....");
						$(".loader").hide();
						$(".form").show();
						$('#msg').html("Something went wrong in server..!!");
					}
				})
				
				
				
			})
		})
	</script>

</body>
</html>