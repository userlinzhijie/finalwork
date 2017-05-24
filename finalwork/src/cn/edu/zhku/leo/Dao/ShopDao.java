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
	 * �÷���Ϊ����ȡ����Ա���ݿ������ ������ص�userΪ�գ���ʾ���ñ������� ������ص�user��Ϊ�գ���ʾ��ȡ�ɹ�
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

		// �������ݿ�
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("���ݿ����Ӳ��ɹ���");
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
		// �������ݿ�
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("���ݿ����Ӳ��ɹ���");
		}

		String sqlQuery = "update shop set status=1 where shop_id=?";

		ps = conn.prepareStatement(sqlQuery);
		ps.setInt(1, sid);
		ps.executeUpdate();
	}

	public void start(int sid) throws Exception {

		Connection conn = null;
		PreparedStatement ps = null;
		// �������ݿ�
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("���ݿ����Ӳ��ɹ���");
		}

		String sqlQuery = "update shop set status=1 where shop_id=?";

		ps = conn.prepareStatement(sqlQuery);
		ps.setInt(1, sid);
		ps.executeUpdate();
	}

	public void stop(int sid) throws Exception {

		Connection conn = null;
		PreparedStatement ps = null;
		// �������ݿ�
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("���ݿ����Ӳ��ɹ���");
		}

		String sqlQuery = "update shop set status=2 where shop_id=?";

		ps = conn.prepareStatement(sqlQuery);
		ps.setInt(1, sid);
		ps.executeUpdate();
	}

}
