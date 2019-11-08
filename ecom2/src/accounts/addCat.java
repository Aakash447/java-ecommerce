package accounts;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/addCat")
public class addCat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");  
	    PrintWriter out = response.getWriter(); 
	    
	    String cid = request.getParameter("cid");
	    String cname=request.getParameter("cname");  
	    

	    try{  
	   
	    	Connection con=Connect_db.getConnection();  
	    	
	    	 String query="Insert into categories values(?,?)";
	    	PreparedStatement ps=con.prepareStatement(query);  
	   
	    	ps.setString(1,cid);  
	    	ps.setString(2,cname);
	    	int i = ps.executeUpdate();
			if(i>0)
				out.print("category added Successfully");
			  
			response.sendRedirect("admin/addCat.html"); 
			
	    	          }catch(Exception e){System.out.println(e);}  
		
	}
		
	}


