package com.user.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.user.bean.User;

public class UserDAO {
	
	public static Connection getCon()
	{   
		Connection con=null;
		try {
		 Class.forName("com.mysql.cj.jdbc.Driver");  
	     String url="jdbc:mysql://localhost:3306/demo";
			 con =DriverManager.getConnection(url,"root","admin");
			String sql="create table if not exists user_table(id int auto_increment,name varchar(20),password varchar(20),email varchar(20),country varchar (20),primary key(id));";
			 Statement st=con.createStatement();
			   st.executeUpdate(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    return con;
	}

	public static int saveUser(User e)
	{   
		int i=0;
		
		try {
		 
	     Connection con =getCon();
	     
	     PreparedStatement smt=con.prepareStatement("insert into user_table(name,password,email,country)values(?,?,?,?);");
		 smt.setString(1,e.getName());	
		 smt.setString(2,e.getPass());
		 smt.setString(3,e.getEmail());
		 smt.setString(4,e.getCountry());
	     
	      i = smt.executeUpdate();
	     con.close();
			
		
	     
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		return i;
		
	}
	
	public static List<User> getUser()
 	{   ArrayList<User> li=new ArrayList<User>();
		Connection con=getCon();
		 try {
			PreparedStatement smt=con.prepareStatement("select * from user_table");
		    ResultSet rs=smt.executeQuery();
		    while(rs.next())
		    {
		    	User e=new User();
		    	e.setId(rs.getInt(1));
		    	e.setName(rs.getString(2));
		    	e.setPass(rs.getString(3));
		    	e.setEmail(rs.getString(4));
		    	e.setCountry(rs.getString(5));
		    	li.add(e);
		    }
		 
		 } catch (Exception e) {
			
			e.printStackTrace();
		}
		 return li;
	}
	
	public static User getUser(int id)
 	{  
		Connection con=getCon();
		User e=new User();
		 try {
			PreparedStatement smt=con.prepareStatement("select * from user_table where id='"+id+"';");
		    ResultSet rs=smt.executeQuery();
		    while(rs.next())
		    {
		    	
		    	e.setId(rs.getInt(1));
		    	e.setName(rs.getString(2));
		    	e.setPass(rs.getString(3));
		    	e.setEmail(rs.getString(4));
		    	e.setCountry(rs.getString(5));
		    
		    }
		 
		 } catch (Exception ex) {
			
			ex.printStackTrace();
		}
		 return e;
	}
	
	public static int updateUser(int id,String name,String pass,String email,String country)
	{    int i=0; 
		
		Connection con=getCon();
		
		try {
			PreparedStatement smt=con.prepareStatement("UPDATE user_table SET name='"+name+"',password='"+pass+"',email='"+email+"',country='"+country+"' WHERE id='"+id+"'; ");
			 i = smt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
	  return i;
	  
	}
	
	public static int deleteUser(int id)
	{  int i=0;
		Connection con=getCon();
		try {
		PreparedStatement smt=con.prepareStatement("delete from user_table where id='"+id+"'; ");
			 i = smt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	  return i;
	}



}
