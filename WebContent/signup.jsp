<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<style>
.center {

 
  width: 40%;
  margin: 0 auto;
  margin-top: 8%;
  border: 3px solid #73AD21;
  padding: 10px;
  background: white;
}

.heading {
  margin: auto;
  width: 100%;
  border: 3px solid #73AD21;
  background: black;
  color: #73AD21;
}
</style>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Signup</title>
</head>
<div class="heading">
<h1 align="center">Movie Booking</h1>
</div>
<body style="background-color:black;">
<div class="center">
<form action="SignUp" method="post" >
	<h4>Enter Username: <input type="text" name="uname" required="required"><p>
	Enter Full Name: <input type="text" name="fname" required="required"><p>
	Enter Password: <input type="password" name="pwd" required="required"><p>
	
	<input type="submit" value="Signup"></h4>
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

<h4><a href="login.jsp">sign in</a></h4>
<p>

<!--  input type="button" onclick="alert('Hello World!')" value="Click Me!" -->



	<!--  <input type="file" name="image" required="required"/><br/><br/> -->
	</div>
</body>
</html>