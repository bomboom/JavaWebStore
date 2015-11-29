package bookmall.beans;

public class Book {
	private int book_id;
	private String photo;
	private float price;
	private String name;
	private String author;
	private String category;
	
	public String getCategory(){
		return category;
	}
	
	public void setCategory(String category){
		this.category = category;
	}
	
	public float getPrice(){
		return price;
	}
	
	public void setPrice(float price){
		this.price = price;
	}
	
	public String getName(){
		return name;
	}
	
	public void setName(String name){
		this.name = name;
	}
	
	public String getAuthor(){
		return author;
	}
	
	public void setAuthor(String author){
		this.author = author;
	}
	
	public int getBook_id() {
		return book_id;
	}
	
	public String getPhoto() {
		return photo;
	}

	public void setBook_id(int id){
		this.book_id = id;
	}

	public void setPhoto(String dir) {
		this.photo = dir;
	}

}
