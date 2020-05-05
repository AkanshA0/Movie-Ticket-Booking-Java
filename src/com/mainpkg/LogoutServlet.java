package com.mainpkg;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		if(request.getParameter("type")!=null){
			//System.out.print("logout admin");
			session.removeAttribute("adminname");
			session.invalidate();
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		    dispatcher.forward( request, response);
		}
		else{
		session.removeAttribute("username");
		session.invalidate();
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
	    dispatcher.forward( request, response);
		}
	}

}
