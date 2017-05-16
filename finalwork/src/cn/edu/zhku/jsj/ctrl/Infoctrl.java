package cn.edu.zhku.jsj.ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
//import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

//import com.mysql.jdbc.Statement;


@SuppressWarnings("serial")
public class Infoctrl extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection con;
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		//HttpSession session=request.getSession();
	   	try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/store?useUnicode=true&characterEncoding=utf8","root","zhijie");
			String users =(String)request.getParameter("userid");
			String sex =(String)request.getParameter("sex");
			String birthday =(String)request.getParameter("birthday");
			String truename =(String)request.getParameter("truename");
			String sql ="insert into login values(?,,?,?,?)";  
		    PreparedStatement pstmt = con.prepareStatement(sql);
		    pstmt.setString(1,users);
		    pstmt.setString(2,sex);
		    pstmt.setString(3,birthday);
		    pstmt.setString(4,truename);
		    pstmt.executeQuery();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		out.flush();
		out.close();
	}

}
