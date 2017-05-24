package cn.edu.zhku.jsj.lzj.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import cn.edu.zhku.jsj.lzj.Util.ConnectionManager;
import cn.edu.zhku.jsj.lzj.Model.User;

public class LoginDao {
	
	public  boolean judge(String userName, String userPassword)
	throws Exception {
		boolean flag = false;
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		// �������ݿ�
		
		// ͨ��������ƶ�̬������Ӧ�õ����ݿ������
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/store","root", "zhijie");
		String sqlQuery = "Select * from login where un = ? && pw = ?";
		ps = conn.prepareStatement(sqlQuery);		
		ps.setString(1, userName);
		ps.setString(2, userPassword);	
		rs = ps.executeQuery();
		if (rs.next()) {
			String name = rs.getString("un");
			String pwd = rs.getString("pw");
			System.out.println(name + "-" + pwd);
			
			flag =true;
		}		
	return flag;
		
	}

	public User getUserByName(User user) throws Exception {
		User newUser = new User();

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		// �������ݿ�
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("���ݿ����Ӳ��ɹ���");
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
