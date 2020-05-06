<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
.center {

 
  width: 40%;
  margin: 0 auto;
  margin-top: 5%;

  padding: 10px;
  background: white;
}


</style>

<%
	//response.setHeader("Cache-Control","no-chache,no-store,must-revalidate");
if(session.getAttribute("adminname")==null){
	
	response.sendRedirect("login.jsp");
}
%>
<%@ include file = "admin_header.jsp" %>
<br><br>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Save movie</title>
</head>
<body>
<div class="center">
<form action="./ImgUpload" method="post">
<h4>Enter movie name: <input type="text" name="mname" required="required"><p>
Enter movie cost: <input type="text" name="cost" required="required"><p>
Enter movie description: <textarea rows = "5" cols = "50" name = "mdesc" required="required"></textarea>
<p>
Select Movie Image: <input type="file" name="image" required="required"><p>
<td colspan=2><input type="submit" value="Submit"></td>
</h4>
</form>

</div>
</body>
</html>