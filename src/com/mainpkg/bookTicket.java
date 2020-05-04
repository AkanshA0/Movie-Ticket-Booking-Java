package com.mainpkg;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/bookTicket")
public class bookTicket extends HttpServlet {
	

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String uname=session.getAttribute("username").toString();
		String mName=request.getParameter("mname");
		int numOfSeats=Integer.parseInt(request.getParameter("nos").toString());
		double cost=Double.parseDouble(request.getParameter("cost").toString());
		String date=request.getParameter("date");
		MysqlLogin obj= new MysqlLogin();
		int tno=obj.bookTicket(uname, mName, numOfSeats, cost, date);
		if(tno!= 0)
		{
			String s=request.getParameter("seatsSelected").toString();
			List<String> seatList=new ArrayList<String>();
			
			for(String word: s.split(","))
				seatList.add(word);
			
			obj.seatsBook(uname, mName,tno, seatList);
			PrintWriter out=response.getWriter();
			out.print("ticket booked Successfully!");
		}
	}

}
