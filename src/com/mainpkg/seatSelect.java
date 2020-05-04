package com.mainpkg;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/seatSelect")
public class seatSelect extends HttpServlet {
	

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    String s=request.getParameter("sno");
		int n=0;
		System.out.print(request.getParameter("numberOfSeats")+"  ");
		if(request.getParameter("numberOfSeats")!=null){
		n=Integer.parseInt(request.getParameter("numberOfSeats").toString());
		
		}
		if(request.getParameter("seats")!=""){
			//System.out.println("not null");
			s=request.getParameter("seats").toString()+","+s;
			
		}
		n++;
		
		request.setAttribute("numberOfSeats", n);
		request.setAttribute("seatNumber", s);
		System.out.println(n);
		System.out.println(s);
		RequestDispatcher dispatcher = request.getRequestDispatcher("movieSelect.jsp");
		  dispatcher.forward( request, response);
	}

}
