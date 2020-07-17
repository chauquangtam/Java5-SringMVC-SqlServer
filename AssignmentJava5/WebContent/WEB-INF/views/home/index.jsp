<%@page import="poly.entity.Staff"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<h4 style="color: blue; text-align: center;">
	<s:message code="home.home.top10" />
</h4>
<hr>
<marquee scrollamount="8" direction="left" loop="100" scrolldelay="0"
	onmouseover="this.stop()" onmouseout="this.start()">
	<c:forEach var="rs" items="${indexlist}">
		<img src="${pageContext.servletContext.contextPath}/images/${rs[1]}"
			style="height: 100px; width: 120px; list-style: none; border: 1px solid blue;"
			title="<s:message code="home.home.tennvtop" /> ${rs[0]} --- <s:message code="home.home.tenpbtop" /> ${rs[2]}" /> |
					</c:forEach>
</marquee>
<hr>
<br>
