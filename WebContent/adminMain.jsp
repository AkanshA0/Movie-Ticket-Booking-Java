<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<p>
<p>
<h2 style='color:black'>Welcome  ${adminname}</h2>

<!--  form action="LogoutServlet?type=admin" method="post">
	<input type="submit" value="Logout">
	</form -->
<body>

</body>
</html>