package cn.edu.zhku.jsj.lzj.Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import cn.edu.zhku.jsj.lzj.Util.ConnectionManager;

public class ShowDao {
	public String  getPic(String id) throws Exception{
		Connection con = null;
		String pic=null;
		con = ConnectionManager.getConnection();
		if (con == null) {
			throw new Exception("数据库连接不成功！");
		}
		Statement stmt = con.createStatement();
		String strSql = "select picture from goods where id = '"+id+"'";
		ResultSet rs = stmt.executeQuery(strSql);
		if (rs.next()){
			pic=rs.getString("picture");
		}
		return pic;
	}
}
