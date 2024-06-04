<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<link rel="stylesheet" href="css/signup.css">
</head>
<body>
<div class="container">
<div class="leftdiv">
<form action="ChangeDetailsAction.jsp" method="post">
<input type="text" name="name" placeholder="Enter Name">
<input type="email" name="email" placeholder="Enter Email">
<input type="text" name="mob" placeholder="Enter Mobile Number">
<select name="qst">
<option >What was your first Car</option>
<option>What was the Name of your School</option>
<option>What is your Grandfather's name</option>
</select>
<input type="text" name="ans" placeholder="Enter Answer">
<input type="password" name="pass" placeholder="Enter Password">
<button type="submit">Apply</button>
<a href="index.jsp">Login</a>
</form>
</div>
<div class="rightdiv">
<%String msg=request.getParameter("msg");
if("invalid".equals(msg))
{%>
	<h1 class="error">Something went wrong!</h1>	
<% }%>
<% if("valid".equals(msg))
{%>
	<h1 class="success">Re-Registration Success!</h1>	
<% }%>
<%if("empty".equals(msg)) {%> <h4 class="error">Fill all Fields!</h4> <%}%>
<h2>Change your Details</h2>
<p>Login again with new username and password after Re-Registration</p>
</div>
</div>

</body>
</html>