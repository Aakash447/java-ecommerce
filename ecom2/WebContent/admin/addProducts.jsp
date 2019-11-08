
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="accounts.Connect_db"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
 try{ 
	 Connection connection = null;
	 Statement statement = null;
	 ResultSet resultSet = null;
	 PreparedStatement ps = null;
	   
connection = Connect_db.getConnection();
statement=connection.createStatement();
 %>
 
  <%
   response.setHeader( "Pragma", "no-cache" );
   response.setHeader( "Cache-Control", "no-cache" );
   response.setDateHeader( "Expires", 0 );
%>
        
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
 	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

</head>

<body>
<form action="../addProducts" method="post" enctype="multipart/form-data" class="form-horizontal" autocomplete="on">
<fieldset>

<!-- Form Name -->

<legend>PRODUCTS</legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_id">Product Id</label>  
  <div class="col-md-4">
  <input type="text" name="pid" class="form-control input-md" >
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_id">Product Name</label>  
  <div class="col-md-4">
  <input type="text" name="pname" class="form-control input-md" >
  </div>
</div>


 
 <!-- For Categories -->
  <% 

 String sql ="select cid,cname from categories";
 resultSet = statement.executeQuery(sql);
 %>	 
 <!-- Text input-->
	<div class="form-group">
 	<label class="col-md-4 control-label" for="product_id">Category Name</label>  
  	<div class="col-md-4">
  	<select id="clist" name="clistn" >
  		<option>Select Category </option>
<%  
 while(resultSet.next()){
	 String cid = resultSet.getString("cid");
	 String cname = resultSet.getString("cname");
	%> <option value="<%=cid %>">
	<%=cname %></option>

<% }  %>
</select>
</div>
</div>

 <!--  For Brands -->
 <% 
String c=null;
 String sql2 ="select bname from brands where bid in ( Select bid from catbrand where cid = '"+ c +"' )";
 ps =connection.prepareStatement(sql2);
 resultSet = ps.executeQuery(sql2);

 %>	   
 <!-- Text input-->
	<div class="form-group">
 	<label class="col-md-4 control-label" for="product_id">Brand Name</label>  
  	<div class="col-md-4">
  	<select name="blistn" id="blist" >
<%  
 while(resultSet.next()){
	
	 String bname = resultSet.getString("bname");
	%> <option value="<%=bname %>">
	<%=bname %></option>

<% }  
 }catch(Exception e){
	 out.println("In catch rs2");
	out.println(e);
} %>


</select>
</div>
</div>



<!-- Text input  -->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_id">Product Image</label>  
  <div class="col-md-4">
  <input type="file" name="pimage" >
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_id">Product Price</label>  
  <div class="col-md-4">
  <input type="number" name="pprice" class="form-control input-md" >
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_id">Keywords</label>  
  <div class="col-md-4">
  <input type="text" name="key" class="form-control input-md">
  </div>
</div>



<center><input type="submit" name="submit" class=""></center>
</fieldset>
</form>


<script>

    $(window).on("load",function () {
    	
        $("#clist").on("change", function () {
            var c_id = $("#clist").val();//id of country select box of index.jsp page;
            console.log("Category id is : "+ c_id);
                $.ajax({
                    url: "addProductHelper.jsp",//your jsp page name
                    data: {c_id : c_id},//sending request to state.jsp page.
                    method: "POST",//HTTP method.
                    success: function (data)
                    {
                        $("#blist").html(data);//output or response will display in state select box.
                    }
                });
        });
        
    });
</script>


</body>
</html>