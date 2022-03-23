package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EmpDAO;
import models.EmpInfoModel;


@WebServlet("/searchEmpServlet")
public class searchEmpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public searchEmpServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String searchemail=request.getParameter("searchemail");
		
		EmpDAO empdaoobj = new EmpDAO();
		ArrayList<EmpInfoModel> searchemplist = empdaoobj.searchEmpRecord(searchemail);
		
		request.setAttribute("searchemplist", searchemplist);
		RequestDispatcher rd = request.getRequestDispatcher("searchEmp.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
