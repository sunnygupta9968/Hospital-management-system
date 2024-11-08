<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<title>Doctor</title>
<%@include file="../components/allcss.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>
<c:if test="${empty adminObj }">
<c:redirect url="../admin_login.jsp"></c:redirect>

</c:if>
	<div class="container my-5">
  <div class="row">
    <div class="col col-3">
      <p class="fs-3 text-center">Add Doctor</p>
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
						<form action="../adddoctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="fullName" class="form-control">
							</div>



							<div class="mb-3">
								<label class="form-label">Qualification</label> <input required
									name="qualification" type="text" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label> <select name="spec"
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
								<label class="form-label">Email</label> <input type="text"
									required name="email" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Mob No</label> <input type="text"
									required name="mobno" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label> <input required
									name="password" type="password" class="form-control">
							</div>

							<button type="submit" class="btn text-light btn-info">Add Doctor</button>
						</form>
    </div>
    <div class="col">
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
      
      <th scope="col">Qualification</th>
      <th scope="col">Speciality</th>
      <th scope="col">Mob No.</th>
      <th scope="col">Email</th>
        <th scope="col">Action</th>
      
      
      
  
  
    </tr>
  </thead>
  <tbody>
  <%
  	DoctorDao d=new DoctorDao(DBConnection.getConn());
  
  List<Doctor>l=d.getAllDoctor();
	for(Doctor s:l){%>
   
           <tr>
          
           <td><%=s.getFullName() %></td>
           <td><%=s.getQualification() %></td>
           <td><%=s.getSpecialist() %></td>
           <td><%=s.getMob() %></td>
           <td><%=s.getEmail() %></td>
           <td>
           <div class="d-flex">
          
         
              <a href="edit_doctor.jsp?id=<%= s.getId()%>" class="text-decoration-none">
           <button type="submit" name="id"  value="<%=s.getId() %>" class="btn btn-info btn-sm mx-2" >Edit</button>
           </a>
            <form action="../removeDoctor" method="post">
           <button type="submit" name="id"  value="<%=s.getId() %>" class="btn btn-danger btn-sm" >Delete</button>
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
</body>
</html>