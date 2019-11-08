package accounts;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part; 


@MultipartConfig(fileSizeThreshold=1024*1024*2,maxFileSize=1024*1024*10,
											maxRequestSize=1024*1024*50)
@WebServlet("/addProducts")
public class addProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// private static final String SAVE_DIR="images";
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  
	    PrintWriter out = response.getWriter(); 
	    
	    
	    
	    String pid = request.getParameter("pid");
	    String pname=request.getParameter("pname");  
	    String cname = request.getParameter("clistn");
		String bname = request.getParameter("blistn");
		
	    Part part = request.getPart("pimage");
		String fileName = extractFileName(part);
		String savePath ="C:\\Users\\Aakash\\workspace\\ecom2\\WebContent\\images\\" + File.separator + fileName ;
		//@SuppressWarnings("unused")
		//File fileSaveDir = new File(savePath);
		//part.write(savePath + File.separator);
		
	    String pprice=request.getParameter("pprice");
	    String key = request.getParameter("key");

	    try{  
	    	
	    	Connection con=Connect_db.getConnection();
	    			
	    	String query="Insert into products values(?,?,?,?,?,?,?,?)";
	    	PreparedStatement ps=con.prepareStatement(query);  
	    //	String filePath = savePath + File.separator + fileName ;
	    	ps.setString(1,pid);  
	    	ps.setString(2,pname);
	    	ps.setString(3,cname);
	    	ps.setString(4,bname);
	    	ps.setString(5,fileName);
	    	ps.setString(6,savePath);
	    	ps.setString(7,pprice);
	    	ps.setString(8,key);
	    	      
	    	int i = ps.executeUpdate();
			if(i>0)
				out.print("Product added Successfully");
			RequestDispatcher rd=request.getRequestDispatcher("admin//addProducts.jsp"); 
			rd.forward(request,response);
	        
	    	
	    	 
	    	}catch(Exception e){System.out.println(e);}  
		
	}
	

	private String extractFileName(Part part ){
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for(String s: items){
			if(s.trim().startsWith("filename") ){
				return s.substring(s.indexOf("=") +2, s.length() -1 );
			}
		}
		return "";
	}
	

}
