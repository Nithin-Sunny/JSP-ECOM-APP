package com.jsp.Connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class ConnClass {
		
		public static Connection getCon()
		{    
			Connection con=null;
			try {
			 Class.forName("com.mysql.cj.jdbc.Driver");  
		     String url="jdbc:mysql://localhost:3306/ecom";	   	 
			 
				con =  DriverManager.getConnection(url,"root","admin");
				
				String qry="create table if not exists user(name varchar(20),email varchar(20),password varchar(20),mobnumber varchar(20),quest varchar(50) ,ans varchar(20),primary key(email));";
				 Statement st=con.createStatement();
				 st.executeUpdate(qry);
				 qry="create table if not exists product(id int auto_increment,name varchar(30),category varchar(30),price int,active varchar(20), primary key(id));";
				 st.executeUpdate(qry);
				 qry="create table if not exists cart(email varchar(20),product_name varchar(30),Product_id int,quantity int,price int,total int,address varchar(70), city varchar(20), state varchar(20),country varchar(20),ordered varchar(10),delivered varchar(10),order_id int auto_increment primary key);";
				 st.executeUpdate(qry);
				 qry="create table if not exists chat(user_id varchar(20),comments varchar(100),admin_replay_to varchar(20),cmt_id int auto_increment primary key);";
				 st.executeUpdate(qry);
				 
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			 return con;
		}
	}

