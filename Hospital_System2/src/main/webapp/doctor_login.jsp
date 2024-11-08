<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Login</title>
<%@include file="components/allcss.jsp" %>

</head>
<body>
<%@include file="components/navbar.jsp" %>
<form action="doctor_login" method="post">
						<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Doctor Login</p>
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

						

						<form action="userLogin" method="post">
							<div class="mb-3">
								<label class="form-label">Email address</label> <input required
									name="email" type="email" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label> <input required
									name="password" type="password" class="form-control">
							</div>

							<button type="submit" class="btn bg-info text-white col-md-12">Login</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>