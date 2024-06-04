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
String oid=request.getParameter("id");
int id=Integer.valueOf(oid);

Connection con=ConnClass.getCon();
try {
	
	 PreparedStatement smt=con.prepareStatement("UPDATE cart SET  delivered=? WHERE order_id=?; ");
	 
	    smt.setString(1,"yes");
	    smt.setInt(2,id); 
	   int i = smt.executeUpdate();
	  
	  if(i>0)
		  {response.sendRedirect("Orders.jsp?msg=delivervalid");}
	  else{response.sendRedirect("Orders.jsp?msg=deliverinvalid");}
	
 }catch(Exception e)
 {
	 
 }


%>
</body>
</html>