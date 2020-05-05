<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ticket</title>
</head>
<body>
<%
	//response.setHeader("Cache-Control","no-chache,no-store,must-revalidate");
	if(session.getAttribute("username")==null){
		
		response.sendRedirect("login.jsp");
	}
	
	
%>
<% 
//String uname=session.getAttribute("username").toString();
int tno=Integer.parseInt(request.getParameter("Tno"));
String mn=request.getParameter("MovieName");
String nos=request.getParameter("numberOfSeats");
String cost=request.getParameter("cost");
String date=request.getParameter("date");

out.print("<img src='./DisplayImage?imgid="+mn+"' width='250px' height='400px'/><br>");
out.print("<h3>"+mn+"<br>number of seats: "+nos+"<br>Cost: "+cost+"<br>Date: "+date+"<br>");
%>

<%@ page import="com.mainpkg.MysqlLogin"%>
<% 
MysqlLogin myLoginObj=new MysqlLogin();
myLoginObj.pstmt=(myLoginObj.con).prepareStatement("select SeatNo from booked where Tno=? and uname=?");
myLoginObj.pstmt.setInt(1,tno);
myLoginObj.pstmt.setString(2,session.getAttribute("username").toString());

myLoginObj.rs=(myLoginObj.pstmt).executeQuery();
out.print("Seats:&emsp;");
if(myLoginObj.rs.first())
{
do{
	out.print(myLoginObj.rs.getString(1)+"&emsp;");
}while(myLoginObj.rs.next());	
}
%>



</body>
</html>