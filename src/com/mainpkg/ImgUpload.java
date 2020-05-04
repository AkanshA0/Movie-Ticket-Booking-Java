package com.mainpkg;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
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
	MysqlLogin myLoginObj=new MysqlLogin();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String movieName=request.getParameter("mname");
		Double cost=Double.parseDouble(request.getParameter("cost").toString());
		String mdesc=request.getParameter("mdesc");
		String img=request.getParameter("image");
		FileInputStream fis=new FileInputStream(new File(img));
		
		try{
			
			 PreparedStatement pstmt=myLoginObj.con.prepareStatement("insert into movies values(?,?,?,?);");
			 pstmt.setString(1, movieName);
			 pstmt.setBinaryStream(2, fis);
			 pstmt.setDouble(3,cost);
			 pstmt.setString(4, mdesc);
			 int n=pstmt.executeUpdate();
			 System.out.println(n);
			 if(n>0){
				 out.print("movie uploaded successfully!");
			 }
			
		 }catch(Exception e){System.out.println(e);}
	}

}
