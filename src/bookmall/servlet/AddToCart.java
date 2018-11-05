package bookmall.servlet;

import bookmall.Dao.*;
import bookmall.beans.*;

import java.io.*;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.*;
import javax.servlet.http.*;

public class AddToCart extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		try{
			String bookid = request.getParameter("bookid");
			CartManager cartManager = new CartManager();
			HttpSession session = request.getSession(true);
			ArrayList cart = (ArrayList)session.getAttribute("cart");
			cartManager.setCart(cart);
			Book book = new Book();
			BookDao bd = new BookDao();
			if(!bookid.equals("null")){
				book = bd.findById(Integer.parseInt(bookid));
				cartManager.addToCart(book, 1);
			}
			session.setAttribute("cart", cartManager.getCart());
			session.setAttribute("total", cartManager.getTotal());
		}catch(Exception e){
			System.out.println(e.toString());
		}
		response.sendRedirect("shoppingcart.jsp");
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		doGet(request, response);
	}
}
