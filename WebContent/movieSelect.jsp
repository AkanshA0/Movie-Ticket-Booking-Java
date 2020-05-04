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
	response.setHeader("Cache-Control","no-chache,no-store,must-revalidate");
	if(session.getAttribute("username")==null){
		
		response.sendRedirect("login.jsp");
	}
%>
<%@ page import="java.util.List,java.util.ArrayList,com.mainpkg.MysqlLogin"%>
<%

String movieName=request.getParameter("mName");
MysqlLogin objmysql=new MysqlLogin();
List<String> reservedSeatsList=objmysql.getBookedSeats(session.getAttribute("username").toString(),movieName);


//out.print(movieId);
List<String> seatList=new ArrayList<String>();
int n;
String s="";
if(request.getAttribute("numberOfSeats")==null)
{n=0;
seatList.add(s);
}
else{
	n=Integer.parseInt(request.getAttribute("numberOfSeats").toString());
	s=request.getAttribute("seatNumber").toString();
	//seatList=(List<String>)request.getAttribute("seatNumber");
	for(String word: s.split(","))
		seatList.add(word);
}

//List<String> l=new ArrayList<String>();
//l.add("1");
//l.add("2");

out.print("<table style='border:5px double black;'>");
int seatNo=1;
for(int i=0;i<5;i++){
	out.print("<tr>");
	for(int j=0;j<7;j++){
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
			
			out.print("<a href='./seatSelect?numberOfSeats="+n+"&sno="+seatNo+"&seats="+s+"'><button type='submit' style='background-color:grey;'><img src='E:/luna java EE workspace/JavaProject/WebContent/images/seat1.jpg' width='40px' heigh='40px' id='dagger'/></button>");
			seatNo++;
		}
		out.print("</td>");
		
	}
	out.print("</tr>");
}
out.print("</table>");

%>

<%! 
void sampleFunction()
{
	System.out.println("heyaa");
}
%>
<h3>Number of seats : ${numberOfSeats}
<br>
<h3>Selected Seats : ${seatNumber}
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