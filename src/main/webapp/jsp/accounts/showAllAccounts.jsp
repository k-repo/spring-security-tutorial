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
			<table class="table">
				<tr>
					<th>Id</th>
					<th>Username</th>
					<th>Email</th>
					<th>Enabled</th>
					<th></th>
				</tr>
				<c:if test="${empty accounts}">
					<tr>
						<td colspan="4">No Results found</td>
					</tr>
				</c:if>
				<c:if test="${! empty accounts}">
					<c:forEach var="account" items="${accounts}">
						<tr>
							<td><c:out value="${account.id}"></c:out></td>
							<td><c:out value="${account.username}"></c:out></td>
							<td><c:out value="${account.email}"></c:out></td>
							<td><c:out value="${account.enabled}"></c:out></td>
							<td>&nbsp;<a href="update/${account.id}">Edit</a>
								&nbsp;&nbsp;<a href="delete/${account.id}">Delete</a>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<ul class="pagination pull-right">
				<c:if test="${ numberOfPages > 0}">
				<li><a href="all?p=${previousPage}">&laquo;</a></li>
				
				<c:forEach begin="1" end="${numberOfPages}" var="i">

				<li <c:if test="${ page == i}"> class="active" </c:if>>
				
				<a href="all?p=${i}">${i}</a>
				</li> 
				</c:forEach>
				
				<li><a href="all?p=${nextPage}">&raquo;</a></li>
				</c:if>
			</ul>


		</div>
	</div>
	<jsp:include page="../tags/footer.jsp" />
</body>
</html>