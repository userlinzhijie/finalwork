package cn.edu.zhku.leo.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import cn.edu.zhku.leo.Model.Shop;
import cn.edu.zhku.leo.Util.ConnectionManager;

public class ShopDao {
	/**
	 * 
	 * 该方法为：读取管理员数据库的数据 如果返回的user为空，表示该用表无数据 如果返回的user不为空，表示读取成功
	 * 
	 * @param
	 * @return
	 * @throws Exception
	 * 
	 */
	public ArrayList<Shop> get() throws Exception {

		ArrayList<Shop> a = new ArrayList<Shop>();

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
		}

		String sqlQuery = "Select * from shop";

		ps = conn.prepareStatement(sqlQuery);

		rs = ps.executeQuery();

		while (rs.next()) {
			int sid = rs.getInt("shop_id");
			int status = rs.getInt("status");
			int uid = rs.getInt("user_id");

			Shop m = new Shop();
			m.setShop_id(sid);
			m.setUser_id(uid);
			m.setStatus(status);

			a.add(m);
		}
		return a;

	}

	public void agree(int sid) throws Exception {

		Connection conn = null;
		PreparedStatement ps = null;
		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
		}

		String sqlQuery = "update shop set status=1 where shop_id=?";

		ps = conn.prepareStatement(sqlQuery);
		ps.setInt(1, sid);
		ps.executeUpdate();
	}

	public void start(int sid) throws Exception {

		Connection conn = null;
		PreparedStatement ps = null;
		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
		}

		String sqlQuery = "update shop set status=1 where shop_id=?";

		ps = conn.prepareStatement(sqlQuery);
		ps.setInt(1, sid);
		ps.executeUpdate();
	}

	public void stop(int sid) throws Exception {

		Connection conn = null;
		PreparedStatement ps = null;
		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
		}

		String sqlQuery = "update shop set status=2 where shop_id=?";

		ps = conn.prepareStatement(sqlQuery);
		ps.setInt(1, sid);
		ps.executeUpdate();
	}

}
