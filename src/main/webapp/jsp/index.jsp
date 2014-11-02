<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="./tags/includes.jsp" />
<body>

	<jsp:include page="./tags/header.jsp" />

	<div class="main">
		<div class="container tim-container"
			style="max-width: 800px; padding-top: 100px; min-height: 510px;">

			<c:if test="${not empty error}">
				<div class="alert alert-danger">
					<div class="container">
						<b>Oups...</b> ${error}
					</div>
				</div>
			</c:if>

			<h1 class="text-center">
				Tutorial and examples <br> <small class="subtitle">Using
					Spring Security.</small>
			</h1>
			<p>At the end of this tutorial, you will understand why Spring's
				simplicity is so powerfull... Make sure you have all the
				dependencies installed in your enviroment to start the demo... feel
				free to share it with your friend or use in the field...</p>
			<!--     end extras -->
		</div>
		<div class="space"></div>
		<!-- end container -->
	</div>
	<!-- end main -->

	<jsp:include page="./tags/footer.jsp" />

</body>
</html>
