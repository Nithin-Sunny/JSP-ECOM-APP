<%@page import="com.jsp.Connection.ConnClass"%>
<%@page import="java.sql.*"%>
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
int id=Integer.valueOf(ids);
String pagev=request.getParameter("page");
Connection con=ConnClass.getCon();
try{
PreparedStatement smtd=con.prepareStatement("delete from cart where order_id='"+id+"'");
int i=smtd.executeUpdate();

if(i>0)
{
	response.sendRedirect(pagev+".jsp?msg=Removed");
}
else
{
	response.sendRedirect(pagev+".jsp?msg=notRemoved");	
}

} catch (Exception e) {
	
	e.printStackTrace();
}
%>
</body>
</html>