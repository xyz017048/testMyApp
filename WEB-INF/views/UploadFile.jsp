<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<title>Upload File</title>
</head>
<body>
 
    <form method="POST" action="webapp/fileOperation/upload" enctype="multipart/form-data">
        File to upload: <input type="file" name="file"><br /> 
        Public: <input type="checkbox" name="isPublic"><br /> <br />
        <input type="submit" value="Upload"> Press here to upload the file!
    </form>
     
</body>
</html>