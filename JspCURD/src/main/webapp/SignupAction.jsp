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

String name=request.getParameter("name");
String pass=request.getParameter("pass");
String email=request.getParameter("email");
String qst=request.getParameter("qst");
String ans=request.getParameter("ans");
String mob=request.getParameter("mob");
if(name.isEmpty()||pass.isEmpty()||email.isEmpty()||qst.isEmpty()||ans.isEmpty()||mob.isEmpty())
{
	response.sendRedirect("SignUp.jsp?msg=empty");
}
else{
Connection con=ConnClass.getCon();
try{
PreparedStatement smt=con.prepareStatement("insert into user(name,email,password,mobnumber,quest,ans)values(?,?,?,?,?,?);");
smt.setString(1, name);
smt.setString(2,email );
smt.setString(3, pass);
smt.setString(4, mob);
smt.setString(5, qst);
smt.setString(6, ans);

int i = smt.executeUpdate();

if(i>0)
{
	response.sendRedirect("SignUp.jsp?msg=valid");
}
else
{
	response.sendRedirect("SignUp.jsp?msg=invalid");	
}

} catch (Exception e) {
	
	e.printStackTrace();
}

}
%>
</body>
</html>