package cn.edu.zhku.jsj.lzj.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import cn.edu.zhku.jsj.lzj.Model.User;
import cn.edu.zhku.jsj.lzj.Util.ConnectionManager;

public class InfoDao {
	public void changeInfo(User user) throws Exception{
		Connection con;
		con=ConnectionManager.getConnection();
		if (con == null) {
			throw new Exception("���ݿ����Ӳ��ɹ���");
		}
		String userid=user.getUserid();
		String sql ="insert into login values(?)";  
	    PreparedStatement pstmt = con.prepareStatement(sql);
	    pstmt.setString(1,userid);
	    pstmt.executeUpdate();
	}
}
