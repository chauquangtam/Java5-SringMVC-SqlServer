<%@page import="poly.entity.Staff"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1">
<title>Employee Manager</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- link icon  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="../css/index.css">
<link rel="stylesheet" type="text/css" href="../css/qlnv.css">
<base href="${pageContext.servletContext.contextPath}/">
<style>
*[id$=errors] {
	color: red;
	font-style: italic;
}
body {
	font-family: Arial, Helvetica, sans-serif;
}

* {
	box-sizing: border-box;
}

input[type=text], select, textarea {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	margin-top: 6px;
	margin-bottom: 16px;
	resize: vertical;
}

input[type=submit] {
	background-color: #4CAF50;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #45a049;
}

.container {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
}
</style>

</head>
<body>

	<ul class="breadcrumb">
		<li><a href="home/index.htm">Home</a></li>
		<li><a href="menu/qlnv.htm">Thành tích</a></li>
		<li><a href="menu/gnttcn.htm">Ghi nhận thành tích và kỷ luật</a></li>
		<li>Thêm thành tích & kỷ luật của nhân viên</li>
	</ul>
	<h4 style="margin-left: 1.5%;">Thêm thành tích & kỷ luật của nhân
		viên</h4>
	<h5
		style="margin-top: -30px; margin-left: 1.5%; text-align: right; margin-right: 0px;">
		<a href="menu/gnttcn.htm" class="btn btn-default btn-sm"
			style="color: blue">Hoàn tất</a>
	</h5>
	<h2 style="color:red">${message}</h2>
	<form:form action="menu/addttcn.htm" modelAttribute="recordsa">
		<label for=departId>Phòng ban: </label>
		<form:select path="staff.id" items="${staffsRecord}" itemValue="id"
			itemLabel="fullname" />
		
		<label for=type>Loại</label>
		<form:select path="type">
			<form:option value="1" >Thành tích</form:option>
			<form:option value="0" >Kỷ luật</form:option>
		</form:select>

		<label for="reason">Lý do: 	<form:errors path="reason" /></label>
		<form:textarea path="reason" placeholder="Write something.."
			style="height: 200px" name="reason"/>
		<input type="submit" value="Submit">
	</form:form>





</body>
</html>