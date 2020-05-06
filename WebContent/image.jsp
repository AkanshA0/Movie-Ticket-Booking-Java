<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>movies</title>
</head>
<body>


<%
	response.setHeader("Cache-Control","no-chache,no-store,must-revalidate");
	if(session.getAttribute("username")==null){
		
		response.sendRedirect("login.jsp");
	}
	
%>
<%@ include file = "user_header.jsp" %>
<h1> &emsp;&emsp;Select  Movie</h1><p>
<br>

<%@ page import="com.mainpkg.MysqlLogin,java.util.List"%>
<% 
MysqlLogin myLoginObj=new MysqlLogin();
List<String> idList=myLoginObj.getImageId();
out.print("<table><tr>");
int line=0;
for(String l : idList){
	
	if(line%3==0){
		out.print("<tr>");
	}
//out.print("   <td><img src='./DisplayImage?imgid="+l+"' width='400px' heigh=400px'/></td>  ");
//out.print("&emsp;<td><tr><td><figure><img src='./DisplayImage?imgid="+l+"' width='400px' heigh='400px'/><figcaption><a href='movieSelect.jsp?mName="+l+"'></figcaption></figure></td></tr><tr><td><a href='movieSelect.jsp?mid="+l+"'>"+l+"</td></tr></td>");
out.print("&emsp;&emsp;<td><figure><img src='./DisplayImage?imgid="+l+"' width='300px' height='450px'/><figcaption><br><a href='movieSelect.jsp?mName="+l+"'>"+l+"</figcaption></figure></td>");
line++;
}
out.print("</tr></table>");

%>


	
	
</body>
</html>