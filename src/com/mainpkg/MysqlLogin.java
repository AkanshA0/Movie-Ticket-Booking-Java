package com.mainpkg;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MysqlLogin {
	
	public static Connection con=null;
	 Statement stmt=null;
	 PreparedStatement pstmt=null;
	 ResultSet rs =null;
	 
	 public MysqlLogin() {
			
			if(con==null){
				connect();
			}
		}
	 
	 public void connect()	
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
	 
	 public boolean saveUser(String name,String fname,String pass){
		 
		 boolean res=false;
			try{
			 pstmt=con.prepareStatement("insert into users values(?,?,?);");
			 pstmt.setString(1,name);
			 pstmt.setString(2,pass);
			 pstmt.setString(3,fname);
			 pstmt.executeUpdate();
			
				 res= true;
			 
			
		 }catch(Exception e){
			 System.out.println(e);
			 res=false;
		 }
		 
		return res;
	 }
	 
	 public List<String> getImageId(){
		 List<String> list = new ArrayList<String>();  
		 
		 try{
			 pstmt=con.prepareStatement("select MovieName from movies");
			 rs=pstmt.executeQuery();
			 if (rs.first()){
				do{
					list.add(rs.getString(1));
				}while(rs.next());
			 }
			
		 }catch(Exception e){
			 System.out.println(e);
		 }

		 
		 return list;
	 }
	 
	 public List<String> getBookedSeats(String uName,String movieName){
		 List<String> list = new ArrayList<String>();  
		 
		 try{
			 pstmt=con.prepareStatement("select SeatNo from booked where uname=? and MovieName=?");
			 pstmt.setString(1, uName);
			 pstmt.setString(2, movieName);
			 rs=pstmt.executeQuery();
			 if (rs.first()){
				do{
					list.add(rs.getString(1));
				}while(rs.next());
			 }
			
		 }catch(Exception e){
			 System.out.println(e);
		 }

		 
		 return list;
	 }
	 
}
