<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Facebook posts</title>
</head>
<body>
<form action="/webapp/facebook/postfeed" method="POST">
 <input type="hidden"  name="${_csrf.parameterName}" value="${_csrf.token}"/>
  <input type="submit" value="Submit">
</form>
</body>
</html>