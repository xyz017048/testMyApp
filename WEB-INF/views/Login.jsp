<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:url value="/login" var="loginUrl" />
<form action="${loginUrl}" method="post">
	<c:if test="${param.error != null}">
		<p>Invalid username and password.</p>
	</c:if>
	<c:if test="${param.logout != null}">
		<p>You have been logged out.</p>
	</c:if>
	<p>
		<label for="username">Username</label> <input type="text"
			id="username" name="username" />
	</p>
	<p>
		<label for="password">Password</label> <input type="password"
			id="password" name="password" />
	</p>
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
	<button type="submit" class="btn">Log in</button>
</form>




<form id="tw_signin" action="<c:url value="/signin/facebook"/>"
	method="POST">
	<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
	<input type="hidden" name="scope" value="email, user_posts, publish_actions" /> Sign in
	with Facebook
	<button type="submit">
		<img src="<c:url value="src/main/resources/social/facebook.png"/>" />
	</button>
</form>