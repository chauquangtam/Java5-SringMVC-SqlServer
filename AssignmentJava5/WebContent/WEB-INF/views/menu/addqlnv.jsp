<%@page import="poly.entity.Staff"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1">
<link
	href="https://sohagame.vcmedia.vn/public/sg277/tonghop/soha-game-dau-an-rong-mobile-16shx.png"
	rel="shortcut icon" type="image/vnd.microsoft.icon">
<title>Thêm nhân viên</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- link icon  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="../../../css/index.css">
<link rel="stylesheet" type="text/css" href="../../../css/qlnv.css">
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

input[type=password], select, textarea {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	margin-top: 6px;
	margin-bottom: 16px;
	resize: vertical;
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
		<li><a href="menu/qlnv.htm">Quản lý nhân viên</a></li>

		<li>Thêm nhân viên</li>
	</ul>
	<h4 style="margin-left: 1.5%;">Thêm nhân viên</h4>
	<h4 style="margin-left: 1.5%;">${message1}</h4>

	<h5
		style="margin-top: -30px; margin-left: 1.5%; text-align: right; margin-right: 0px;">
		<a href="menu/qlnv.htm" class="btn btn-default btn-sm"
			style="color: blue">Hoàn tất</a>
	</h5>
	<form:form action="menu/addqlnv.htm" modelAttribute="staffsa2">

		<label for="username"><s:message code="home.home.qlnv.addqlnv.username" />: <form:errors path="username" /></label>
		<form:input path="username" placeholder="Nhập họ và tên.." />
		<label for="password"><s:message code="home.home.qlnv.addqlnv.password" />: <form:errors path="password" /></label>
		<form:password path="password" placeholder="Nhập mật khẩu.." />

		<label for="fullname"><s:message code="home.home.qlnv.addqlnv.fullname" />: <form:errors path="fullname" /></label>
		<form:input path="fullname" placeholder="Nhập họ và tên.." />
		<label for="gender"><s:message code="home.home.qlnv.addqlnv.gender" />:</label>
		<br>
		<form:radiobutton path="gender" value="true" label="Nam" checked="checked "/>
		<form:radiobutton path="gender" value="false" label="Nữ" />
		<br>
		<%-- 	<form:select path="gender">
			<form:option value="true">Nam</form:option>
			<form:option value="false">Nữ</form:option>
		</form:select> --%>

		<label for="birthday"><s:message code="home.home.qlnv.addqlnv.birthday" />: <form:errors path="birthday" /></label>
		<form:input path="birthday"
			placeholder="Nhập ngày sinh vd: 10/08/2000.." />

		<label for="photo"><s:message code="home.home.qlnv.addqlnv.image" />: <form:errors path="photo" /></label>
	 <form:input path="photo" placeholder="Chọn ảnh.." type="file"
			name="photo" /> 
		<label for="email"><s:message code="home.home.qlnv.addqlnv.email" />: <form:errors path="email" /></label>
		<form:input path="email" placeholder="Nhập Email.." />


		<label for="phone"><s:message code="home.home.qlnv.addqlnv.phone" />: <form:errors path="phone" /></label>
		<form:input path="phone"
			placeholder="Nhập số điện thoại vd:0377898307.." />

		<label for=departId><s:message code="home.home.qlnv.addqlnv.departs" /></label>
		<form:select path="depart.id" items="${departs}" itemValue="id"
			itemLabel="name" />
		<label for=roles><s:message code="home.home.qlnv.addqlnv.position" /></label>
		<form:select path="roles">
			<form:option value="0"><s:message code="home.home.qlnv.addqlnv.departsmanager" /></form:option>
			<form:option value="1"><s:message code="home.home.qlnv.addqlnv.departsemployee" /></form:option>
		</form:select>

		<label for=salary><s:message code="home.home.qlnv.addqlnv.salary" />: <form:errors path="salary" /></label>
		<form:input path="salary" placeholder="Nhập lương cho nhân viên này.." />

		<label for="notes"><s:message code="home.home.qlnv.addqlnv.notes" /></label>
		<form:textarea path="notes" placeholder="Write something.."
			style="height: 200px" />



		<input type="submit" value="Submit">
	</form:form>
</body>
</html>