package bookmall.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import org.apache.jasper.tagplugins.jstl.core.Out;

import java.util.*;
import bookmall.Dao.*;

public class ProcessCart extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		try{
			String bookid = request.getParameter("bookid");
			String action = request.getParameter("action");
			
			String quantity=null;
			if(action.equals("update"))
			{
				quantity = request.getParameter("quantity");
			}
			CartManager cartManager = new CartManager();
			HttpSession session = request.getSession(true);
			ArrayList cart = (ArrayList)session.getAttribute("cart");
			cartManager.setCart(cart);
			
			if(action.equals("update")){
				cartManager.update(Integer.parseInt(bookid), Integer.parseInt(quantity));
			}else{
				cartManager.delete(Integer.parseInt(bookid));
			}
			
			session.setAttribute("cart", cartManager.getCart());
			session.setAttribute("total", cartManager.getTotal());
		}catch(Exception e){
			//Out.output(arg0, arg1, arg2, arg3, arg4)
		} 
		response.sendRedirect("shoppingcart.jsp");
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		doGet(request, response);
	}
	
	
	
	
}
