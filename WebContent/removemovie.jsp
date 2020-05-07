<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>remove movie</title>
</head>
<body>
<%
	//response.setHeader("Cache-Control","no-chache,no-store,must-revalidate");
if(session.getAttribute("adminname")==null){
	
	response.sendRedirect("login.jsp");
}
	
	
%>
<%@ include file = "admin_header.jsp" %>

<%@ page import="com.mainpkg.MysqlLogin"%>
<br>
<br>
<h2>&emsp;&emsp;&emsp;Click on Movie to remove it</h2>
<br>
<h3>
<% 
MysqlLogin myLoginObj=new MysqlLogin();
myLoginObj.pstmt=(myLoginObj.con).prepareStatement("select MovieName from movies");

myLoginObj.rs=(myLoginObj.pstmt).executeQuery();

if(myLoginObj.rs.first())
{
do{
	out.print("&emsp;&emsp;&emsp;&emsp;<a href='./removeMovie?mname="+myLoginObj.rs.getString(1)+"' style='color:#ff6a00'>"+myLoginObj.rs.getString(1)+"</a>");
	out.print("<br><br>");
}while(myLoginObj.rs.next());	
}

%>
</body>
</html>