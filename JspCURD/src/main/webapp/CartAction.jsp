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
String email=session.getAttribute("email").toString();
String pids=request.getParameter("pid");
int pid=Integer.valueOf(pids);
int q=1;
Connection con=ConnClass.getCon();
int z=0;
int total=0;

try {
	PreparedStatement ssmt=con.prepareStatement("select * from cart where email='"+email+"'and Product_id='"+pid+"' and ordered is null");
   ResultSet rs=ssmt.executeQuery();
   while(rs.next())
   {
	   z=1;
	  q=rs.getInt(4)+1; 
	  total=rs.getInt(5)*q;
	  PreparedStatement smt=con.prepareStatement("UPDATE cart SET quantity='"+q+"',total='"+total+"' WHERE email='"+email+"' and Product_id='"+pid+"' and ordered is null; ");
	  int i = smt.executeUpdate();
	  response.sendRedirect("UserHome.jsp?msg=update");
	}
   
 }catch(Exception e)
 {}

if(z==0)
{

	try {
		PreparedStatement ssmt=con.prepareStatement("select * from product where id='"+pid+"'");
	   ResultSet rs=ssmt.executeQuery();
	   while(rs.next())
	   {
		  
		   PreparedStatement smt=con.prepareStatement("insert into cart(email,product_name,product_id,quantity,price,total)values(?,?,?,?,?,?);");
		   
		   smt.setString(1, email);
		    smt.setString(2, rs.getString(2));
		    smt.setInt(3,rs.getInt(1));
		   smt.setInt(4,q);
		   smt.setInt(5,rs.getInt(4));
		   smt.setInt(6,rs.getInt(4)*q);
		   int i = smt.executeUpdate();
		   response.sendRedirect("UserHome.jsp?msg=new");
		   
		}
	   
	   
	 }catch(Exception e)
	 {
		 
	 }
}

%>
</body>
</html>