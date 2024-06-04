<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<link rel="stylesheet" href="css/userHeader.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
<div class="container ">
   <%    String email=" no name";
  try{ email=session.getAttribute("email").toString();
}catch(Exception e){
	   response.sendRedirect("index.jsp");
}
   %>
    <h3>Ecom Online Shopping</h3>
    <div class="links">
  <a href=""><%=email %><i class="fas fa-user"></i></a>
  <a href="UserHome.jsp">Home<i class="fas fa-home"></i></a>
  <a href="MyCart.jsp">My Cart<i class="fas fa-cart-arrow-down"></i></a>
  <a href="MyOrder.jsp">My Orders<i class="fas fa-dolly"></i></a>
  <a href="ChangeDetails.jsp">Change Details<i class="fas fa-edit"></i></a>
  <a href="ChatPage.jsp">Message Us<i class="fas fa-comment-alt"></i></a>
   <a href="About.jsp">About<i class="fas fa-info-circle"></i></a>
  <a href="logout.jsp">Logout<i class="fas fa-sign-out-alt"></i></a>
   <div><form action="UserHome.jsp" method="get"> <input style="outline: none;" type="text" name="search"><button type="submit"> <i  class="fas fa-search"></i></button></form></div>
  </div>
        

</div>
</body>
</html>