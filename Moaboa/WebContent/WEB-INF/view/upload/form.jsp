<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>Document</title>
</head>
<body>
	<h1>form.jsp페이지입니다.</h1>
	<form:form method="post" action="upload.do" commandName="uploadFile" enctype="multipart/form-data">
		<input type="file" name="file" id="" />
		<form:errors path="file" />
		<input type="submit" value="전송">
	</form:form>
	
	
</body>
</html>