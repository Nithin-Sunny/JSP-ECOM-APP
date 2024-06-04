<%@page import="com.jsp.Connection.ConnClass"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
<%
String email=session.getAttribute("email").toString();
String ids=request.getParameter("id");
int id=Integer.valueOf(ids);
String addr=request.getParameter("addr");
String city=request.getParameter("city");
String state=request.getParameter("state");
String country=request.getParameter("country");
Connection con=ConnClass.getCon();
try {
	
	 PreparedStatement smt=con.prepareStatement("UPDATE cart SET address=?,city=?,state=?,country=?, ordered=? WHERE email=? and Product_id=? and ordered is null; ");
	 
	    smt.setString(1, addr);
	    smt.setString(2,city);
	    smt.setString(3,state);
	    smt.setString(4,country);
	    smt.setString(5,"yes");
	    smt.setString(6, email);
	    smt.setInt(7, id);
	   int i = smt.executeUpdate();
	  
	  if(i>0)
		  {response.sendRedirect("MyCart.jsp?msg=valid");}
	  else{response.sendRedirect("MyCart.jsp?msg=invalid");}
	
 }catch(Exception e)
 {
	 
 }
%>
</body>
</html>