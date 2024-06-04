<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
 <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="container">
<div class="leftdiv">
<form action="LoginAction.jsp" method="post">
<input type="email" name="email" placeholder="Enter Email">
<input type="password" name="pass" placeholder="Enter Password">
<button type="submit">Login</button>

<a href="SignUp.jsp">SighUp</a>
<a href="SignUp.jsp">Forgot Password?</a>
</form>
</div>
<div class="rightdiv">
<%String msg=request.getParameter("msg");
if("invalid".equals(msg))
{%>
	<h1 class="error">Invalid Username or Password</h1>	
<% }

%>
<h2>Online Shopping</h2>
<p>The Online shopping App provide User to Purchase Product Online Without Going To actual stores.</p>
</div>
</div>
</body>
</html>