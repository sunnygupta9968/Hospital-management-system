<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="com.dao.SpecialistDao" %>
 <%@page import="com.db.DBConnection" %>
 <%@page import="com.entity.Specialist" %>
 <%@page import="java.util.ArrayList" %>
 <%@page import="java.util.List" %>
 <%@page import="com.dao.DoctorDao" %>
 <%@page import="com.dao.PatientDao" %>
  <%@page import="com.entity.Doctor" %>
   <%@page import="com.entity.Patient" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patients</title>
<%@include file="../components/allcss.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>
<c:if test="${empty doctorObj }">
<c:redirect url="../doctor_login.jsp"></c:redirect>

</c:if>
<div class="container my-5">
  <div class="row">
    <div class="col col-4">
      <p class="fs-3 text-center">Add Patients</p>
							<c:if test="${not empty succMsg }">
			<div class="alert alert-success text-center" role="alert">
				 ${succMsg}
			</div>
							
		<c:remove var="succMsg" scope="session" />
		</c:if>
		<c:if test="${not empty errorMsg }">
			<div class="alert alert-danger text-center" role="alert">
				 ${errorMsg}
			</div>
							
		<c:remove var="errorMsg" scope="session" />
		</c:if>
						<form action="../addPatient" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="fullName" class="form-control">
							</div>



							<div class="mb-3">
								<label class="form-label">Age</label> <input required
									name="age" min="1" max="100" type="number" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Department</label> <select name="department"
									required class="form-control">
									<%SpecialistDao dao=new SpecialistDao(DBConnection.getConn());
									List<Specialist>list=dao.getAllSpecialist();
									for(Specialist s:list){%>
									<option value="<%=s.getSpecialistName() %>"><%=s.getSpecialistName() %></option>

									<%}
									%>
								
								</select>
							</div>
						<div class="mb-3">
								<label class="form-label">Doctor</label> <select name="doctor"
									required class="form-control">
									<%DoctorDao ddao=new DoctorDao(DBConnection.getConn());
									List<Doctor>dl=ddao.getAllDoctor();
									for(Doctor s:dl){%>
									<option value="<%=s.getFullName() %>"><%=s.getFullName() %></option>

									<%}
									%>
								
								</select>
							</div>
							<div class="mb-3">
								<label class="form-label">Email</label> <input type="text"
									required name="email" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Mob No</label> <input type="text"
									required name="mobno" class="form-control">
							</div>

						
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
    </div>
    <div class="col">
      <table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Full Name</th>
      
      <th scope="col">Age</th>
      <th scope="col">Department</th>
       <th scope="col">Doctor</th>
      <th scope="col">Mob No.</th>
      <th scope="col">Email</th>
      
      
  
  
    </tr>
  </thead>
  <tbody>
  <%
  	PatientDao d=new PatientDao(DBConnection.getConn());
  
  List<Patient>l=d.getAllPatients();
	for(Patient p:l){%>
   
           <tr>
           <td><%=p.getId() %></td>
           <td><%=p.getFullName() %></td>
           <td><%=p.getAge() %></td>
           <td><%=p.getDepartment() %></td>
           <td><%=p.getDoctor() %></td>
            <td><%=p.getMobno() %></td>
           <td><%=p.getEmail() %></td>
           
           
           </tr>
           <tr></tr>


   <%
       }
   %>
  </tbody>
</table>



    </div>
   
  </div>
</div>
</body>
</html>