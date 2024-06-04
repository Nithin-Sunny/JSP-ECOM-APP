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
<link rel="stylesheet" href="adminCSS/AddNew.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
<%int id=0;

Connection con=ConnClass.getCon();
try {
	PreparedStatement smt=con.prepareStatement("select * from product");
   ResultSet rs=smt.executeQuery();
   while(rs.next())
   {
   	id=rs.getInt(1);
   }

} catch (Exception e) {
	
	e.printStackTrace();
}
%>
<h3 class="pid">Product ID:<%= id+1%></h3>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{%>
	<h4 class="success">Product Added Successfully!</h4>
<%}else if("invalid".equals(msg)){%><h4 class="error">Error!</h4>
<%}else if("empty".equals(msg)) {%> <h4 class="error">Fill all Fields!</h4> <%}%>



<form action="NewProductAction.jsp" method="post">
<div class="box">
<div class="one">
<div>
<label>Enter Name</label>
<input type="text" name="name" placeholder="Enter Product Name">
</div>
<div>
<label>Enter Category</label>
<input type="text" name="cat" placeholder="Enter Category">
</div>
</div>
<div class="two">
<div>
<label>Enter Price</label>
<input type="text" name="price" placeholder="Enter Price">
</div>
<div>
<label>Active</label>
<select name="active">
<option>Yes</option>
<option>No</option>
</select>
</div>
</div>
</div>
<button><a>Save</a><i class="fa fa-plus-circle"></i></button>
</form>
</body>
</html>