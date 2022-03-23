<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="models.EmpInfoModel"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
     EmpInfoModel empobj = (EmpInfoModel)session.getAttribute("empinfo");
     if (empobj == null)
     {
    	 response.sendRedirect("emplogin.jsp");
     }	
     else
     {
   %>
   
 <div align="center">
      <h3>EMP VIEW PROFILE</h3>
      <h3 style="color: blue;"> WELCOME <%= empobj.getName() %></h3>
  <br/>
    <nav>
         <a href="empafterlogin.jsp">EMP DASHBOARD </a> |
         <a href="empviewprofile.jsp">VIEW OWN PROFILE </a> |
         <a href="empupdateprofile.jsp">UPDATE PROFILE </a> |
         <a href="logoutemp.jsp">LOGOUT </a>
      </nav>
   <br/>
   
      <div style="color: red;font-size: large; font-weight: bold;">
   <%
      if (request.getAttribute("msg") != null)
    	  out.print(request.getAttribute("msg"));
   %>
   </div>
   <br/>
   <form action="UpdateEmpServlet" method="post">
       <input type="hidden" name="email" value="<%=empobj.getEmail()%>">
       <input type="hidden" name="pass" value="<%=empobj.getPassword()%>">
     <table>
      <tr>
        <td><label >Email :</label></td>
        <td><% out.print(empobj.getEmail()); %></td>
       
       </tr>
 
       <tr>
        <td><label >Name :</label></td>
        
         <td><input type="text" name="fullname" value="<%= empobj.getName() %>" required ></td>
       </tr>            

      
            
       <tr>
         <td><label >Salary :</label></td>
         <td><input type="text" name="salary" value="<%= empobj.getSalary() %>" required ></td>
       </tr>
            
       <tr>
          <td><label >City :</label></td>
          <td>
            <input type="text" name="city" value="<%= empobj.getCity() %>" required > </td>
        </tr>
        <tr>
           <td>&nbsp;</td>
           <td> <input type="submit" value="Update"> </td>
        </tr>
       </table>
     </form>
   
  </div>
  
  <%
     }
  %>

</body>
</html>