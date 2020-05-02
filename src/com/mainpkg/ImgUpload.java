package com.mainpkg;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ImgUpload")
public class ImgUpload extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String img=request.getParameter("image");
		FileInputStream fis=new FileInputStream(new File(img));
		
		try{
			 Class.forName("com.mysql.jdbc.Driver");
			 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MovieJava","root","root");
			 PreparedStatement pstmt=con.prepareStatement("insert into data values(?,?);");
			 pstmt.setString(1, "2");
			 pstmt.setBinaryStream(2, fis);
			 int n=pstmt.executeUpdate();
			 System.out.println(n);
			
		 }catch(Exception e){System.out.println(e);}
	}

}
