package cn.edu.zhku.leo.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import cn.edu.zhku.leo.Model.User;
import cn.edu.zhku.leo.Util.ConnectionManager;

public class UserDao {

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
	public ArrayList<User> getAll() throws Exception {
	
		ArrayList<User> a=new ArrayList<User>();

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
			
			User m = new User();
			m.setId(id);
			m.setPassword(password);
			m.setName(name);
			
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

		String sqlQuery = "Select * from user where id=?";
		
		ps = conn.prepareStatement(sqlQuery);
		ps.setString(1, id);
		rs = ps.executeQuery();
		
		if(rs.next()){
			sqlQuery = "delete from user where id=?";
			
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
	
}
