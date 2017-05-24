package cn.edu.zhku.jsj.lzj.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import cn.edu.zhku.jsj.lzj.Util.ConnectionManager;
import cn.edu.zhku.jsj.lzj.Model.User;

public class RegDao {
	public void writeSql(User user) throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
		}	
		String sqlQuery = "insert into login values(?,?,null)";
		ps = conn.prepareStatement(sqlQuery);
		ps.setString(1, user.getUserid());
		ps.setString(2, user.getUserPassword());
		ps.executeUpdate();
		
	}
}
