<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>movies</title>
</head>
<body>

<%
	response.setHeader("Cache-Control","no-chache,no-store,must-revalidate");
	if(session.getAttribute("username")==null){
		
		response.sendRedirect("login.jsp");
	}
%>
    Welcome ${username}
    
    <form action="LogoutServlet">
	<input type="submit" value="Logout">
	</form>
	
	<a href="image.jsp">movies
	<br>
	<a href="mybookings.jsp">my bookings
</body>
</html>