<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
d {
  padding-top: 10px;
  padding-right: 80px;
  padding-bottom: 10px;
  padding-left: 20px;

  
}
div {
  padding-top: 5px;
  padding-right: 100px;
  padding-bottom: 50px;
  padding-left: 100px;
  
  
}
pg {
  
  padding-right: 400px;
  padding-bottom: 0px;
    padding-top: 0px;
  padding-left: 0px;
   
 
  
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>book</title>
</head>

<body>

<%
	//response.setHeader("Cache-Control","no-chache,no-store,must-revalidate");
	if(session.getAttribute("username")==null || request.getParameter("mName")==null){
		
		response.sendRedirect("login.jsp");
	}
	
	
%>
<%@ include file = "user_header.jsp" %>


<%@ page import="java.util.List,java.util.ArrayList,com.mainpkg.MysqlLogin"%>

<%

	String movieName=request.getParameter("mName");
	



MysqlLogin objmysql=new MysqlLogin();
List<String> reservedSeatsList=objmysql.getBookedSeats(session.getAttribute("username").toString(),movieName);
out.print("<d style='float:left;'>");
out.print("&emsp;&emsp;&emsp;<img src='./DisplayImage?imgid="+movieName+"' width='250px' height='400px'/></d>");
//out.print("<div style='float:center;'>");
out.print("<div><h2 align='center'>"+movieName+"</h2>");
out.print("<h5 align='center'>"+objmysql.getMovieDesc(movieName)+"</h5><p>");

double movieCost=objmysql.getMovieCost(movieName);

//out.print(movieId);
List<String> seatList=new ArrayList<String>();
int n;
double Tcost=0;
String s="";
if(request.getAttribute("numberOfSeats")==null)
{n=0;
seatList.add(s);

}
else{
	n=Integer.parseInt(request.getAttribute("numberOfSeats").toString());
	Tcost=Double.parseDouble(request.getAttribute("totalCost").toString());
	s=request.getAttribute("seatNumber").toString();
	//seatList=(List<String>)request.getAttribute("seatNumber");
	for(String word: s.split(","))
		seatList.add(word);
}
%>

<h3 align='center'>Number of seats : ${numberOfSeats}</h3>
<h3 align='center'>Selected Seats : ${seatNumber}</h3>
<h3 align='center'>Amount Payable : ${totalCost}</h3>
<% 
//out.print("<h3>Number of seats : "+request.getAttribute("numberOfSeats")+"</h3>");
out.print("<form action='./bookTicket?mname="+movieName+"&nos="+request.getAttribute("numberOfSeats")+"&cost="+request.getAttribute("totalCost")+"&seatsSelected="+request.getAttribute("seatNumber")+"' method='post'>");
out.print("<h3 align='center'>Date : <input type='text' name='date' required='required'/><p>");
out.print("<input type='submit' value='Book Ticket'/>");
out.print("</form></div>");
%>




<% 
//List<String> l=new ArrayList<String>();
//l.add("1");
//l.add("2");
//out.print("<div align='left' style='vertical-align:bottom'>");
out.print("<pg style='float:right;'>");
out.print("<table >");
int seatNo=1;
for(int i=0;i<6;i++){
	out.print("<tr>");
	for(int j=0;j<10;j++){
		out.print("<td>");
		if(reservedSeatsList.contains(seatNo+"") || seatList.contains(seatNo+"")){
			out.print("<button type='submit' disabled='disabled'><img src='E:/luna java EE workspace/JavaProject/WebContent/images/seat1.jpg' width='40px' heigh='40px' id='dagger'/></button>");
			seatNo++;
		}
	/*	else if(seatList.contains(seatNo+"")){
			System.out.println("dup"+seatNo);
			out.print("<button type='submit' style='background-color:yellow; disabled='disabled'><img src='E:/luna java EE workspace/JavaProject/WebContent/images/seat1.jpg' width='40px' heigh='40px' id='dagger'/></button>");
			seatNo++;
		}*/
		else{
			
			out.print("<a href='./seatSelect?mName="+movieName+"&numberOfSeats="+n+"&sno="+seatNo+"&seats="+s+"&totalCost="+(Tcost+movieCost)+"'><button type='submit' style='background-color:grey;'><img src='E:/luna java EE workspace/JavaProject/WebContent/images/seat1.jpg' width='40px' heigh='40px' id='dagger'/></button>");
			seatNo++;
		}
		out.print("</td>");
		
	}
	out.print("</tr>");
}
out.print("</table>");

%>

<%! 
//void sampleFunction()
//{
	//System.out.println("sample");
//}
%>
<!--div style="float:left;"-->

<% 
//out.print("<form action='./bookTicket?mname="+movieName+"&nos="+request.getAttribute("numberOfSeats")+"&cost="+request.getAttribute("totalCost")+"&seatsSelected="+request.getAttribute("seatNumber")+"' method='post'>");
//out.print("<h3>Date : <input type='text' name='date' required='required'/><p>");
//out.print("<input type='submit' value='Book Ticket'/>");
//out.print("</form>");
%>
</pg>
<!--/div-->
<!--  
<style>
.myClass {
  color: white;
  background-color: DodgerBlue;
  padding: 20px;
  text-align: center;
  margin: 10px;
}
</style>


<button onClick="sampleFunction()">Show content</button>
<template>
  <div class="myClass">I like: </div>
</template>

<script type="text/javascript">
var myArr = ["Audi", "BMW", "Ford", "Honda", "Jaguar", "Nissan"];
function sampleFunction()
{
	 var temp, item, a, i;
	  //get the template element:
	  temp = document.getElementsByTagName("template")[0];
	  //get the DIV element from the template:
	  item = temp.content.querySelector("div");
	  //for each item in the array:
	  for (i = 0; i < myArr.length; i++) {
	    //Create a new node, based on the template:
	    a = document.importNode(item, true);
	    //Add data from the array:
	    a.textContent += myArr[i];
	    //append the new node wherever you like:
	    document.body.appendChild(a);
	  }
	//System.out.println("heyaa");
}
</script>
-->

</body>
</html>