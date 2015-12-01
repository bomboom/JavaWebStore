package bookmall.servlet;

import java.io.IOException;

import bookmall.Dao.OrderDao;
import javax.servlet.*;
import javax.servlet.http.*;

public class AddOrder extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		try{
			String addr = request.getParameter("addr");
			String city = request.getParameter("city");
			String country = request.getParameter("country");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String id = (String)request.getSession().getAttribute("id");
			String total = request.getParameter("total");
			String action = request.getParameter("action");
			
			System.out.println(addr+city+country+email+phone+id+total+action);
			
			if(action.equals("Place Order")){
				OrderDao od = new OrderDao();
				od.SaveOrder(id, addr, city, country, email, phone, total);
			}
		}catch(Exception e){
			System.out.println(e.toString());
		}
		response.sendRedirect("images/finish.jpeg");
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		doGet(request, response);
	}
}
