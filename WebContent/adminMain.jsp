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
<%
	//response.setHeader("Cache-Control","no-chache,no-store,must-revalidate");
if(session.getAttribute("adminname")==null){
	
	response.sendRedirect("login.jsp");
}
%>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>admin</title>
</head>
<%@ include file = "admin_header.jsp" %>
<br>
<br>
<br>
<br>
<div class="welcome">
   <h1 align="center" style='color:#ff6a00'>Welcome  ${adminname}</h1>
</div>

<!--  form action="LogoutServlet?type=admin" method="post">
	<input type="submit" value="Logout">
	</form -->
<body>

</body>
</html>