package cn.edu.zhku.jsj.lzj.filter;

import java.io.IOException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.zhku.jsj.lzj.Util.ConnectionManager;

public class Shopfilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse resp=(HttpServletResponse)response;
		HttpSession session =req.getSession();
		Connection con = null;
		try {
			con = ConnectionManager.getConnection();
			if (con == null) {
				throw new Exception("数据库连接不成功！");
			}
			Cookie[] cookies = null;
			cookies = req.getCookies();
			String userid="";
			for (int i = 0; i < cookies.length; i++) {
				String name = URLDecoder.decode(cookies[i].getName(), "utf-8");
				if (name.equals("user_id")) {
					userid = URLDecoder.decode(cookies[i].getValue(), "utf-8");
				}
			}
			Statement stmt = con.createStatement();
			String strSql = "select * from shop where user_id = "+userid; 
			ResultSet rs = stmt.executeQuery(strSql); 
			String flag=null;
			if(rs.next())
				 flag=rs.getString("status");
			int check = Integer.parseInt(flag);
			if(check!=1){
				session.setAttribute("MSG","你没有开铺,无法进入此页面");
				resp.sendRedirect("../index.jsp");	
				return;
			}
			chain.doFilter(request, response);
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}			

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
