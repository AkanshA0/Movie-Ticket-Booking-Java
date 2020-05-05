<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	//response.setHeader("Cache-Control","no-chache,no-store,must-revalidate");
if(session.getAttribute("adminname")==null){
	
	response.sendRedirect("login.jsp");
}
	
	
%>
<%@ page import="com.mainpkg.MysqlLogin"%>
<h2>Click on Movie to remove it</h2>
<p>
<h3>
<% 
MysqlLogin myLoginObj=new MysqlLogin();
myLoginObj.pstmt=(myLoginObj.con).prepareStatement("select MovieName from movies");

myLoginObj.rs=(myLoginObj.pstmt).executeQuery();

if(myLoginObj.rs.first())
{
do{
	out.print("<a href='./removeMovie?mname="+myLoginObj.rs.getString(1)+"'>"+myLoginObj.rs.getString(1));
	out.print("<br>");
}while(myLoginObj.rs.next());	
}

%>
</body>
</html>