package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public AdminLoginServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String adminid=request.getParameter("adminloginid");
		String adminpassword=request.getParameter("adminpassword");
		System.out.println(adminid  + "   " +  adminpassword);
		
		
      String redirectfilename="";
		
		if (adminid.equals("admin") && adminpassword.equals("admin"))
		{
			redirectfilename = "adminafterlogin.jsp";
			HttpSession session = request.getSession(true);
			System.out.println(" Hello");
			session.setAttribute("usertype", "ADMIN");
			System.out.println(redirectfilename);
		
		}
		else
		{
			redirectfilename = "adminlogin.jsp";
			request.setAttribute("msg", "INVALID UID OR PASSWORD");
			System.out.println(redirectfilename);
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(redirectfilename);

		
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
