<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
     String admincheck = (String)session.getAttribute("usertype");
     if (admincheck.equals(""))
     {
    	 response.sendRedirect("adminlogin.jsp");
     }	
     else
     {
   %>
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
   <br/>

 <form action="DeleteUserServlet" method ="post">
 
    <table>
        <tr>
            <td>Email</td>
            <td><input type="email" name="deleteemail" placeholder="delete User email id"/></td>
             <input type ="hidden" name= "jsppage" value ="DeleteUser">
            
        </tr>
      
  
    <tr>
        <td></td>
        <td><input type="submit" value="Delete User">
            &nbsp; &nbsp;
            <input type="reset" value="Clear"> </td>
    </tr>
   
    
    </table>
</form>
<%
}%>
</div>
</body>
</html>