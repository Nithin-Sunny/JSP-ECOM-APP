<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.jsp.Connection.ConnClass"%>
<%@page import="java.sql.Connection"%>
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
String ids=request.getParameter("idn");
String name=request.getParameter("name");
String cat=request.getParameter("cat");
String s=request.getParameter("price");
String active=request.getParameter("active");

int i=0;
if(name.isEmpty()||cat.isEmpty()||s.isEmpty())
{
	response.sendRedirect("Edit.jsp?msg=empty");
}
else
{	
Connection con=ConnClass.getCon();
int amt=Integer.parseInt(s);
int idn=Integer.parseInt(ids);
try{
PreparedStatement smtp=con.prepareStatement("UPDATE product SET name='"+name+"',category='"+cat+"',price='"+amt+"',active='"+active+"' WHERE id='"+idn+"'; ");
i = smtp.executeUpdate();
if("No".equals(active))
{
	PreparedStatement smt=con.prepareStatement("delete from cart WHERE Product_id='"+idn+"'; ");
	i = smt.executeUpdate();	
}
con.close();

} catch (Exception e) {
	
	e.printStackTrace();
}

if(i>0)
{
	response.sendRedirect("ViewEdit.jsp?msg=valid");
}
else
{
	response.sendRedirect("ViewEdit.jsp?msg=invalid");
}
}

%>
</body>
</html>