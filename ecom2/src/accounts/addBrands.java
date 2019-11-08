package accounts;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession; 



public class addBrands extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// private static final String SAVE_DIR="images";
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  
	    PrintWriter out = response.getWriter(); 
	    out.println("Inside addbrands");
	    String bid = request.getParameter("bid");
	    String bname=request.getParameter("bname");  
	    
	    String cid = request.getParameter("cidn");
	    System.out.println("cid is:"+ cid);

	    try{  
	   
	    	Connection con=Connect_db.getConnection();  
	    	
	    	 String query="Insert into brands values(?,?)";
	    	 String query2="Insert into catbrand values(?,?)";
	    	PreparedStatement ps=con.prepareStatement(query);  
	   
	    	ps.setString(1,bid);  
	    	ps.setString(2,bname);
	    	int i = ps.executeUpdate();
			if(i>0)
				out.print("Brand added Successfully");
			
			PreparedStatement ps2 = con.prepareStatement(query2);
			ps2.setString(1,cid);
			ps2.setString(2,bid);
			int i2 = ps2.executeUpdate();
			if(i2>0)
				out.print("catid added Successfully");
			
			response.sendRedirect("admin/addBrand.jsp");
			
	    	          }catch(Exception e){System.out.println(e);}  
		
	}
	

}
