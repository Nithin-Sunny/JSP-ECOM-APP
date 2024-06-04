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
<title>Insert title here</title>
<link rel="stylesheet" href="adminCSS/ViewEdit.css">
</head>
<body>
<h2>Delivered Orders</h2>
<%String msg=request.getParameter("msg");
 if("Removed".equals(msg))
{%>
	<h4 class="success">Removed!</h4>
<%}else if("notRemoved".equals(msg)){%><h4 class="error">Can't Remove!</h4><%} %>


<table width='100%'>
<tr><th>ORDER ID</th><th>NAME</th><th>QUANTITY</th><th><i class="fas fa-rupee-sign"></i>PRICE</th><th><i class="fas fa-rupee-sign"></i>TOTAL</th><th>REMOVE</th></tr>
<%

Connection con=ConnClass.getCon();
try {
	PreparedStatement smt=con.prepareStatement("select * from cart where delivered='yes' ");
   ResultSet rs=smt.executeQuery();
   while(rs.next())
   {
   	%>

<tr><td><%= rs.getInt(3)%></td><td>	<%= rs.getString(2)%></td><td><%= rs.getInt(4)%></td><td><i class="fas fa-rupee-sign"></i><%= rs.getInt(5)%></td><td><i class="fas fa-rupee-sign"></i><%= rs.getString(6)%></td>
		    <td><a href="../RemoveAction.jsp?id=<%= rs.getInt(13)%>&page=admin/DeliveredOrders"><i class="fas fa-minus-circle"></i>Remove</a></td></tr>

<%}
  } catch (Exception e) {e.printStackTrace();}

%>		    
</table>
</body>
</html>