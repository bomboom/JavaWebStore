package bookmall.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class Quit extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		PrintWriter out = response.getWriter();
		String session = (String)request.getSession(true).getAttribute("id");
		System.out.println(session);
		if(session!=null){
			try{
				//request.getSession(true).setAttribute("id", null);;
			}catch (Exception e){
				session = null;
			}
		}
		System.out.println(request.getSession().getAttribute("id"));
		//request.getSession().invalidate();
		//request.getSession().setAttribute("id", null);
		out.print("quit");
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		doGet(request, response);
	}
}
