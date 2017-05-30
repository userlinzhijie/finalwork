package cn.edu.zhku.leo.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import cn.edu.zhku.leo.Model.*;
import cn.edu.zhku.leo.Util.ConnectionManager;

public class UserDao {

	/**
	 * 
	 * 该方法为：读取管理员数据库的数据 如果返回的user为空，表示该用表无数据 如果返回的user不为空，表示读取成功
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

		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
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
			int sex = rs.getInt("sex"); // 0保密1男2女
			String birth = rs.getString("birth");
			String email = rs.getString("email");
			String truename = rs.getString("truename");
			
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
			m.setTruename(truename);
			
			a.add(m);
		}
		return a;

	}

	/**
	 * 根据传入的id删除数据库里对应的数据
	 * 
	 * @param String
	 *            id
	 * @return 成功返回true，失败返回false
	 * @throws Exception
	 * 
	 */
	public boolean del(String id) throws Exception {

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
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

		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
		}

		String sqlQuery = "update `user` set nickname=?,truename=?,telephone=?,birth=?,sex=?,email=? where id=?";

		ps = conn.prepareStatement(sqlQuery);
		ps.setString(1, u.getNickname());
		ps.setString(2, u.getTruename());
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

		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
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

		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
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

		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
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

		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
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

		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
		}

		String sqlQuery = "delete from address where id=?";

		ps = conn.prepareStatement(sqlQuery);
		ps.setInt(1, id);
		try{
		rs = ps.executeUpdate();
		}catch(Exception e){
			return false;
		}
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

		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
		}

		String sqlQuery = "INSERT into card VALUES(?,?,?,?,?,?,0)";

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

		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
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
			int de_fault = rs.getInt("de_fault");
			Card m = new Card();

			m.setId(id);
			m.setName(name);
			m.setPhone(phone);
			m.setUser_id(user_id);
			m.setBank(bank);
			m.setId_number(id_number);
			m.setDe_fault(de_fault);
			a.add(m);
		}
		return a;

	}

	public boolean del_card(String id) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		int rs = 0;

		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
		}

		String sqlQuery = "delete from card where id=?";

		ps = conn.prepareStatement(sqlQuery);
		ps.setString(1, id);
		try {
			rs = ps.executeUpdate();
		} catch (Exception e) {
			return false;
		}
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

		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
		}

		String sqlQuery = "Select * from `order`";

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
			int goods_id = rs.getInt("goods_id");
			int seller_id = rs.getInt("seller_id");
			int num=rs.getInt("number");

			Order m = new Order();

			m.setAddress_id(address_id);
			m.setDate(date);
			m.setId(id);
			m.setStatus(status);
			m.setTotal(total);
			m.setTransfee(transfee);
			m.setUser_id(user_id);
			m.setGoods_id(goods_id);
			m.setNumber(num);
			m.setSeller_id(seller_id);
			
			a.add(m);
		}
		return a;

	}

	public Shop getShop(int user_id) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
		}

		String sqlQuery = "Select * from shop where user_id = ?";

		ps = conn.prepareStatement(sqlQuery);
		ps.setInt(1, user_id);
		rs = ps.executeQuery();

		if (rs.next()) {
			Shop s = new Shop();
			s.setShop_id(rs.getInt("shop_id"));
			s.setStatus(rs.getInt("status"));
			s.setUser_id(user_id);
			s.setName(rs.getString("name"));
			return s;
		} else {
			return null;
		}
	}

	public boolean add_shop(Shop s) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		int rs = 0;

		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
		}

		String sqlQuery = "INSERT into shop VALUES(0,?,?,?)";

		ps = conn.prepareStatement(sqlQuery);

		ps.setInt(1, s.getUser_id());
		ps.setInt(2, s.getStatus());
		ps.setString(3, s.getName());
		try {
			rs = ps.executeUpdate();
			if (rs == 0)
				return false;
			else
				return true;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean register(User u) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		int rs = 0;

		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
		}

		String sqlQuery = "insert into `user`(`name`,`password`) VALUES (?,?)";

		ps = conn.prepareStatement(sqlQuery);

		ps.setString(1, u.getName());
		ps.setString(2, u.getPassword());
		try {
			rs = ps.executeUpdate();
			if (rs == 0)
				return false;
			else
				return true;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean checkByNamePwd(String name, String password)
			throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
		}

		String sqlQuery = "Select * from user where `name`=? and `password`=?";

		ps = conn.prepareStatement(sqlQuery);
		ps.setString(1, name);
		ps.setString(2, password);
		rs = ps.executeQuery();
		if (rs.next()) {
			return true;
		} else {
			return false;
		}
	}

	public ArrayList<Cartlog> getCart() throws Exception {
		ArrayList<Cartlog> a = new ArrayList<Cartlog>();

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ResultSet grs = null;

		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
		}

		String sqlQuery = "Select * from cart";

		ps = conn.prepareStatement(sqlQuery);

		rs = ps.executeQuery();

		while (rs.next()) {
			Cartlog c = new Cartlog();
			c.setId(rs.getInt("id"));
			c.setGoods_id(rs.getInt("goods_id"));
			c.setUser_id(rs.getInt("user_id"));
			c.setNumber(rs.getInt("number"));

			sqlQuery = "SELECT `name`,price from goods where id=?";
			ps = conn.prepareStatement(sqlQuery);
			ps.setInt(1, rs.getInt("goods_id"));
			grs = ps.executeQuery();

			grs.next();
			c.setName(grs.getString("name"));
			c.setPrice(grs.getInt("price"));

			a.add(c);
		}
		return a;
	}

	public boolean del_cart(int id) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		int rs = 0;

		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
		}

		String sqlQuery = "delete from cart where id=?";

		ps = conn.prepareStatement(sqlQuery);
		ps.setInt(1, id);
		rs = ps.executeUpdate();

		if (rs != 0) {
			return true;
		} else {
			return false;
		}
	}

	public Goods getGoodsById(int id) throws Exception {
		Goods c = new Goods();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
		}

		String sqlQuery = "Select * from goods where id=?";

		ps = conn.prepareStatement(sqlQuery);
		ps.setInt(1, id);
		rs = ps.executeQuery();

		while (rs.next()) {
			c.setName(rs.getString("name"));
			c.setPrice(rs.getInt("price"));
			c.setId(rs.getInt("id"));
			c.setNumber(1);
		}
		return c;

	}

	public int add_order(Order c) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		int rs = 0;
		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
		}

		String sqlQuery = "INSERT into `order` VALUES(?,?,?,?,?,?,?,?,?,?,?)";

		ps = conn.prepareStatement(sqlQuery);
		ps.setInt(1, 0);
		ps.setInt(2, c.getUser_id());
		ps.setInt(3, c.getAddress_id());
		ps.setInt(4, c.getGoods_id());
		ps.setInt(5, c.getSeller_id());
		ps.setInt(6, c.getNumber());
		ps.setInt(7, c.getTotal());
		ps.setInt(8, c.getTransfee());
		ps.setInt(9, c.getStatus());
		ps.setString(10, c.getDate());
		ps.setString(11, c.getCard_id());
		rs = ps.executeUpdate();
		if (rs == 0)
			return 0;
		else {
			return -1;
		}
	}

	public boolean orderStatusTo(int order_id, int status) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		int rs = 0;

		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
		}

		String sqlQuery = "update `order` set `status`=? where id=?";

		ps = conn.prepareStatement(sqlQuery);
		ps.setInt(1, status);
		ps.setInt(2, order_id);

		rs = ps.executeUpdate();
		if (rs == 0)
			return false;
		else
			return true;
	}

	public boolean del_order(int id) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		int rs = 0;

		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
		}

		String sqlQuery = "delete from `order` where id=?";

		ps = conn.prepareStatement(sqlQuery);
		ps.setInt(1, id);
		rs = ps.executeUpdate();

		if (rs != 0) {
			return true;
		} else {
			return false;
		}
	}

	public boolean add_collect(int uid, int gid) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		int rs = 0;

		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
		}

		String sqlQuery = "INSERT into collect VALUES(0,?,?)";

		ps = conn.prepareStatement(sqlQuery);

		ps.setInt(1, uid);
		ps.setInt(2, gid);

		rs = ps.executeUpdate();
		if (rs == 0)
			return false;
		else
			return true;
	}

	public boolean del_collect(int id) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		int rs = 0;

		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
		}

		String sqlQuery = "delete from collect where id=?";
		ps = conn.prepareStatement(sqlQuery);
		ps.setInt(1, id);
		rs = ps.executeUpdate();

		if (rs == 0)
			return false;
		else
			return true;
	}

	public ArrayList<Collect> getCollect(int user_id) throws Exception {
		ArrayList<Collect> a = new ArrayList<Collect>();

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ResultSet crs = null;

		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
		}

		String sqlQuery = "Select * from collect where user_id=?";

		ps = conn.prepareStatement(sqlQuery);
		ps.setInt(1, user_id);
		rs = ps.executeQuery();

		while (rs.next()) {
			int id = rs.getInt("id");
			int uid = rs.getInt("user_id");
			int gid = rs.getInt("goods_id");
			Collect m = new Collect();

			m.setId(id);
			m.setGoods_id(gid);
			m.setUser_id(uid);

			sqlQuery = "SELECT `name`,price from goods where id=?";
			ps = conn.prepareStatement(sqlQuery);
			ps.setInt(1, rs.getInt("goods_id"));
			crs = ps.executeQuery();

			crs.next();
			m.setName(crs.getString("name"));
			m.setPrice(crs.getInt("price"));

			a.add(m);
		}
		return a;
	}

	public boolean add_cart(Cartlog c) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		int rs = 0;

		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
		}

		String sqlQuery = "INSERT into cart VALUES(0,?,?,?)";

		ps = conn.prepareStatement(sqlQuery);

		ps.setInt(1, c.getGoods_id());
		ps.setInt(2, c.getUser_id());
		ps.setInt(3, c.getNumber());

		rs = ps.executeUpdate();
		if (rs == 0)
			return false;
		else
			return true;
	}

	public int getSidByGid(int goods_id) throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
		}

		String sqlQuery = "Select * from goods where id=?";

		ps = conn.prepareStatement(sqlQuery);
		ps.setInt(1, goods_id);
		rs = ps.executeQuery();

		rs.next();
		return rs.getInt("Seller_id");
	
	}

	public void clear_cart() throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		int r = 0;
		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
		}

		String sqlQuery = "delete from cart";

		ps = conn.prepareStatement(sqlQuery);
		r = ps.executeUpdate();
		if(r==0)System.out.println("!clear failure!");
	}

	public int getOrderStatusById(int id) throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
		}

		String sqlQuery = "Select status from `order` where id=?";

		ps = conn.prepareStatement(sqlQuery);
		ps.setInt(1, id);
		rs = ps.executeQuery();

		rs.next();
		return rs.getInt("status");
	}

	public void setDefault_a(int id) throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;

		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
		}

		String sqlQuery = "update `address` set `de_fault`=?";

		ps = conn.prepareStatement(sqlQuery);
		ps.setInt(1,0);

		ps.executeUpdate();
		
		sqlQuery = "update `address` set `de_fault`=? where id=?";

		ps = conn.prepareStatement(sqlQuery);
		ps.setInt(1,1);
		ps.setInt(2, id);

		ps.executeUpdate();
		
		
	}
	public void setDefault_c(String id) throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;

		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
		}

		String sqlQuery = "update `card` set `de_fault`=?";

		ps = conn.prepareStatement(sqlQuery);
		ps.setInt(1,0);
		ps.executeUpdate();
		
		sqlQuery = "update `card` set `de_fault`=? where id=?";

		ps = conn.prepareStatement(sqlQuery);
		ps.setInt(1,1);
		ps.setString(2, id);

		ps.executeUpdate();
		
	}

	public void add_advice(Advice a) throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
		}

		String sqlQuery = "INSERT into advice VALUES(?,?,?)";

		ps = conn.prepareStatement(sqlQuery);

		ps.setInt(1, a.getId());
		ps.setString(2, a.getTag());
		ps.setString(3, a.getDetails());

		ps.executeUpdate();
		
	}
}
