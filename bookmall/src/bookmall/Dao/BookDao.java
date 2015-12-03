package bookmall.Dao;

import bookmall.beans.Book;
import bookmall.tool.ConnDB;
import java.util.List;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BookDao {
	public List<Book> listBook(String sql) {
		List<Book> bookList = new ArrayList<Book>();
		ConnDB a = new ConnDB();
		
		try{
			ResultSet rs = a.executeQuery(sql);
			
			while(rs.next()) {
				Book book = new Book();
				book.setBook_id(rs.getInt(4));
				book.setPhoto(rs.getString(6));
				book.setName(rs.getString(1));
				book.setCategory(rs.getString(5));
				book.setAuthor(rs.getString(2));
				book.setPrice(rs.getFloat(3));
				book.setText(rs.getString(7));
				bookList.add(book);
			}
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
		a.close();
		
		return bookList;
	}
	
	public Book findById(int bookid){
		try{
			String sql = "select * from book where book_id ="+bookid;
			//System.out.println(sql);
			ConnDB a = new ConnDB();
			
			ResultSet rs = a.executeQuery(sql);
			if(rs.next()){
				int book_id = rs.getInt(4);
				String photo = rs.getString(6);
				String name = rs.getString(1);
				String author = rs.getString(2);
				float price = rs.getFloat(3);
				String category = rs.getString(5);
				Book temp = new Book();
				temp.setBook_id(book_id);
				temp.setPhoto(photo);
				temp.setAuthor(author);
				temp.setCategory(category);
				temp.setPrice(price);
				temp.setName(name);
				a.close();
				return temp;
			}else{
				return null;
			}
		}catch(Exception e){
			System.out.println(e.toString());
			return null;
		}
	}
	
}
