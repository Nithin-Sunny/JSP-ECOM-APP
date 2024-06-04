<%@page import="com.jsp.Connection.ConnClass"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="adminHeader.jsp" %>
     <%@ include file="adminFooter.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<link rel="stylesheet" href="adminCSS/ViewEdit.css">
</head>
<body>
<h2>Orders Received</h2>
<%
int z=0;
String msg=request.getParameter("msg");
String st="Waiting for delivery";
if("valid".equals(msg))
{%>
	<h4 class="success">Order Cancelled Successfully!</h4>
<%}else if("invalid".equals(msg)){%><h4 class="error">Order Cancellation Failed!</h4><%}
else if("delivervalid".equals(msg)){%><h4 class="success">Order Delivered Successfully!</h4><%}
else if("deliverinvalid".equals(msg)){%><h4 class="error">Order Delivery Failed!</h4><%}%>


<table width='100%'>
<tr><th>ORDER ID</th><th>NAME</th><th>QUANTITY</th><th><i class="fas fa-rupee-sign"></i>PRICE</th><th><i class="fas fa-rupee-sign"></i>TOTAL</th><th>CANCEL ORDER</th><th>DELIVER ORDER</th></tr>
<%

Connection con=ConnClass
.getCon();
try {
	PreparedStatement smt=con.prepareStatement("select * from cart where ordered='yes' and delivered is null ");
   ResultSet rs=smt.executeQuery();
   while(rs.next())
   {
	z=1;   
   	%>

<tr><td><%= rs.getInt(13)%></td><td><%= rs.getString(2)%></td><td><%= rs.getInt(4)%></td><td><i class="fas fa-rupee-sign"></i><%= rs.getInt(5)%></td><td><i class="fas fa-rupee-sign"></i><%= rs.getString(6)%></td>
		    <td><a href="CancelOrderAction.jsp?id=<%= rs.getInt(13)%>"><i class="fas fa-window-close"></i>Cancel</a></td>
		    <td><a href="DeliverOrderAction.jsp?id=<%= rs.getInt(13)%>"><i class="fas fa-dolly"></i>Deliver</a></td></tr>

<%}
  } catch (Exception e) {e.printStackTrace();}

%>		    
</table>
<%if(z==0)
{%><h1 style="color: white;">No Orders</h1>  <%}%>
</body>
</html>