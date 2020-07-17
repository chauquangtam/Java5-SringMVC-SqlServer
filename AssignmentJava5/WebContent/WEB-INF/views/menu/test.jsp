<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Danh sách khách hàng</title>
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<%@ page isELIgnored="false"%>
</head>
<body>
	<div class="container">
		<div class="col-md-12">
			<h2>CRM - Customer Relationship Manager</h2>
			<hr />

			<input type="button" value="Thêm mới"
				onclick="window.location.href='showForm'; return false;"
				class="btn btn-primary" /> <br /> <br />
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">Danh sách khách hàng</div>
				</div>
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table table-striped table-bordered">
							<tr>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Free Passes</th>
								<th>Postal Code</th>
								<th>Email</th>
								<th>Action</th>
							</tr>

							<!-- loop over and print our customers -->
							<c:forEach var="tempCustomer" items="${customers}">

								<!-- construct an "update" link with customer id -->
								<c:url var="updateLink" value="/customer/updateForm">
									<c:param name="customerId" value="${tempCustomer.id}" />
								</c:url>

								<!-- construct an "delete" link with customer id -->
								<c:url var="deleteLink" value="/customer/delete">
									<c:param name="customerId" value="${tempCustomer.id}" />
								</c:url>

								<tr>
									<td>${tempCustomer.firstName}</td>
									<td>${tempCustomer.lastName}</td>
									<td>${tempCustomer.freePasses}</td>
									<td>${tempCustomer.postalCode}</td>
									<td>${tempCustomer.email}</td>

									<td>
										<!-- display the update link --> <a href="${updateLink}">Cập
											nhật</a> | <a href="${deleteLink}"
										onclick="if (!(confirm('Bạn muốn xóa thông tin khách hàng này?'))) return false">Xóa</a>
									</td>

								</tr>

							</c:forEach>

						</table>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>