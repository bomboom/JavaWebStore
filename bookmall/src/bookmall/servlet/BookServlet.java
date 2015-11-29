package bookmall.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookmall.beans.Book;
import bookmall.Dao.BookDao;


@SuppressWarnings("serial")
public class BookServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		this.doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		String sql = "select * from book";
		BookDao bd = new BookDao();
		
		List<Book> bookList = bd.listBook(sql);
		
		for(int i = 0;i < bookList.size(); i++){
			System.out.println(bookList.get(i).getBook_id());
		}
			
		request.setAttribute("bookList", bookList);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
}
