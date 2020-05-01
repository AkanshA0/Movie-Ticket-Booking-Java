package com.mainpkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class MysqlLogin {
	
	 Connection con=null;
	 Statement stmt=null;
	 PreparedStatement pstmt=null;
	 ResultSet rs =null;
	 
	 MysqlLogin()	
	 {	
	 try{
		 Class.forName("com.mysql.jdbc.Driver");
		 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MovieJava","root","root");
		 System.out.println("successful connection!");
		// stmt=con.createStatement();
	 }catch(Exception e){System.out.println(e);}
	 
}
	 public boolean checkLogin(String name,String pass){
		boolean res=false;
		try{
		 pstmt=con.prepareStatement("select * from users where uname=? and password=?;");
		 pstmt.setString(1,name);
		 pstmt.setString(2,pass);
		 rs=pstmt.executeQuery();
		 if (rs.first()){
			 res= true;
		 }
		
	 }catch(Exception e){
		 System.out.println(e);
	 }
	 
	return res;
} 
}
