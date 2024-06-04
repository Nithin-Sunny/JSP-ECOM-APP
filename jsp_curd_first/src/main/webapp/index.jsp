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
<h1>HOME</h1>
<%String msg=request.getParameter("msg");
if(msg!=null)
{%>
<h3><%=msg%></h3>		
<%}%>
<a href="UserForm.jsp">Add User</a>
<a href="ViewUser.jsp">View User</a>
</body>
</html>