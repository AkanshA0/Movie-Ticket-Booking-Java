package com.mainpkg;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	MysqlLogin myLoginObj=new MysqlLogin();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("uname");
		String pass=request.getParameter("pwd");
		
		if(request.getParameter("chk")!=null)
		{
		if(request.getParameter("chk").equals("admin"))
		{
			System.out.print("checked");
			
			if(myLoginObj.checkAdminLogin(name, pass)){
				HttpSession session=request.getSession();
				session.setAttribute("adminname", name);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("adminMain.jsp");
			    dispatcher.forward( request, response);
			}
			else{
				request.setAttribute("errorMessage", "Invalid username or password"); 
				RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			    dispatcher.forward( request, response);
			}
		}
		}
		else{
		if(myLoginObj.checkLogin(name, pass)){
			HttpSession session=request.getSession();
			session.setAttribute("username", name);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("userMain.jsp");
		    dispatcher.forward( request, response);
		}
		else{
			request.setAttribute("errorMessage", "Invalid username or password"); 
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		    dispatcher.forward( request, response);
		}
		
	}


	}
}
