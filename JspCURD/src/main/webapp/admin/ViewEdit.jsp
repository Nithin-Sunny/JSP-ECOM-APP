<%@page import="java.sql.*"%>
<%@page import="com.jsp.Connection.ConnClass"%>
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
<h2>All Products And Edit Products</h2>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{%>
	<h4 class="success">Updated Successfully!</h4>
<%}else if("invalid".equals(msg)){%><h4 class="error">Updation Faild!</h4><%} %>
<table width='100%'>
<tr><th>ID</th><th>NAME</th><th>CATEGORY</th><th><i class="fas fa-rupee-sign"></i>PRICE</th><th>ACTIVE</th><th><i class="fas fa-edit"></i>Edit</th></tr>
<%

Connection con=ConnClass.getCon();
try {
	PreparedStatement smt=con.prepareStatement("select * from product");
   ResultSet rs=smt.executeQuery();
   while(rs.next())
   {
   	%>

<tr><td><%= rs.getInt(1)%></td><td>	<%= rs.getString(2)%></td><td><%= rs.getString(3)%></td><td><i class="fas fa-rupee-sign"></i><%= rs.getInt(4)%></td><td><%= rs.getString(5)%></td>
		    <td><a href="Edit.jsp?id=<%= rs.getInt(1)%>"><i class="fas fa-edit"></i>Edit</a></td></tr>

<%}
  } catch (Exception e) {e.printStackTrace();}

%>		    
</table>

</body>
</html>