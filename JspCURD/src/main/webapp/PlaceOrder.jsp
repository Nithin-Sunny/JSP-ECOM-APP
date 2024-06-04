<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@include file="UserHeader.jsp" %>
    <%@include file="UserFooter.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<link rel="stylesheet" href="css/PlaceOrder.css">
</head>
<body>
<%String id=request.getParameter("id"); %>
<h1>Enter the Contact Details</h1>
<form name="order-form" action="PlaceOrderAction.jsp" method="get">
<input type="hidden" name="id" value="<%= id%>">
<div class="form-container">
<div>
<label>Address:</label>
<input type="text" name="addr" >
</div>
<div>
<label>City:</label>
<input type="text" name="city">
</div>
<div>
<label>State:</label>
<input type="text" name="state">
</div>
<div>
<label>Country:</label>
<input type="text" name="country">
</div>
<button class="btn">SUBMIT</button>
</div>
</form>
</body>
</html>