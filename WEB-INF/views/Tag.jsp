<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tag test</title>
</head>
<body>
<form action="/webapp/tag/search/" method="GET">
  <input type="submit" value="Submit">
  <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
</form>
</body>
</html>