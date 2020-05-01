<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Signup</title>
</head>
<body>
<form action="SignUp" method="post" >
	Enter Username: <input type="text" name="uname" required="required"><p>
	Enter Full Name: <input type="text" name="fname" required="required"><p>
	Enter Password: <input type="password" name="pwd" required="required"><p>
	
	<input type="submit" value="Signup">
	</form>
	
	
	
	<%
	//response.setHeader("Cache-Control","no-chache,no-store,must-revalidate");
    if(request.getAttribute("errorMessage")!=null)
    {
        out.println("<font color='red'>"+request.getAttribute("errorMessage")+"</font>");
    }
    else if(request.getAttribute("successMessage")!=null)
    {
        out.println("<font color='green'>"+request.getAttribute("successMessage")+"</font>");
    }
%>
<br>
<a href="login.jsp">sign in

	<!--  <input type="file" name="image" required="required"/><br/><br/> -->
</body>
</html>