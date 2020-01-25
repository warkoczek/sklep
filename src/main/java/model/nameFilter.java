package model;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class nameFilter
 */
@WebFilter("/waliduj")
public class nameFilter implements Filter {

    /**
     * Default constructor. 
     */
    public nameFilter() {
        // TODO Auto-generated constructor stub
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
		System.out.println("jestem w filtrze nameFilter");
		PrintWriter out = response.getWriter();
		String user = req.getParameter("user");
		String pass = req.getParameter("password");
		if (user == null)
			chain.doFilter(request, response);
		String errorPage = "login.jsp";
		if(user.length() < 3) {
			request.setAttribute("user", user);
			request.setAttribute("userMsg", "User name is too short");
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
