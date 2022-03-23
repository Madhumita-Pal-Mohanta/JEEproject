package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EmpDAO;
import models.EmpInfoModel;


@WebServlet("/UpdateEmpServlet")
public class UpdateEmpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public UpdateEmpServlet() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		EmpInfoModel empobj = new EmpInfoModel();
		empobj.setName(request.getParameter("fullname"));
		empobj.setEmail(request.getParameter("email"));
		//empobj.setPassword(request.getParameter("pass"));
		empobj.setSalary(Double.parseDouble(request.getParameter("salary")));
		empobj.setCity(request.getParameter("city"));
		
		HttpSession session = request.getSession(true);
		session.setAttribute("empinfo", empobj);
		
		EmpDAO empdaoobj = new EmpDAO();
		boolean status = empdaoobj.updateRecord(empobj);
		if(status)
		{
			request.setAttribute("msg", "UPDATE SUCCESS");  
		}
		else
		{
			request.setAttribute("msg", "TRY AGAIN"); 
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("empupdateprofile.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
