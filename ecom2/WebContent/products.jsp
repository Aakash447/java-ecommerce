<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
 
	 <!--body   class="Productsp"  -->
	<div  style="padding-bottom:0px"> 
		
		<% try{
 String sql2 ="select pid,pname,imageName,pprice from products ";
 resultSet = statement.executeQuery(sql2);
 %>
 <div class="Products">
 <%
 while(resultSet.next()){
	 String pId = resultSet.getString(1);
	 String pName = resultSet.getString(2);
	 String imageName = resultSet.getString(3);
	 String pPrice = resultSet.getString(4);
 
%>	 
 
    
    <div class="items">
      <div class="panel panel-primary">
        <div class="panel-heading"><%= pName %></div>
        <div class="panel-body"><img src="images/<%=imageName%>" class="img-responsive" style="width:100%; height:150px" alt="Image"></div>
        <div class="panel-footer"><%= pPrice %></div>
        <form action="addToCart" method="post">
        <input type="hidden" name="pId" value="<%=pId  %>">
        <input type="hidden" name="pName" value="<%=pName  %>">
        <input type="hidden" name="imageName" value="<%=imageName  %>">
        <input type="hidden" name="pPrice" value="<%=pPrice  %>">
        <input align="right" type="submit" name="submit" value="Add to Cart">
        </form>
      </div>
    </div>
 <%
 }
		}catch(Exception e){
			e.printStackTrace();
		}
  	
 
 %> 
  
</div>
		
		
	</div>
	 <!-- body ends -->

</div>
<br>
	<script src="indexPages/index.js"></script> 

</body>
</html>
