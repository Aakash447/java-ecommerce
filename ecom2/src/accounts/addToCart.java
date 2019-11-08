package accounts;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/addToCart")
public class addToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public addToCart() {
        super();
     
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String pId = request.getParameter("pId");
		String pName = request.getParameter("pName");
		String imageName = request.getParameter("imageName");
		String pPrice = request.getParameter("pPrice");
		
		
		try{
			
			Connection con = Connect_db.getConnection();
			
			String query ="Insert into cart values(?,?,?,?) ";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, pId);
			ps.setString(2, pName);
			ps.setString(3, imageName);
			ps.setString(4, pPrice);
			
			int i = ps.executeUpdate();
			if(i>0)
				out.print("Added to cart Successfully..");
			response.sendRedirect("products.jsp");
	
			}catch(Exception e2){ System.out.println(e2); }
		
		
	}

}
