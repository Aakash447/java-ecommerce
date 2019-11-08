<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.File"%>
<%@page import="javax.servlet.http.Part"%>
<%@page import="accounts.Connect_db"%>
<% 
 Connection con = null;
 Statement stmt = null;
 ResultSet rs = null;
 int tprice=0;
 %>
 <% 
  try{
 con = Connect_db.getConnection();

 stmt=con.createStatement();
 %>
 <%
   response.setHeader( "Pragma", "no-cache" );
   response.setHeader( "Cache-Control", "no-cache" );
   response.setDateHeader( "Expires", 0 );
%>
    
    
    
<!DOCTYPE html>
<html>
	<head>
		<title>Shopping Cart</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>		
		<link rel="stylesheet" type="text/css" href="css/cart.css"/>
		<link rel="stylesheet" href="css/index.css">
		 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
 	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 
	</head>

<body>

<%@include file="indexPages/navigationBar.jsp" %>






	<div style=" padding:10px">
	
	<div style="margin-left:300px;margin-top:130px;float:left"> <img src="otherImage/shopping.png" class="img-responsive" style="width:300px; height:200px" alt="Image">
	</br></br><Center><h2>Your Shopping Cart</h2></Center>
	 </div>
	 
	<div class="table-wrapper-scroll-y my-custom-scrollbar" style="margin-left:800px;margin-right:100px;margin-top:100px;">
<table class="table table-condensed tbody" >
    <thead>
      <tr>
        <th>Qty</th>
        <th>PName</th>
        <th>Image</th>
        <th>Price</th>
        <th>Operations</th>
      </tr>
    </thead>
  
				
	<% 
 	String sql ="select * from cart ";
 	rs = stmt.executeQuery(sql);
 	
 	%>
 	 <tbody>
 	<% 
 	 while(rs.next()){
	 String pId = rs.getString(1);
	 String pName = rs.getString(2);
	 String imageName = rs.getString(3);
	 String pPrice = rs.getString(4);
	 tprice = tprice + Integer.parseInt(pPrice);
 
%>	 
		
		      <tr>
		        <td>1	</td>
		        <td><%=pName %>	</td>
		        <td><img src="images/<%=imageName%>" class="img-responsive" style="width:200px; height:150px" alt="Image">	</td>
		        <td><%=pPrice %>	</td>
		        <td><a href="deleteProduct?pId=<%=pId%>"><button>Delete</button></a> </td>
		      </tr>
		    
				
<%
 }

 } catch (Exception e) {
 e.printStackTrace();
 }
 %> 
					</tbody>

  </table>
  </div>	
  </div>
	</body>
</html>