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
<img src="https://www.bing.com/images/search?view=detailV2&ccid=sc0Q6Oyj&id=CE7B732EC521BBFC2A8D01518227B26D1AEA8B52&thid=OIP.sc0Q6OyjaZNCRBL8f4O32QHaFj&mediaurl=https%3A%2F%2Fi.ytimg.com%2Fvi%2FyaY0lHcynpU%2Fhqdefault.jpg&exph=360&expw=480&q=image&simid=608037824011176518&selectedindex=0&adlt=demote&shtp=GetUrl&shid=cb81a9f4-3a89-483c-9a3f-1c7f7ec2ee40&shtk=MTAgTWludXRlIFJlbGF4YXRpb24gYW5kIFZpc3VhbCBNZWRpdGF0aW9uIC0gSGkgRGVmIDEwODBwIC0gWW91VHViZQ%3D%3D&shdk=Rm91bmQgb24gQmluZyBmcm9tIHd3dy55b3V0dWJlLmNvbQ%3D%3D&shhk=g9wUZeTlpGR7uQjZhujLZbKXq%2Fy%2Fl9%2FBu%2BjziFJse7E%3D&form=EX0023&shth=OSH.BrXJTEm8kVMu84diiZtbyw" alt="image display"/>
<br>
<a href="login.jsp">sign in



	<!--  <input type="file" name="image" required="required"/><br/><br/> -->
</body>
</html>