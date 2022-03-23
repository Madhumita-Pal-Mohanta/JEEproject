package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EmpDAO;


@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DeleteUserServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("deleteemail");
		String pagename = request.getParameter("jsppage");
		
		EmpDAO empdaoobj = new EmpDAO();
		
		boolean status = empdaoobj.deleteRecord(email);
		if(status)
		{
			request.setAttribute("msg", "USER DELETED");  
		}
		else
		{
			request.setAttribute("msg", "TRY AGAIN"); 
		}
		RequestDispatcher rd=null;
		if(pagename.equals("viewallpage"))
			rd = request.getRequestDispatcher("viewallemp.jsp");
		if(pagename.equals("searchpage"))
			rd = request.getRequestDispatcher("searchEmp.jsp");
		if(pagename.equals("DeleteUser"))
			rd = request.getRequestDispatcher("DeleteUser.jsp");
		
		rd.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
