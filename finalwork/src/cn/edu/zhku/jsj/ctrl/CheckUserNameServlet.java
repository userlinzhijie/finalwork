package cn.edu.zhku.jsj.ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

@SuppressWarnings("serial")
public class CheckUserNameServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection con;
		response.setContentType("text/html");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/store?useUnicode=true&characterEncoding=utf8","root","zhijie");
			PrintWriter out = response.getWriter();
			String users =(String)request.getParameter("userName");
			String sql ="select * from login where un=?";  
		    PreparedStatement pstmt = con.prepareStatement(sql);
		    pstmt.setString(1,users);
		    ResultSet rs =pstmt.executeQuery();
			JSONObject resultJson = new JSONObject();
			if(rs.next()){
				resultJson.put("flag", "true");
			}else{
				resultJson.put("flag", "false");
			}
			out.println(resultJson);
			out.flush();
			out.close();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e){
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}
}
