package CS542;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.Statement;

public class JDBCTest {
	//database connection
	public static Connection getConnection(){
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore","root","Ldd@8432");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	//insert
	public static void insert(){
		Connection conn = getConnection();
		try {
			String sql = "INSERT INTO admin(name, password) "
					+ "VALUES('ddliu','ddliu')";
			Statement st = conn.createStatement();
			int count = st.executeUpdate(sql);
			System.out.println("insert " + count + " row");
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//update
	public static void update(){
		Connection conn = getConnection();
		try {
			String sql = "UPDATE admin SET name ='ldd' WHERE name = 'ddliu'";
			Statement st = conn.createStatement();
			int count = st.executeUpdate(sql);
			System.out.println("update " + count + " row");
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//delete
	public static void delete(){
		Connection conn = getConnection();
		try {
			String sql = "DELETE FROM admin WHERE name = 'ddliu'";
			Statement st = conn.createStatement();
			int count = st.executeUpdate(sql);
			System.out.println("delete " + count + " row");
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//select
	public static void select(){
		Connection conn = getConnection();
		try {
			String sql = "SELECT * FROM admin";
			Statement st = conn.createStatement();
			int count = st.executeUpdate(sql);
			System.out.println("select " + count + " row");
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
		insert();
	}
		
}
