<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:url value="/j_spring_security_logout" var="logoutUrl" />
<sec:authorize var="loggedIn" access="isAuthenticated()" />
<div id="navbar-full">
	<div id="navbar">
		<!--    
        navbar-default can be changed with navbar-ct-blue navbar-ct-azzure navbar-ct-red navbar-ct-green navbar-ct-orange  
        -->
		<nav class="navbar navbar-ct-blue navbar-fixed-top" role="navigation">

			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="<%=request.getContextPath()%>">Spring
						Security Example</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">



						<sec:authorize access="isAuthenticated()">
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">Accounts <span class="caret"></span></a>
								<ul class="dropdown-menu" role="menu">
									<li><a
										href="<%=request.getContextPath()%>/accounts/all.html">
											All user accounts </a></li>
									<sec:authorize access="hasRole('ROLE_ADMIN')">
										<li class="divider"></li>
										<li><a href="<%=request.getContextPath()%>/accounts/new">
												New user account </a></li>
									</sec:authorize>
								</ul></li>
						</sec:authorize>




						<li><a href="javascript:void(0);" data-toggle="search"
							class="hidden-xs"><i class="fa fa-search"></i></a></li>
					</ul>
					<c:url var="url"
						value="${request.contextPath}/accounts/searchAccount" />
					<form:form class="navbar-form navbar-left navbar-search-form"
						role="search" action="${url}" method="get">
						<div class="form-group">
							<input type="text" value="" id="q" name="q" class="form-control"
								placeholder="Search...">
						</div>
					</form:form>
					<ul class="nav navbar-nav navbar-right">

						<sec:authorize access="isAuthenticated()">
							<li>
								<form method="post" action="${logoutUrl}">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" /> <input type="submit"
										class="btn btn-round btn-default" value="logout">
								</form>
							</li>
						</sec:authorize>


						<c:choose>
							<c:when test="${loggedIn}">
								<li><button class="btn btn-round btn-default">
										<sec:authentication property="principal.username" />
									</button></li>
							</c:when>
							<c:otherwise>
								<li><a href="<%=request.getContextPath()%>/login"
									class="btn btn-round btn-default">Sign in</a></li>
							</c:otherwise>
						</c:choose>


					</ul>

				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
	</div>
	<!--  end navbar -->

</div>
<!-- end menu-dropdown -->


