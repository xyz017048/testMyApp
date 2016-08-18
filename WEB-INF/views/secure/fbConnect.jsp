<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="<c:url value="/connect/facebook" />" method="POST">
		<input type="hidden" name="scope" value="email, user_posts" />
		<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
		<p>Connect existing account to facebook</p>
		<p>
			<button type="submit">
				<img src="<c:url value="src/main/resources/social/facebook.png" />" />
			</button>
		</p>
	</form>
</body>
</html>