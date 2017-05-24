package cn.edu.zhku.jsj.lzj.Ctrl;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.zhku.jsj.lzj.Model.User;
import cn.edu.zhku.jsj.lzj.Service.RegService;

@SuppressWarnings("serial")
public class Regctrl extends HttpServlet {

	RegService rs=new RegService();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		RequestDispatcher rd = null;
		PrintWriter out = response.getWriter();
		String userid = (String)request.getParameter("userName");
	   	String userPassword = (String)request.getParameter("pwd");
	   	User user  = new User();
		user.setUserid(userid);
		user.setUserPassword(userPassword);
		request.getSession().setAttribute("user",userid);
		try {
			rs.towriteSql(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
		out.flush();
		out.close();
	}

}
