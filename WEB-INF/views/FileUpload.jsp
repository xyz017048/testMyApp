<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>AngularJS $http Example</title>
<style>
.thumb {
	width: 24px;
	height: 24px;
	float: none;
	position: relative;
	top: 7px;
}

form .progress {
	line-height: 15px;
}

.progress {
	display: inline-block;
	width: 100px;
	border: 3px groove #CCC;
}

.progress div {
	font-size: smaller;
	background: orange;
	width: 0;
}
</style>
<!-- TODO We need to move bootstrap to our local server -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
</head>
<body ng-app="fileUpload" ng-controller="FileCtrl">
	<h4>Upload on file select</h4>
	<label>Public:
    <input type="checkbox" ng-model="checkboxModel.public">
  </label><br/>
	<button type="file" ngf-select="uploadFiles($file, $invalidFiles)"
		accept="image/*" ngf-max-height="1000" ngf-max-size="1MB">
		Select File</button>
	<br>
	<br> File:
	<div style="font: smaller">
		{{f.name}} {{errFile.name}} {{errFile.$error}} {{errFile.$errorParam}}
		<span class="progress" ng-show="f.progress >= 0">
			<div style="width: {{f.progress" ng-bind="f.progress + '%'"></div>
		</span>
	</div>
	{{errorMsg}}

	<script src="<c:url value='/static/js/include/angular.js' />"></script>
	<script
		src="<c:url value='/static/js/include/ng-file-upload-shim.js' />"></script>
	<!-- for no html5 browsers support -->
	<script src="<c:url value='/static/js/include/ng-file-upload.js' />"></script>

	<script src="<c:url value='/static/js/fileApp.js' />"></script>
	<script
		src="<c:url value='/static/js/controller/file_controller.js' />"></script>
</body>
</html>