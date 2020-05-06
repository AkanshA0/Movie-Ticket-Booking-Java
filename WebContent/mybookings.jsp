<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bookings</title>
</head>
<body>

<%
	//response.setHeader("Cache-Control","no-chache,no-store,must-revalidate");
	if(session.getAttribute("username")==null){
		
		response.sendRedirect("login.jsp");
	}
	
	
%>
<%@ include file = "user_header.jsp" %>
<br>

<br>
<%@ page import="com.mainpkg.MysqlLogin"%>
<h3>
<% 
MysqlLogin myLoginObj=new MysqlLogin();
myLoginObj.pstmt=(myLoginObj.con).prepareStatement("select * from tickets where uname=?");
myLoginObj.pstmt.setString(1,session.getAttribute("username").toString());

myLoginObj.rs=(myLoginObj.pstmt).executeQuery();
if(myLoginObj.rs.first())
{
do{
	out.print("&emsp;&emsp;<a href='displayTicket.jsp?Tno="+myLoginObj.rs.getInt(1)+"&MovieName="+myLoginObj.rs.getString(3)+"&numberOfSeats="+myLoginObj.rs.getInt(4)+"&cost="+myLoginObj.rs.getDouble(5)+"&date="+myLoginObj.rs.getString(6)+"' style='color:#ff6a00'>"+myLoginObj.rs.getString(3)+"&emsp;("+myLoginObj.rs.getString(6)+")</a>");
	out.print("<br><br>");
}while(myLoginObj.rs.next());	
}
%>
</h3>
</body>
</html>