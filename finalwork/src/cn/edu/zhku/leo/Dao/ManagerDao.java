package cn.edu.zhku.leo.Dao;

import java.sql.*;
import java.util.ArrayList;

import cn.edu.zhku.leo.Util.ConnectionManager;
import cn.edu.zhku.leo.Model.*;

public class ManagerDao {
	
	/**
	 * 
	 * 该方法为：读取管理员数据库的数据
	 * 如果返回的user为空，表示该用表无数据
	 * 如果返回的user不为空，表示读取成功
	 * 
	 * @param 
	 * @return
	 * @throws Exception
	 * 
	 */
	public ArrayList<Manager> getManager() throws Exception {
	
		ArrayList<Manager> a=new ArrayList<Manager>();

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
		}

		String sqlQuery = "Select * from manager";
		
		ps = conn.prepareStatement(sqlQuery);

		rs = ps.executeQuery();

		while (rs.next()) {
			int id = rs.getInt("id");
			String password = rs.getString("password");
			String info = rs.getString("info");
			
			Manager m = new Manager();
			m.setId(id);
			m.setPassword(password);
			m.setInfo(info);
			
			a.add(m);
		}
		return a;

	}
	
	/**
	 * 根据传入的id删除数据库里对应的数据
	 * 
	 * @param String id
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

		String sqlQuery = "Select * from manager where id=?";
		
		ps = conn.prepareStatement(sqlQuery);
		ps.setString(1, id);
		rs = ps.executeQuery();
		
		if(rs.next()){
			sqlQuery = "delete from manager where id=?";
			
			ps = conn.prepareStatement(sqlQuery);
			ps.setString(1, id);
			int r= ps.executeUpdate();
			if(r!=0){
				return true;
			}else{
				return false;
			}
			
		}else{
			return false;
		}
	}
	
	/**
	 * 根据传入的Manager对象添加数据库
	 * 
	 * @param Manager m
	 * @return 成功返回true，失败返回false
	 * @throws Exception
	 * 
	 */
	public boolean add(Manager m) throws Exception {

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
		}

		String sqlQuery = "Select * from manager where id=?";
		
		ps = conn.prepareStatement(sqlQuery);
		ps.setString(1, String.valueOf(m.getId()));
		rs = ps.executeQuery();
		
		if(!rs.next()){
			sqlQuery = "INSERT INTO manager VALUES (?,?,?)";
			
			ps = conn.prepareStatement(sqlQuery);
			ps.setString(1,String.valueOf(m.getId()));
			ps.setString(2,m.getPassword());
			ps.setString(3, m.getInfo());
			int r= ps.executeUpdate();
			if(r!=0){
				return true;
			}else{
				return false;
			}
			
		}else{
			return false;
		}
	}
	
	/**
	 * 根据传入的id获取Manager对象from数据库
	 * 
	 * @param int id
	 * @return 成功返回Manager m,失败返回null
	 * @throws Exception
	 * 
	 */
	public Manager getone(int id) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
		}

		String sqlQuery = "Select * from manager where id=?";
		
		ps = conn.prepareStatement(sqlQuery);
		ps.setString(1, String.valueOf(id));
		rs = ps.executeQuery();
		
		rs.next();
		
		int id2 = rs.getInt("id");
		String password = rs.getString("password");
		String info = rs.getString("info");
		
		Manager m = new Manager();
		m.setId(id2);
		m.setPassword(password);
		m.setInfo(info);
		return m;
	}

	/**
	 * 根据传入的id获取一条数据并修改info
	 * 
	 * @param int id
	 * @return 成功返回Manager m,失败返回null
	 * @throws Exception
	 * 
	 */
	public int edit(int id, String info) throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		int rs =0;
		
		// 连接数据库
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("数据库连接不成功！");
		}

		String sqlQuery = "update manager set info=? where id=?";

		ps = conn.prepareStatement(sqlQuery);
		ps.setInt(2, id);
		ps.setString(1, info);
		rs = ps.executeUpdate();
		
		return rs;

	}
}
