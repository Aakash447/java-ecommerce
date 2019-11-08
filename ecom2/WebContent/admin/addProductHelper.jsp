<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="accounts.Connect_db"%>
    <%@ page import="java.sql.*"%>  
     <!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head> 
      <body>
        <select class="form-control" name="state" id="state">
            <option>Select brand</option>
    <%  
    String c_id=request.getParameter("c_id");  
    if(c_id==null || c_id.trim().equals("")){  
    out.print("Please enter id");  
    }else{   
    try{  
    Connection con=	Connect_db.getConnection();
    String sql2 ="select bid,bname from brands where bid in ( Select bid from catbrand where cid = '"+ c_id +"' )";
    PreparedStatement ps =con.prepareStatement(sql2); 
    ResultSet rs=ps.executeQuery();  
    while(rs.next()){
    	
    %>	
  	 <option value="<%=rs.getString("bid")%>"><%=rs.getString("bname")%></option>
    <% 	
    }  
     %>
      </select>
      <%
    }catch(Exception e){e.printStackTrace();}  
    }
    %> 
    
    </select>
    </body>
    </html>
    