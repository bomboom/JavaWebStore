package bookmall.servlet;

import bookmall.beans.*;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class CheckUser extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String id = request.getParameter("name");
		String pass = request.getParameter("pass");
		user us = new user();
		us.setId(id);
		us.setPwd(pass);
		try{
			if(us.check()){
				out.print("aa");
				request.getSession().invalidate();
				request.getSession().setAttribute("id", id);
			}else{
				out.print("a");
				//System.out.println("a");
			}
		}catch(Exception e){
				out.print(e.toString());
			}
		out.flush();
		out.close();
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
