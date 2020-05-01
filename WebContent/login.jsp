<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>

	<form action="LoginServlet" method="post">
	Enter Username: <input type="text" name="uname"><p>
	Enter Password: <input type="password" name="pwd"><p>
	<input type="submit" value="Login">
	</form>
	<%
	
    if(request.getAttribute("errorMessage")!=null)
    {
        out.println("<font color='red'>"+request.getAttribute("errorMessage")+"</font>");
    }
%>

<!--  <c:if test="${not empty errorMessage}">
   <c:out value="${errorMessage}"/>
</c:if> 

-->

</body>
</html>