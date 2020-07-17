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
<base href="${pageContext.servletContext.contextPath}/">
</head>
<body>
	<div id="navbarc1">
		<jsp:include page="templates/nav.jsp"></jsp:include>
	</div>
	<div class="header">
		<jsp:include page="templates/slider.jsp"></jsp:include>
	</div>
	<div class="row" style="margin-left: 0.3%">
		<div class="leftcolumn">
			<div class="card">
				<jsp:include page="${param.pageview}" />
			</div>
		</div>
		<div class="rightcolumn">
			<jsp:include page="templates/profile.jsp"></jsp:include>
		</div>
	</div>
	<div class="footer">
		<h2>&reg;Copyright for w3</h2>
	</div>
	<script>
		$(function() {
			$("a[data-lang]").click(function() {
				var lang = $(this).attr("data-lang");
				$.get("home/index.htm?language=" + lang, function() {
					location.reload();
				});
				return false;
			});
		});
	</script>
</body>
</html>