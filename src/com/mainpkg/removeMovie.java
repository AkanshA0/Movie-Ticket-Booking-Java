package com.mainpkg;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/removeMovie")
public class removeMovie extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mname=request.getParameter("mname");
		MysqlLogin obj= new MysqlLogin();
		obj.removeMovie(mname);
		
		PrintWriter out=response.getWriter();
		out.print("Removed Successfully!");
	}

}
