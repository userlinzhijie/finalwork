package cn.edu.zhku.jsj.lzj.Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import cn.edu.zhku.jsj.lzj.Util.ConnectionManager;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class GetDao {
	public JSONArray getGoods() throws Exception{
		Connection conn = null;
		ResultSet rs = null;
		JSONArray jsonArray = new JSONArray();
		JSONObject one = new JSONObject();
		conn = ConnectionManager.getConnection();
		String sql = "Select * from login";
		Statement stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		while(rs.next())
		{
			one.put("brand",rs.getString("brand"));
			one.put("type",rs.getString("type"));
			one.put("color",rs.getString("color"));
			one.put("trans",rs.getString("trans"));
			one.put("inter",rs.getString("inter"));
			one.put("size",rs.getString("size"));
			one.put("weight",rs.getString("weight"));
			jsonArray.add(one);
		}
		return jsonArray;
	}
}
