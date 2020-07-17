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
<link
	href="https://sohagame.vcmedia.vn/public/sg277/tonghop/soha-game-dau-an-rong-mobile-16shx.png"
	rel="shortcut icon" type="image/vnd.microsoft.icon">
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

input[type=textarea], select, textarea {
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

		<li>Sửa thông tin nhân viên</li>
	</ul>
	<h4 style="margin-left: 1.5%;">Sửa thông tin nhân viên</h4>
	<h4 style="margin-left: 1.5%;">${message}</h4>
	<h5
		style="margin-top: -30px; margin-left: 1.5%; text-align: right; margin-right: 0px;">
		<a href="menu/qlnv.htm" class="btn btn-default btn-sm"
			style="color: blue">Hoàn tất</a>
	</h5>
	<form:form action="menu/editqlnv.htm" modelAttribute="staffs">
		<label for="id">Mã nhân viên: </label>
		<form:input path="id"  readonly="readonly" name="id"
			value="${id}" />
		<label for="username">Username: </label>
		<form:input path="username" placeholder="Nhập họ và tên.."
			required="required" value="${username}" />

		<label for="password">Mật khẩu</label>
		<form:password path="password" placeholder="Nhập mật khẩu.."
			required="required" value="${password}" />

		<label for="fullname">Họ và tên</label>
		<form:input path="fullname" placeholder="Nhập họ và tên.."
			required="required" value="${fullname}" />

		<label for="gender">Giới tính</label>
		<br>
	
		<c:if test="${gender == true }">
		<form:radiobutton path="gender" value="true" label="Nam" checked="checked"/>
		<form:radiobutton path="gender" value="false" label="Nữ" />
		</c:if>
		<c:if test="${gender == false }">
		<form:radiobutton path="gender" value="true" label="Nam" />
		<form:radiobutton path="gender" value="false" label="Nữ" checked="checked"/>
		</c:if>

	
		<br>
		<%-- <form:select path="gender">
						<form:option value="true" >Nam</form:option>
						<form:option value="false" >Nữ</form:option>
					</form:select> --%>

		<label for="birthday">Ngày sinhs</label>
		<form:input path="birthday"
			placeholder="Nhập ngày sinh vd: 10/08/2000.." required="required"
			value="${birthday}" />

		<label for="photo">Hình ảnh</label>
		<form:input path="photo" placeholder="Chọn ảnh.." type="file"
			value="${photo}" name="photo" /> 


		<label for="email">Email</label>
		<form:input path="email" placeholder="Nhập Email.."
			required="required" value="${email}" />


		<label for="phone">Điện thoạis</label>
		<form:input path="phone"
			placeholder="Nhập số điện thoại vd:0377898307.." required="required"
			value="${phone}" />
		<label for=depart.id>Phòng ban</label>
		<form:select path="depart.id" items="${departs}" itemValue="id"
			itemLabel="name" />
			<label for="roles">Chức vụ</label>
		<br>
			<c:if test="${roles == '10' }">
		<form:radiobutton path="roles" value="10" label="Quản lý" checked="checked"/>
		<form:radiobutton path="roles" value="1" label="Nhân viên" />
		</c:if>
		<c:if test="${roles == '1' }">
		<form:radiobutton path="roles" value="10" label="Quản lý" />
		<form:radiobutton path="roles" value="1" label="Nhân viên" checked="checked"/>
		</c:if>
			<br>
		<%-- <label for=roles>Chức vụ</label>
					<form:select path="roles">
						<form:option value="10" >Quản lý</form:option>
						<form:option value="1" >Nhân viên</form:option>
					</form:select> --%>
		<label for=salary>Lương</label>
		<form:input path="salary" placeholder="Nhập lương cho nhân viên này.."
			value="${salary}" />

		<label for="notes">Ghi chú</label>
		<form:input path="notes" placeholder="Write something.."
			value="${notes}" />
		<input type="submit" value="Submit">
	</form:form>






</body>
</html>