package cn.edu.zhku.jsj.ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Loginctrl extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		Connection con;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/store?useUnicode=true&characterEncoding=utf8","root","zhijie");
			String users =(String)request.getParameter("lguserName");
		    String pass =(String)request.getParameter("lgpwd");
		    String check = users;
		    String msg = null;
		    RequestDispatcher rd = null;
		    if(check == null)
		    {
			    String sql ="select * from login where un=? and pw=?";  
			    PreparedStatement pstmt = con.prepareStatement(sql);
			    pstmt.setString(1,users);
			    pstmt.setString(2,pass);
			    ResultSet rs=pstmt.executeQuery();
			    if(rs.next())
			    {
			    	session.setAttribute("user",users);
			    	rd = request.getRequestDispatcher("/index.jsp");
					rd.forward(request,response);
			    }
			    else
			    {
			    	msg = "帐号或密码不匹配,请重新输入";
				    request.setAttribute("MSG", msg);
			    	rd = request.getRequestDispatcher("/jsp/result.jsp");
					rd.forward(request,response);
			    }
		    }
		    else
			 {
		    	msg = "你以登陆，请不要重复登陆";
			    request.setAttribute("MSG", msg);
		    	rd = request.getRequestDispatcher("/jsp/result.jsp");
				rd.forward(request,response);
			 }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
		out.flush();
		out.close();
	}

}
