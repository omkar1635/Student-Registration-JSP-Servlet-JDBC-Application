<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- Added this two lines from materializecss.com website for font operaitons -->

  <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
     

<meta charset="UTF-8">
<title>Register User</title>
</head>



<body style="background: url(images/signup_image.jpg); background-attachment: fixed; background-size: cover;" >
	
	<%
	String email =(String) request.getAttribute("email_att");
	String fname =(String) request.getAttribute("firstname_att");
	String lname =(String) request.getAttribute("lastname_att");
	String pass  = (String) request.getAttribute("password_att");

	
	%>

	<div class="container">
	<div class="vertical-center">
		
	
		<div class="row">
			<div class="col m6 offset-m3">
				<div class="card">
					<div class="card-content">
						<div class="form center-align">
						<h3>Update here..!!</h3>
						<h5 id="msg"></h5>
							<form action="Update_user_Final" method="post" id="myform">
								First Name <input type="text" value="<%= fname%>" name="firstname" id="firstnameid"><br>
								Last Name <input type="text" value="<%= lname%>" name="lastname" id="lastnameid"><br>
								Email <input type="email" value="<%= email%>" name="email" id="emailid"><br>
								Password <input type="text" value="<%= pass%>" name="password" id="passwordid"><br><br>
								<button type="submit" class="btn light-blue accent-3">Update</button>
								
								<br>
								<a id="home" href="index.html">Go to Homepage</a>
							</form>
						</div>
						
						<div class="loader center-align" style="margin-top: 10px; display: none" >
								 <div class="preloader-wrapper big active">
							    <div class="spinner-layer spinner-blue-only">
							      <div class="circle-clipper left">
							        <div class="circle"></div>
							      </div><div class="gap-patch">
							        <div class="circle"></div>
							      </div><div class="circle-clipper right">
							        <div class="circle"></div>
							      </div>
							    </div>
							  </div>
							
							  <h5>Please wait...</h5>
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
			$('#home').hide();
			$("#myform").on('submit',function(event){
				event.preventDefault();
				var f = $(this).serialize();
				console.log(f);
				
				$(".loader").show();
				$(".form").hide();
				
				
				$.ajax({
					url:"Update_user_Final",
					data: f,
					type: "POST",
					success: function(data, textStatus ,jqXHR) {
						console.log(data);
						console.log("success.....")
						$(".loader").hide();
						$(".form").show();
						
						if(data.trim()==='updated'){
							$('#msg').html("Values are updated..!!");
							$('#msg').addClass("green-text")
							$('#home').show();
						}
						else if(data.trim()==='exception'){
							$('#msg').html("There is some exception..!!");
							$('#msg').addClass("red-text")
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