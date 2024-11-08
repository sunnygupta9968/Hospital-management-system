<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
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
<title>Edit Doctor</title>
<%@include file="../components/allcss.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>

		
						<div class="container d-flex align-items-center justify-content-center ">
    <div class="col col-6">
      <p class="fs-3 text-center">Edit Doctor Details</p>
							<c:if test="${not empty succMsg }">
			<div class="alert alert-success text-center" role="alert">
				 ${succMsg}
			</div>
							
		<c:remove var="succMsg" scope="session" />
		</c:if>
		<c:if test="${not empty erroeMsg }">
			<div class="alert alert-danger text-center" role="alert">
				 ${succMsg}
			</div>
							
		<c:remove var="succMsg" scope="session" />
		
		</c:if>
		
		<%				if(request.getParameter("id")!=null){
						int id = Integer.parseInt(request.getParameter("id"));
		
						DoctorDao dao2 = new DoctorDao(DBConnection.getConn());
						Doctor d = dao2.getDoctorById(id);
						
						%>
						<form action="../updateDoctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="fullName" class="form-control" value="<%=d.getFullName()%>">
							</div>



							<div class="mb-3">
								<label class="form-label">Qualification</label> <input required
									name="qualification" type="text" class="form-control" value="<%=d.getQualification()%>">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label> <select name="spec"
									required class="form-control">
									<option value="<%=d.getSpecialist() %>"><%=d.getSpecialist() %></option>
									<%SpecialistDao dao=new SpecialistDao(DBConnection.getConn());
									List<Specialist>list=dao.getAllSpecialist();
									for(Specialist s:list){
									 if(s.getSpecialistName()==d.getSpecialist()){
										continue;
									 }
									 else{
									%>
									<option value="<%=s.getSpecialistName() %>"><%=s.getSpecialistName() %></option>

									<%}
									}
									%>
								
								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label> <input type="text"
									required name="email" class="form-control" value="<%=d.getEmail()%>">
							</div>

							<div class="mb-3">
								<label class="form-label">Mob No</label> <input type="text"
									required name="mobno" class="form-control" value="<%=d.getMob()%>">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label> <input required
									name="password" type="text" class="form-control" value="<%=d.getPassword()%>">
							</div>
							<div class="mb-3">
							<input required name="id" type="hidden" class="form-control" value="<%=id%>">
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
						
						
						
						
						
	<% 	}
		else{
			response.sendRedirect("doctor.jsp");
		}
						%>
						
</div>
</body>
</html>