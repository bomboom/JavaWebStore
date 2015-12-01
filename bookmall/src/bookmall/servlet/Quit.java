package bookmall.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class Quit extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		request.getSession().invalidate();
		request.getSession().setAttribute("id", null);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		doGet(request, response);
	}
}
