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
<title>Insert title here</title>
<link rel="stylesheet" href="css/userHome.css">
</head>
<body>

<h2>My Cart</h2>
<%
String em=session.getAttribute("email").toString();
String msg=request.getParameter("msg");
if("valid".equals(msg))
{%>
	<h4 class="success">Order Placed Successfully!</h4>
<%}else if("invalid".equals(msg)){%><h4 class="error">Order Failed!</h4><%} 
if("Removed".equals(msg))
{%>
	<h4 class="success">Removed From Cart!</h4>
<%}else if("notRemoved".equals(msg)){%><h4 class="error">Can't Remove!</h4><%} %>

<table width='100%'>
<tr><th>ID</th><th>NAME</th><th>QUANTITY</th><th><i class="fas fa-rupee-sign"></i>PRICE</th><th><i class="fas fa-rupee-sign"></i>TOTAL</th><th>REMOVE</th><th>PLACE ORDER</th></tr>
<%

Connection con=ConnClass.getCon();
try {
	PreparedStatement smt=con.prepareStatement("select * from cart where email='"+em+"' and ordered is null");
   ResultSet rs=smt.executeQuery();
   while(rs.next())
   {
   	%>

<tr><td><%= rs.getInt(3)%></td><td>	<%= rs.getString(2)%></td><td><%= rs.getInt(4)%></td><td><i class="fas fa-rupee-sign"></i><%= rs.getInt(5)%></td><td><i class="fas fa-rupee-sign"></i><%= rs.getString(6)%></td>
		    <td><a href="RemoveAction.jsp?id=<%= rs.getInt(13)%>&page=MyCart"><i class="fas fa-minus-circle"></i>Remove</a></td>
		    <td><a href="PlaceOrder.jsp?id=<%= rs.getInt(3)%>"><i class="far fa-check-circle"></i>Place Order</a></td></tr>

<%}
  } catch (Exception e) {e.printStackTrace();}

%>		    
</table>

</body>
</html>