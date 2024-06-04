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

String addr="";
String city="";
String state="";
String country="";
String olde=session.getAttribute("email").toString();
String name=request.getParameter("name");
String pass=request.getParameter("pass");
String email=request.getParameter("email");
String qst=request.getParameter("qst");
String ans=request.getParameter("ans");
String mob=request.getParameter("mob");
if(name.isEmpty()||pass.isEmpty()||email.isEmpty()||qst.isEmpty()||ans.isEmpty()||mob.isEmpty())
{
	response.sendRedirect("ChangeDetails.jsp?msg=empty");
}
else{
Connection con=ConnClass.getCon();

try{
	PreparedStatement smt=con.prepareStatement("insert into user(name,email,password,mobnumber,quest,ans,address,city,state,country)values(?,?,?,?,?,?,?,?,?,?);");
smt.setString(1, name);
smt.setString(2,email );
smt.setString(3, pass);
smt.setString(4, mob);
smt.setString(5, qst);
smt.setString(6, ans);
smt.setString(7, addr);
smt.setString(8, city);
smt.setString(9, state);
smt.setString(10,country);
int i = smt.executeUpdate();

PreparedStatement smtu=con.prepareStatement("update cart set email='"+email+"' where email='"+olde+"'");
smtu.executeUpdate();

PreparedStatement smtd=con.prepareStatement("delete from user where email='"+olde+"'");
smtd.executeUpdate();

if(i>0)
{
	response.sendRedirect("ChangeDetails.jsp?msg=valid");
}
else
{
	response.sendRedirect("ChangeDetails.jsp?msg=invalid");	
}

} catch (Exception e) {
	
	e.printStackTrace();
}
session.setAttribute("email", null);
}
%>
</body>
</html>