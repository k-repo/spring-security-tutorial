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
	<div class="main">
		<div class="container tim-container"
			style="max-width: 800px; padding-top: 100px; min-height: 510px;">

			<c:url var="url"
				value="${request.contextPath}/accounts/update/${editAccount.id}" />
			<c:url var="back" value="${request.contextPath}/accounts/all" />


			<form:form class="form-horizontal" action="${url}" method="post"
				commandName="editAccount">
				<fieldset>

					<!-- Form Name -->
					<legend>Edit Account</legend>
					<c:if test="${not empty error}">
						<div class="alert alert-danger">
							<div class="container">
								<b>Oups...</b> ${error}
							</div>
						</div>
					</c:if>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="id">Id</label>
						<div class="col-md-5">
							<form:input path="id" readonly="true"
								class="form-control input-md" />

						</div>
					</div>



					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="username">Username</label>
						<div class="col-md-5">
							<form:input path="username" class="form-control input-md"
								readonly="true" />

						</div>
					</div>



					<!-- Text input-->
					<div
						class="form-group <c:if test="${not empty error }">has-error</c:if>">
						<label class="col-md-4 control-label" for="email">Email</label>
						<div class="col-md-5">
							<form:input path="email" class="form-control input-md" />

						</div>
					</div>

					<!-- Checkbox input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="enabled">Enabled</label>
						<div class="col-md-5">
							<form:checkbox path="enabled" class="form-control input-md" />

						</div>
					</div>


					<!-- Radio input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="role">Role</label>
						<div class="col-md-5">

							<label class="radio " style="padding-top: 0px;"> <span
								class="icons"><span class="first-icon fa fa-circle-o"></span><span
									class="second-icon fa fa-dot-circle-o"></span></span><input
								type="radio" name="role" data-toggle="radio"
								<c:if test="${ editRole.name  == 'ROLE_USER'}"> checked </c:if>
								id="roleUser" value="ROLE_USER"> <i></i>Role User
							</label> <label class="radio" style="padding-top: 0px;"> <span
								class="icons"><span class="first-icon fa fa-circle-o"></span><span
									class="second-icon fa fa-dot-circle-o"></span></span><input
								type="radio" name="role" data-toggle="radio" id="roleAdmin"
								<c:if test="${ editRole.name  == 'ROLE_ADMIN'}"> checked </c:if>
								value="ROLE_ADMIN"> <i></i>Role Admin
							</label>



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