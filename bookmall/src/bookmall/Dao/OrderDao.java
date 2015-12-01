package bookmall.Dao;

import bookmall.beans.*;
import bookmall.tool.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {
	public List<Orders> ListOrders(String sql) {
		List<Orders> orderList = new ArrayList<Orders>();
		ConnDB a = new ConnDB();
		
		try{
			ResultSet rs = a.executeQuery(sql);
			
			while(rs.next()) {
				Orders order = new Orders();
				order.setAddr(rs.getString(2));
				order.setUsername(rs.getString(1));
				order.setPhone(rs.getString(3));
				order.setEmail(rs.getString(4));
				order.setTotal(rs.getFloat(5));
				orderList.add(order);
			}
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
		a.close();
		
		return orderList;
	}
	
	public void SaveOrder(String username, String addr, String city, String country, String email, String phone, String total){
		String ADDR = addr+" "+city+" "+country;
		float an = Float.parseFloat(total);
		String sql = "insert into orders values('"+username+"','"+ADDR+"','"+email+"','"+phone+"',"+an+")";
		ConnDB a = new ConnDB();
		//System.out.println(sql);
		
		try{
			a.insert(sql);;
		}
		catch (Exception e){
			System.out.println(e.getMessage());
		}
		a.close();
	}
	
}
