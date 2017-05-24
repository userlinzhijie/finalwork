package cn.edu.zhku.jsj.lzj.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import cn.edu.zhku.jsj.lzj.Util.ConnectionManager;
import cn.edu.zhku.jsj.lzj.Model.User;

public class LoginDao {
	
	public User getUserByName(User user) throws Exception {
		User newUser = new User();

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
		}

		String sqlQuery = "Select * from login where un = ? && pw = ?";
		
		ps = conn.prepareStatement(sqlQuery);

		ps.setString(1, user.getUserid());
		ps.setString(2, user.getUserPassword());

		rs = ps.executeQuery();
		
		boolean result = rs.next();

		if (result == true) {
			String userName = rs.getString("un");
			String userPassword = rs.getString("pw");
			newUser.setUserid(userName);
			newUser.setUserPassword(userPassword);
		}
		return newUser;
	}
	
}
