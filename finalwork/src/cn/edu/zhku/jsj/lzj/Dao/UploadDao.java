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
		String brand = keyboard.getBrand();
		String type = keyboard.getType();
		String color = keyboard.getColor();
		String trans = keyboard.getTrans();
		String picture =keyboard.getPicture();
		String sql ="insert into login values(?,?,?,?,?)";  
	    PreparedStatement pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1,brand);
	    pstmt.setString(2,type);
	    pstmt.setString(3,color);
	    pstmt.setString(4,trans);
	    pstmt.setString(5,picture);
	    pstmt.executeUpdate();
	}
}
