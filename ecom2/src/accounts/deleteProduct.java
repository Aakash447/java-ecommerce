package accounts;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteProduct")
public class deleteProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String pId = request.getParameter("pId");
		
try{
			
			Connection con = Connect_db.getConnection();
			
			String query ="Delete from cart where pid= '"+pId +"' ";
			PreparedStatement ps = con.prepareStatement(query);
			
			int i = ps.executeUpdate();
			if(i>0)
				out.print("Product Deleted Successfully");
			response.sendRedirect("cart.jsp");
			
			
			
	
		}catch(Exception e2){ System.out.println(e2); }
		
		
		
	}

}
