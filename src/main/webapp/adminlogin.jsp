<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div align="center">
 <nav>
         <a href="index.jsp">HOME </a> |
         <a href="reg.jsp">REG </a> |
         <a href="emplogin.jsp">LOGIN </a> |
         <a href=#>CONTACT US </a> |
          <a href="adminlogin.jsp">ADMIN LOGIN</a> 
     </nav>
    <br /><br />

    <h3 style="color: brown;">ADMIN LOGIN</h3>

  <div style="color: red;font-size: large; font-weight: bold;">
  <%
  if(request.getAttribute("msg") != null)
	  out.print(request.getAttribute("msg"));
   %>
    <br/>
  
  </div>
  
    <form action="AdminLoginServlet" method ="post">
        <input type="text" name="adminloginid"  placeholder="Enter ID">
        <br /> <br />
        <input type="password" name="adminpassword" placeholder="Password">
        <br /> <br />
        <input type="submit" value="LOGIN">
    </form>
</div>

</body>
</html>