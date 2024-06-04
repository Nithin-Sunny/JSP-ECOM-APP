<%@page import="com.user.bean.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.user.DAO.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<link rel="stylesheet" href="css/view.css">
</head>
<body>
<h1>User Details</h1>
<h2><a href="index.jsp">home</a></h2>
<%String msg=request.getParameter("msg");
if(msg!=null)
{%>
<h3><%=msg%></h3>		
<%}%>
<table border="1">
<tr><th>ID</th><th>NAME</th><th>PASSWORD</th><th>EMAIL</th><th>COUNTRY</th><th>EDIT</th><th>DELETE</th></tr>
<% List<User> li=UserDAO.getUser();
int z=0;
for(User e : li)
{ z=1;%>
<tr><td><%=e.getId() %></td><td><%= e.getName()%></td><td><%=e.getPass() %></td><td><%=e.getEmail()%></td><td><%=e.getCountry() %></td>
<td ><a style="color: orange;" href="Edit.jsp?id=<%=e.getId() %>">Edit</a></td><td ><a style="color: red;" href="Delete.jsp?id=<%=e.getId() %>">Delete</a></td></tr>	
<%}%>
</table>
<%if(z==0)
{%>
<h3>Empty!go back to <a href="index.jsp">home</a> and add some data.</h3>		
<%}%>
</body>
</html>