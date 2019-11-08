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
 Connection connection = null;
 Statement statement = null;
 ResultSet resultSet = null;
 %>
 <% 
  try{
 connection = Connect_db.getConnection();

 statement=connection.createStatement();
 %>
 <%
   response.setHeader( "Pragma", "no-cache" );
   response.setHeader( "Cache-Control", "no-cache" );
   response.setDateHeader( "Expires", 0 );
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
			<div class="sidenavl">
				 <% 
					 String sql ="select cname from categories ";
					 resultSet = statement.executeQuery(sql);
				 %>
				 <%
				 	while(resultSet.next()){
					 	String cname = resultSet.getString("cname");
				 
				 %>
		            <h4><a href="#"><%=cname %></a></h4>
		         <% } %>     
		      
		    </div>
		
		
		    <div class="sidenavr">
			<%
			    resultSet.beforeFirst();
			 	while(resultSet.next()){
				 	String cname = resultSet.getString("cname");
			%> 
		      <h4><a href="#"><%=cname %></a></h4>
			<%
		 	}
		  	} catch (Exception e) {
		  		e.printStackTrace();
		  	}
		
			 %>
		 	</div>
</body>
</html>