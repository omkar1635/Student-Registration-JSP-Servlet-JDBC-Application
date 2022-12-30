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
<title>Update User</title>

</head>
	<body style="background: url(images/signup_image.jpg); background-attachment: fixed; background-size: cover;">
	<div class="container">
	<div class="vertical-center">
		<div class="row">
			<div class="col m6 offset-m3">
				<div class="card">
					<div class="card-content">
						<div class="form center-align">
							<h3>Update User</h3>
							<h5 id="msg"></h5>
							<form action="update_user" method="post" id="myform">
								<input type="email" placeholder="Enter email to update" name="email" ><br>
								<button type="submit" id="value_button" class="btn light-blue accent-3">Update</button>
							</form>
</body>
</html>