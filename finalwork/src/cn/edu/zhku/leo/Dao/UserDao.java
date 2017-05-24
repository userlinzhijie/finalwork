package cn.edu.zhku.leo.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import cn.edu.zhku.leo.Model.Address;
import cn.edu.zhku.leo.Model.Card;
import cn.edu.zhku.leo.Model.Order;
import cn.edu.zhku.leo.Model.User;
import cn.edu.zhku.leo.Util.ConnectionManager;

public class UserDao {

	/**
	 * 
	 * �÷���Ϊ����ȡ����Ա���ݿ������ ������ص�userΪ�գ���ʾ���ñ������� ������ص�user��Ϊ�գ���ʾ��ȡ�ɹ�
	 * 
	 * @param
	 * @return
	 * @throws Exception
	 * 
	 */
	public ArrayList<User> getAll() throws Exception {

		ArrayList<User> a = new ArrayList<User>();

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		// �������ݿ�
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("���ݿ����Ӳ��ɹ���");
		}

		String sqlQuery = "Select * from user";

		ps = conn.prepareStatement(sqlQuery);

		rs = ps.executeQuery();

		while (rs.next()) {
			int id = rs.getInt("id");
			String password = rs.getString("password");
			String name = rs.getString("name");
			String nickname = rs.getString("nickname");
			float money = rs.getFloat("money");
			String telephone = rs.getString("telephone");
			int sex = rs.getInt("sex"); // 0����1��2Ů
			String birth = rs.getString("birth");
			String email = rs.getString("email");

			User m = new User();

			m.setId(id);
			m.setPassword(password);
			m.setName(name);
			m.setBirth(birth);
			m.setMoney(money);
			m.setNickname(nickname);
			m.setSex(sex);
			m.setTelephone(telephone);
			m.setEmail(email);

			a.add(m);
		}
		return a;

	}

	/**
	 * ���ݴ����idɾ�����ݿ����Ӧ������
	 * 
	 * @param String
	 *            id
	 * @return �ɹ�����true��ʧ�ܷ���false
	 * @throws Exception
	 * 
	 */
	public boolean del(String id) throws Exception {

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		// �������ݿ�
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("���ݿ����Ӳ��ɹ���");
		}

		String sqlQuery = "Select * from user where id=?";

		ps = conn.prepareStatement(sqlQuery);
		ps.setString(1, id);
		rs = ps.executeQuery();

		if (rs.next()) {
			sqlQuery = "delete from user where id=?";

			ps = conn.prepareStatement(sqlQuery);
			ps.setString(1, id);
			int r = ps.executeUpdate();
			if (r != 0) {
				return true;
			} else {
				return false;
			}

		} else {
			return false;
		}
	}

	public boolean edit(User u) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		int rs = 0;

		// �������ݿ�
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("���ݿ����Ӳ��ɹ���");
		}

		String sqlQuery = "update `user` set nickname=?,`name`=?,telephone=?,birth=?,sex=?,email=? where id=?";

		ps = conn.prepareStatement(sqlQuery);
		ps.setString(1, u.getNickname());
		ps.setString(2, u.getName());
		ps.setString(3, u.getTelephone());
		ps.setString(4, u.getBirth());
		ps.setInt(5, u.getSex());
		ps.setString(6, u.getEmail());
		ps.setInt(7, u.getId());
		rs = ps.executeUpdate();
		if (rs == 0)
			return false;
		else
			return true;
	}

	public boolean cPassword(int id, String newpassword) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		int rs = 0;

		// �������ݿ�
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("���ݿ����Ӳ��ɹ���");
		}

		String sqlQuery = "update `user` set `password`=? where id=?";

		ps = conn.prepareStatement(sqlQuery);
		ps.setString(1, newpassword);
		ps.setInt(2, id);

		rs = ps.executeUpdate();
		if (rs == 0)
			return false;
		else
			return true;
	}

	public boolean check(int id, String password) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		// �������ݿ�
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("���ݿ����Ӳ��ɹ���");
		}

		String sqlQuery = "Select * from user where id=? and `password`=?";

		ps = conn.prepareStatement(sqlQuery);
		ps.setInt(1, id);
		ps.setString(2, password);
		rs = ps.executeQuery();
		if (rs.next()) {
			return true;
		} else {
			return false;
		}
	}

	public ArrayList<Address> getAllAddress() throws Exception {
		ArrayList<Address> a = new ArrayList<Address>();

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		// �������ݿ�
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("���ݿ����Ӳ��ɹ���");
		}

		String sqlQuery = "Select * from address";

		ps = conn.prepareStatement(sqlQuery);

		rs = ps.executeQuery();

		while (rs.next()) {
			int id = rs.getInt("id");
			int user_id = rs.getInt("user_id");
			int de_fault = rs.getInt("de_fault");
			String name = rs.getString("name");
			String telephone = rs.getString("telephone");
			String province = rs.getString("province");
			String city = rs.getString("city");
			String dist = rs.getString("dist");
			String street = rs.getString("street");

			Address m = new Address();

			m.setCity(city);
			m.setDe_fault(de_fault);
			m.setDist(dist);
			m.setId(id);
			m.setName(name);
			m.setProvince(province);
			m.setStreet(street);
			m.setTelephone(telephone);
			m.setUser_id(user_id);

			a.add(m);
		}
		return a;

	}

	public boolean add_address(Address a) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		int rs = 0;

		// �������ݿ�
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("���ݿ����Ӳ��ɹ���");
		}

		String sqlQuery = "INSERT into address VALUES(?,?,?,?,?,?,?,?,?)";

		ps = conn.prepareStatement(sqlQuery);
		ps.setInt(1, 0);
		ps.setInt(2, a.getUser_id());
		ps.setString(3, a.getName());
		ps.setString(4, a.getTelephone());
		ps.setString(5, a.getProvince());
		ps.setString(6, a.getCity());
		ps.setString(7, a.getDist());
		ps.setString(8, a.getStreet());
		ps.setInt(9, a.getDe_fault());

		rs = ps.executeUpdate();
		if (rs == 0)
			return false;
		else
			return true;
	}

	public boolean del_address(int id) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		int rs = 0;

		// �������ݿ�
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("���ݿ����Ӳ��ɹ���");
		}

		String sqlQuery = "delete from address where id=?";

		ps = conn.prepareStatement(sqlQuery);
		ps.setInt(1, id);
		rs = ps.executeUpdate();

		if (rs != 0) {
			return true;
		} else {
			return false;
		}

	}

	public boolean add_card(Card a) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		int rs = 0;

		// �������ݿ�
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("���ݿ����Ӳ��ɹ���");
		}

		String sqlQuery = "INSERT into card VALUES(?,?,?,?,?,?)";

		ps = conn.prepareStatement(sqlQuery);

		ps.setString(1, a.getId());
		ps.setInt(2, a.getUser_id());
		ps.setString(3, a.getName());
		ps.setString(4, a.getId_number());
		ps.setString(5, a.getPhone());
		ps.setString(6, a.getBank());

		rs = ps.executeUpdate();
		if (rs == 0)
			return false;
		else
			return true;
	}

	public ArrayList<Card> getAllCard() throws Exception {
		ArrayList<Card> a = new ArrayList<Card>();

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		// �������ݿ�
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("���ݿ����Ӳ��ɹ���");
		}

		String sqlQuery = "Select * from card";

		ps = conn.prepareStatement(sqlQuery);

		rs = ps.executeQuery();

		while (rs.next()) {

			int user_id = rs.getInt("user_id");

			String name = rs.getString("name");
			String phone = rs.getString("phone");
			String id_number = rs.getString("id_number");
			String id = rs.getString("id");
			String bank = rs.getString("bank");

			Card m = new Card();

			m.setId(id);
			m.setName(name);
			m.setPhone(phone);
			m.setUser_id(user_id);
			m.setBank(bank);
			m.setId_number(id_number);

			a.add(m);
		}
		return a;

	}

	public boolean del_card(String id) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		int rs = 0;

		// �������ݿ�
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("���ݿ����Ӳ��ɹ���");
		}

		String sqlQuery = "delete from card where id=?";

		ps = conn.prepareStatement(sqlQuery);
		ps.setString(1, id);
		rs = ps.executeUpdate();

		if (rs != 0) {
			return true;
		} else {
			return false;
		}
	}

	public ArrayList<Order> getAllOrder() throws Exception {
		ArrayList<Order> a = new ArrayList<Order>();

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		// �������ݿ�
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("���ݿ����Ӳ��ɹ���");
		}

		String sqlQuery = "Select * from order";

		ps = conn.prepareStatement(sqlQuery);

		rs = ps.executeQuery();

		while (rs.next()) {

			int id = rs.getInt("id");
			int user_id = rs.getInt("user_id");
			int address_id = rs.getInt("address_id");
			int total = rs.getInt("total");
			int transfee = rs.getInt("transfee");
			int status = rs.getInt("status");
			String date = rs.getString("date");

			Order m = new Order();

			m.setAddress_id(address_id);
			m.setDate(date);
			m.setId(id);
			m.setStatus(status);
			m.setTotal(total);
			m.setTransfee(transfee);
			m.setUser_id(user_id);

			a.add(m);
		}
		return a;

	}

}
