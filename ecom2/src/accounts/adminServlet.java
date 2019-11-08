package accounts;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/adminServlet")
public class adminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public adminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
    protected void doGet(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
		response.setContentType("text/html");  
		PrintWriter out=response.getWriter();  
		 
		HttpSession session=request.getSession(false);  
		if(session!=null){  
		String email=(String)session.getAttribute("email");  
		 
		response.sendRedirect("admin/adminPanel.html");
		System.out.print("Hello, "+email+" Welcome to Profile"); 
		}  
		else{  
		  out.print("Please login first");  
		  request.getRequestDispatcher("signIn.html").include(request, response);  
		}  
		out.close();  
		}  

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
