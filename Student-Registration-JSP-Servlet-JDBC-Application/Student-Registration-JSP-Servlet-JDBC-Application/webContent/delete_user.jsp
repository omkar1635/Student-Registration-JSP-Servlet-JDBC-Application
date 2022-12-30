<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete User</title>

  <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
  
</head>
<body style="background: url(images/signup_image.jpg); background-attachment: fixed; background-size: cover;">
	
<div class="container">
	<div class="vertical-center">
		
	
		<div class="row">
			<div class="col m6 offset-m3">
				<div class="card">
					<div class="card-content">
						<div class="form center-align">
						<h3>Delete User</h3>
						<h5 id="msg"></h5>
							<form action="delete_user" method="post" id="myform">
								<input type="email" placeholder="Enter email to delete" name="email" id="emailid"><br>
								<br><br>
									<button type="submit" class="btn light-blue accent-3">Delete</button>
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
			
			$("#myform").on('submit',function(event){
				event.preventDefault();
				var f = $(this).serialize();
				console.log(f);
				
				$(".loader").show();
				$(".form").hide();
				
				
				$.ajax({
					url:"delete_user",
					data: f,
					type: "POST",
					success: function(data, textStatus ,jqXHR) {
						console.log(data);
						console.log("success.....")
						$(".loader").hide();
						$(".form").show();
						
						if(data.trim()==='deleted'){
							$('#msg').html("User is deleted..!!");
							$('#msg').addClass("red-text")
							$('#email').setText("")
							
						}
						else if(data.trim()==='idnotpresent'){
							$('#msg').html("Email ID is not present..!!");
							$('#msg').addClass("red-text")
						}
						else if(data.trim()==='empty'){
							$('#msg').html("Please enter valid email id..!!");
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