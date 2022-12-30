<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background: url(images/blur_back_image.jpg); background-attachment: fixed; background-size: cover;">
	<%
		String email =(String) request.getAttribute("email_att");
	%>

	<h1 style="color: white;">This <%= email %> ID is not present</h1>
	<br>
	<br>
	
	<a style="color: white;" href="update_user.jsp">Click here to Go Back</a> 
	
	
</body>
</html>