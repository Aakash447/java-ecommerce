package accounts;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  
	    PrintWriter out = response.getWriter();  
	          
	    String email=request.getParameter("email");  
	    String password=request.getParameter("password");  
	          
	    try {
			if(LoginDAO.validate(email, password)){  
				  HttpSession session=request.getSession();  
			        session.setAttribute("email",email);  
			    RequestDispatcher rd=request.getRequestDispatcher("admin/adminPanel.html");  
			    rd.forward(request,response);  
			}  
			else{  
			    out.print("Sorry username or password error");  
			    RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
			    rd.include(request,response);  
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	          
	    
	}

}