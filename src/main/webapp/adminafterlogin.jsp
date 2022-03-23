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
     if (admincheck==null)
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
     
     <h3> This is admin home page</h3>
  </div>
<%
     }
%>
</body>
</html>