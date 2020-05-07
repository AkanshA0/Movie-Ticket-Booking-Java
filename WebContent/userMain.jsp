<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<style>
.welcome {
  margin: auto;
  width: 100%;
  height: 100%;
  margin-top: 10%
   
  color: #73AD21;
 
}
</style>

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
<br>
<br>
<br>
<br>
<div class="welcome">
   <h1 align="center" style='color:#ff6a00'>Welcome  ${username}</h1>
</div>
    <p>
    <!--  form action="LogoutServlet">
	<input type="submit" value="Logout">
	</form-->
	
</body>
</html>