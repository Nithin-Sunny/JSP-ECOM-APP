<%@page import="java.util.List"%>
<%@page import="com.user.bean.User"%>
<%@page import="com.user.DAO.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/index.css">
</head>
<body>
<%
String ids=request.getParameter("id");
int idi=Integer.valueOf(ids);
 User e=UserDAO.getUser(idi);

%>
<h1>Edit User Details</h1>
<h2 style="margin-right: 170px;"><a href="index.jsp">home</a></h2>
<form action="EditAction.jsp" method="post">
<table>
<tr><td>Name:</td><td><input type="text" name="name" value="<%=e.getName()%>"></td></tr>
<tr><td>Password:</td><td><input type="password" name="pass" value="<%=e.getPass()%>"></td></tr>
<tr><td>Email:</td><td><input type="email" name="email" value="<%=e.getEmail()%>"></td></tr>
<tr><td>Country:</td><td><select name="country">
<option selected><%=e.getCountry()%></option>
<option value="India">India</option>
<option value="USA">USA</option>
<option value="China">China</option>
<option value="Russia">Russia</option>
<option value="Canada">Canada</option>
</select>
</td></tr>
<tr><td><input type="submit" value="Update"></td></tr>
</table>
<input type="hidden" name="id" value="<%= ids%>">
</form>
</body>
</html>