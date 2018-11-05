package bookmall.Dao;

import bookmall.beans.*;
import java.util.ArrayList;
import java.util.Iterator;

public class CartManager {
	private ArrayList cart;
	private float total;
	
	public void setCart(ArrayList cart){
		this.cart = cart;
		this.setTotal(0);
	}
	
	public ArrayList getCart(){
		return this.cart;
	}
	
	//add items to cart
	public ArrayList addToCart(Book book, int quantity){
		if(cart == null){
			cart = new ArrayList();
			Item item = new Item(book, quantity);
			cart.add(item);
		}
		else{
			Object items[] = cart.toArray();
			boolean find = false;   //to check it item already exits
			
			for(int i=0;i<items.length;i++){
				Item temp = (Item)items[i];
				
				if(temp.getBook().getBook_id()==book.getBook_id()){
					temp.setQuant(temp.getQuant()+quantity);
					find = true;
					break;
				}
			}
			
			if(!find){
				Item item = new Item(book, quantity);
				total+=item.getBook().getPrice()*quantity;
				cart.add(item);
			}
		}
		return cart;
	}
	
	//remove item
	public void delete(int bookid){
		Iterator i = cart.iterator();
		while(i.hasNext()){
			Item temp = (Item)i.next();
			if(temp.getBook().getBook_id()==bookid){
				cart.remove(temp);
				break;
			}
		}
		this.setTotal((float)Math.round((this.total+total)*100)/100);
	}
	
	//update quantity
	public void update(int bookid, int quant){
		Iterator i = cart.iterator();
		while(i.hasNext()){
			Item temp = (Item)i.next();
			if(temp.getBook().getBook_id()==bookid){
				temp.setQuant(quant);
				//System.out.println("good");
				break;
			}
		}
	}

	public float getTotal() {
		Iterator i = cart.iterator();
		float SUM=0;
		while(i.hasNext()){
			Item temp = (Item)i.next();
			SUM+=temp.getBook().getPrice()*temp.getQuant();
		}
		
		return (float)Math.round(SUM*100)/100;
	}

	public void setTotal(float total) {
		this.total=total;
	}
	
	
}
