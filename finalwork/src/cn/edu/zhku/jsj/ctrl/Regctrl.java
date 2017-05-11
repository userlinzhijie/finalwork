package cn.edu.zhku.jsj.ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Regctrl extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String name = (String)request.getParameter("userName");
	   	String password = (String)request.getParameter("pwd");
	   	String phone = (String)request.getParameter("phone");
	   	RequestDispatcher rd = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/store?useUnicode=true&characterEncoding=utf8","root","zhijie");
			String  sql = "insert into login values('"+name+"','"+password+"','"+phone+"')";
			request.getSession().setAttribute("user",name);
			Statement stmt = con.createStatement();
			stmt.execute(sql);
			rd = request.getRequestDispatcher("/index.jsp");
			rd.forward(request,response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.flush();
		out.close();
	}

}
