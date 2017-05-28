package cn.edu.zhku.jsj.lzj.Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import cn.edu.zhku.jsj.lzj.Model.Shopinfo;
import cn.edu.zhku.leo.Util.ConnectionManager;

public class ShopinfoDao {
	Shopinfo si = new Shopinfo();
	public Shopinfo getShopInfo(String id) throws Exception{
		Connection con = null;
		con = ConnectionManager.getConnection();
		if (con == null) {
			throw new Exception("数据库连接不成功！");
		}
		Statement stmt = con.createStatement();
		String strSql = "select * from user where id = '"+id+"'";
		ResultSet rs = stmt.executeQuery(strSql);
		if(rs.next()){
			si.setUsername(rs.getString("name"));
			si.setTruename(rs.getString("truename"));
		}
		strSql="select * from shop where user_id = '"+id+"'";
		rs = stmt.executeQuery(strSql);
		if(rs.next()){
			si.setShopname(rs.getString("name"));
		}
		return si;
	}
}
