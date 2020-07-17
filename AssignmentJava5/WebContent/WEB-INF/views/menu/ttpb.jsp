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
					<li><a href="menu/tt.htm">Thống kê thành tích</a></li>
		<li><a href="menu/ttpb.htm">Thống kê thành tích phòng ban</a></li>
					<li>Thành tích phòng ban</li>
				</ul>
				
				<a href="menu/gnttcn.htm" class="btn btn-info" role="button">Ghi nhận thành tích và kỷ luật</a>
				<a href="menu/ttcn.htm" class="btn btn-info" role="button">Tổng hợp thành tích cá nhân</a>
				<a href="menu/ttpb.htm" class="btn btn-info" role="button">Tổng hợp thành tích của phòng</a>
			
				<h4 style="margin-top:20px;">Tổng hợp thành tích của phòng</h4>

				<div class="table-responsive">
					<table class="table table-hover">
						<tr>
							<th>Mã phòng ban</th>
							<th>Phòng ban</th>
							<th>Tổng thành tích</th>
							<th>Tổng kỷ luật</th>
							<th>Điểm thưởng</th>
						</tr>
					<c:forEach var="rs" items="${recordsgnttcn}">
							<tr>
								<td>${rs[0]}</td>
								<td>${rs[3]}</td>
								<td>${rs[1] }</td>
								<td>${rs[2]}</td>
								<td>${rs[1] - rs[2]}</td>

							</tr>
						</c:forEach>
					</table>

				</div>
</body>
</html>