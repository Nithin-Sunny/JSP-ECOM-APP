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
<title>Insert title here</title>
<link rel="stylesheet" href="adminCSS/AdminChatPage.css">
</head>
<body>
<%String user=request.getParameter("id"); %>
<h4>Chat With <%=user %> </h4>
<div class="out-cont">
<div class="in-cont">
<div class="table-con">
<table width="100%">
<%

String admin=session.getAttribute("email").toString();
String msg="";
 msg=request.getParameter("cmtin");
 
Connection con=ConnClass.getCon();
try {
	
	if(msg!=null&&msg!="")
	{
		PreparedStatement smt=con.prepareStatement("insert into chat (user_id,comments, admin_replay_to)values(?,?,?)");
		smt.setString(1,admin );
		smt.setString(2,msg );
		smt.setString(3,user );
         int i = smt.executeUpdate();
	}
	
	PreparedStatement smtd=con.prepareStatement("select * from chat where user_id='"+user+"' or admin_replay_to='"+user+"'");
	 
	ResultSet rs=smtd.executeQuery();
  
   while(rs.next())
   {
     if(user.equals(rs.getString(1)))
   {%>  
<tr class="user"><td><%=rs.getString(1)+": "+rs.getString(2) %></td></tr>
<%}else{%>
<tr class="admin"><td><%=rs.getString(2) %></td></tr>
<%}}
   }catch(Exception e){}%>

</table>
<a id="bottom"></a>
</div>
</div>
<form action="AdminChatPage.jsp" method="get"><input type="hidden" name="id" value="<%=user%>"><input type="text" name="cmtin"><button >send</button ></form>
</div>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded",function(event){
	var b=document.getElementById('bottom');
	b.scrollIntoView();
});
</script>
</body>
</html>