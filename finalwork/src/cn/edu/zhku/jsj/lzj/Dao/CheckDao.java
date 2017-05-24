package cn.edu.zhku.jsj.lzj.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import cn.edu.zhku.jsj.lzj.Util.ConnectionManager;
import cn.edu.zhku.jsj.lzj.Model.User;

public class CheckDao {
	public boolean getUser(User user) throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		conn = ConnectionManager.getConnection();
		if (conn == null) {
			throw new Exception("数据库连接不成功！");
		}
		String sqlQuery = "Select * from login where un = ?";
		ps = conn.prepareStatement(sqlQuery);
		ps.setString(1, user.getUserid());
		rs = ps.executeQuery();		
		boolean result = rs.next();
		return result;
	}
}
