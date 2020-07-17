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

</head>
<body>

	<ul class="breadcrumb">
		<li><a href="home/index.htm">Home</a></li>
		<li><a href="menu/qlpb.htm">Quản lý phòng ban</a></li>

		<li>Thông tin phòng ban</li>
	</ul>
	<h4 style="margin-left: 1.5%;">Quản lý phòng ban</h4>
	<h4 style="margin-left: 1.5%;">${message}</h4>
	<h5
		style="margin-top: -30px; margin-left: 1.5%; text-align: right; margin-right: 0px;">
		<a href="menu/addpb.htm" class="btn btn-default btn-sm"
			style="color: blue">Thêm phòng ban</a>
	</h5>
	<div class="table-responsive">
		<table class="table table-hover">
			<tr>
				<th>Mã phòng ban</th>
				<th>Tên phòng ban</th>
				<th>Sửa</th>
				<th>Xóa</th>
			</tr>
			<c:forEach var="ds" items="${departs}">
				<tr>
					<td>${ds.id}</td>
					<td>${ds.name}</td>

					<td><a href="menu/editpb/${ds.id}.htm"
						class="btn btn-info btn-sm"
						style="text-decoration: none; color: white !important;"
						onclick="if (!(confirm('Bạn muốn sửa thông tin khách hàng: ${ds.name} này không?'))) return false">Sửa</a>
					</td>

					<td><a href="menu/deleteqlpb/${ds.id}.htm" id="btnxoa"
						class="btn btn-info btn-sm"
						style="text-decoration: none; color: white !important;"
						onclick="if (!(confirm('Bạn muốn xóa thông tin khách hàng: ${ds.name} này không?'))) return false">Xóa</a>
					</td>

				</tr>
			</c:forEach>
		</table>

	</div>

</body>
</html>