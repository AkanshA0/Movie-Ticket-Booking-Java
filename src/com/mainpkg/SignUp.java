package com.mainpkg;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/SignUp")

public class SignUp extends HttpServlet {
	
	MysqlLogin myLoginObj=new MysqlLogin();

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("uname");
		String fname=request.getParameter("fname");
		String pass=request.getParameter("pwd");
	
		
		if(name.length()>=5 && fname.length()>=5 && pass.length()>=5 && fname.contains(" "))
		{	
		
		if(! myLoginObj.saveUser(name, fname, pass)){
			request.setAttribute("errorMessage", "SignUp Failed!"); 
			RequestDispatcher dispatcher = request.getRequestDispatcher("signup.jsp");
		    dispatcher.forward( request, response);
		}
		else{
			request.setAttribute("successMessage", "successful signup!"); 
			RequestDispatcher dispatcher = request.getRequestDispatcher("signup.jsp");
		    dispatcher.forward( request, response);
		}
	}
	else{
		request.setAttribute("errorMessage", "SignUp Failed!"); 
		RequestDispatcher dispatcher = request.getRequestDispatcher("signup.jsp");
	    dispatcher.forward( request, response);
	}
	}

}
