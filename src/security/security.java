package security;

import java.io.IOException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;









public class security extends HandlerInterceptorAdapter {
	public boolean preHandle(HttpServletRequest request,HttpServletResponse respond,
			Object hanler) throws IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("user") == null) {
			respond.sendRedirect(request.getContextPath() + "/admin/loginadmin.htm");
			return false;
		}
		return true;
	}
}
