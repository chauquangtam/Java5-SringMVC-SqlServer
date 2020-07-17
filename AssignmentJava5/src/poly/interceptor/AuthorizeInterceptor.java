package poly.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthorizeInterceptor extends HandlerInterceptorAdapter {
	public boolean preHandler(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session =request.getSession();
		if (session.getAttribute("user")==null) {
			response.sendRedirect(request.getContextPath()+"/loginandregistration/login.htm");
			return false;
		}
		return true;
	}
}
