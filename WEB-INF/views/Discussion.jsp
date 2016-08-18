<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <!-- Main style sheet -->
    <link href="<c:url value='/static/css/discussion.css' />" rel="stylesheet"></link>    
	<title>Discussion</title>
</head>
<body ng-app="discussLanding">
	<div ng-controller="Controller as ctrl">
		<discussion-preview ng-repeat="it in items | orderBy:sequence" item-info="it" discuss-detail="ctrl.discussDetail(selectedItem)" switch-favorite="ctrl.switchFavorite(box)" hover-gray="ctrl.hoverGray(box)"/>
	</div>

	<!-- AngularJS -->
	<script src="<c:url value='/static/js/angular/angular.js' />"></script>	
	<script src="<c:url value='/static/js/components/controller/discussLanding-controller.js' />"></script>
	<script src="<c:url value='/static/js/components/directives/discussLanding-directives.js' />"></script>
	<script src="<c:url value='/static/js/components/service/discussLanding-service.js' />"></script>
	<script src="<c:url value='/static/js/discussion.js' />"></script>
</body>
</html>
