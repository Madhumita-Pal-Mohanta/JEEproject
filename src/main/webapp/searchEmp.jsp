<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="models.EmpInfoModel"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
     String admincheck = (String)session.getAttribute("usertype");
     if (admincheck == null)
     {
    	 response.sendRedirect("adminlogin.jsp");
     }	
     else
     {
   %>
 <br/>
   <div align="center">
   
   <h3 style="color: blue;"> WELCOME <%= admincheck %></h3>
   <br/><br/>
 <nav>
         <a href="adminafterlogin.jsp">AFTER LOGIN HOME </a> |
         <a href="searchEmp.jsp">SEARCH EMP </a> |
         <a href="ViewAllEmp">VIEW ALL EMP </a> |
         <a href="DeleteUser.jsp">DEL EMP </a> |
         <a href="adminlogout.jsp">LOGOUT </a>
     </nav>
     <br/>
     
      <div style="color: red;font-size: large; font-weight: bold;">
   <%
      if (request.getAttribute("msg") != null)
    	  out.print(request.getAttribute("msg"));
   %>
   </div>
 <form action="searchEmpServlet" method ="post">
 
    <table>
        <tr>
            <td>Email</td>
            <td><input type="email" name="searchemail" placeholder="search User email id"/></td>
        </tr>
      
  
    <tr>
        <td></td>
        <td><input type="submit" value="Search User">
            &nbsp; &nbsp;
            <input type="reset" value="Clear"> </td>
    </tr>
   
    
    </table>
</form>


<br/>
      <%
       ArrayList<EmpInfoModel> searchemplist =(ArrayList<EmpInfoModel>) request.getAttribute("searchemplist");
    	
       if (searchemplist != null)
       {
    	   if (searchemplist.size()>0)
    	   {
      %> 
         <table border="1">
           <caption>SEARCH EMP DETAILS</caption>
           <tr>
             <th>NAME</th>
             <th>EMAIL</th>
             <th>SALARY</th>
             <th>CITY</th>
           </tr>
        
     <%
       for(EmpInfoModel empobj:searchemplist)
       {
     %>
    	 <tr>
    	   <td><% out.print(empobj.getName()); %></td>
    	   <td><% out.print(empobj.getEmail()); %></td>
           <td><% out.print(""+empobj.getSalary()); %></td>
    	   <td><% out.print(empobj.getCity()); %></td>
    	    <td> <form action="DeleteUserServlet" method="post">
    	            <input type="hidden" name="deleteemail" value="<%=empobj.getEmail()%>">
    	            <input type ="hidden" name= "jsppage" value ="searchpage">
    	            <input type="submit" value="Delete">
    	        </form> </td>
    	 </tr>
      <% 
       } //END FOR LOOP
       %>
          </table>
     
     <%
    } // END IF FOR ARRAY SIZE CHECK
   else {
	   
	   %>
	   <h3>NO SEARCH RECORED FOUND</h3>
	   <%
   }
     } //END IF NULL CHECK
    
    %>
    
 <%
     }
%>    
     
</div>
</body>
</html>