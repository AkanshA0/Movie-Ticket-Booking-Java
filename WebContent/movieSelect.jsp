<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.util.List,java.util.ArrayList"%>
<%
String movieId=request.getParameter("mid");
//out.print(movieId);
List<String> l=new ArrayList<String>();
l.add("1");
l.add("2");
out.print("<table>");
for(int i=0;i<5;i++){
	out.print("<tr>");
	for(int j=0;j<7;j++){
		out.print("<td>");
		if(l.contains(j+"")){
			out.print("<button type='submit' disabled='disabled'><img src='E:/luna java EE workspace/JavaProject/WebContent/images/seat1.jpg' width='40px' heigh='40px' id='dagger'/></button>");
		}
		else{
			
			out.print("<button type='submit' style='background-color:green;'><img src='E:/luna java EE workspace/JavaProject/WebContent/images/seat1.jpg' width='40px' heigh='40px' id='dagger'/></button>");
		}
		out.print("</td>");
		
	}
	out.print("</tr>");
}
out.print("</table>");
%>
</body>
</html>