<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.dao.SpecialistDao" %>
 <%@page import="com.db.DBConnection" %>
 <%@page import="com.entity.Specialist" %>
 <%@page import="java.util.ArrayList" %>
 <%@page import="java.util.List" %>
 <%@page import="com.dao.DoctorDao" %>
  <%@page import="com.entity.Doctor" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> View Doctors</title>
<%@include file="../components/allcss.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>


<p class="text-center fs-3 my-4">Medical Staff</p>

	<div class="col my-4 mx-4">
      <table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Full Name</th>
      
      <th scope="col">Qualification</th>
      <th scope="col">Speciality</th>
      <th scope="col">Mob No.</th>
      <th scope="col">Email</th>
      
      
  
  
    </tr>
  </thead>
  <tbody>
  <%
  	DoctorDao d=new DoctorDao(DBConnection.getConn());
  
  List<Doctor>l=d.getAllDoctor();
	for(Doctor s:l){%>
   
           <tr>
           <td><%=s.getId() %></td>
           <td><%=s.getFullName() %></td>
           <td><%=s.getQualification() %></td>
           <td><%=s.getSpecialist() %></td>
           <td><%=s.getMob() %></td>
           <td><%=s.getEmail() %></td>
           
           
           </tr>
           <tr></tr>


   <%
       }
   %>
  </tbody>
</table>



    </div>
   
</body>
</html>