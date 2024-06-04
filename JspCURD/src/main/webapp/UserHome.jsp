<%@page import="com.jsp.Connection.ConnClass"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="UserHeader.jsp" %>
    <%@include file="UserFooter.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<link rel="stylesheet" href="css/userHome.css">
</head>
<body>
<h2>Home</h2>
<%
String msg=request.getParameter("msg");
if("new".equals(msg))
{%>
	<h4 class="success">Added to Cart Successfully!</h4>
<%}else if("update".equals(msg)){%><h4 class="success">Product Already exist in the Cart,Quantity Increased!</h4><%} %>
<table width='100%'>
<tr><th>ID</th><th>NAME</th><th>CATEGORY</th><th><i class="fas fa-rupee-sign"></i>PRICE</th><th>ADD TO CART</th></tr>
<%

String ser=request.getParameter("search");

Connection con=ConnClass.getCon();
int p=0;
try {
	
	PreparedStatement smt=null;
	
	if(ser==null||ser.isEmpty())
	{	
		smt=con.prepareStatement("select * from product where active='yes'");
	
	}
	else
	{
	 smt=con.prepareStatement("select * from product where name like '%"+ser+"%' or category like '%"+ser+"%' and active='yes'");	
	}
	
	ResultSet rs=smt.executeQuery();
   while(rs.next())
   {p=1;
   	%>

<tr><td><%= rs.getInt(1)%></td><td>	<%= rs.getString(2)%></td><td><%= rs.getString(3)%></td><td><i class="fas fa-rupee-sign"></i><%= rs.getInt(4)%></td>
		    <td><a href="CartAction.jsp?pid=<%= rs.getInt(1)%>"><i class="fas fa-cart-plus"></i>Add to cart</a></td></tr>
<%}
  
} catch (Exception e) {e.printStackTrace();}
%>		    
</table>
<% if(p==0){%><h1 style="color:white;">..Nothing to Show..</h1><%}%>
</body>
</html>