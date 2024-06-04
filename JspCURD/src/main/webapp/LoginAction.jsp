<%@page import="com.mysql.cj.xdevapi.Statement"%>
<%@page import="com.jsp.Connection.ConnClass"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
  String email=request.getParameter("email");
  String pass=request.getParameter("pass");
  int p=0;
  if("admin@g.com".equals(email) && "admin".equals(pass))
  {  p=1;	  
	  session.setAttribute("email",email );
	  response.sendRedirect("admin/adminHome.jsp");
  }
  else{
   	 Connection con=ConnClass.getCon();
   	try {
   		PreparedStatement smt=con.prepareStatement("select * from user where email='"+email+"'&& password='"+pass+"'");
   	   ResultSet rs=smt.executeQuery();
   	   while(rs.next())
   	   {
   	      p=1;
   	   session.setAttribute("email",email );
 	  response.sendRedirect("UserHome.jsp");
   	   }
   	 }catch(Exception e)
   	 {
   		 
   	 }
	  
	  
  }
  if(p==0)
  {    
	  response.sendRedirect("index.jsp?msg=invalid");
  }
  
  
%>
</body>
</html>