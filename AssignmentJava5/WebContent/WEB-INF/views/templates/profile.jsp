<%@page import="poly.entity.Staff"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>

	<div class="card">
		<h3 style="color: blue">
			<s:message code="global.menu.infomation" />
		</h3>
		<h5>
			<s:message code="global.menu.username" />
			<label style="color: red">${user.fullname}</label>
		</h5>
		<img
			src="${pageContext.servletContext.contextPath}/images/${user.photo}"
			class="fakeimg" style="max-height: 120px;" />
		<p>
		<h5>
			<s:message code="global.menu.email" />
			<label style="color: red">${user.email}</label>
		</h5>
		<h5>
			<s:message code="global.menu.phone" />
			<label style="color: red">${user.phone}</label>
		</h5>
		<h5>
			<s:message code="global.menu.birthday" />
			<label style="color: red">${user.birthday}</label>
		</h5>
	</div>
