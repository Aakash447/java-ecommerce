<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

	<!--  Header -->
  <div  style="background-color:black;border:2px solid red;  padding: 1px;">
    <h1 style="display:inline; padding:2px 10px 0px 40px ; color:white;">Name</h1>
    <div style="display:inline;margin-left:200px">
    	<select style="height:30px;margin:0px;">
    	  <option value="all">All</option>
		  <option value="volvo">Volvo</option>
		  <option value="saab">Saab</option>
		  <option value="mercedes">Mercedes</option>
		  <option value="audi">Audi</option>
		</select> 
		<form style="display:inline" method="post" action="searchedProducts.jsp" >
   		<input type="text" name="key" placeholder="Search Product here" style="margin:0px; width:700px; height:30px"/>
   		<input type="submit" name="search" value="search">
   		</form>
   </div>
    <p style=" padding:2px 10px 0px 40px ;color:white;" >Mission, Vision and Values</p>
  </div>
