<%@page import="poly.entity.Staff"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<nav class="navbar navbar-inverse"
			style="margin-left: 0.3%; width: 100%; margin-bottom: 0px;">
			<div class="container-fluid" style="background-color: white;">
				<ul class="nav navbar-nav">
					<li class="actives"><a href="home/index.htm"><img
							src="https://img.icons8.com/ios-glyphs/30/000000/manager--v2.png"
							style="height: 20px"> EM System</a></li>
					<%
						Staff user1 = (Staff) session.getAttribute("user");
						if (user1 != null) {
							if(user1.getRoles().equals("10")){
								%>
								<li><a href="menu/qlnv.htm"><s:message code="global.menu.qlnv" /></a></li>
								<li><a href="menu/qlpb.htm"><s:message code="global.menu.qlpb" /></a></li>
								<li><a href="menu/tt.htm"><s:message code="global.menu.tt" /></a></li>
								<%
							}
					
						} else {
					%>


					<%
						}
					%>
				</ul>
				<form class="navbar-form navbar-left" action="">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="<s:message code="global.menu.search" />"
							name="search">
						<div class="input-group-btn">
							<button class="btn btn-default" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
					</div>
				</form>
				<button class="btn btn-danger navbar-btn"><s:message code="global.menu.next" /></button>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="home/index.htm?language=en" data-lang="en">
							English</a></li>
					<li><a href="home/index.htm?language=vi" data-lang="vi">
							Tiếng Việt</a></li>
					<%
						Staff user = (Staff) session.getAttribute("user");
						if (user != null) {
					%>
					<li><a href="javascript:alert('Họ và Tên :${user.fullname}');"><img
							src="https://sohagame.vcmedia.vn/public/sg277/tonghop/soha-game-dau-an-rong-mobile-16shx.png">
							${user.fullname}</a></li>


					<li><a href="loginandregistration/dangxuat.htm"><span
							class="glyphicon glyphicon-user"></span><s:message code="global.menu.logout" /></a></li>

					<%
						} else {
					%>
					<%-- <li><a href="loginandregistration/registration.htm"><span
							class="glyphicon glyphicon-user"></span> ĐĂNG KÍ<span
							class="badge" style="background-color: blue; margin-top: -20px">7</span></a></li> --%>
					<li><a href="loginandregistration/login.htm"><span
							class="glyphicon glyphicon-log-in"></span> <s:message code="global.menu.login" /></a></li>
					<%
						}
					%>
				</ul>
			</div>
		</nav>