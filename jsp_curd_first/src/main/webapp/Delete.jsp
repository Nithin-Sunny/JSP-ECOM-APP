<%@page import="com.user.DAO.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String ids=request.getParameter("id");
int idi=Integer.valueOf(ids);
int i=UserDAO.deleteUser(idi);
if(i>0)
{
response.sendRedirect("ViewUser.jsp?msg=Deleted successfully");	
}
else
{
	response.sendRedirect("ViewUser.jsp?msg=Deletion Failed");
}
%>
</body>
</html>