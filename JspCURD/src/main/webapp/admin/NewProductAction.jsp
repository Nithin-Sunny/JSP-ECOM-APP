
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page import="com.jsp.Connection.ConnClass"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
<%
int i=0;
String name=request.getParameter("name");
String cat=request.getParameter("cat");
String s=request.getParameter("price");
String active=request.getParameter("active");
if(name.isEmpty()||cat.isEmpty()||s.isEmpty())
{
	response.sendRedirect("AddNewProduct.jsp?msg=empty");
}
else
{	
Connection con=ConnClass.getCon();
int amt=Integer.parseInt(s);
try{
PreparedStatement smt=con.prepareStatement("insert into product(name,category,price,active)values('"+name+"','"+cat+"','"+amt+"','"+active+"');");
i = smt.executeUpdate();
con.close();

} catch (Exception e) {
	
	e.printStackTrace();
}

if(i>0)
{
	response.sendRedirect("AddNewProduct.jsp?msg=valid");
}
else
{
	response.sendRedirect("AddNewProduct.jsp?msg=invalid");
}
}
%>
</body>
</html>