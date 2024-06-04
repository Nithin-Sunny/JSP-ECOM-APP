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
<%int i=UserDAO.saveUser(us);
if(i>0)
{
response.sendRedirect("index.jsp?msg=Saved successfully");	
}
else
{
	response.sendRedirect("index.jsp?msg=Failed");
}

%>
</body>
</html>