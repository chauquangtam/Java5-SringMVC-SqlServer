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
<title>Quản lý nhân viên</title>

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
		<li><a href="home/index.htm"><s:message
					code="global.menu.home" /></a></li>
		<li><a href="menu/qlnv.htm"><s:message
					code="global.menu.qlnv" /></a></li>

		<li><s:message code="home.home.qlnv.tentp" /></li>
	</ul>
	<h4 style="margin-left: 1.5%;">
		<s:message code="global.menu.qlnv" />
	</h4>
	<h4 style="margin-left: 1.5%;">${message}</h4>
	<h5
		style="margin-top: -30px; margin-left: 1.5%; text-align: right; margin-right: 0px;">
		<a href="menu/addqlnv.htm" class="btn btn-default btn-sm"
			style="color: blue"><s:message code="home.home.qlnv.addstaff" /></a>
	</h5>
	<div class="table-responsive">
	
	<form action="menu/search.htm" method="get">
					<label for="name"><s:message
					code="home.home.qlnv.departmentname" /> : </label>
					<input type="text"  placeholder="<s:message code="home.home.qlnv.enter" />"
						required="required" name="nameEmployee" value="${request}"/>
					<input type="submit" value="<s:message code="home.home.qlnv.submit" />">
				</form>
				<br>
		<table class="table table-hover">
			<tr>
				<th><s:message code="home.home.qlnv.employeecode" /></th>
				<th><s:message code="home.home.qlnv.firstandlastname" /></th>
				<th><s:message code="home.home.qlnv.sex" /></th>
				<th><s:message code="home.home.qlnv.dateofbirth" /></th>
				<th><s:message code="home.home.qlnv.email" /></th>
				<th><s:message code="home.home.qlnv.phone" /></th>
		<%-- 		<th><s:message code="home.home.qlnv.department" /></th> --%>
				<th><s:message code="home.home.qlnv.edit" /></th>
				<th><s:message code="home.home.qlnv.delete" /></th>
			</tr>
			<c:forEach var="s" items="${searchName}">
				<tr>
					<td>${s.id}</td>
					<td>${s.fullname}</td>
					<td>${s.gender?'Nam':'Nữ'}</td>
					<td>${s.birthday}</td>
					<td>${s.email}</td>
					<td><img
						src="${pageContext.servletContext.contextPath}/images/${s.photo}"
						style="width: 100px; height: 100px" /></td>
					<%-- <td>${s.phone}</td> --%>
				<%-- 	<td>${s.depart.id}</td> --%>
					<td><a href="menu/editqlnv/${s.id}.htm"
						class="btn btn-info btn-sm"
						style="text-decoration: none; color: white !important;"
						onclick="if (!(confirm('Bạn muốn sửa thông tin khách hàng: ${s.fullname} này không?'))) return false"><s:message
								code="home.home.qlnv.edit" /></a></td>

					<td><a href="menu/delete/${s.id}.htm" id="btnxoa"
						class="btn btn-info btn-sm"
						style="text-decoration: none; color: white !important;"
						onclick="if (!(confirm('Bạn muốn xóa thông tin khách hàng: ${s.fullname} này không?'))) return false"><s:message
								code="home.home.qlnv.delete" /></a></td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>