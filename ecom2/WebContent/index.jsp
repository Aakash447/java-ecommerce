
<!DOCTYPE html>
<html lang="en">
<head>
	  <title>Store</title>
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="css/index.css">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
 	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
	<%@include file="indexPages/header.jsp" %>
	<%@include file="indexPages/navigationBar.jsp" %>
 
 	<div class="container-fluid ">    
  		<%@include file="indexPages/Con_sidebar.jsp" %>
 
	 <!--body  -->
	<div class="Products" style="padding-bottom:0px">
		<%@include file="indexPages/carousel.html" %>
		<%@include file="indexPages/carousel.html" %>
		<%@include file="indexPages/carousel.html" %>
		<%@include file="indexPages/carousel.html" %>
		<%@include file="indexPages/carousel.html" %>
		<%@include file="indexPages/carousel.html" %>
		
	</div>
	 <!-- body ends -->

</div>
<br>
	<script src="indexPages/index.js"></script> 

</body>
</html>
