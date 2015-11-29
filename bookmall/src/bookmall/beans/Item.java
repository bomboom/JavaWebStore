package bookmall.beans;

//Items in Cart
public class Item {
	private Book book;
	private int quant;
	private float tot;
	
	public Item(Book d, int quant){
		this.book = d;
		this.quant = quant;
		this.setTot((float)Math.round(this.book.getPrice()*this.quant*100)/100);
	}
	
	public void setBook(Book d){
		this.book = d;
	}
	
	public Book getBook(){
		return this.book;
	}
	
	public void setQuant(int quant){
		this.quant = quant;
		this.setTot((float)Math.round(this.book.getPrice()*this.quant*100)/100);
	}
	
	public int getQuant(){
		return this.quant;
	}

	public float getTot() {
		return tot;
	}

	public void setTot(float tot) {
		this.tot = tot;
	}
}
