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
 <%@page import="com.dao.AppointmentDao" %>
  <%@page import="com.entity.Doctor" %>
  <%@page import="com.entity.User" %>
  <%@page import="com.entity.appointments" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Appointments</title>
<%@include file="components/allcss.jsp" %>

</head>
<body>
<%@include file="components/navbar.jsp" %>
<c:if test="${empty userObj}">
<c:redirect url="user_login.jsp"></c:redirect>

</c:if>
<div class="container my-4 mx-1">
  <div class="row">
    <div class="col">
     <div class="col">
				<div class="card paint-card">
				
					<div class="card-body">
						<p class="text-center fs-3"> Book Appointment</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-4 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<p class=" fs-4 text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<form class="row g-3" action="bookAppoin" method="post">

							<input type="hidden" name="userid" value="${userObj.id }">

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Full Name</label> <input
									required type="text" value="${userObj.fullname }" class="form-control" name="fullname">
							</div>

							<div class="col-md-6">
								<label>Gender</label> <select class="form-control" name="gender"
									required>
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Age</label> <input
									required type="number" class="form-control" name="age">
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Appointment Date</label> <input type="date" class="form-control" required
									name="appoint_date">
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Email</label> <input
									required type="email" class="form-control" value="${userObj.email}" name="email">
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Phone No</label> <input
									maxlength="10" required type="text" class="form-control"
									name="phno">
							</div>


							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Diseases</label> <input
									required type="text" class="form-control" name="diseases">
							</div>

							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Doctor</label> <select
									required class="form-control" name="doctor">
									<option value="">--select--</option>

									<%
									DoctorDao dao = new DoctorDao(DBConnection.getConn());
									List<Doctor> list = dao.getAllDoctor();
									for (Doctor d : list) {
									%>
									<option value="<%=d.getId()%>"><%=d.getFullName()%> (<%=d.getSpecialist()%>)
									</option>
									<%
									}
									%>
								</select>
							</div>

							<div class="col-md-12">
								<label>Full Address</label>
								<textarea required name="address" class="form-control" rows="3"
									cols=""></textarea>
							</div>

							<c:if test="${empty userObj }">
								<a href="user_login.jsp" class="col-md-6 offset-md-3 btn btn-success">Submit</a>
							</c:if>

							<c:if test="${not empty userObj }">
								<button class="col-md-6 offset-md-3 btn btn-success">Submit</button>
							</c:if>
						</form>
					</div>
				</div>
				
			</div>
    </div>
    <div class="col mx-1">
      
			 <div class="col">
			 <div class="card paint-card mx-1">
				
					<div class="card-body">
			 <p class="text-center fs-3"> Booked Appointment</p>
    <c:if test="${not empty delSucc }">
			<div class="alert alert-success text-center" role="alert">
				 ${delSucc}
			</div>
							
		<c:remove var="delSucc" scope="session" />
		</c:if>
		<c:if test="${not empty delFail }">
			<div class="alert alert-danger text-center" role="alert">
				 ${delFail}
			</div>
							
		<c:remove var="delFail" scope="session" />
		</c:if>
      <table class="table">
  <thead class="thead-dark">
    <tr>
     
      <th scope="col">Full Name</th>
      <th scope="col">Age</th>
      <th scope="col">Appointment Date</th>
      <th scope="col">Mob no.</th>
     <th scope="col">Disease</th>
        <th scope="col">Doctor</th>
     <th scope="col">Action</th>
      
      
      
  
  
    </tr>
  </thead>
  <tbody>
  <%
   User user = (User) session.getAttribute("userObj");
  	AppointmentDao d=new AppointmentDao(DBConnection.getConn());
 
   
  List<appointments>l=d.getAllAppointments(user.getId());
  
	for(appointments s:l){%>
   
           <tr>
          
           <td><%=s.getFullName() %></td>
         <td><%=s.getAge() %></td>
         <td><%=s.getAppoinDate() %></td>
          <td><%=s.getPhNo() %></td>
     <td><%=s.getDiseases() %></td>
              <%DoctorDao doc=new DoctorDao(DBConnection.getConn());
                     Doctor ds=doc.getDoctorById(s.getDoctorId());
              %>
         <td><%=ds.getFullName() %></td> 
        <td>
           <div class="d-flex">
            <form action="deleteAppoint" method="post">
           <button type="submit" name="userId"  value="<%=s.getId() %>" class="btn btn-danger btn-sm" >Delete</button>
           </form>
           </div>
           </td>
           
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
    </div>  
  </div>
</div>
<div class="container p-3">
		<div class="row">
			<div class="col p-3">
			
			</div>

			
		</div>

	</div>
</body>
</html>