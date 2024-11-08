<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
 <%@page import="com.db.DBConnection" %>
  <%@page import="com.dao.DoctorDao" %>
  <%@page import="com.dao.Userdao" %>
  
  <%@page import="com.dao.AppointmentDao" %>
  
   <%@page import="com.dao.SpecialistDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<%@include file="../components/allcss.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>

<c:if test="${empty adminObj }">
<c:redirect url="../admin_login.jsp"></c:redirect>

</c:if>
<%
	DoctorDao doc_dao=new DoctorDao(DBConnection.getConn());
   Userdao user_dao =new Userdao(DBConnection.getConn());
   SpecialistDao spec_dao =new SpecialistDao(DBConnection.getConn());
   
  AppointmentDao appoin_dao =new AppointmentDao(DBConnection.getConn());

%>
<div class="dashboard pt-5">
<p class="text-center fs-3">Admin Dashboard</p>

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
<div class="row mx-auto">
			<div class="col-md-4">
				<div class="card paint-card">
				<a href="doctor.jsp" class="text-decoration-none">
					<div class="card-body text-dark text-center ">
						<i class="fas fa-user-md text-info fa-3x"></i><br>
						<p class="fs-4 text-center">
							Doctor <br><%=doc_dao.getDoctorCount() %>
						</p>
					</div>
					</a>
				</div>
			</div>



			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center ">
						<i class="fas fa-user-circle text-info fa-3x"></i><br>
						<p class="fs-4 text-center">
							User <br><%=user_dao.getUserCount() %>
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card paint-card">
					
					<div class="card-body text-center ">
						<i class="far fa-calendar-check text-info fa-3x"></i><br>
						<p class="fs-4 text-center">
							Total Appointment <br><%=appoin_dao.getAppointCount() %>
						</p>
					</div>
					
				</div>
			</div>

			<div class="col-md-4 mt-2">

				<div class="card paint-card " data-bs-toggle="modal"
					data-bs-target="#exampleModal">
					<div class="card-body text-center">
						<i class="fas text-info fa-medkit fa-3x" "></i><br>
						<p class="fs-4 text-center">
							Specialist <br><%=spec_dao.getSpecialistCount() %>
						</p>
					</div>
				</div>

			</div>

		</div>
	</div>
</dv>
<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       <form action="../addspecialist" method="post">
       	<div class="mb-3">
    <label for="specName" class="form-label">Specialist name</label>
    <input type="text" class="form-control" name="specName" id="specName" aria-describedby="text">
 
  </div>
  <div class="text-center mt-3">
  	<button type="submit" class="btn btn-primary">Add Specialist</button>
  </div>
       </form>
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>
</body>
</html>