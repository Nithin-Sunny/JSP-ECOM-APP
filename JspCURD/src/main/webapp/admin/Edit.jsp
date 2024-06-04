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
<link rel="stylesheet" href="adminCSS/AddNew.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
<%
int idn=0;
String ids=request.getParameter("id");
if(ids!=null){idn=Integer.parseInt(ids);}
%>

<%
String name="",cat="",act="";
int price=0;
Connection con=ConnClass.getCon();
try {
	PreparedStatement smt=con.prepareStatement("select * from product where id='"+idn+"'");
   ResultSet rs=smt.executeQuery();
   while(rs.next())
   {
   	 name=rs.getString(2);
   	 cat=rs.getString(3);
   	price=rs.getInt(4);
   	act=rs.getString(5);
   }

} catch (Exception e) {
	
	e.printStackTrace();
}
%>
<h2 style='color:white; margin-bottom:0px;'>Edit Product</h2>
<h3 class="pid">Product ID:<%= idn%></h3>


<form action="EditAction.jsp" method="post">
<input type="hidden" name="idn" value="<%=idn %>">
<div class="box">
<div class="one">
<div>
<label>Enter Name</label>
<input type="text" name="name" value="<%= name %>">
</div>
<div>
<label>Enter Category</label>
<input type="text" name="cat" value="<%= cat %>">
</div>
</div>
<div class="two">
<div>
<label>Enter Price</label>
<input type="text" name="price" value="<%= price %>">
</div>
<div>
<label>Active</label>
<select name="active" >
<option <%if("Yes".equals(act)){out.print("selected");} %>>Yes</option>
<option <%if("No".equals(act)){out.print("selected");} %>>No</option>
</select>
</div>
</div>
</div>
<button><a>UPDATE</a><i class="fa fa-plus-circle"></i></button>
</form>

</body>
</html>