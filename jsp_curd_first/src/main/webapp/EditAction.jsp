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
<jsp:useBean id="us" class="com.user.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="us"/>
<%int i=UserDAO.updateUser(us.getId(),us.getName(),us.getPass(),us.getEmail(),us.getCountry());
if(i>0)
{
response.sendRedirect("ViewUser.jsp?msg=Updated successfully");	
}
else
{
	response.sendRedirect("ViewUser.jsp?msg= Updation Failed");
}%>
</body>
</html>