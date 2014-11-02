<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.panel-heading {
	padding: 5px 15px;
}

.panel-footer {
	padding: 1px 15px;
	color: #A0A0A0;
}

.profile-img {
	width: 96px;
	height: 96px;
	margin: 0 auto 10px;
	display: block;
	-moz-border-radius: 50%;
	-webkit-border-radius: 50%;
	border-radius: 50%;
}
</style>
<jsp:include page="./tags/includes.jsp" />
<body>

	<jsp:include page="./tags/header.jsp" />

	<div class="main" style="background-color: #34ACDC;">
		<div class="container tim-container"
			style="max-width: 800px; padding-top: 150px; min-height: 730px;">

		
			<c:if test="${not empty message}">
				<div class="alert alert-warning">
					<div class="container">
						<b>Oups...</b> ${message}
					</div>
				</div>
			</c:if>


			<form method="post"
				action="<c:url value='j_spring_security_check' />"
				authentication-failure-handler-ref="authenticationFailureHandler">

				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />

				<div class="col-sm-7 col-md-7 col-md-offset-2">
					<div class="panel panel-default">
						<div class="panel-heading text-center">
							<strong> Sign in to continue</strong> <br> <strong
								style="color: red">${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</strong>
						</div>
						<div class="panel-body">

							<fieldset>
								<div class="row">
									<div class="center-block">
										<img class="profile-img"
											src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120"
											alt="">
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12 col-md-10  col-md-offset-1 ">
										<div class="form-group">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-user"></i>
												</span> <input class="form-control" placeholder="Username"
													name="username" type="text" autofocus>
											</div>
										</div>
										<div class="form-group">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-lock"></i>
												</span> <input class="form-control" placeholder="Password"
													name="password" type="password" value="">
											</div>
										</div>
										<div class="form-group">
											<input type="submit"
												class="btn btn-fill btn-primary btn-block" value="Sign in">
										</div>
									</div>
								</div>
							</fieldset>

						</div>
						<div class="panel-footer ">
							Don't have an account! <a href="#" onClick=""> Sign Up Here </a>
						</div>
					</div>
				</div>



			</form>
		</div>
	</div>

	<!-- end main -->


</body>
</html>
