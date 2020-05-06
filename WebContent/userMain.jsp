<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>movies</title>
</head>
<%@ include file = "user_header.jsp" %>
<body>

<%
	//response.setHeader("Cache-Control","no-chache,no-store,must-revalidate");
	if(session.getAttribute("username")==null){
		
		response.sendRedirect("login.jsp");
	}
%>
<p>
<p>
   <h2 style='color:black'>Welcome  ${username}</h2>
    <p>
    <!--  form action="LogoutServlet">
	<input type="submit" value="Logout">
	</form-->
	
</body>
</html>