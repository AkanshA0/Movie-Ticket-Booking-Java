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
	 
	 public int getMaxTno(){
		 int tno=0;
		 try{
			 pstmt=con.prepareStatement("select max(Tno) from tickets");
			
			 rs=pstmt.executeQuery();
			 if (rs.first()){
				
					tno=rs.getInt(1);
				
			 }
			
		 }catch(Exception e){
			 System.out.println(e);
		 }

		 
		 return tno;
	 }
	 
	 public String getMovieDesc(String mName){
		 String d="";
		 try{
			 pstmt=con.prepareStatement("select description from movies where MovieName=?");
			 pstmt.setString(1, mName);
			 rs=pstmt.executeQuery();
			 if (rs.first()){
				
					d=rs.getString(1);
				
			 }
			
		 }catch(Exception e){
			 System.out.println(e);
		 }

		 
		 return d;
	 }
	 
	 public double getMovieCost(String mName){
		 double c=0;
		 try{
			 pstmt=con.prepareStatement("select cost from movies where MovieName=?");
			 pstmt.setString(1, mName);
			 rs=pstmt.executeQuery();
			 if (rs.first()){
				
					c=rs.getDouble(1);
				
			 }
			
		 }catch(Exception e){
			 System.out.println(e);
		 }

		 
		 return c;
	 }
	 
	 public int bookTicket(String uname,String mName,int numOfSeats,double cost,String date){
		
		 int tno=getMaxTno()+1;
			try{
			 pstmt=con.prepareStatement("insert into tickets values(?,?,?,?,?,?);");
			 pstmt.setInt(1, tno);
			 pstmt.setString(2,uname);
			 pstmt.setString(3,mName);
			 pstmt.setInt(4, numOfSeats);
			 pstmt.setDouble(5, cost);
			 pstmt.setString(6,date);
			 pstmt.executeUpdate();
			
			
			 
			
		 }catch(Exception e){
			 System.out.println(e);
		
		 }
		 
		return tno;
	 }
	 
	 public void seatsBook(String uname,String mName,int tno,List<String> sList){
		
		
			try{
			 pstmt=con.prepareStatement("insert into booked values(?,?,?,?);");
			 
			 for(String s : sList){
			 pstmt.setString(1, s);
			 pstmt.setString(2,mName);
			 pstmt.setString(3,uname);
			 pstmt.setInt(4, tno);
			
			 pstmt.executeUpdate();
			 }
				
			 
			
		 }catch(Exception e){
			 System.out.println(e);
			
		 }
		 
		
	 }
}
