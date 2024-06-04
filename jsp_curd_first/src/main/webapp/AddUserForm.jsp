<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/userForm.css">
</head>
<body>
<h1>Create New User</h1>
<h2 style="margin-right: 170px;"><a href="index.jsp">home</a></h2>
<form action="AddUser.jsp" method="post">
<table>
<tr><td>Name:</td><td><input type="text" name="name"></td></tr>
<tr><td>Password:</td><td><input type="password" name="pass"></td></tr>
<tr><td>Email:</td><td><input type="email" name="email"></td></tr>
<tr><td>Country:</td><td><select name="country">
<option value="India">India</option>
<option value="USA">USA</option>
<option value="China">China</option>
<option value="Russia">Russia</option>
<option value="Canada">Canada</option>
</select>
</td></tr>
</table>
<button type="submit">save</button>
</form>
</body>
</html>