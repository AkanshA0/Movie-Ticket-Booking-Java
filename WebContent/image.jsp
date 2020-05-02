<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Image</h1>
<% 
out.print("<tr><td><img src='./DisplayImage?imgid=2' width='100px' heigh='100px'/></td>   <td><img src='./DisplayImage?imgid=1' width='100px' heigh='100px'/></td></tr>");
%>
</body>
</html>