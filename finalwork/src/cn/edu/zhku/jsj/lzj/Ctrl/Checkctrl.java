package cn.edu.zhku.jsj.lzj.Ctrl;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import cn.edu.zhku.jsj.lzj.Model.User;
import cn.edu.zhku.jsj.lzj.Service.CheckService;

@SuppressWarnings("serial")
public class Checkctrl extends HttpServlet {

	CheckService cs = new CheckService();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String userid = (String)request.getParameter("userName");
		User user  = new User();
		user.setUserid(userid);
		JSONObject resultJson = new JSONObject();
		try {
			if(cs.checkUser(user)){
				resultJson.put("flag", "true");
			}else{
				resultJson.put("flag", "false");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		out.println(resultJson);
		out.flush();
		out.close();
	}

}
