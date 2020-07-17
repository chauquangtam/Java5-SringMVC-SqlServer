<%
String view = request.getParameter("pageview");

 if(view.startsWith("home/")){
pageContext.forward("index.jsp");
}
else if(view.startsWith("loginandregistration/")){
pageContext.forward("loginandregistration/login.jsp");
}

else if(view.startsWith("menu/")){
pageContext.forward("index.jsp");
}
else if(view.startsWith("mailer/")){
pageContext.forward("mailer/form.jsp");
}
else if(view.startsWith("uploadfile/")){
pageContext.forward("index.jsp");
}
%>