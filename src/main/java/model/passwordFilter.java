package model;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class passwordFilter
 */
@WebFilter("/waliduj")
public class passwordFilter implements Filter {

    /**
     * Default constructor. 
     */
    public passwordFilter() {
        System.out.println("jestem w filtrze hasla");
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		System.out.println("jestem w filtrze passwordFilter");
		PrintWriter out = response.getWriter();
		String pass = req.getParameter("password");
		String user = req.getParameter("user");
		String errorPage = "login.jsp";
		if (pass == null)
			chain.doFilter(request, response);
		if (pass.contains("0") == false && pass.contains("1") == false) {
			request.setAttribute("user", user);
			request.setAttribute("passwordMsg", "Wrong password: password should contain 0 or 1");
			RequestDispatcher rd = request.getRequestDispatcher(errorPage);
			rd.include(request, response);
		}
		else
		   chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
