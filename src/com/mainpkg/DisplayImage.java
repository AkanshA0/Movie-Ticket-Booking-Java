package com.mainpkg;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DisplayImage")
public class DisplayImage extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		byte[] img=null;
		ServletOutputStream sos=null;
		String s=request.getParameter("imgid");
		String q="select image from data where id=?;";
		try{
			 Class.forName("com.mysql.jdbc.Driver");
			 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MovieJava","root","root");
			 PreparedStatement pstmt=con.prepareStatement(q);
			 pstmt.setString(1, s);
			 ResultSet rs=pstmt.executeQuery();
			 sos=response.getOutputStream();
			 if(rs.next()){
				 
				 img=rs.getBytes(1);
				 sos.write(img);
			 }
			
			// sos.write(img);
			
		 }catch(Exception e){System.out.println(e);}
		 
				
	}

}
