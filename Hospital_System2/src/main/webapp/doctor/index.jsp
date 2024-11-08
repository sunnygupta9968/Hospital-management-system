<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
 <%@page import="com.db.DBConnection" %>
  <%@page import="com.dao.DoctorDao" %>
  <%@page import="com.dao.Userdao" %>
   <%@page import="com.dao.SpecialistDao" %>
   <%@page import="com.dao.AppointmentDao" %>
   <%@page import="com.dao.SpecialistDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WELCOME Doctor</title>
<%@include file="../components/allcss.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>
<c:if test="${empty doctorObj }">
<c:redirect url="../doctor_login.jsp"></c:redirect>

</c:if>
<%
	DoctorDao doc_dao=new DoctorDao(DBConnection.getConn());
   Userdao user_dao =new Userdao(DBConnection.getConn());
   SpecialistDao spec_dao =new SpecialistDao(DBConnection.getConn());
   AppointmentDao appoin_dao =new AppointmentDao(DBConnection.getConn());

%>
<div class="dashboard pt-5">
<p class="text-center fs-3">Doctor Dashboard</p>

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
				<a href="doctors.jsp" class="text-decoration-none">
					<div class="card-body text-center text-dark ">
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
					<a href="patients.jsp" class="text-decoration-none">
					<div class="card-body text-center text-dark">
						<i class="fas fa-user-circle text-info fa-3x"></i><br>
						<p class="fs-4 text-center">
							Patients <br><%=doc_dao.getDoctorCount() %>
						</p>
					</div>
					</a>
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
					<div class="card-body text-center ">
						<i class="fas fa-medkit text-info fa-3x"></i><br>
						<p class="fs-4 text-center">
							Specialist <br><%=spec_dao.getSpecialistCount() %>
						</p>
					</div>
				</div>

			</div>

		</div>
	</div>
</dv>
</body>
</html>