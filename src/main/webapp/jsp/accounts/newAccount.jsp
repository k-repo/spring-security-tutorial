<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../tags/includes.jsp" />
<body>

	<jsp:include page="../tags/header.jsp" />

	<c:url var="back" value="${request.contextPath}/accounts/all" />

	<div class="main">
		<div class="container tim-container"
			style="max-width: 800px; padding-top: 100px; min-height: 510px;">
			<form:form class="form-horizontal" action="saveAccount" method="post"
				commandName="newItem">
				<fieldset>

					<!-- Form Name -->
					<legend>New Item</legend>
					<c:if test="${not empty error}">
						<div class="alert alert-danger">
							<div class="container">
								<b>Oups...</b> ${error}
							</div>
						</div>
					</c:if>


					<!-- Text input-->
					<div
						class="form-group <c:if test="${not empty error && errorType == 1}">has-error</c:if>">
						<label class="col-md-4 control-label" for="username">Username</label>
						<div class="col-md-5">
							<input id="username" name="username" type="text"
								placeholder="username" class="form-control input-md" required="">

						</div>
					</div>

					<!-- Text input-->
					<div
						class="form-group <c:if test="${not empty error && errorType == 2}">has-error</c:if>">
						<label class="col-md-4 control-label" for="password">Password</label>
						<div class="col-md-5">
							<input id="password" name="password" type="password"
								placeholder="Password" class="form-control input-md" required="">

						</div>
					</div>


					<!-- Text input-->
					<div
						class="form-group <c:if test="${not empty error && errorType == 2}">has-error</c:if>">
						<label class="col-md-4 control-label" for="confirmPassword">Confirm
							Password</label>
						<div class="col-md-5">
							<input id="confirmPassword" name="confirmPassword"
								type="password" placeholder="Confirm Password"
								class="form-control input-md" required="">

						</div>
					</div>

					<!-- Text input-->
					<div
						class="form-group <c:if test="${not empty error && errorType == 3}">has-error</c:if>">
						<label class="col-md-4 control-label" for="email">Email</label>
						<div class="col-md-5">
							<input id="email" name="email" type="text" placeholder="Email"
								class="form-control input-md">

						</div>
					</div>

					<!-- Radio input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="role">Role</label>
						<div class="col-md-5">

							<label class="radio checked" style="padding-top: 0px;"> <span
								class="icons"><span class="first-icon fa fa-circle-o"></span><span
									class="second-icon fa fa-dot-circle-o"></span></span><input
								type="radio" name="role" data-toggle="radio" checked id="role"
								value="ROLE_USER"> <i></i>Role User
							</label> <label class="radio" style="padding-top: 0px;"> <span
								class="icons"><span class="first-icon fa fa-circle-o"></span><span
									class="second-icon fa fa-dot-circle-o"></span></span><input
								type="radio" name="role" data-toggle="radio" id="role"
								value="ROLE_ADMIN"> <i></i>Role Admin
							</label>



						</div>
					</div>

					<!-- Checkbox input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="enabled">Enabled</label>
						<div class="col-md-5">
							<input id="enabled" name="enabled" type="checkbox"
								placeholder="Enabled" class="form-control input-md">

						</div>
					</div>




					<div class="form-group">
						<label class="col-md-4 "></label>
						<div class="col-md-5">
							<input type="submit" name="" value="Save"
								class="btn btn-fill btn-primary"> &nbsp;&nbsp; <input
								type="reset" name="" value="Reset"
								class="btn btn-fill btn-success"> &nbsp;&nbsp; <a
								href="${back}" class="btn  btn-fill btn-warning">Back</a>
						</div>
					</div>


					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />



				</fieldset>
			</form:form>
		</div>
	</div>
	<jsp:include page="../tags/footer.jsp" />
</body>

</html>