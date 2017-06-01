package cn.edu.zhku.jsj.lzj.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import cn.edu.zhku.jsj.lzj.Model.Keyboard;
import cn.edu.zhku.jsj.lzj.Util.ConnectionManager;

public class UploadDao {
	public void upload(Keyboard keyboard) throws Exception{
		Connection conn = null;
		conn = ConnectionManager.getConnection();
		if (conn == null) {
			throw new Exception("数据库连接不成功！");
		}
		String name = keyboard.getName();
		String price= keyboard.getPrice();
		String brand = keyboard.getBrand();
		String version= keyboard.getVersion();
		String type = keyboard.getType();
		String color = keyboard.getColor();
		String standard= keyboard.getStandard();
		String inter = keyboard.getInter();
		String backlight= keyboard.getBacklight();
		String ergo = keyboard.getErgo();
		String size= keyboard.getSize();
		String weight = keyboard.getWeight();
		String material= keyboard.getMaterial();
		String details= keyboard.getDetails();
		String picture =keyboard.getPicture();
		String user=keyboard.getUser();
		String sql ="insert into goods values(0,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,0)";  
	    PreparedStatement pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1,user);
	    pstmt.setString(2,brand);
	    pstmt.setString(3,price);
	    pstmt.setString(4,name);
	    pstmt.setString(5,version);
	    pstmt.setString(6,type);
	    pstmt.setString(7,color);
	    pstmt.setString(8,standard);
	    pstmt.setString(9,inter);
	    pstmt.setString(10,backlight);
	    pstmt.setString(11,ergo);
	    pstmt.setString(12,size);
	    pstmt.setString(13,weight);
	    pstmt.setString(14,picture);
	    pstmt.setString(15,material);
	    pstmt.setString(16,details);
	    pstmt.executeUpdate();
	}
}
