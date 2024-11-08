<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-info">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp"><i class="far fa-hospital"></i> RamaCare Hospital</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
   
    
     
    
    
      <c:if test="${empty userObj}" >
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
      
      
      <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="admin_login.jsp"><i class="fas fa-user-tie"></i> Admin</a>
        </li>
       <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="doctor_login.jsp"><i class="fas fa-user-md"></i> Doctor</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#"><i class="far fa-calendar-check"></i> Appointment</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="user_login.jsp"><i class="fas fa-user"></i> User</a>
        </li>
        </ul>
   </c:if> 
        
        <c:if test="${not empty userObj}" >
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
      
      
      <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="book_appointments.jsp"><i class="fas fa-user-tie"></i> View Appointment</a>
        </li>
       
       <div class="dropdown">
						<button class="btn bg-light btn-light dropdown-toggle" type="button"
							id="dropdownMenuButton1" data-bs-toggle="dropdown"
							aria-expanded="false">
							<i class="fa-solid fa-circle-user"></i> ${userObj.fullname }
						</button>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
							<li><a class="dropdown-item" href="change_password.jsp">Change
									Password</a></li>
							<li><a class="dropdown-item" href="userLogout">Logout</a></li>
						</ul>
					</div>
   </c:if> 
        </ul>
     
    </div>
  </div>
</nav>