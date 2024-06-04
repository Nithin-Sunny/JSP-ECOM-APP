
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<link rel="stylesheet" href="adminCSS/adminHeader.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
 
<div class="container ">
   <%  try{
	   String email=session.getAttribute("email").toString();
	   }catch(Exception e){
		   response.sendRedirect("../index.jsp");
	   }
	   %>
   
    <h3>ADMIN</h3>
    <div class="links">
  <a href="AddNewProduct.jsp">Add New Product<i class="fa fa-plus-square"></i></a>
  <a href="ViewEdit.jsp">All Products & Edit Products<i class="fab fa-elementor"></i></a>
  <a href="ChatList.jsp">Messages Received<i class="fas fa-comment-alt"></i></a>
  <a href="Orders.jsp">Orders Received<i class="fas fa-archive"></i></a>
  <a href="CancelledOrders.jsp">Cancelled Orders<i class="fas fa-window-close"></i></a>
  <a href="DeliveredOrders.jsp">Delivered Orders<i class="fas fa-dolly"></i></a>
  <a href="../logout.jsp">Logout<i class="fas fa-sign-out-alt"></i></a>
  </div>
        

</div>
</body>
</html>