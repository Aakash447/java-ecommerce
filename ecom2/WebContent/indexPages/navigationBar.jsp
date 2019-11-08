<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<nav class=" navbar-inverse" id="nav1">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">shopName</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="index.jsp">Home</a></li>
        <li><a  href="#">Page 1</a></li>
        <li><a href="products.jsp">Products</a></li>
        <li><a href="#">Page 3</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="adminServlet"><span class="glyphicon glyphicon-user"></span> SignIn</a></li>
        <li><a href="cart.jsp"><span class="glyphicon glyphicon-log-in"></span>Cart</a></li>
      </ul>
    </div>
  </div>
</nav>
