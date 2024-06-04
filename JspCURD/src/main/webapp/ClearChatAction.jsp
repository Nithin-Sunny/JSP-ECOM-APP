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
String id=request.getParameter("id");
Connection con=ConnClass.getCon();
try {
	
	PreparedStatement smtd=con.prepareStatement("delete from chat where user_id='"+id+"' or admin_replay_to='"+id+"'");
	int i=smtd.executeUpdate();
	response.sendRedirect("ChatPage.jsp"); 
} catch (Exception e) {
	
	e.printStackTrace();
}
%>
</body>
</html>