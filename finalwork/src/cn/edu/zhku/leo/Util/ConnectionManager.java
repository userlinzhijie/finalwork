package cn.edu.zhku.leo.Util;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionManager {
	
	private static String driverName= "com.mysql.jdbc.Driver";
	private static String url = "jdbc:mysql://127.0.0.1:3306/webshop";
	private static String userName = "root";
	private static String password = "zhijie";
	
	public static Connection getConnection() throws Exception {
		Connection conn = null;
		//ͨ��������ƶ�̬������Ӧ�õ����ݿ������
		Class.forName( ConnectionManager.driverName );
		conn = DriverManager.getConnection(ConnectionManager.url,ConnectionManager.userName,ConnectionManager.password);
		return conn;
	}

}
