<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="accounts.Connect_db"%>
<%
 try{ 
	 Connection connection = null;
	 Statement statement = null;
	 ResultSet resultSet = null;
	   
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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<body>
<form action="../addBrands" method="post" >
<% 

 String sql ="select cid,cname from categories";
 resultSet = statement.executeQuery(sql);
 %>	
 Category: <select id="clist" onchange="getSelectedValue()">
 
 <%  
 while(resultSet.next()){
	 String cid = resultSet.getString("cid");
	 String cname = resultSet.getString("cname");
	%> <option value="<%=cid %>"><%=cname %></option>
<% }  
 }catch(Exception e){
	 out.println("In catch rs2");
	out.println(e);
} %>
</select> 
</br></br>
<input type="hidden" id="cidi" name="cidn" value="">
Brand ID <input type="text" name="bid"/></br></br>
Brand Name <input type="text" name="bname"/></br></br>
<input type="submit" name="submit">

</form>

<script type="text/javascript">
	
	function getSelectedValue(){
		var sv = document.getElementById("clist").value;
		console.log(sv);
		document.getElementById('cidi').value = sv;
		}
	getSelectedValue();
	
</script>


</body>
</html>


