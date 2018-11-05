package bookmall.beans;

import bookmall.tool.ConnDB;
import java.sql.*;

public class user {
	private boolean ok = false;
	private String user_id = null;
	private String pwd = null;
	
	public boolean check() throws Exception{
		checkSQL(this.user_id, this.pwd);
		//System.out.println(this.ok);
		return this.ok;
	}
	
	public void setId(String id){
		this.user_id=id;
	}
	
	public String getId() {
		return user_id;
	}
	
	public void setPwd(String Pwd){
		this.pwd = Pwd;
	}
	
	public String getPwd(){
		return pwd;
	}
	
	public void checkSQL(String id, String pwd) throws Exception{
		ConnDB db = new ConnDB();
		String sql = "select * from user where username='"+id+"' and password='"+pwd+"'";
		//System.out.print(sql);
		ResultSet rs = db.executeQuery(sql);
		if(rs.next()){
			this.ok = true;
		}else{
			this.ok = false;
		}
	}
}
