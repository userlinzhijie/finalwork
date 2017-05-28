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
		String sql ="insert into goods values(0,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";  
	    PreparedStatement pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1,brand);
	    pstmt.setString(2,price);
	    pstmt.setString(3,name);
	    pstmt.setString(4,version);
	    pstmt.setString(5,type);
	    pstmt.setString(6,color);
	    pstmt.setString(7,standard);
	    pstmt.setString(8,inter);
	    pstmt.setString(9,backlight);
	    pstmt.setString(10,ergo);
	    pstmt.setString(11,size);
	    pstmt.setString(12,weight);
	    pstmt.setString(13,picture);
	    pstmt.setString(14,material);
	    pstmt.setString(15,details);
	    pstmt.setString(16,user);
	    pstmt.executeUpdate();
	}
}
