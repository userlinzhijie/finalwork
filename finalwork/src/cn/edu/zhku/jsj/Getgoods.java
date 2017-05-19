package cn.edu.zhku.jsj;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@SuppressWarnings("serial")
public class Getgoods extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		JSONObject Keyboard = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		JSONObject Keyboard1 = new JSONObject();
		JSONObject Keyboard2 = new JSONObject();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/store?useUnicode=true&characterEncoding=utf8","root","zhijie");
			String sql="select * from login";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				Keyboard1.put("name",rs.getString("un"));
				Keyboard1.put("type",rs.getString("pw"));
				Keyboard1.put("sales",rs.getString("age"));
			}
			if(rs.next()){
				Keyboard2.put("name",rs.getString("un"));
				Keyboard2.put("type",rs.getString("pw"));
				Keyboard2.put("sales",rs.getString("age"));
			}
			jsonArray.add(Keyboard1);
			jsonArray.add(Keyboard2);
			Keyboard.put("Keyboards",jsonArray);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		out.println(Keyboard);
		out.flush();
		out.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
