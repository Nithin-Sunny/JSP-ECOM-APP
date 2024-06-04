<%@page import="com.jsp.Connection.ConnClass"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="adminHeader.jsp" %>
     <%@ include file="adminFooter.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<link rel="stylesheet" href="adminCSS/ViewEdit.css">
</head>
<body>

<h2>Messages Received</h2>
<table width='100%'>
<tr><th>UserID</th><th>Recent Message</th><th>Open Chat</th></tr>
<%
int z=0;
Connection con=ConnClass.getCon();
try {
	PreparedStatement smt=con.prepareStatement("select user_id from chat group by user_id ");
   ResultSet rs=smt.executeQuery();
   while(rs.next())
   {
   	%>       <%PreparedStatement smt2=con.prepareStatement("select * from chat where user_id='"+rs.getString(1)+"' and cmt_id=(select max(cmt_id) from chat where user_id='"+rs.getString(1)+"') ");
              ResultSet rs2=smt2.executeQuery();
              while(rs2.next())
              {z=1;
            	  if(!"admin@g.com".equals(rs2.getString(1)))
              {%>

            <tr><td><%= rs2.getString(1)%></td><td><%= rs2.getString(2)%></td>
		    <td><a href="AdminChatPage.jsp?id=<%= rs.getString(1)%>">Open</a></td></tr>

<%}}}
  } catch (Exception e) {e.printStackTrace();}
%>		    
</table>
<%if(z==0)
{%>
<h1 style="color: white;">No Messages</h1>
<% }%>
</body>
</html>